library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.emm_telsys.all;



entity AXI4_Stream_Data_Source_v1_0 is
	generic ( 
        C_TX_BUF_ADDR_WIDTH       : integer   := 16;
		C_BRAM_READ_LATENCY       : integer   := 2;

        C_M00_AXIS_TDATA_WIDTH    : integer    := 32;
        C_M00_AXIS_TUSER_WIDTH    : integer    := 0;
        C_HAS_TLAST               : boolean    := false;

		C_S00_AXI_DATA_WIDTH	  : integer	   := 32;
		C_S00_AXI_ADDR_WIDTH	  : integer	   := 6;

        C_DEVICE_ID               : std_logic_vector( 23 downto 0 ) := x"D0FEED"

	 );
	port ( 
		-- Users to add ports here
        aclk               : in  std_logic;
        aresetn            : in  std_logic;

        data_buf_out_addr  : out std_logic_vector( C_TX_BUF_ADDR_WIDTH - 1 downto 0 );
        data_buf_out_en    : out std_logic;
        data_buf_out_data  : in  std_logic_vector( C_M00_AXIS_TDATA_WIDTH - 1 downto 0 );
        data_buf_in_data   : out std_logic_vector( C_M00_AXIS_TDATA_WIDTH - 1 downto 0 );  
        data_buf_in_we     : out std_logic;
        
        irq                : out std_logic;

		-- Ports of Axi Slave Bus Interface S00_AXI
		s00_axi_awaddr	   : in std_logic_vector( C_S00_AXI_ADDR_WIDTH - 1 downto 0 );
		s00_axi_awprot	   : in std_logic_vector( 2 downto 0 );
		s00_axi_awvalid	   : in std_logic;
		s00_axi_awready	   : out std_logic;
		s00_axi_wdata	   : in std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
		s00_axi_wstrb	   : in std_logic_vector( ( C_S00_AXI_DATA_WIDTH/8 ) - 1 downto 0 );
		s00_axi_wvalid	   : in std_logic;
		s00_axi_wready	   : out std_logic;
		s00_axi_bresp	   : out std_logic_vector( 1 downto 0 );
		s00_axi_bvalid	   : out std_logic;
		s00_axi_bready	   : in std_logic;
		s00_axi_araddr	   : in std_logic_vector( C_S00_AXI_ADDR_WIDTH - 1 downto 0 );
		s00_axi_arprot	   : in std_logic_vector( 2 downto 0 );
		s00_axi_arvalid	   : in std_logic;
		s00_axi_arready	   : out std_logic;
		s00_axi_rdata	   : out std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
		s00_axi_rresp	   : out std_logic_vector( 1 downto 0 );
		s00_axi_rvalid	   : out std_logic;
		s00_axi_rready	   : in std_logic;

		-- Ports of Axi Master Bus Interface M00_AXIS
		m00_axis_tvalid	   : out std_logic;
		m00_axis_tdata	   : out std_logic_vector( C_M00_AXIS_TDATA_WIDTH - 1 downto 0 );
		m00_axis_tstrb	   : out std_logic_vector( ( C_M00_AXIS_TDATA_WIDTH/8 ) - 1 downto 0 );
		m00_axis_tuser     : out std_logic_vector( C_M00_AXIS_TUSER_WIDTH - 1 downto 0 );
		m00_axis_tlast	   : out std_logic;
		m00_axis_tready	   : in std_logic
	 );
end AXI4_Stream_Data_Source_v1_0;

architecture rtl of AXI4_Stream_Data_Source_v1_0 is
    
constant C_TX_MAX_DATA_WORDS   : integer := 2 ** C_TX_BUF_ADDR_WIDTH;
constant C_BRAM_SIZE_BYTES     : integer := 4 * ( 2**C_TX_BUF_ADDR_WIDTH );
constant C_N_SLV_REG           : integer := 2**( C_S00_AXI_ADDR_WIDTH - 2 );

-- component declaration
component AXI4_Stream_Data_Source_v1_0_S00_AXI is
  generic ( 
    C_S_AXI_DATA_WIDTH	: integer	:= 32;
    C_S_AXI_ADDR_WIDTH	: integer	:= 6
  );
  port ( 
    SLV_REG_WRITE_F : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_READ_F  : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    
    SLV_REG_0       : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_1       : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_2       : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_3       : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_4       : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_5       : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_6       : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_7       : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_8       : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_9       : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_10      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_11      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_12      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_13      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_14      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_15      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );

    S_AXI_ACLK	    : in std_logic;
    S_AXI_ARESETN	: in std_logic;
    S_AXI_AWADDR	: in std_logic_vector( C_S_AXI_ADDR_WIDTH - 1 downto 0 );
    S_AXI_AWPROT	: in std_logic_vector( 2 downto 0 );
    S_AXI_AWVALID	: in std_logic;
    S_AXI_AWREADY	: out std_logic;
    S_AXI_WDATA	    : in std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    S_AXI_WSTRB	    : in std_logic_vector( ( C_S_AXI_DATA_WIDTH/8 ) - 1 downto 0 );
    S_AXI_WVALID	: in std_logic;
    S_AXI_WREADY	: out std_logic;
    S_AXI_BRESP	    : out std_logic_vector( 1 downto 0 );
    S_AXI_BVALID	: out std_logic;
    S_AXI_BREADY	: in std_logic;
    S_AXI_ARADDR	: in std_logic_vector( C_S_AXI_ADDR_WIDTH - 1 downto 0 );
    S_AXI_ARPROT	: in std_logic_vector( 2 downto 0 );
    S_AXI_ARVALID	: in std_logic;
    S_AXI_ARREADY	: out std_logic;
    S_AXI_RDATA	    : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    S_AXI_RRESP	    : out std_logic_vector( 1 downto 0 );
    S_AXI_RVALID	: out std_logic;
    S_AXI_RREADY	: in std_logic
 );
end component AXI4_Stream_Data_Source_v1_0_S00_AXI;

component BRAM_to_AXI4_Stream is
  generic ( 
    C_AXIS_TDATA_WIDTH      : integer := 32;
    C_BUF_ADDR_WIDTH        : integer := 12;
    C_BRAM_READ_LATENCY     : integer := 2
    );
  
  port ( 
    ACLK              : in  std_logic;
    ARESETN           : in  std_logic;
    TX_STATE_OUT      : out T_SM_STATE;
    TX_BUF_START_ADDR : integer range 0 to C_TX_MAX_DATA_WORDS;
    TX_BUF_ADDR       : out std_logic_vector( C_TX_BUF_ADDR_WIDTH - 1 downto 0 );
    TX_BUF_EN         : out std_logic;
    TX_BUF_DATA       : in  std_logic_vector( C_AXIS_TDATA_WIDTH - 1 downto 0 );
    M_AXIS_TREADY     : in  std_logic;
    M_AXIS_TVALID     : out std_logic;
    M_AXIS_TDATA      : out std_logic_vector( C_AXIS_TDATA_WIDTH - 1 downto 0 );
    SOFT_RESET        : in  std_logic;
    START_TX_F        : in  std_logic;
    TX_DONE           : out std_logic;
    N_DATA_WORDS      : in  integer range 0 to C_TX_MAX_DATA_WORDS
    );
end component BRAM_to_AXI4_Stream;

component Control_Register is
  generic ( 
    DATA_WIDTH      : integer := 32
    );
  
  port ( 
    ACLK            : in  std_logic;
    ARESETN         : in  std_logic;
    CTRL_REG_IN     : in  std_logic_vector( DATA_WIDTH - 1 downto 0 );
    CTRL_REG_OUT    : out std_logic_vector( DATA_WIDTH - 1 downto 0 );
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
    INT_ACK_F       : in  std_logic --flag
    );
 
end component Interrupt_Controller;



signal slv_reg_read_f          : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );    
signal slv_reg_write_f         : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );    
                              
signal slv_reg_0               : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_1               : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_2               : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_3               : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_4               : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_5               : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_6               : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_7               : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_8               : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_9               : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_10              : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_11              : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_12              : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_13              : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_14              : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_15              : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );

signal ctrl_reg                : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );      
signal info_reg                : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal bram_size_reg           : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal status_reg              : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );      
signal n_data_words_reg        : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal tx_addr_reg             : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );

signal resetp                  : std_logic;
signal resetn                  : std_logic;
signal sys_resetp              : std_logic;

signal m00_axis_tvalid_i       : std_logic;
signal m00_axis_tdata_i        : std_logic_vector( C_M00_AXIS_TDATA_WIDTH - 1 downto 0 );

signal data_buf_out_addr_i     : std_logic_vector( C_TX_BUF_ADDR_WIDTH - 1 downto 0 );
signal data_buf_out_en_i       : std_logic;
signal irq_i                   : std_logic;

--Flags from CPU
signal ps_reset_f              : std_logic;
signal ps_start_1_shot_f       : std_logic;
signal ps_start_contin_f       : std_logic;
signal ps_stop_f               : std_logic;
signal ps_int_ack_f            : std_logic;
signal ctrl_reg_in             : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );

--Stretched reset from PS
signal ps_reset                : std_logic;

constant TF_IDLE               : T_SM_STATE := C_SM_STATE_IDLE;
constant TF_WAIT_1_SHOT        : T_SM_STATE := b"1010";
constant TF_TX_1_SHOT          : T_SM_STATE := b"1110";
constant TF_WAIT_CONTIN        : T_SM_STATE := b"1011";
constant TF_TX_CONTIN          : T_SM_STATE := b"1111";
signal tf_state                : T_SM_STATE;

signal tx_frame_f              : std_logic;
signal tx_stop_b               : std_logic;

signal int_rqst_f              : std_logic;

signal tx_frame_done           : std_logic;
signal tx_n_data_words         : integer range 0 to C_TX_MAX_DATA_WORDS;
signal tx_start_addr           : integer range 0 to C_TX_MAX_DATA_WORDS;

--========================
-- Stats gathering signals
--======================== 
signal tx_data_ctr             : unsigned( clogb2( C_N_FFT_MAX - 1 ) - 1 downto 0 );   
signal tx_symbol_ctr           : unsigned( clogb2( C_N_SYMBS_FRAME_MAX - 1 ) - 1  downto 0 );   
signal tx_frame_ctr            : unsigned( clogb2( C_N_FRAMES_BLOCK_MAX - 1 ) - 1  downto 0 );   
signal tx_block_ctr            : unsigned( clogb2( C_N_BLOCKS_MAX - 1 ) - 1  downto 0 );   

signal tx_data_ctr_p           : unsigned( 31 downto 0 ); 
signal tx_symbol_ctr_p         : unsigned( 31 downto 0 ); 
signal tx_frame_ctr_p          : unsigned( 31 downto 0 ); 
signal tx_block_ctr_p          : unsigned( 31 downto 0 );

signal tx_valid                : std_logic;

signal ps_n_fft                : unsigned( clogb2( C_N_FFT_MAX ) - 1  downto 0 );
signal ps_n_symbols_frame      : unsigned( clogb2( C_N_SYMBS_FRAME_MAX ) - 1  downto 0 );
signal ps_n_frames_block       : unsigned( clogb2( C_N_FRAMES_BLOCK_MAX ) - 1  downto 0 );



signal tm_state                : T_SM_STATE;

begin

-- Instantiation of Axi Bus Interface S00_AXI
AXI4_Stream_Data_Source_v1_0_S00_AXI_inst : AXI4_Stream_Data_Source_v1_0_S00_AXI
	generic map ( 
		C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
	 )
	port map ( 
	
        SLV_REG_READ_F  => slv_reg_read_f,  
        SLV_REG_WRITE_F => slv_reg_write_f,  

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
	
		S_AXI_ACLK	    => aclk,
		S_AXI_ARESETN	=> resetn,
		S_AXI_AWADDR	=> s00_axi_awaddr,
		S_AXI_AWPROT	=> s00_axi_awprot,
		S_AXI_AWVALID	=> s00_axi_awvalid,
		S_AXI_AWREADY	=> s00_axi_awready,
		S_AXI_WDATA	    => s00_axi_wdata,
		S_AXI_WSTRB	    => s00_axi_wstrb,
		S_AXI_WVALID	=> s00_axi_wvalid,
		S_AXI_WREADY	=> s00_axi_wready,
		S_AXI_BRESP	    => s00_axi_bresp,
		S_AXI_BVALID	=> s00_axi_bvalid,
		S_AXI_BREADY	=> s00_axi_bready,
		S_AXI_ARADDR	=> s00_axi_araddr,
		S_AXI_ARPROT	=> s00_axi_arprot,
		S_AXI_ARVALID	=> s00_axi_arvalid,
		S_AXI_ARREADY	=> s00_axi_arready,
		S_AXI_RDATA	    => s00_axi_rdata,
		S_AXI_RRESP	    => s00_axi_rresp,
		S_AXI_RVALID	=> s00_axi_rvalid,
		S_AXI_RREADY	=> s00_axi_rready
	 );

	-- Add user logic here
BRAM_to_AXI4_Stream_i : BRAM_to_AXI4_Stream	
    generic map ( 
        C_AXIS_TDATA_WIDTH    => C_M00_AXIS_TDATA_WIDTH,
        C_BUF_ADDR_WIDTH      => C_TX_BUF_ADDR_WIDTH,
        C_BRAM_READ_LATENCY   => C_BRAM_READ_LATENCY
    )
    port map ( 
        ACLK              => aclk,
        ARESETN           => resetn,
        TX_STATE_OUT      => tm_state,
        TX_BUF_START_ADDR => tx_start_addr,
        TX_BUF_ADDR       => data_buf_out_addr_i,
        TX_BUF_EN         => data_buf_out_en_i,
        TX_BUF_DATA       => data_buf_out_data,
        M_AXIS_TREADY     => m00_axis_tready,
        M_AXIS_TVALID     => m00_axis_tvalid_i,
        M_AXIS_TDATA      => m00_axis_tdata_i,
        SOFT_RESET        => sys_resetp,
        START_TX_F        => tx_frame_f,
        TX_DONE           => tx_frame_done,
        N_DATA_WORDS      => tx_n_data_words
    ); 

Control_Register_i : Control_Register
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
  
Interrupt_Controller_i : Interrupt_Controller    
      port map ( 
        ACLK            => aclk,
        ARESETN         => resetn,
        SOFT_RESET      => sys_resetp,
        INTERNAL_IRQ_F  => int_rqst_f,
        EXTERNAL_IRQ    => irq_i,
        INT_ACK_F       => ps_int_ack_f
        );
         

data_buf_in_data           <= ( others => '0' );
data_buf_in_we             <= '0';

status_reg( 0 )            <= tx_frame_done; 
status_reg( 4 )            <= m00_axis_tvalid_i;
status_reg( 5 )            <= m00_axis_tready;
status_reg( 11 downto 8 )  <= tf_state;
status_reg( 15 downto 12 ) <= tm_state;

info_reg                 <= C_DEVICE_ID & std_logic_vector( to_unsigned( C_N_SLV_REG, slv_reg_0'length - C_DEVICE_ID'length ) );
bram_size_reg            <= std_logic_vector( to_unsigned( C_BRAM_SIZE_BYTES, slv_reg_0'length ) );

ctrl_reg                 <= slv_reg_0;
n_data_words_reg         <= slv_reg_2;
tx_addr_reg              <= slv_reg_3;

slv_reg_1                <= info_reg;
slv_reg_8                <= status_reg;
slv_reg_9                <= bram_size_reg;
slv_reg_10               <= ( others=>'0' );
slv_reg_11               <= ( others=>'0' );
slv_reg_12               <= std_logic_vector( resize( tx_data_ctr_p, slv_reg_0'length ) );
slv_reg_13               <= std_logic_vector( resize( tx_symbol_ctr_p, slv_reg_0'length ) );
slv_reg_14               <= std_logic_vector( resize( tx_frame_ctr_p, slv_reg_0'length ) );
slv_reg_15               <= std_logic_vector( resize( tx_block_ctr_p, slv_reg_0'length ) );

tx_n_data_words          <= to_integer( unsigned( n_data_words_reg ) );
tx_start_addr            <= to_integer( unsigned( tx_addr_reg ) );

ps_n_fft                 <= resize( unsigned( slv_reg_5 ), ps_n_fft'length );
ps_n_symbols_frame       <= resize( unsigned( slv_reg_6 ), ps_n_symbols_frame'length );
ps_n_frames_block        <= resize( unsigned( slv_reg_7 ), ps_n_frames_block'length );

m00_axis_tvalid          <= m00_axis_tvalid_i;
m00_axis_tdata           <= m00_axis_tdata_i;
m00_axis_tstrb           <= ( others => '1' );	
m00_axis_tlast           <= '0';

data_buf_out_addr        <= data_buf_out_addr_i;
data_buf_out_en          <= data_buf_out_en_i;

irq                      <= irq_i;

ps_int_ack_f             <= ctrl_reg_in( 1 );
ps_start_1_shot_f        <= ctrl_reg_in( 2 );
ps_start_contin_f        <= ctrl_reg_in( 3 );
ps_stop_f                <= ctrl_reg_in( 4 );
    
tx_valid <= '1' when ( ( m00_axis_tvalid_i = '1' ) and ( m00_axis_tready = '1' ) ) else '0';    
    
stats_p: process( aclk )
begin
  if rising_edge( aclk ) then
    if ( resetn = '0' ) then
      tx_data_ctr     <= ( others=> '0' );
      tx_symbol_ctr   <= ( others=> '0' );
      tx_frame_ctr    <= ( others=> '0' );
      tx_block_ctr    <= ( others=> '0' );    
                          
      tx_data_ctr_p   <= ( others=> '0' );
      tx_symbol_ctr_p <= ( others=> '0' );
      tx_frame_ctr_p  <= ( others=> '0' );
      tx_block_ctr_p  <= ( others=> '0' );    
    
    else 
      if tx_valid = '1' then
        tx_data_ctr_p        <= tx_data_ctr_p + 1;
        if tx_data_ctr < ps_n_fft - 1 then  
          tx_data_ctr        <= tx_data_ctr + 1;
        else
          tx_data_ctr <= ( others=> '0' );
          tx_symbol_ctr_p    <= tx_symbol_ctr_p + 1;
          if tx_symbol_ctr < ps_n_symbols_frame - 1 then 
            tx_symbol_ctr    <= tx_symbol_ctr + 1;
          else
            tx_symbol_ctr    <= ( others=> '0' );
            tx_frame_ctr_p   <= tx_frame_ctr_p + 1;
            if tx_frame_ctr < ps_n_frames_block - 1 then
              tx_frame_ctr   <= tx_frame_ctr + 1;
            else
              tx_frame_ctr   <= ( others=> '0' );
              tx_block_ctr_p <= tx_block_ctr_p + 1;
              tx_block_ctr   <= tx_block_ctr + 1;
            end if;
          end if;
        end if;
      end if;
    end if;
  end if;
end process;
    

-- Transmit SM    
--Tx_p: process ( aclk )
--begin
--  if rising_edge( aclk ) then
--    if ( resetn = '0' ) then
--      tf_state    <= TF_IDLE;
--      int_rqst_f  <= '0';
                  
--    else 
--      int_rqst_f  <= '0';           
     
--      case tf_state is
--        when TF_IDLE =>
--          sm_state <= b"00";
--          if ( ps_tx_frame_f = '1' ) then
--            tf_state <= TF_WAIT_START;
--          end if;

--        when TF_WAIT_START =>
--          sm_state <= b"01";
--          if ( tx_frame_done = '0' ) then
--            tf_state <= TF_RUNNING;
--          end if;
          
--        when TF_RUNNING =>  
--          sm_state <= b"10";
--          if ( tx_frame_done = '1' ) then
--            int_rqst_f <= '1';
--            tf_state <= TF_IDLE;
--          end if;
          
--        when others =>
--          null;
         
--      end case;
--    end if;
--  end if;
--end process;


Tx_p: process ( aclk )
begin
  if rising_edge( aclk ) then
    if ( resetn = '0' ) then
      tf_state     <= TF_IDLE;
      tx_frame_f   <= '0';
      tx_stop_b    <= '0';
      int_rqst_f   <= '0';
      sys_resetp   <= '1';
    else 
      sys_resetp   <= '0';
      tx_frame_f   <= '0';
      int_rqst_f   <= '0';           
       
      if ps_stop_f = '1' then
        tf_state   <= TF_IDLE;
        sys_resetp <= '1';
      else
         
        case tf_state is
          when TF_IDLE =>
            if ps_start_1_shot_f = '1' then
              tx_frame_f <= '1';
              tf_state   <= TF_WAIT_1_SHOT;
            end if;
            if ps_start_contin_f = '1' then
              tx_frame_f <= '1';
              tf_state   <= TF_WAIT_CONTIN;
            end if;
  
          when TF_WAIT_1_SHOT =>
            if ( tx_frame_done = '0' ) then
              tf_state   <= TF_TX_1_SHOT;
            end if;
            
          when TF_TX_1_SHOT =>  
            if ( tx_frame_done = '1' ) then
              tf_state   <= TF_IDLE;
            end if;
  
          when TF_WAIT_CONTIN =>
            if ( tx_frame_done = '0' ) then
              tf_state   <= TF_TX_CONTIN;
            end if;
  
          when TF_TX_CONTIN =>  
            if ( tx_frame_done = '1' ) then
              tx_frame_f <= '1';
              tf_state   <= TF_WAIT_CONTIN;
            end if;
            
          when others =>
            null;
        end case;

      end if;
    end if;
  end if;

end process;


end rtl;
