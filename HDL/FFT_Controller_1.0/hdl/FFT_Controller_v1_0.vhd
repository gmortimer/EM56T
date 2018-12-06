library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.emm_telsys.all;


entity FFT_Controller_v1_0 is
	generic (
        

		C_S00_AXI_DATA_WIDTH         : integer	:= 32;
		C_S00_AXI_ADDR_WIDTH         : integer	:= 6;
        CFG_EXT_EN                   : boolean  := false;
        C_CFG_EXT_EN                 : boolean  := false; 
        C_CFG_CONST                  : boolean  := false;
        C_CFG_FFT_DATA               : std_logic_vector( 39 downto 0 )  := x"0000000000";  
		C_M_AXIS_CONFIG_TDATA_WIDTH	 : integer	:= 24;
		C_HAS_DIAGS                  : boolean  := true;

        C_DEVICE_ID                  : std_logic_vector( 23 downto 0 )  :=  x"FF7CC1"

	);
	port (
		-- Users to add ports here
        aclk                         : in  std_logic;
        aresetn                      : in  std_logic;
        fft_resetn                   : out std_logic;
        config_in                    : in  std_logic := '0';
        config_done                  : out std_logic;
        
        event_frame_started          : in  std_logic := '0';
        event_tlast_unexpected       : in  std_logic := '0';
        event_tlast_missing          : in  std_logic := '0';
        event_status_channel_halt    : in  std_logic := '0';
        event_data_in_channel_halt   : in  std_logic := '0';
        event_data_out_channel_halt  : in  std_logic := '0';
        
--        		-- Ports of Axi Slave Bus Interface
--        s_axis_data_tready           : out std_logic;
--        s_axis_data_tdata            : in  std_logic_vector(C_S_AXIS_DATA_TDATA_WIDTH-1 downto 0) := (others => '0');
--        s_axis_data_tvalid           : in  std_logic := '0';

--        -- Ports of Axi Master Bus Interface
--        m_axis_data_tvalid           : out std_logic;
--        m_axis_data_tdata            : out std_logic_vector(C_M_AXIS_DATA_TDATA_WIDTH-1 downto 0);
--        m_axis_data_tlast            : out std_logic;
--        m_axis_data_tready           : in  std_logic := '0';

        -- Ports of Axi Master Bus Interface
        m_axis_config_tvalid         : out std_logic;
        m_axis_config_tdata          : out std_logic_vector(C_M_AXIS_CONFIG_TDATA_WIDTH-1 downto 0);
        m_axis_config_tready         : in  std_logic;

        irq                          : out std_logic;

		-- Ports of Axi Slave Bus Interface S00_AXI
		s00_axi_awaddr	             : in  std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_awprot	             : in  std_logic_vector(2 downto 0);
		s00_axi_awvalid	             : in  std_logic;
		s00_axi_awready	             : out std_logic;
		s00_axi_wdata	             : in  std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_wstrb	             : in  std_logic_vector((C_S00_AXI_DATA_WIDTH/8)-1 downto 0);
		s00_axi_wvalid	             : in  std_logic;
		s00_axi_wready	             : out std_logic;
		s00_axi_bresp	             : out std_logic_vector(1 downto 0);
		s00_axi_bvalid	             : out std_logic;
		s00_axi_bready	             : in  std_logic;
		s00_axi_araddr	             : in  std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_arprot	             : in  std_logic_vector(2 downto 0);
		s00_axi_arvalid	             : in  std_logic;
		s00_axi_arready	             : out std_logic;
		s00_axi_rdata	             : out std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_rresp	             : out std_logic_vector(1 downto 0);
		s00_axi_rvalid	             : out std_logic;
		s00_axi_rready	             : in  std_logic

	);
	
end FFT_Controller_v1_0;

architecture arch_imp of FFT_Controller_v1_0 is

constant C_N_SLV_REG    : integer := 2**( C_S00_AXI_ADDR_WIDTH - 2 );


-- component declaration
component FFT_Controller_v1_0_S00_AXI is
  generic (
    C_S_AXI_DATA_WIDTH	: integer   := 32;
    C_S_AXI_ADDR_WIDTH	: integer   := 6
  );
  port (
    SLV_REG_0           : out std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0 );
    SLV_REG_1           : in  std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0 );
    SLV_REG_2           : out std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0 );
    SLV_REG_3           : out std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0 );
    SLV_REG_4           : out std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0 );
    SLV_REG_5           : out std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0 );
    SLV_REG_6           : out std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0 );
    SLV_REG_7           : out std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0 );
    SLV_REG_8           : in  std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0 );
    SLV_REG_9           : in  std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0 );
    SLV_REG_10          : in  std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0 );
    SLV_REG_11          : in  std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0 );
    SLV_REG_12          : in  std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0 );
    SLV_REG_13          : in  std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0 );
    SLV_REG_14          : in  std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0 );
    SLV_REG_15          : in  std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0 );
    
    S_AXI_ACLK          : in  std_logic;
    S_AXI_ARESETN       : in  std_logic;
    S_AXI_AWADDR        : in  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_AWPROT        : in  std_logic_vector(2 downto 0);
    S_AXI_AWVALID       : in  std_logic;
    S_AXI_AWREADY       : out std_logic;
    S_AXI_WDATA         : in  std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    S_AXI_WSTRB         : in  std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
    S_AXI_WVALID        : in  std_logic;
    S_AXI_WREADY        : out std_logic;
    S_AXI_BRESP         : out std_logic_vector(1 downto 0);
    S_AXI_BVALID        : out std_logic;
    S_AXI_BREADY        : in  std_logic;
    S_AXI_ARADDR        : in  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_ARPROT        : in  std_logic_vector(2 downto 0);
    S_AXI_ARVALID       : in  std_logic;
    S_AXI_ARREADY       : out std_logic;
    S_AXI_RDATA         : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    S_AXI_RRESP         : out std_logic_vector(1 downto 0);
    S_AXI_RVALID        : out std_logic;
    S_AXI_RREADY        : in  std_logic
  );
end component FFT_Controller_v1_0_S00_AXI;

component Control_Register is
  generic (
    DATA_WIDTH      : integer := 32
    );
  
  port (
    ACLK            : in  std_logic;
    ARESETN         : in  std_logic;
    CTRL_REG_IN     : in  std_logic_vector(DATA_WIDTH-1 downto 0);
    CTRL_REG_OUT    : out std_logic_vector(DATA_WIDTH-1 downto 0);
    RESETP_OUT      : out std_logic;
    RESETN_OUT      : out std_logic
  );
end component Control_Register;

component Interrupt_Controller is    
  port (
    ACLK            : in  std_logic;
    ARESETN         : in  std_logic;
    SOFT_RESET      : in  std_logic;
    INTERNAL_IRQ_F  : in  std_logic; --flag 
    EXTERNAL_IRQ    : out std_logic;
    INT_ACK_F       : in  std_logic  --flag
  );
end component Interrupt_Controller;

component Signal_f is
  port (
    SIG_I    : in  std_logic;
    SIG_O_F  : out std_logic;
    CLK      : in  std_logic;
    RESETN   : in  std_logic
  );
end component Signal_f;

signal slv_reg_0              : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
signal slv_reg_1              : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
signal slv_reg_2              : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
signal slv_reg_3              : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
signal slv_reg_4              : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
signal slv_reg_5              : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
signal slv_reg_6              : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
signal slv_reg_7              : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
signal slv_reg_8              : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
signal slv_reg_9              : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
signal slv_reg_10             : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
signal slv_reg_11             : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
signal slv_reg_12             : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
signal slv_reg_13             : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
signal slv_reg_14             : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
signal slv_reg_15             : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);

signal m_axis_config_tvalid_i : std_logic;
signal m_axis_config_tdata_i  : std_logic_vector( C_M_AXIS_CONFIG_TDATA_WIDTH - 1 downto 0 );

constant CFG_IDLE             : T_SM_STATE := b"1001";
constant CFG_TX_FFT           : T_SM_STATE := b"1011";
signal cfg_state              : T_SM_STATE;

signal fft_resetn_i           : std_logic;
signal irq_i                  : std_logic;
signal int_rqst_f             : std_logic;

signal resetp                 : std_logic;
signal resetn                 : std_logic;
signal ps_tx_cfg_fft_f        : std_logic;
signal ps_int_ack_f           : std_logic;

signal ctrl_reg               : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
signal ctrl_reg_in            : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
signal info_reg               : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
signal cfg_fft_lo_reg         : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
signal cfg_fft_hi_reg         : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);

signal cfg_fft_out_reg        : std_logic_vector(C_M_AXIS_CONFIG_TDATA_WIDTH-1 downto 0);
signal cf_cfg_fft_f           : std_logic;
signal tx_cfg_fft_done        : std_logic;

signal status_reg             : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
signal event_reg              : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);   
  
signal config_in_f            : std_logic;

begin

-- Instantiation of Axi Bus Interface S00_AXI
   FFT_Controller_v1_0_S00_AXI_inst : FFT_Controller_v1_0_S00_AXI
  generic map (
  	C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
  	C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
  )
  port map (
    SLV_REG_0       => slv_reg_0,
    SLV_REG_1       => slv_reg_1,
    SLV_REG_2       => slv_reg_2,
    SLV_REG_3       => slv_reg_3,
    SLV_REG_4       => slv_reg_4,
    SLV_REG_5       => slv_reg_5,
    SLV_REG_6       => slv_reg_6,
    SLV_REG_7       => slv_reg_7,
    SLV_REG_8       => slv_reg_8,
    SLV_REG_9       => slv_reg_9,
    SLV_REG_10      => slv_reg_10,
    SLV_REG_11      => slv_reg_11,
    SLV_REG_12      => slv_reg_12,
    SLV_REG_13      => slv_reg_13,
    SLV_REG_14      => slv_reg_14,
    SLV_REG_15      => slv_reg_15,

    S_AXI_ACLK      => aclk,
    S_AXI_ARESETN   => aresetn,
    S_AXI_AWADDR    => s00_axi_awaddr,
    S_AXI_AWPROT    => s00_axi_awprot,
    S_AXI_AWVALID   => s00_axi_awvalid,
    S_AXI_AWREADY   => s00_axi_awready,
    S_AXI_WDATA     => s00_axi_wdata,
    S_AXI_WSTRB     => s00_axi_wstrb,
    S_AXI_WVALID    => s00_axi_wvalid,
    S_AXI_WREADY    => s00_axi_wready,
    S_AXI_BRESP     => s00_axi_bresp,
    S_AXI_BVALID    => s00_axi_bvalid,
    S_AXI_BREADY    => s00_axi_bready,
    S_AXI_ARADDR    => s00_axi_araddr,
    S_AXI_ARPROT    => s00_axi_arprot,
    S_AXI_ARVALID   => s00_axi_arvalid,
    S_AXI_ARREADY   => s00_axi_arready,
    S_AXI_RDATA     => s00_axi_rdata,
    S_AXI_RRESP     => s00_axi_rresp,
    S_AXI_RVALID    => s00_axi_rvalid,
    S_AXI_RREADY    => s00_axi_rready
  );

Control_Reg : Control_Register
  generic map (
    DATA_WIDTH      => C_S00_AXI_DATA_WIDTH
  ) 
  port map (
    ACLK            => aclk,
    ARESETN         => aresetn,
    CTRL_REG_IN     => ctrl_reg,
    CTRL_REG_OUT    => ctrl_reg_in,
    RESETP_OUT      => resetp,
    RESETN_OUT      => resetn
  );
          
Int_Controller : Interrupt_Controller    
  port map (
    ACLK            => aclk,
    ARESETN         => resetn,
    SOFT_RESET      => resetp,
    INTERNAL_IRQ_F  => int_rqst_f,
    EXTERNAL_IRQ    => irq_i,
    INT_ACK_F       => ps_int_ack_f
  );
	
config_in_sync: Signal_f
    port map (
      SIG_I    => config_in,
      SIG_O_F  => config_in_f,
      CLK      => aclk,
      RESETN   => resetn
  );
	
ps_int_ack_f               <= ctrl_reg_in(1);
ps_tx_cfg_fft_f            <= ctrl_reg_in(2);
	
--s_axis_data_tready         <= m_axis_data_tready;
--m_axis_data_tvalid         <= s_axis_data_tvalid;
--m_axis_data_tdata          <= s_axis_data_tdata;
--m_axis_data_tlast          <= '0';

m_axis_config_tvalid       <= m_axis_config_tvalid_i;
m_axis_config_tdata        <= m_axis_config_tdata_i;

fft_resetn                 <= fft_resetn_i;
config_done                <= tx_cfg_fft_done;
irq                        <= irq_i;


ctrl_reg                   <= slv_reg_0;
cfg_fft_lo_reg             <= slv_reg_2;
cfg_fft_hi_reg             <= slv_reg_3;

info_reg( 31 downto 8 )    <= C_DEVICE_ID;
info_reg(  7 downto 0 )    <= std_logic_vector( to_unsigned( C_N_SLV_REG, 8 ));
slv_reg_1                  <= info_reg;

status_reg(0)              <= resetp;
status_reg(1)              <= irq_i;
status_reg(2)              <= tx_cfg_fft_done;
status_reg(3)              <= config_in;
status_reg(4)              <= '0';
status_reg(5)              <= '0';
status_reg(6)              <= '0';
status_reg(7)              <= '0';

--status_reg(8)              <= s_axis_data_tvalid;
--status_reg(9)              <= m_axis_data_tready;
status_reg(8)              <= '0';
status_reg(9)              <= '0';
status_reg(10)             <= '0';
status_reg(11)             <= '0';
status_reg(12)             <= m_axis_config_tready;
status_reg(13)             <= m_axis_config_tvalid_i;
status_reg(14)             <= '0';
status_reg(15)             <= '0';

status_reg(19 downto 16)   <= cfg_state;
status_reg(20)             <= '0';
status_reg(21)             <= '0';
status_reg(22)             <= '0';
status_reg(23)             <= '0';

status_reg(24)             <= '0';
status_reg(25)             <= '0';
status_reg(26)             <= '0';
status_reg(27)             <= '0';
status_reg(28)             <= '0';
status_reg(29)             <= '0';
status_reg(30)             <= '0';
status_reg(31)             <= '0';
slv_reg_8                  <= status_reg;

event_reg(0)               <= event_frame_started;         
event_reg(1)               <= event_tlast_unexpected;      
event_reg(2)               <= event_tlast_missing;         
event_reg(3)               <= event_status_channel_halt;   
event_reg(4)               <= event_data_in_channel_halt;  
event_reg(5)               <= event_data_out_channel_halt; 
slv_reg_9                  <= event_reg;

slv_reg_10                 <= std_logic_vector( to_unsigned( m_axis_config_tdata_i'length, slv_reg_10'length ));
slv_reg_11                 <= zeros( slv_reg_0'length - m_axis_config_tdata_i'length )     & m_axis_config_tdata_i( min( m_axis_config_tdata_i'length, slv_reg_0'length ) - 1 downto 0 );
slv_reg_12                 <= zeros( slv_reg_0'length * 2 - m_axis_config_tdata_i'length ) & m_axis_config_tdata_i( m_axis_config_tdata_i'left downto  slv_reg_0'length ) 
                              when m_axis_config_tdata_i'length > slv_reg_0'length else ( others => '0' );
slv_reg_13                 <= ( others=>'0' );
slv_reg_14                 <= ( others=>'0' );
slv_reg_15                 <= ( others=>'0' );


CFG_FFT_p : process ( aclk )
  begin
    if rising_edge( aclk ) then
      if resetn = '0' then
        cfg_state               <= CFG_IDLE;
        m_axis_config_tvalid_i  <= '0';
        tx_cfg_fft_done         <= '0';
        fft_resetn_i            <= '0';
                     
      else 
        fft_resetn_i            <= '1';
        
        case cfg_state is
        
          when CFG_IDLE =>
            m_axis_config_tvalid_i    <= '0';
            if ps_tx_cfg_fft_f = '1' or config_in_f = '1' then
              if not C_CFG_CONST then
                m_axis_config_tdata_i <= cfg_fft_hi_reg( m_axis_config_tdata_i'length - cfg_fft_lo_reg'length - 1 downto 0 ) 
                                       & cfg_fft_lo_reg( min( m_axis_config_tdata_i'length, cfg_fft_lo_reg'length ) - 1 downto 0);      
              else
                m_axis_config_tdata_i <= C_CFG_FFT_DATA( m_axis_config_tdata'range );
              end if;  
              m_axis_config_tvalid_i  <= '1';
              tx_cfg_fft_done         <= '0';
              cfg_state               <= CFG_TX_FFT;
            end if;
            
          when CFG_TX_FFT =>
            if (m_axis_config_tready = '1') then
              m_axis_config_tvalid_i  <= '0';
              tx_cfg_fft_done         <= '1';
              cfg_state               <= CFG_IDLE;
            end if; 

          when others =>
            null;

        end case;
      end if;
    end if;
  end process;

IRQ_p : process ( aclk )
  begin
    if rising_edge( aclk ) then
      if resetn = '0' then
        int_rqst_f      <= '0';
                     
      else 
        if event_reg = ( event_reg'range => '0' ) then  
          int_rqst_f    <= '0';
        else 
          int_rqst_f    <= '1';
        end if;
         
      end if;
    end if;
  end process;


	-- User logic ends

end arch_imp;
