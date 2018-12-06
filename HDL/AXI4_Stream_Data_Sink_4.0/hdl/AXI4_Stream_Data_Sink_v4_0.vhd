library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.emm_telsys.all;

entity AXI4_Stream_Data_Sink_v4_0 is
generic ( 

    C_IN_BUF_ADDR_WIDTH         : integer := 16;
    C_OUT_BUF_ADDR_WIDTH        : integer := 16;
	C_S00_AXI_DATA_WIDTH        : integer := 32;
	C_S00_AXI_ADDR_WIDTH        : integer := 7;

	-- Parameters of Axi Slave Bus Interface S_AXIS_DATA
	C_S_AXIS_DATA_TDATA_WIDTH	: integer := 32;
	
    C_BRAM_READ_LATENCY         : integer := 2;
	C_DEVICE_ID                 : std_logic_vector( 23 downto 0 ) := x"1BEFED"  
 );
port ( 

    aclk               : in  std_logic;
    aresetn            : in  std_logic;

    data_buf_out_addr  : out std_logic_vector( C_OUT_BUF_ADDR_WIDTH-1 downto 0 );
    data_buf_out_en    : out std_logic;
    data_buf_out_data  : in  std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
    data_buf_in_addr   : out std_logic_vector( C_IN_BUF_ADDR_WIDTH-1 downto 0 );
    data_buf_in_we     : out std_logic;
    data_buf_in_data   : out std_logic_vector( C_S_AXIS_DATA_TDATA_WIDTH-1 downto 0 );
    
    irq                : out std_logic;
    

	-- Ports of Axi Slave Bus Interface S00_AXI
    s00_axi_awaddr	   : in std_logic_vector( C_S00_AXI_ADDR_WIDTH-1 downto 0 );
    s00_axi_awprot	   : in std_logic_vector( 2 downto 0 );
    s00_axi_awvalid	   : in std_logic;
    s00_axi_awready	   : out std_logic;
    s00_axi_wdata	   : in std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
    s00_axi_wstrb	   : in std_logic_vector( ( C_S00_AXI_DATA_WIDTH/8 )-1 downto 0 );
    s00_axi_wvalid	   : in std_logic;
    s00_axi_wready	   : out std_logic;
    s00_axi_bresp	   : out std_logic_vector( 1 downto 0 );
    s00_axi_bvalid	   : out std_logic;
    s00_axi_bready	   : in std_logic;
    s00_axi_araddr	   : in std_logic_vector( C_S00_AXI_ADDR_WIDTH-1 downto 0 );
    s00_axi_arprot	   : in std_logic_vector( 2 downto 0 );
    s00_axi_arvalid	   : in std_logic;
    s00_axi_arready	   : out std_logic;
    s00_axi_rdata	   : out std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
    s00_axi_rresp	   : out std_logic_vector( 1 downto 0 );
    s00_axi_rvalid	   : out std_logic;
    s00_axi_rready	   : in std_logic;
    
    -- Ports of Axi Slave Bus Interface S_AXIS_DATA
    s_axis_data_tready	   : out std_logic;
    s_axis_data_tdata	   : in std_logic_vector( C_S_AXIS_DATA_TDATA_WIDTH-1 downto 0 );
    s_axis_data_tvalid	   : in std_logic
 );
end AXI4_Stream_Data_Sink_v4_0;

architecture arch_imp of AXI4_Stream_Data_Sink_v4_0 is

constant C_IN_MAX_DATA_WORDS : integer := 2**C_IN_BUF_ADDR_WIDTH;
constant C_BRAM_SIZE_BYTES   : integer := 4 * ( 2**C_OUT_BUF_ADDR_WIDTH  );
constant C_N_SLV_REG         : integer := 2**( C_S00_AXI_ADDR_WIDTH - 2 );

-- component declaration
component AXI4_Stream_Data_Sink_v4_0_S00_AXI is
  generic ( 
	C_S_AXI_DATA_WIDTH	: integer	:= 32;
	C_S_AXI_ADDR_WIDTH	: integer	:= 7
   );
  port ( 
    SLV_REG_0       : out std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
    SLV_REG_1       : in  std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
    SLV_REG_2       : out std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
    SLV_REG_3       : out std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
    SLV_REG_4       : out std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
    SLV_REG_5       : out std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
    SLV_REG_6       : out std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
    SLV_REG_7       : out std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
    SLV_REG_8       : out std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
    SLV_REG_9       : out std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
    SLV_REG_10      : out std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
    SLV_REG_11      : out std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
    SLV_REG_12      : out std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
    SLV_REG_13      : out std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
    SLV_REG_14      : out std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
    SLV_REG_15      : out std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );

    SLV_REG_16      : in  std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
    SLV_REG_17      : in  std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
    SLV_REG_18      : in  std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
    SLV_REG_19      : in  std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
    SLV_REG_20      : in  std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
    SLV_REG_21      : in  std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
    SLV_REG_22      : in  std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
    SLV_REG_23      : in  std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
    SLV_REG_24      : in  std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
    SLV_REG_25      : in  std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
    SLV_REG_26      : in  std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
    SLV_REG_27      : in  std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
    SLV_REG_28      : in  std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
    SLV_REG_29      : in  std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
    SLV_REG_30      : in  std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
    SLV_REG_31      : in  std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0  );
	
	S_AXI_ACLK	    : in std_logic;
	S_AXI_ARESETN	: in std_logic;
	S_AXI_AWADDR	: in std_logic_vector( C_S_AXI_ADDR_WIDTH-1 downto 0 );
	S_AXI_AWPROT	: in std_logic_vector( 2 downto 0 );
	S_AXI_AWVALID	: in std_logic;
	S_AXI_AWREADY	: out std_logic;
	S_AXI_WDATA	    : in std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0 );
	S_AXI_WSTRB	    : in std_logic_vector( ( C_S_AXI_DATA_WIDTH/8 )-1 downto 0 );
	S_AXI_WVALID	: in std_logic;
	S_AXI_WREADY	: out std_logic;
	S_AXI_BRESP	    : out std_logic_vector( 1 downto 0 );
	S_AXI_BVALID	: out std_logic;
	S_AXI_BREADY	: in std_logic;
	S_AXI_ARADDR	: in std_logic_vector( C_S_AXI_ADDR_WIDTH-1 downto 0 );
	S_AXI_ARPROT	: in std_logic_vector( 2 downto 0 );
	S_AXI_ARVALID	: in std_logic;
	S_AXI_ARREADY	: out std_logic;
	S_AXI_RDATA	    : out std_logic_vector( C_S_AXI_DATA_WIDTH-1 downto 0 );
	S_AXI_RRESP	    : out std_logic_vector( 1 downto 0 );
	S_AXI_RVALID	: out std_logic;
	S_AXI_RREADY	: in std_logic
                                                                                                                                                                                                                                              );
end component AXI4_Stream_Data_Sink_v4_0_S00_AXI;

component BRAM_PS_RW is
  generic ( 
    C_BRAM_ADDR_WIDTH       : integer := 0;
    C_BRAM_RD_ADDR_WIDTH    : integer := 0;
    C_BRAM_WR_ADDR_WIDTH    : integer := 0;
    C_BRAM_BUF_SEL_WIDTH    : integer := 0;
    C_BRAM_RD_BUF_SEL_WIDTH : integer := 0;
    C_BRAM_WR_BUF_SEL_WIDTH : integer := 0;
    C_BRAM_DIN_WIDTH        : integer := 0;
    C_BRAM_DOUT_WIDTH       : integer := 0;
    C_PS_ADDR_REG_WIDTH     : integer := 0;
    C_PS_RD_ADDR_REG_WIDTH  : integer := 0;
    C_PS_WR_ADDR_REG_WIDTH  : integer := 0;
    C_PS_RD_DATA_REG_WIDTH  : integer := 0;
    C_PS_WR_DATA_REG_WIDTH  : integer := 0;
    C_BRAM_RD_LATENCY       : integer := 2
   );
  
  port ( 
    PS_ADDR_REG             : in   std_logic_vector( C_PS_ADDR_REG_WIDTH - 1 downto 0 )    := ( others => '0'  );
    PS_RD_ADDR_REG          : in   std_logic_vector( C_PS_RD_ADDR_REG_WIDTH - 1 downto 0 ) := ( others => '0'  );
    PS_WR_ADDR_REG          : in   std_logic_vector( C_PS_WR_ADDR_REG_WIDTH - 1 downto 0 ) := ( others => '0'  );
    PS_RD_DATA_REG          : out  std_logic_vector( C_PS_RD_DATA_REG_WIDTH - 1 downto 0  );
    PS_WR_DATA_REG          : in   std_logic_vector( C_PS_WR_DATA_REG_WIDTH - 1 downto 0 ) := ( others => '0'  );
  
    SYS_ADDR                : in   std_logic_vector( C_BRAM_ADDR_WIDTH - 1 downto 0 )      := ( others => '0'  );
    SYS_RD_ADDR             : in   std_logic_vector( C_BRAM_RD_ADDR_WIDTH - 1 downto 0 )   := ( others => '0'  );
    SYS_WR_ADDR             : in   std_logic_vector( C_BRAM_WR_ADDR_WIDTH - 1 downto 0 )   := ( others => '0'  );
    SYS_BUF_SEL             : in   std_logic_vector( C_BRAM_BUF_SEL_WIDTH - 1 downto 0 )   := ( others => '0'  ); 
    SYS_RD_BUF_SEL          : in   std_logic_vector( C_BRAM_RD_BUF_SEL_WIDTH - 1 downto 0 ):= ( others => '0'  ); 
    SYS_WR_BUF_SEL          : in   std_logic_vector( C_BRAM_WR_BUF_SEL_WIDTH - 1 downto 0 ):= ( others => '0'  ); 
    SYS_WR_DATA             : in   std_logic_vector( C_BRAM_DIN_WIDTH - 1 downto 0 )       := ( others => '0'  );
    SYS_EN                  : in   std_logic                                               := '0';
    SYS_RD_EN               : in   std_logic                                               := '0';
    SYS_WR_EN               : in   std_logic                                               := '0';
    SYS_WE                  : in   std_logic                                               := '0';
  
    BRAM_ADDR               : out  std_logic_vector( C_BRAM_ADDR_WIDTH - 1 downto 0  );
    BRAM_RD_ADDR            : out  std_logic_vector( C_BRAM_RD_ADDR_WIDTH - 1 downto 0  );
    BRAM_WR_ADDR            : out  std_logic_vector( C_BRAM_WR_ADDR_WIDTH - 1 downto 0  );
    BRAM_BUF_SEL            : out  std_logic_vector( C_BRAM_BUF_SEL_WIDTH - 1 downto 0  );
    BRAM_RD_BUF_SEL         : out  std_logic_vector( C_BRAM_RD_BUF_SEL_WIDTH - 1 downto 0  );
    BRAM_WR_BUF_SEL         : out  std_logic_vector( C_BRAM_RD_BUF_SEL_WIDTH - 1 downto 0  );
    BRAM_DIN                : out  std_logic_vector( C_BRAM_DIN_WIDTH - 1 downto 0  );
    BRAM_EN                 : out  std_logic;
    BRAM_RD_EN              : out  std_logic;
    BRAM_WR_EN              : out  std_logic;
    BRAM_WE                 : out  std_logic;

    BRAM_DOUT               : in   std_logic_vector( C_BRAM_DOUT_WIDTH - 1 downto 0 )      := ( others => '0'  );
  
    PS_RD_F                 : in   std_logic                                               := '0';
    PS_RD_ACK_F             : in   std_logic                                               := '0';
    PS_RD_RDY               : out  std_logic;                                              
    PS_WR_F                 : in   std_logic                                               := '0';
  
    RD_STATE_OUT            : out  T_SM_STATE;  
    PS_ENABLE               : in   std_logic                                               := '0';
    PS_RD_ENABLE            : in   std_logic                                               := '0';
    PS_WR_ENABLE            : in   std_logic                                               := '0';
    ACLK                    : in   std_logic;
    ARESETN                 : in   std_logic
   );
end component BRAM_PS_RW;


component Control_Register is
  generic ( 
    DATA_WIDTH      : integer := 32
     );
    
  port ( 
    ACLK            : in  std_logic;
    ARESETN         : in  std_logic;
    CTRL_REG_IN     : in  std_logic_vector( DATA_WIDTH-1 downto 0 );
    CTRL_REG_OUT    : out std_logic_vector( DATA_WIDTH-1 downto 0 );
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


--=============
-- PS Interface
--=============
signal slv_reg_0               : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal slv_reg_1               : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal slv_reg_2               : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal slv_reg_3               : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal slv_reg_4               : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal slv_reg_5               : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal slv_reg_6               : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal slv_reg_7               : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal slv_reg_8               : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal slv_reg_9               : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal slv_reg_10              : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal slv_reg_11              : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal slv_reg_12              : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal slv_reg_13              : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal slv_reg_14              : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal slv_reg_15              : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );

signal slv_reg_16              : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal slv_reg_17              : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal slv_reg_18              : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal slv_reg_19              : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal slv_reg_20              : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal slv_reg_21              : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal slv_reg_22              : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal slv_reg_23              : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal slv_reg_24              : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal slv_reg_25              : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal slv_reg_26              : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal slv_reg_27              : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal slv_reg_28              : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal slv_reg_29              : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal slv_reg_30              : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal slv_reg_31              : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );

signal n_rx_data_words         : integer range 0 to 2 ** C_IN_BUF_ADDR_WIDTH; 
signal rx_stream_done          : std_logic;

signal ps_start_blck_f         : std_logic;
signal ps_int_ack_f            : std_logic;
signal ps_start_f              : std_logic;
signal ps_stop_f               : std_logic;
signal ps_rd_data_f            : std_logic;
signal ps_rd_ack_f             : std_logic;
signal ps_load_data_f          : std_logic;
signal ps_wr_data_f            : std_logic;
signal ps_end_load_f           : std_logic;

signal rd_data_rdy             : std_logic;
         
signal int_rqst                : std_logic;
signal irq_i                   : std_logic;         
         
signal ctrl_reg                : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );   
signal info_reg                : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );   
signal bram_size_reg           : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );   

signal addr_reg                : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );   
signal wr_data_reg             : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );   
signal ctrl_reg_in             : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );   
signal config_reg              : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );

signal stat_reg                : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );
signal rd_data_reg             : std_logic_vector( C_S00_AXI_DATA_WIDTH-1 downto 0 );         

signal resetp                  : std_logic;
signal resetn                  : std_logic;


--============
-- BRAM access
--============
signal rx_bram_addr            : unsigned( C_IN_BUF_ADDR_WIDTH - 1 downto 0  );
signal rx_bram_nxt_addr        : unsigned( C_IN_BUF_ADDR_WIDTH - 1 downto 0  );

signal a_data_buf_in_addr      : std_logic_vector( C_IN_BUF_ADDR_WIDTH-1 downto 0 );
signal a_data_buf_in_we        : std_logic;
signal a_data_buf_in_data      : std_logic_vector( C_S_AXIS_DATA_TDATA_WIDTH-1 downto 0 );

signal ad_admin_en             : std_logic;
signal ps_pl_wr_inh            : std_logic;

signal rx_buf_start_addr       : unsigned( C_IN_BUF_ADDR_WIDTH - 1 downto 0  );

--========================
-- Stats gathering signals
--======================== 
signal rx_data_ctr             : unsigned( clogb2( C_N_FFT_MAX - 1 ) - 1 downto 0  );   
signal rx_symbol_ctr           : unsigned( clogb2( C_N_SYMBS_FRAME_MAX - 1 ) - 1  downto 0  );   
signal rx_frame_ctr            : unsigned( clogb2( C_N_FRAMES_BLOCK_MAX - 1 ) - 1  downto 0  );   
signal rx_block_ctr            : unsigned( clogb2( C_N_BLOCKS_MAX - 1 ) - 1  downto 0  );   

signal rx_data_ctr_p           : unsigned( 31 downto 0  ); 
signal rx_symbol_ctr_p         : unsigned( 31 downto 0  ); 
signal rx_frame_ctr_p          : unsigned( 31 downto 0  ); 
signal rx_block_ctr_p          : unsigned( 31 downto 0  );

signal wr_data_ctr             : unsigned( clogb2( C_N_FFT_MAX - 1 ) - 1 downto 0  );   
signal wr_symbol_ctr           : unsigned( clogb2( C_N_SYMBS_FRAME_MAX - 1 ) - 1  downto 0  );   
signal wr_frame_ctr            : unsigned( clogb2( C_N_FRAMES_BLOCK_MAX - 1 ) - 1  downto 0  );   
signal wr_block_ctr            : unsigned( clogb2( C_N_BLOCKS_MAX - 1 ) - 1  downto 0  );   

signal wr_data_ctr_p           : unsigned( 31 downto 0  ); 
signal wr_symbol_ctr_p         : unsigned( 31 downto 0  ); 
signal wr_frame_ctr_p          : unsigned( 31 downto 0  ); 
signal wr_block_ctr_p          : unsigned( 31 downto 0  );

signal rx_valid                : std_logic;

signal ps_n_fft                : unsigned( clogb2( C_N_FFT_MAX ) - 1  downto 0  );
signal ps_n_symbols_frame      : unsigned( clogb2( C_N_SYMBS_FRAME_MAX ) - 1  downto 0  );
signal ps_n_frames_block       : unsigned( clogb2( C_N_FRAMES_BLOCK_MAX ) - 1  downto 0  );

--=====================
-- State machine states
--=====================
constant EX_IDLE             : T_SM_STATE := b"1001";
constant EX_SOFT_LOAD_DATA   : T_SM_STATE := b"1011";

signal ex_state              : T_SM_STATE;
signal ex_nxtst              : T_SM_STATE;

constant RX_IDLE             : T_SM_STATE := b"1001";
constant RX_BLCK             : T_SM_STATE := b"1011";
constant RX_CONT             : T_SM_STATE := b"1101";

signal rx_state              : T_SM_STATE;
signal rx_nxtst              : T_SM_STATE;

constant RD_IDLE             : T_SM_STATE := b"1001";
constant RD_WAITING          : T_SM_STATE := b"1010";
constant RD_READY            : T_SM_STATE := b"1101";

signal rd_data_state         : T_SM_STATE; 

--=================================
-- Ovservable AXI4 handshake signal
--=================================
signal s_axis_data_tready_i    : std_logic;

   
begin

-- Instantiation of Axi Bus Interface S00_AXI
AXI4_Stream_Data_Sink_v4_0_S00_AXI_inst : AXI4_Stream_Data_Sink_v4_0_S00_AXI
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
  
  SLV_REG_16      => slv_reg_16,
  SLV_REG_17      => slv_reg_17,
  SLV_REG_18      => slv_reg_18,
  SLV_REG_19      => slv_reg_19,
  SLV_REG_20      => slv_reg_20,
  SLV_REG_21      => slv_reg_21,
  SLV_REG_22      => slv_reg_22,
  SLV_REG_23      => slv_reg_23,
  SLV_REG_24      => slv_reg_24,
  SLV_REG_25      => slv_reg_25,
  SLV_REG_26      => slv_reg_26,
  SLV_REG_27      => slv_reg_27,
  SLV_REG_28      => slv_reg_28,
  SLV_REG_29      => slv_reg_29,
  SLV_REG_30      => slv_reg_30,
  SLV_REG_31      => slv_reg_31,
  
  
  S_AXI_ACLK	=> aclk,
  S_AXI_ARESETN	=> aresetn,
  S_AXI_AWADDR	=> s00_axi_awaddr,
  S_AXI_AWPROT	=> s00_axi_awprot,
  S_AXI_AWVALID	=> s00_axi_awvalid,
  S_AXI_AWREADY	=> s00_axi_awready,
  S_AXI_WDATA	=> s00_axi_wdata,
  S_AXI_WSTRB	=> s00_axi_wstrb,
  S_AXI_WVALID	=> s00_axi_wvalid,
  S_AXI_WREADY	=> s00_axi_wready,
  S_AXI_BRESP	=> s00_axi_bresp,
  S_AXI_BVALID	=> s00_axi_bvalid,
  S_AXI_BREADY	=> s00_axi_bready,
  S_AXI_ARADDR	=> s00_axi_araddr,
  S_AXI_ARPROT	=> s00_axi_arprot,
  S_AXI_ARVALID	=> s00_axi_arvalid,
  S_AXI_ARREADY	=> s00_axi_arready,
  S_AXI_RDATA	=> s00_axi_rdata,
  S_AXI_RRESP	=> s00_axi_rresp,
  S_AXI_RVALID	=> s00_axi_rvalid,
  S_AXI_RREADY	=> s00_axi_rready
   );
  
 
Control_Register_inst : Control_Register
  generic map ( 
    DATA_WIDTH => C_S00_AXI_DATA_WIDTH
    )
  port map ( 
    ACLK            => aclk,
    ARESETN         => aresetn,
    CTRL_REG_IN     => ctrl_reg,
    CTRL_REG_OUT    => ctrl_reg_in,
    RESETP_OUT      => resetp,
    RESETN_OUT      => resetn
     );

Interrupt_Controller_inst : Interrupt_Controller    
  port map ( 
    ACLK            => aclk,
    ARESETN         => resetn,
    SOFT_RESET      => resetp,
    INTERNAL_IRQ_F  => int_rqst,
    EXTERNAL_IRQ    => irq_i,
    INT_ACK_F       => ps_int_ack_f
     );

ps_txbuf_w_rxbuf_r: BRAM_PS_RW
  generic map ( 
    C_BRAM_RD_ADDR_WIDTH    => C_OUT_BUF_ADDR_WIDTH, 
    C_BRAM_WR_ADDR_WIDTH    => C_IN_BUF_ADDR_WIDTH,
    C_BRAM_DIN_WIDTH        => C_S_AXIS_DATA_TDATA_WIDTH, 
    C_BRAM_DOUT_WIDTH       => C_S00_AXI_DATA_WIDTH, 
    C_PS_RD_ADDR_REG_WIDTH  => C_S00_AXI_DATA_WIDTH, 
    C_PS_WR_ADDR_REG_WIDTH  => C_S00_AXI_DATA_WIDTH, 
    C_PS_RD_DATA_REG_WIDTH  => C_S00_AXI_DATA_WIDTH, 
    C_PS_WR_DATA_REG_WIDTH  => C_S00_AXI_DATA_WIDTH, 
    C_BRAM_RD_LATENCY       => C_BRAM_READ_LATENCY 
 )                     

  port map ( 
    PS_RD_ADDR_REG          => addr_reg,
    PS_WR_ADDR_REG          => addr_reg,
    PS_RD_DATA_REG          => rd_data_reg, 
    PS_WR_DATA_REG          => wr_data_reg,
                        
    SYS_RD_ADDR             => ( others => '0'  ),
    SYS_WR_ADDR             => a_data_buf_in_addr, 
    SYS_WR_DATA             => a_data_buf_in_data,  
    SYS_RD_EN               => '0', 
    SYS_WE                  => a_data_buf_in_we,  

    BRAM_RD_ADDR            => data_buf_out_addr,
    BRAM_WR_ADDR            => data_buf_in_addr,
    BRAM_DIN                => data_buf_in_data, 
    BRAM_RD_EN              => data_buf_out_en, 
    BRAM_WE                 => data_buf_in_we, 

    BRAM_DOUT               => data_buf_out_data, 
                        
    PS_RD_F                 => ps_rd_data_f, 
    PS_RD_ACK_F             => ps_rd_ack_f, 
    PS_RD_RDY               => rd_data_rdy, 
    PS_WR_F                 => ps_wr_data_f, 
                        
    RD_STATE_OUT            => rd_data_state, 
    PS_RD_ENABLE            => '1', 
    PS_WR_ENABLE            => ad_admin_en, 
    ACLK                    => aclk, 
    ARESETN                 => resetn 
   );



ad_admin_en            <= '1' when ( ex_state = EX_SOFT_LOAD_DATA )else '0';

ctrl_reg               <= slv_reg_0;

ps_int_ack_f           <= ctrl_reg_in( 1 );
ps_start_blck_f        <= ctrl_reg_in( 2 );
ps_start_f             <= ctrl_reg_in( 3 );
ps_stop_f              <= ctrl_reg_in( 4 );
ps_rd_data_f           <= ctrl_reg_in( 5 );
ps_rd_ack_f            <= ctrl_reg_in( 6 );
ps_load_data_f         <= ctrl_reg_in( 7 );
ps_wr_data_f           <= ctrl_reg_in( 8 );
ps_end_load_f          <= ctrl_reg_in( 9 );

config_reg             <= slv_reg_2;
ps_pl_wr_inh           <= config_reg( 0 );

addr_reg               <= slv_reg_3;
wr_data_reg            <= slv_reg_4;
n_rx_data_words        <= to_integer( unsigned( slv_reg_5 ) );
rx_buf_start_addr      <= unsigned( slv_reg_6( rx_buf_start_addr'length - 1 downto 0 ));


ps_n_fft               <= resize( unsigned( slv_reg_8  ), ps_n_fft'length  );
ps_n_symbols_frame     <= resize( unsigned( slv_reg_9  ), ps_n_symbols_frame'length  );
ps_n_frames_block      <= resize( unsigned( slv_reg_10 ), ps_n_frames_block'length  );

stat_reg( 0 )            <= resetp;
stat_reg( 1 )            <= irq_i;
stat_reg( 2 )            <= rd_data_rdy;
stat_reg( 3 )            <= rx_stream_done;

stat_reg( 4 )            <= s_axis_data_tready_i;
stat_reg( 5 )            <= s_axis_data_tvalid; 

stat_reg( 6 )            <= '0'; 
stat_reg( 7 )            <= '0'; 

stat_reg( 11 downto 8 )  <= ex_state;
stat_reg( 15 downto 12 ) <= rx_state;
stat_reg( 19 downto 16 ) <= rd_data_state;    
  
stat_reg( 20 )           <= '0'; 
stat_reg( 21 )           <= '0'; 
stat_reg( 22 )           <= '0'; 
stat_reg( 23 )           <= '0'; 
stat_reg( 24 )           <= '0';
stat_reg( 25 )           <= '0';
stat_reg( 26 )           <= '0'; 
stat_reg( 27 )           <= '0'; 
stat_reg( 28 )           <= '0'; 
stat_reg( 29 )           <= '0'; 
stat_reg( 30 )           <= '0'; 
stat_reg( 31 )           <= '0'; 

info_reg               <= C_DEVICE_ID & std_logic_vector( to_unsigned( C_N_SLV_REG, slv_reg_0'length - C_DEVICE_ID'length ) ); 
bram_size_reg          <= std_logic_vector( to_unsigned( C_BRAM_SIZE_BYTES, slv_reg_0'length ) );

slv_reg_1              <= info_reg;
slv_reg_16             <= stat_reg;
slv_reg_17             <= rd_data_reg;
slv_reg_18             <= bram_size_reg;
slv_reg_19             <= ( others=>'0' );
slv_reg_20             <= std_logic_vector( resize( rx_data_ctr_p,   slv_reg_0'length ) );
slv_reg_21             <= std_logic_vector( resize( rx_symbol_ctr_p, slv_reg_0'length ) );
slv_reg_22             <= std_logic_vector( resize( rx_frame_ctr_p,  slv_reg_0'length ) );
slv_reg_23             <= std_logic_vector( resize( rx_block_ctr_p,  slv_reg_0'length ) );
slv_reg_24             <= std_logic_vector( resize( wr_data_ctr_p,   slv_reg_0'length ) );
slv_reg_25             <= std_logic_vector( resize( wr_symbol_ctr_p, slv_reg_0'length ) );
slv_reg_26             <= std_logic_vector( resize( wr_frame_ctr_p,  slv_reg_0'length ) );
slv_reg_27             <= std_logic_vector( resize( wr_block_ctr_p,  slv_reg_0'length ) );
slv_reg_28             <= ( others=>'0' );
slv_reg_29             <= ( others=>'0' );
slv_reg_30             <= ( others=>'0' );
slv_reg_31             <= std_logic_vector( resize( rx_bram_addr,    slv_reg_0'length ) );
 
s_axis_data_tready     <= s_axis_data_tready_i;

irq                    <= irq_i;
int_rqst               <= '0';


--===============
-- BRAM Access sm
--===============
ex_sm: process( aclk, ex_state, ex_nxtst, ps_load_data_f, ps_end_load_f  )
begin
  if rising_edge( aclk ) then
    if ( resetn = '0' ) then
      ex_state   <= EX_IDLE;
    else
      ex_state   <= ex_nxtst;
    end if;
  end if;  
  
  ex_nxtst       <= ex_state;
  
  case ex_state is
    when EX_IDLE =>
      if ps_load_data_f = '1' then
        ex_nxtst <= EX_SOFT_LOAD_DATA;
      end if;
        
    when EX_SOFT_LOAD_DATA =>
      if ( ps_end_load_f = '1' ) then
        ex_nxtst <= EX_IDLE;
      end if;
                      
    when others =>
      null;
      
  end case; 
end process;

--===========================================
-- Rx process : can be continuous or by block
--===========================================
rx_valid             <= '1' when ( ( s_axis_data_tready_i = '1' ) and ( s_axis_data_tvalid = '1' ) ) else '0';

a_data_buf_in_addr   <= std_logic_vector( rx_bram_addr  );
a_data_buf_in_data   <= s_axis_data_tdata;
a_data_buf_in_we     <= rx_valid and not ps_pl_wr_inh; 
s_axis_data_tready_i <= '1' when ( rx_state /= RX_IDLE )else '0';
rx_stream_done       <= '1' when ( rx_state  = RX_IDLE )else '0';

rxdata: process( aclk, rx_state, rx_nxtst, ex_nxtst, ps_start_blck_f, ps_start_f, ps_stop_f, rx_valid, rx_bram_addr, n_rx_data_words   )
begin  
  if rising_edge( aclk ) then
    if resetn = '0' then
      rx_state   <= RX_IDLE;
    else
      rx_state   <= rx_nxtst;
    end if;
  end if;
  
  rx_nxtst       <= rx_state;
  
  case rx_state is
    when RX_IDLE =>

      if ps_start_blck_f = '1' then
        rx_nxtst    <= RX_BLCK;
      elsif ps_start_f = '1' then
        rx_nxtst    <= RX_CONT;
      end if;
      
    when RX_BLCK =>
      if rx_valid = '1' then 
        if rx_bram_addr = n_rx_data_words - 1 or ps_stop_f = '1' then
           rx_nxtst <= RX_IDLE;
        end if;
      end if;
    
    when RX_CONT =>
      if ps_stop_f = '1' then 
        rx_nxtst    <= RX_IDLE;
      end if;
  
    when others =>
      null;
      
  end case;

  if ex_nxtst = EX_SOFT_LOAD_DATA then
    rx_nxtst <= RX_IDLE;
  end if;

end process;

bram_addr_p: process( aclk, rx_state, rx_nxtst, rx_bram_addr, rx_bram_nxt_addr, a_data_buf_in_we, rx_buf_start_addr  )
begin  
  if rising_edge( aclk ) then
    if resetn = '0' then
      rx_bram_addr <= ( others => '0' );
    else
      rx_bram_addr <= rx_bram_nxt_addr;
    end if;
  end if;  
  
  rx_bram_nxt_addr <= rx_bram_addr;
  
  case rx_state is
    when RX_IDLE =>
      if rx_nxtst = RX_BLCK then
        rx_bram_nxt_addr <= rx_buf_start_addr;
      end if;
    
    when RX_CONT | RX_BLCK =>  
      if a_data_buf_in_we = '1' then 
        rx_bram_nxt_addr <= rx_bram_addr + 1;
      end if;
      
    when others =>
      null;
      
  end case;

end process;


    
stats_p: process( aclk  )
begin
  if rising_edge( aclk )then
    if ( resetn = '0' ) then
      rx_data_ctr     <= ( others=> '0'  );
      rx_symbol_ctr   <= ( others=> '0'  );
      rx_frame_ctr    <= ( others=> '0'  );
      rx_block_ctr    <= ( others=> '0'  );    
                          
      rx_data_ctr_p   <= ( others=> '0'  );
      rx_symbol_ctr_p <= ( others=> '0'  );
      rx_frame_ctr_p  <= ( others=> '0'  );
      rx_block_ctr_p  <= ( others=> '0'  );    
      
      wr_data_ctr     <= ( others=> '0'  );
      wr_symbol_ctr   <= ( others=> '0'  );
      wr_frame_ctr    <= ( others=> '0'  );
      wr_block_ctr    <= ( others=> '0'  );    
                          
      wr_data_ctr_p   <= ( others=> '0'  );
      wr_symbol_ctr_p <= ( others=> '0'  );
      wr_frame_ctr_p  <= ( others=> '0'  );
      wr_block_ctr_p  <= ( others=> '0'  );    
      
    
    else 
      if rx_valid = '1' then
        rx_data_ctr_p        <= rx_data_ctr_p + 1;
        if rx_data_ctr < ps_n_fft - 1 then  
          rx_data_ctr        <= rx_data_ctr + 1;
        else
          rx_data_ctr        <= ( others=> '0'  );
          rx_symbol_ctr_p    <= rx_symbol_ctr_p + 1;
        end if;
        
        if rx_data_ctr = ps_n_fft - 1 then
          if rx_symbol_ctr < ps_n_symbols_frame - 1 then 
            rx_symbol_ctr    <= rx_symbol_ctr + 1;
          else
            rx_symbol_ctr    <= ( others=> '0'  );
            rx_frame_ctr_p   <= rx_frame_ctr_p + 1;
          end if;
        end if;
         
        if rx_symbol_ctr = ps_n_symbols_frame - 1 and rx_data_ctr = ps_n_fft - 1 then
          if rx_frame_ctr < ps_n_frames_block - 1 then
            rx_frame_ctr   <= rx_frame_ctr + 1;
          else
            rx_frame_ctr   <= ( others=> '0'  );
            rx_block_ctr_p <= rx_block_ctr_p + 1;
            rx_block_ctr   <= rx_block_ctr + 1;
          end if;
        end if;
      end if; -- rx_valid = '1'

      if a_data_buf_in_we = '1' then
        wr_data_ctr_p        <= wr_data_ctr_p + 1;
        if wr_data_ctr < ps_n_fft - 1 then  
          wr_data_ctr        <= wr_data_ctr + 1;
        else
          wr_data_ctr        <= ( others=> '0'  );
          wr_symbol_ctr_p    <= wr_symbol_ctr_p + 1;
        end if;
        
        if wr_data_ctr = ps_n_fft - 1 then
          if wr_symbol_ctr < ps_n_symbols_frame - 1 then 
            wr_symbol_ctr    <= wr_symbol_ctr + 1;
          else
            wr_symbol_ctr    <= ( others=> '0'  );
            wr_frame_ctr_p   <= wr_frame_ctr_p + 1;
          end if;
        end if;
         
        if wr_symbol_ctr = ps_n_symbols_frame - 1 and wr_data_ctr = ps_n_fft - 1 then
          if wr_frame_ctr < ps_n_frames_block - 1 then
            wr_frame_ctr   <= wr_frame_ctr + 1;
          else
            wr_frame_ctr   <= ( others=> '0'  );
            wr_block_ctr_p <= wr_block_ctr_p + 1;
            wr_block_ctr   <= wr_block_ctr + 1;
          end if;
        end if;
      end if; -- rx_valid = '1'

    end if;
  end if;
end process;


end arch_imp;
