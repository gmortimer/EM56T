--============================================
-- Handles PS Access to BRAM
--============================================
-- All unused inputs default to zero.
-- To force zeros onto 
-- BRAM_WE  : Omit PS_WR_F
-- BRAM_DIN : Set C_PS_WR_DATA_REG_WIDTH = C_BRAM_DIN_WIDTH, Omit PS_WR_DATA_REG 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.emm_telsys.all;

entity BRAM_PS_RW is
  generic (
    C_BRAM_RD_ADDR_WIDTH    : integer := 0;
    C_BRAM_RD_BUF_SEL_WIDTH : integer := 0;
    C_BRAM_WR_ADDR_WIDTH    : integer := 0;
    C_BRAM_WR_BUF_SEL_WIDTH : integer := 0;
    C_BRAM_DIN_WIDTH        : integer := 0;
    C_BRAM_DOUT_WIDTH       : integer := 0;
    C_PS_RD_ADDR_REG_WIDTH  : integer := 0;
    C_PS_WR_ADDR_REG_WIDTH  : integer := 0;
    C_PS_RD_DATA_REG_WIDTH  : integer := 0;
    C_PS_WR_DATA_REG_WIDTH  : integer := 0;
    C_BRAM_RD_LATENCY       : integer := 2
  );
  
  port (
    PS_RD_ADDR_REG          : in   std_logic_vector( C_PS_RD_ADDR_REG_WIDTH - 1 downto 0 )  := ( others => '0' );
    PS_WR_ADDR_REG          : in   std_logic_vector( C_PS_WR_ADDR_REG_WIDTH - 1 downto 0 )  := ( others => '0' );
    PS_RD_DATA_REG          : out  std_logic_vector( C_PS_RD_DATA_REG_WIDTH - 1 downto 0 );
    PS_WR_DATA_REG          : in   std_logic_vector( C_PS_WR_DATA_REG_WIDTH - 1 downto 0 )  := ( others => '0' );

    SYS_RD_ADDR             : in   std_logic_vector( C_BRAM_RD_ADDR_WIDTH - 1 downto 0 )    := ( others => '0' );
    SYS_WR_ADDR             : in   std_logic_vector( C_BRAM_WR_ADDR_WIDTH - 1 downto 0 )    := ( others => '0' );
    SYS_RD_BUF_SEL          : in   std_logic_vector( C_BRAM_RD_BUF_SEL_WIDTH - 1 downto 0 ) := ( others => '0' ); 
    SYS_WR_BUF_SEL          : in   std_logic_vector( C_BRAM_WR_BUF_SEL_WIDTH - 1 downto 0 ) := ( others => '0' ); 
    SYS_WR_DATA             : in   std_logic_vector( C_BRAM_DIN_WIDTH - 1 downto 0 )        := ( others => '0' );
    SYS_EN                  : in   std_logic                                                := '0';
    SYS_WE                  : in   std_logic                                                := '0';

    BRAM_RD_ADDR            : out  std_logic_vector( C_BRAM_RD_ADDR_WIDTH - 1 downto 0 );
    BRAM_WR_ADDR            : out  std_logic_vector( C_BRAM_WR_ADDR_WIDTH - 1 downto 0 );
    BRAM_RD_BUF_SEL         : out  std_logic_vector( C_RRAM_RD_BUF_SEL_WIDTH - 1 downto 0 );
    BRAM_WR_BUF_SEL         : out  std_logic_vector( C_RRAM_RD_BUF_SEL_WIDTH - 1 downto 0 );
    BRAM_DOUT               : in   std_logic_vector( C_BRAM_DOUT_WIDTH - 1 downto 0 )       := ( others => '0' );
    BRAM_DIN                : out  std_logic_vector( C_BRAM_DIN_WIDTH - 1 downto 0 );
    BRAM_EN                 : out  std_logic;
    BRAM_WE                 : out  std_logic;

    PS_RD_F                 : in   std_logic                                                := '0';
    PS_RD_ACK_F             : in   std_logic                                                := '0';
    PS_RD_RDY               : out  std_logic;                                               
    PS_WR_F                 : in   std_logic                                                := '0';

    RD_STATE_OUT            : out  T_SM_STATE;  
    PS_ENABLE               : in   std_logic                                                := '1';
    ACLK                    : in   std_logic;
    ARESETN                 : in   std_logic
  );
end BRAM_PS_RW;

  

architecture rtl of BRAM_PS_RW is
constant PS_RD_REG_PAD : std_logic_vector( PS_RD_DATA_REG'length - C_PS_RD_REG_OFFS - BRAM_DOUT'length - 1 downto 0 ) := ( others => '0' );

constant RD_IDLE            : T_SM_STATE := b"1001";
constant RD_WAIT_BRAM       : T_SM_STATE := b"1011";
constant RD_RDY             : T_SM_STATE := b"1101";
signal rd_state             : T_SM_STATE;
signal rd_nxtst             : T_SM_STATE;

signal rd_ctr               : unsigned( clogb2( C_BRAM_RD_LATENCY ) - 1 downto 0 );
signal rd_en                : std_logic;

signal ps_rd_addr           : std_logic_vector( BRAM_RD_ADDR'length - 1 downto 0 );
signal ps_wr_addr           : std_logic_vector( BRAM_RD_ADDR'length - 1 downto 0 );
signal ps_rd_buf_sel        : std_logic_vector( BRAM_RD_BUF_SEL'length - 1 downto 0 );
signal ps_wr_buf_sel        : std_logic_vector( BRAM_WR_BUF_SEL'length - 1 downto 0 );
signal ps_rd_data           : std_logic_vector( BRAM_DOUT'length - 1 downto 0 );
signal ps_wr_data           : std_logic_vector( BRAM_DIN'length - 1 downto 0 );
signal ps_en                : std_logic;
signal ps_we                : std_logic;


begin
RD_STATE_OUT          <= rd_state;

ps_rd_addr            <= PS_RD_ADDR_REG( ps_rd_addr'length - 1 downto 0 );
ps_wr_addr            <= PS_WR_ADDR_REG( ps_wr_addr'length - 1 downto 0 );
ps_rd_buf_sel         <= PS_RD_ADDR_REG( ps_rd_addr'length + ps_rd_buf_sel'length - 1 downto ps_rd_addr'length ); 
ps_wr_buf_sel         <= PS_WR_ADDR_REG( ps_wr_addr'length + ps_wr_buf_sel'length - 1 downto ps_wr_addr'length ); 
PS_RD_DATA_REG        <= PS_RD_REG_PAD & ps_rd_data;
ps_wr_data            <= PS_WR_DATA_REG( ps_wr_data'length - 1 downto 0 );

ps_we                 <= '1' when  ( PS_WR_F = '1' and PS_ENABLE = '1' ) else '0';
ps_en                 <= '1' when (( PS_WR_F = '1' or rd_en = '1'   ) and PS_ENABLE = '1' ) else '0';


mux_p: process( PS_ENABLE,
         SYS_RD_ADDR, SYS_WR_ADDR, SYS_RD_BUF_SEL, SYS_WR_BUF_SEL, SYS_WR_DATA, SYS_EN, SYS_WE,
         ps_rd_addr,  ps_wr_addr,  ps_rd_buf_sel,  ps_rd_buf_sel,  ps_wr_data,  ps_en,  ps_we  
       )
begin
  if( PS_ENABLE = '1' ) then
    BRAM_RD_ADDR     <= ps_rd_addr; 
    BRAM_WR_ADDR     <= ps_wr_addr;
    BRAM_RD_BUF_SEL  <= ps_rd_buf_sel;       
    BRAM_WR_BUF_SEL  <= ps_wr_buf_sel;       
    BRAM_DIN         <= ps_wr_data;
    BRAM_EN          <= ps_en;
    BRAM_WE          <= ps_we;   
  else
    BRAM_RD_ADDR     <= SYS_RD_ADDR;
    BRAM_WR_ADDR     <= SYS_WR_ADDR;
    BRAM_RD_BUF_SEL  <= SYS_RD_BUF_SEL;       
    BRAM_WR_BUF_SEL  <= SYS_WR_BUF_SEL;       
    BRAM_DIN         <= SYS_WR_DATA;
    BRAM_EN          <= SYS_EN;     
    BRAM_WE          <= SYS_WE;
  end if;
end process;  


rd_ctr_p: process( aclk )
begin
  if rising_edge(aclk) then
    if rd_state = RD_WAIT_BRAM then
      rd_ctr <= rd_ctr + 1; 
    else
      rd_ctr <= (others => '0');
    end if;
  end if;
end process;

rd_data_reg_p: process( ACLK, BRAM_DOUT, rd_state )
begin
  if rising_edge( ACLK ) then
    if( ARESETN = '0' ) then   
      ps_rd_data    <= (others => '0');
    else 
      if rd_state = RD_RDY then
        ps_rd_data  <= BRAM_DOUT;
      end if;
    end if;
    
    if rd_state = RD_RDY then
      PS_RD_RDY   <= '1';
    else
      PS_RD_RDY   <= '0';
    end if;

  end if;
end process;

read_p: process( ACLK, rd_state, rd_ctr, PS_ENABLE, PS_RD_F, PS_RD_ACK_F )
begin
  if rising_edge( ACLK ) then
    if( ARESETN = '0' ) then   
      rd_state    <= RD_IDLE;
    else 
      rd_state    <= rd_nxtst;
    end if;
  end if;
         
  rd_nxtst  <= rd_state;
  rd_en     <= '0';

  if ( PS_ENABLE = '0' ) then   
    rd_nxtst <= RD_IDLE;
  else
    case rd_state is
      when RD_IDLE =>  
        if PS_RD_F = '1' then
          rd_nxtst <= RD_WAIT_BRAM;
        end if;  
    
      when RD_WAIT_BRAM =>
        rd_en      <= '1';
        if rd_ctr = C_BRAM_RD_LATENCY - 1 then
          rd_nxtst <= RD_RDY;
        end if;
    
      when RD_RDY =>
        rd_en      <= '1';
        if PS_RD_ACK_F = '1' then
          rd_nxtst <= RD_IDLE;
        end if;                               
    
      when others =>
        rd_nxtst   <= RD_IDLE;
    end case;
  end if;

end process;

   
end rtl;

