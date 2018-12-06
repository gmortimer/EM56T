library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.emm_telsys.all;


entity Training_Symbol_Injector_v1_0 is
  generic ( 
	-- Users to add parameters here
    C_BUF_ADDR_WIDTH        : integer := 11;

	-- Parameters of Axi Slave Bus Interface S00_AXI
	C_S00_AXI_DATA_WIDTH	: integer	:= 32;
	C_S00_AXI_ADDR_WIDTH	: integer	:= 8;

	C_S_AXIS_DATA_TDATA_WIDTH	: integer	:= 32;


    C_BRAM_READ_LATENCY     : integer := 2;

    C_DEVICE_ID             : std_logic_vector( 23 downto 0 )  :=  x"751751"
  );
  port ( 


    aclk            : in  std_logic;
    aresetn         : in  std_logic;

 
    ts_buf_addr     : out std_logic_vector( C_BUF_ADDR_WIDTH - 1 downto 0 );
    ts_buf_we       : out std_logic;
    ts_buf_en       : out std_logic;
    ts_buf_sel      : out std_logic_vector( 1 downto 0 );
    ts_buf_dout     : in  std_logic_vector( C_S_AXIS_DATA_TDATA_WIDTH - 1 downto 0 );
    ts_buf_din      : out std_logic_vector( C_S_AXIS_DATA_TDATA_WIDTH - 1 downto 0 );
    rx_buf_addr     : out std_logic_vector( C_BUF_ADDR_WIDTH - 1 downto 0 );
    rx_buf_we       : out std_logic;
    rx_buf_din      : out std_logic_vector( C_S_AXIS_DATA_TDATA_WIDTH - 1 downto 0 );
    rx_buf_sel      : out std_logic_vector( 0 downto 0 );
    tx_buf_addr     : out std_logic_vector( C_BUF_ADDR_WIDTH - 1 downto 0 );
    tx_buf_en       : out std_logic;
    tx_buf_dout     : in  std_logic_vector( C_S_AXIS_DATA_TDATA_WIDTH - 1 downto 0 );
    tx_buf_sel      : out std_logic_vector( 0 downto 0 );
    
    irq             : out std_logic;

	s00_axi_awaddr	: in std_logic_vector( C_S00_AXI_ADDR_WIDTH - 1 downto 0 );
	s00_axi_awprot	: in std_logic_vector( 2 downto 0 );
	s00_axi_awvalid	: in std_logic;
	s00_axi_awready	: out std_logic;
	s00_axi_wdata	: in std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
	s00_axi_wstrb	: in std_logic_vector( ( C_S00_AXI_DATA_WIDTH/8 ) - 1 downto 0 );
	s00_axi_wvalid	: in std_logic;
	s00_axi_wready	: out std_logic;
	s00_axi_bresp	: out std_logic_vector( 1 downto 0 );
	s00_axi_bvalid	: out std_logic;
	s00_axi_bready	: in std_logic;
	s00_axi_araddr	: in std_logic_vector( C_S00_AXI_ADDR_WIDTH - 1 downto 0 );
	s00_axi_arprot	: in std_logic_vector( 2 downto 0 );
	s00_axi_arvalid	: in std_logic;
	s00_axi_arready	: out std_logic;
	s00_axi_rdata	: out std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
	s00_axi_rresp	: out std_logic_vector( 1 downto 0 );
	s00_axi_rvalid	: out std_logic;
	s00_axi_rready	: in std_logic;

	-- Ports of Axi Slave Bus Interface S00_AXIS
	s_axis_data_tready	: out std_logic;
	s_axis_data_tdata	: in std_logic_vector( C_S_AXIS_DATA_TDATA_WIDTH - 1 downto 0 );
	s_axis_data_tvalid	: in std_logic;

	-- Ports of Axi Master Bus Interface M00_AXIS
	m_axis_data_tvalid	: out std_logic;
	m_axis_data_tdata	: out std_logic_vector( C_S_AXIS_DATA_TDATA_WIDTH - 1 downto 0 );
	m_axis_data_tready	: in std_logic
  );
end Training_Symbol_Injector_v1_0;

architecture arch_imp of Training_Symbol_Injector_v1_0 is

constant C_TS_BUF_SEL_WIDTH        : integer   := clogb2( C_N_TSYMBS_FRAME_MAX - 1 ); 
constant C_N_SLV_REG               : integer   := 2 ** ( C_S00_AXI_ADDR_WIDTH - 2 ); 

component Training_Symbol_Injector_v1_0_S00_AXI is
  generic (
    C_S_AXI_DATA_WIDTH  : integer   := 32;
    C_S_AXI_ADDR_WIDTH  : integer   := 8
  );
  port (
    SLV_REG_WRITE_F : out std_logic_vector( 64 - 1 downto 0 );
    SLV_REG_READ_F  : out std_logic_vector( 64 - 1 downto 0 );

    SLV_REG_0       : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_1       : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_2       : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_3       : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_4       : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_5       : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_6       : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_7       : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_8       : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_9       : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_10      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_11      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_12      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_13      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_14      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_15      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_16      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_17      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_18      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_19      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_20      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_21      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_22      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_23      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_24      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_25      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_26      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_27      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_28      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_29      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_30      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_31      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_32      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_33      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_34      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_35      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_36      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_37      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_38      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_39      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_40      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_41      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_42      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_43      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_44      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_45      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_46      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_47      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_48      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_49      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_50      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_51      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_52      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_53      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_54      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_55      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_56      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_57      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_58      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_59      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_60      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_61      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_62      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_63      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );

    S_AXI_ACLK      : in  std_logic;
    S_AXI_ARESETN   : in  std_logic;
    S_AXI_AWADDR    : in  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_AWPROT    : in  std_logic_vector(2 downto 0);
    S_AXI_AWVALID   : in  std_logic;
    S_AXI_AWREADY   : out std_logic;
    S_AXI_WDATA     : in  std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    S_AXI_WSTRB     : in  std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
    S_AXI_WVALID    : in  std_logic;
    S_AXI_WREADY    : out std_logic;
    S_AXI_BRESP     : out std_logic_vector(1 downto 0);
    S_AXI_BVALID    : out std_logic;
    S_AXI_BREADY    : in  std_logic;
    S_AXI_ARADDR    : in  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_ARPROT    : in  std_logic_vector(2 downto 0);
    S_AXI_ARVALID   : in  std_logic;
    S_AXI_ARREADY   : out std_logic;
    S_AXI_RDATA     : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    S_AXI_RRESP     : out std_logic_vector(1 downto 0);
    S_AXI_RVALID    : out std_logic;
    S_AXI_RREADY    : in  std_logic
  );
end component Training_Symbol_Injector_v1_0_S00_AXI;

component AXI4_Stream_to_BRAM_II
  generic ( 
    C_AXIS_TDATA_WIDTH   : integer := 8;
    C_AXIS_TUSER_WIDTH   : integer := 16;
    C_BRAM_ADDR_WIDTH    : integer := 12
  );
  port ( 
    BRAM_ADDR_TUSER_EN   : in  std_logic := '0';
    BRAM_ADDR_IN_EN      : in  std_logic := '0';
    BRAM_BLOCK_SIZE      : in  std_logic_vector( C_BRAM_ADDR_WIDTH     downto 0 ) := ( others => '0' );
    BRAM_ADDR_INC        : in  std_logic_vector( C_BRAM_ADDR_WIDTH - 1 downto 0 ) := ( 0 => '1', others => '0' );
    BRAM_ADDR_N_INCS     : in  std_logic_vector( C_BRAM_ADDR_WIDTH - 1 downto 0 ) := ( others => '0' );
    BRAM_ADDR_IN         : in  std_logic_vector( C_BRAM_ADDR_WIDTH - 1 downto 0 ) := ( others => '0' );
    BRAM_ADDR_OUT        : out std_logic_vector( C_BRAM_ADDR_WIDTH - 1 downto 0 );
    BRAM_WE              : out std_logic;
    BRAM_DIN             : out std_logic_vector( C_AXIS_TDATA_WIDTH - 1 downto 0 );
    START_F              : in  std_logic := '1';
    BLOCK_DONE_F         : out std_logic;
    RX_STATE_OUT         : out std_logic_vector( 3 downto 0 );
    S_AXIS_TREADY        : out std_logic;
    S_AXIS_TVALID        : in  std_logic;
    S_AXIS_TDATA         : in  std_logic_vector( C_AXIS_TDATA_WIDTH - 1 downto 0 );
    S_AXIS_TUSER         : in  std_logic_vector( C_AXIS_TUSER_WIDTH - 1 downto 0 ) := ( others => '0' );
    RESETP               : in  std_logic := '1';
    ARESETN              : in  std_logic;
    ACLK                 : in  std_logic
  );
end component  AXI4_Stream_to_BRAM_II;

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
    TX_BUF_START_ADDR : in  integer range 0 to 2 ** C_BUF_ADDR_WIDTH;
    TX_BUF_ADDR       : out std_logic_vector( C_BUF_ADDR_WIDTH - 1 downto 0 );
    TX_BUF_EN         : out std_logic;
    TX_BUF_DATA       : in  std_logic_vector( C_AXIS_TDATA_WIDTH - 1 downto 0 );
    M_AXIS_TREADY     : in  std_logic;
    M_AXIS_TVALID     : out std_logic;
    M_AXIS_TDATA      : out std_logic_vector( C_AXIS_TDATA_WIDTH - 1 downto 0 );
    SOFT_RESET        : in  std_logic;
    START_TX_F        : in  std_logic;
    TX_DONE           : out std_logic;
    N_DATA_WORDS      : in  integer range 0 to 2 ** C_BUF_ADDR_WIDTH
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
    INT_ACK_F       : in  std_logic  --flag
  );
end component Interrupt_Controller;
     
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
    PS_ADDR_REG             : in   std_logic_vector( C_PS_ADDR_REG_WIDTH - 1 downto 0 )     := ( others => '0' );
    PS_RD_ADDR_REG          : in   std_logic_vector( C_PS_RD_ADDR_REG_WIDTH - 1 downto 0 )  := ( others => '0' );
    PS_WR_ADDR_REG          : in   std_logic_vector( C_PS_WR_ADDR_REG_WIDTH - 1 downto 0 )  := ( others => '0' );
    PS_RD_DATA_REG          : out  std_logic_vector( C_PS_RD_DATA_REG_WIDTH - 1 downto 0 );
    PS_WR_DATA_REG          : in   std_logic_vector( C_PS_WR_DATA_REG_WIDTH - 1 downto 0 )  := ( others => '0' );
  
    SYS_ADDR                : in   std_logic_vector( C_BRAM_ADDR_WIDTH - 1 downto 0 )       := ( others => '0' );
    SYS_RD_ADDR             : in   std_logic_vector( C_BRAM_RD_ADDR_WIDTH - 1 downto 0 )    := ( others => '0' );
    SYS_WR_ADDR             : in   std_logic_vector( C_BRAM_WR_ADDR_WIDTH - 1 downto 0 )    := ( others => '0' );
    SYS_BUF_SEL             : in   std_logic_vector( C_BRAM_BUF_SEL_WIDTH - 1 downto 0 )    := ( others => '0' ); 
    SYS_RD_BUF_SEL          : in   std_logic_vector( C_BRAM_RD_BUF_SEL_WIDTH - 1 downto 0 ) := ( others => '0' ); 
    SYS_WR_BUF_SEL          : in   std_logic_vector( C_BRAM_WR_BUF_SEL_WIDTH - 1 downto 0 ) := ( others => '0' ); 
    SYS_WR_DATA             : in   std_logic_vector( C_BRAM_DIN_WIDTH - 1 downto 0 )        := ( others => '0' );
    SYS_EN                  : in   std_logic                                                := '0';
    SYS_RD_EN               : in   std_logic                                                := '0';
    SYS_WR_EN               : in   std_logic                                                := '0';
    SYS_WE                  : in   std_logic                                                := '0';
  
    BRAM_ADDR               : out  std_logic_vector( C_BRAM_ADDR_WIDTH - 1 downto 0 );
    BRAM_RD_ADDR            : out  std_logic_vector( C_BRAM_RD_ADDR_WIDTH - 1 downto 0 );
    BRAM_WR_ADDR            : out  std_logic_vector( C_BRAM_WR_ADDR_WIDTH - 1 downto 0 );
    BRAM_BUF_SEL            : out  std_logic_vector( C_BRAM_BUF_SEL_WIDTH - 1 downto 0 );
    BRAM_RD_BUF_SEL         : out  std_logic_vector( C_BRAM_RD_BUF_SEL_WIDTH - 1 downto 0 );
    BRAM_WR_BUF_SEL         : out  std_logic_vector( C_BRAM_RD_BUF_SEL_WIDTH - 1 downto 0 );
    BRAM_DIN                : out  std_logic_vector( C_BRAM_DIN_WIDTH - 1 downto 0 );
    BRAM_EN                 : out  std_logic;
    BRAM_RD_EN              : out  std_logic;
    BRAM_WR_EN              : out  std_logic;
    BRAM_WE                 : out  std_logic;
  
    BRAM_DOUT               : in   std_logic_vector( C_BRAM_DOUT_WIDTH - 1 downto 0 )       := ( others => '0' );
  
    PS_RD_F                 : in   std_logic                                                := '0';
    PS_RD_ACK_F             : in   std_logic                                                := '0';
    PS_RD_RDY               : out  std_logic;                                               
    PS_WR_F                 : in   std_logic                                                := '0';
  
    RD_STATE_OUT            : out  T_SM_STATE;  
    PS_ENABLE               : in   std_logic                                                := '0';
    PS_RD_ENABLE            : in   std_logic                                                := '0';
    PS_WR_ENABLE            : in   std_logic                                                := '0';
    ACLK                    : in   std_logic;
    ARESETN                 : in   std_logic
  );
end component BRAM_PS_RW;

component AXI4_Stream_Stats is
  generic (
    C_L0_COUNT_WIDTH      : integer := 32;
    C_L0_ACCUM_WIDTH      : integer := 32;
    C_L1_COUNT_WIDTH      : integer := 32;
    C_L1_ACCUM_WIDTH      : integer := 32;
    C_L2_COUNT_WIDTH      : integer := 32;
    C_L2_ACCUM_WIDTH      : integer := 32;
    C_L3_COUNT_WIDTH      : integer := 32;
    C_L3_ACCUM_WIDTH      : integer := 32;
    C_TV_ACCUM_WIDTH      : integer := 32
  );
  port (
    AXIS_TREADY             : in  std_logic;
    AXIS_TVALID             : in  std_logic;
    N_L0_L1                 : in  unsigned( C_L0_COUNT_WIDTH - 1 downto 0 );
    N_L1_L2                 : in  unsigned( C_L1_COUNT_WIDTH - 1 downto 0 );
    N_L2_L3                 : in  unsigned( C_L2_COUNT_WIDTH - 1 downto 0 );
    L0_ACCUM_OUT            : out unsigned( C_L0_ACCUM_WIDTH - 1 downto 0 ); 
    L1_ACCUM_OUT            : out unsigned( C_L1_ACCUM_WIDTH - 1 downto 0 ); 
    L2_ACCUM_OUT            : out unsigned( C_L2_ACCUM_WIDTH - 1 downto 0 ); 
    L3_ACCUM_OUT            : out unsigned( C_L3_ACCUM_WIDTH - 1 downto 0 );
    TV_ACCUM_OUT            : out unsigned( C_TV_ACCUM_WIDTH - 1 downto 0 );
    SYNC_F                  : in  std_logic; 
    ACLK                    : in  std_logic;
    RESETN                  : in  std_logic;
    RESETP                  : in  std_logic
  );
end component AXI4_Stream_Stats;

--=============================
-- PS Interface Basic Framework
--=============================

-- PS Interface Slave Registers
signal slv_reg_0       : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_1       : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_2       : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_3       : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_4       : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_5       : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_6       : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_7       : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_8       : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_9       : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_10      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_11      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_12      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_13      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_14      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_15      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_16      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_17      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_18      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_19      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_20      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_21      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_22      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_23      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_24      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_25      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_26      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_27      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_28      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_29      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_30      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_31      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_32      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_33      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_34      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_35      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_36      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_37      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_38      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_39      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_40      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_41      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_42      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_43      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_44      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_45      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_46      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_47      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_48      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_49      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_50      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_51      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_52      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_53      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_54      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_55      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_56      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_57      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_58      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_59      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_60      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_61      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_62      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_63      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );

-- PS Interface signals

signal ctrl_reg                : std_logic_vector( slv_reg_0'range );
signal ctrl_reg_in             : std_logic_vector( slv_reg_0'range );
signal info_reg                : std_logic_vector( slv_reg_0'range );
signal stat_reg                : std_logic_vector( slv_reg_0'range );

signal resetp                  : std_logic;
signal resetn                  : std_logic;

signal int_rqst_f              : std_logic;
signal irq_i                   : std_logic;
signal ps_int_ack_f            : std_logic;
signal slv_reg_wr_f            : std_logic_vector( C_N_SLV_REG - 1 downto 0 );
signal slv_reg_rd_f            : std_logic_vector( C_N_SLV_REG - 1 downto 0 );

signal ts_buf_addr_i           : std_logic_vector( C_BUF_ADDR_WIDTH - 1 downto 0 );
signal ts_buf_we_i             : std_logic;
signal ts_buf_en_i             : std_logic;
signal ts_buf_sel_i            : std_logic_vector( C_TS_BUF_SEL_WIDTH - 1 downto 0 );
signal ts_buf_din_i            : std_logic_vector( C_S_AXIS_DATA_TDATA_WIDTH - 1 downto 0 );
signal rx_buf_addr_i           : std_logic_vector( C_BUF_ADDR_WIDTH - 1 downto 0 );
signal rx_buf_we_i             : std_logic;
signal rx_buf_din_i            : std_logic_vector( C_S_AXIS_DATA_TDATA_WIDTH - 1 downto 0 );
signal rx_buf_sel_i            : std_logic_vector( 0 downto 0 );
signal tx_buf_addr_i           : std_logic_vector( C_BUF_ADDR_WIDTH - 1 downto 0 );
signal tx_buf_en_i             : std_logic;
signal tx_buf_sel_i            : std_logic_vector( 0 downto 0 );

signal pf_ts_buf_sel           : std_logic_vector( C_TS_BUF_SEL_WIDTH - 1 downto 0 );
signal pf_rx_buf_addr          : std_logic_vector( C_BUF_ADDR_WIDTH - 1 downto 0 );
signal pf_rx_buf_we            : std_logic;
signal pf_rx_buf_din           : std_logic_vector( C_S_AXIS_DATA_TDATA_WIDTH - 1 downto 0 );
signal pf_rx_buf_sel           : std_logic_vector( 0 downto 0 );
signal pf_tx_buf_addr          : std_logic_vector( C_BUF_ADDR_WIDTH - 1 downto 0 );
signal pf_tx_buf_en            : std_logic;
signal pf_tx_buf_sel           : std_logic_vector( 0 downto 0 );
signal pf_tx_buf_start_addr    : unsigned( clogb2( C_N_FFT_MAX ) - 1 downto 0 );
signal pf_tx_buf_addr_mask     : std_logic_vector( C_BUF_ADDR_WIDTH - 1 downto 0 );
signal pf_tx_buf_addr_m        : std_logic_vector( C_BUF_ADDR_WIDTH - 1 downto 0 );

signal pf_ts_buf_en_t          : std_logic;
signal pf_tx_buf_en_t          : std_logic;

constant PF_IDLE               : T_SM_STATE := b"1001"; 
constant PF_START_FRAME        : T_SM_STATE := b"0011"; 
constant PF_WAIT_RX_DS         : T_SM_STATE := b"0101"; 
constant PF_WAIT_TX_TS_START   : T_SM_STATE := b"1100"; 
constant PF_WAIT_TX_TS         : T_SM_STATE := b"1101"; 
constant PF_WAIT_TX_DS_START   : T_SM_STATE := b"1110"; 
constant PF_WAIT_TX_DS         : T_SM_STATE := b"1111"; 
     
constant EX_IDLE               : T_SM_STATE := b"1001"; 
constant EX_ADMIN              : T_SM_STATE := b"1011"; 
constant EX_RUNNING            : T_SM_STATE := b"1101"; 
           
signal ex_state                : T_SM_STATE;
signal pf_state                : T_SM_STATE; 
signal rm_state                : T_SM_STATE;
signal tm_state                : T_SM_STATE;
signal ad_rd_ts_state          : T_SM_STATE;
signal ad_rd_tx_state          : T_SM_STATE;

signal ps_n_fft_reg            : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal ps_n_cpre_reg           : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal ps_n_symb_agc_reg       : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal ps_n_symb_nsd_reg       : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal ps_n_symb_prs_reg       : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal ps_n_symb_dta_reg       : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal ps_n_frame_block_reg    : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal ps_ad_rd_wr_addr_reg    : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal ps_ad_wr_data_reg       : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );

signal ps_ad_rd_tx_buf_reg     : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal ps_ad_rd_ts_buf_reg     : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );


signal s_axis_data_tready_i    : std_logic;
signal m_axis_data_tvalid_i    : std_logic;
signal m_axis_data_tdata_i     : std_logic_vector( C_S_AXIS_DATA_TDATA_WIDTH - 1 downto 0 );
signal m_axis_data_tdata_b     : std_logic_vector( C_S_AXIS_DATA_TDATA_WIDTH - 1 downto 0 );


signal ps_start_f              : std_logic;
signal ps_stop_f               : std_logic;
signal ps_enter_admin_f        : std_logic;      
signal ps_exit_admin_f         : std_logic;      
signal ps_ad_wr_ts_buf_f       : std_logic;      
signal ps_ad_wr_rx_buf_f       : std_logic;      
signal ps_ad_rd_ts_buf_f       : std_logic;
signal ps_ad_rd_tx_buf_f       : std_logic;
signal ps_ad_rd_ack_f          : std_logic;
signal ps_rd_sync_f            : std_logic;  

type T_SYMBOL_TYPE is ( ST_DATA, ST_TRAINING );
signal pf_symb_type : T_SYMBOL_TYPE;

signal ps_n_cpre               : unsigned( clogb2( C_N_FFT_MAX )          - 1 + 1 downto 0 );
signal ps_n_fft                : unsigned( clogb2( C_N_FFT_MAX )          - 1 + 1 downto 0 );    
signal ps_n_symb_agc           : unsigned( clogb2( C_N_SYMBS_FRAME_MAX )  - 1 downto 0 );    
signal ps_n_symb_nsd           : unsigned( clogb2( C_N_SYMBS_FRAME_MAX )  - 1 downto 0 );    
signal ps_n_symb_prs           : unsigned( clogb2( C_N_SYMBS_FRAME_MAX )  - 1 downto 0 );    
signal ps_n_symb_dta           : unsigned( clogb2( C_N_SYMBS_FRAME_MAX )  - 1 downto 0 );    
signal ps_n_frame_block        : unsigned( clogb2( C_N_FRAMES_BLOCK_MAX ) - 1 downto 0 );    

signal pf_rx_ds_count          : unsigned( clogb2( C_N_SYMBS_FRAME_MAX )  - 1 downto 0 );  
signal pf_tx_ds_count          : unsigned( clogb2( C_N_SYMBS_FRAME_MAX )  - 1 downto 0 );  
signal pf_tx_ts_count          : unsigned( clogb2( C_N_SYMBS_FRAME_MAX )  - 1 downto 0 );
signal pf_rx_ds_accum          : unsigned( C_S00_AXI_DATA_WIDTH - 1 - 1 downto 0 );
signal pf_tx_ds_accum          : unsigned( C_S00_AXI_DATA_WIDTH - 1 - 1 downto 0 );
signal pf_tx_ts_accum          : unsigned( C_S00_AXI_DATA_WIDTH - 1 - 1 downto 0 );
signal pf_rx_frame_count       : unsigned( C_S00_AXI_DATA_WIDTH - 1 - 1 downto 0 );
signal pf_tx_frame_count       : unsigned( C_S00_AXI_DATA_WIDTH - 1 - 1 downto 0 );
signal pf_start_rx_f           : std_logic;
signal pf_start_tx_f           : std_logic;
signal pf_rx_symbol_done_f     : std_logic;
signal pf_rx_symbol_done       : std_logic;
signal pf_tx_symbol_done       : std_logic;
signal pf_tx_data              : std_logic_vector( C_S_AXIS_DATA_TDATA_WIDTH - 1 downto 0 );
signal pf_tx_ts_en             : std_logic;

signal n_wd_symb_rx            : unsigned( clogb2( C_N_FFT_MAX )          - 1 + 1 downto 0 );
signal n_wd_symb_tx            : unsigned( clogb2( C_N_FFT_MAX )          - 1 + 1 downto 0 );
signal n_symb_frame_rx         : unsigned( clogb2( C_N_SYMBS_FRAME_MAX )  - 1 downto 0 );
signal n_symb_frame_tx         : unsigned( clogb2( C_N_SYMBS_FRAME_MAX )  - 1 downto 0 );
signal n_symb_data_tx          : unsigned( clogb2( C_N_SYMBS_FRAME_MAX )  - 1 downto 0 );
signal n_symb_train            : unsigned( clogb2( C_N_SYMBS_FRAME_MAX )  - 1 downto 0 ); 

signal ad_rd_rdy               : std_logic;
signal ad_admin_en             : std_logic;

signal ad_rd_tx_buf_rdy        : std_logic;
signal ad_rd_ts_buf_rdy        : std_logic;

 
signal pf_bramc_rst_f          : std_logic;

--========================
-- Stats gathering signals
--======================== 
--signal rx_data_ctr             : unsigned( n_wd_symb_rx'range     );   
--signal rx_symbol_ctr           : unsigned( n_symb_frame_rx'range  );   
--signal rx_frame_ctr            : unsigned( ps_n_frame_block'range );   
--signal rx_block_ctr            : unsigned( clogb2( C_N_BLOCKS_MAX ) - 1 downto 0 );   

signal rx_data_ctr_p           : unsigned( C_S00_AXI_DATA_WIDTH - 1 - 1 downto 0 ); 
signal rx_symbol_ctr_p         : unsigned( C_S00_AXI_DATA_WIDTH - 1 - 1 downto 0 ); 
signal rx_frame_ctr_p          : unsigned( C_S00_AXI_DATA_WIDTH - 1 - 1 downto 0 ); 
signal rx_block_ctr_p          : unsigned( C_S00_AXI_DATA_WIDTH - 1 - 1 downto 0 );

--signal tx_data_ctr             : unsigned( n_wd_symb_tx'range     );   
--signal tx_symbol_ctr           : unsigned( n_symb_frame_tx'range  );   
--signal tx_frame_ctr            : unsigned( ps_n_frame_block'range );   
--signal tx_block_ctr            : unsigned( clogb2( C_N_BLOCKS_MAX ) - 1 downto 0 );   

signal tx_data_ctr_p           : unsigned( C_S00_AXI_DATA_WIDTH - 1 - 1 downto 0 ); 
signal tx_symbol_ctr_p         : unsigned( C_S00_AXI_DATA_WIDTH - 1 - 1 downto 0 ); 
signal tx_frame_ctr_p          : unsigned( C_S00_AXI_DATA_WIDTH - 1 - 1 downto 0 ); 
signal tx_block_ctr_p          : unsigned( C_S00_AXI_DATA_WIDTH - 1 - 1 downto 0 );

--signal rx_valid                : std_logic;
--signal tx_valid                : std_logic;

signal rx_tv_ctr_p             : unsigned( C_S00_AXI_DATA_WIDTH - 1 - 1 downto 0 );
signal tx_tv_ctr_p             : unsigned( C_S00_AXI_DATA_WIDTH - 1 - 1 downto 0 );
    
begin

--=============================
-- PS Interface Basic Framework
--=============================

axi_lite_i: Training_Symbol_Injector_v1_0_S00_AXI
  generic map (
    C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
    C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
  )
  port map (
    SLV_REG_WRITE_F => slv_reg_wr_f,
    SLV_REG_READ_F  => slv_reg_rd_f,

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
    SLV_REG_32      => slv_reg_32,
    SLV_REG_33      => slv_reg_33,
    SLV_REG_34      => slv_reg_34,
    SLV_REG_35      => slv_reg_35,
    SLV_REG_36      => slv_reg_36,
    SLV_REG_37      => slv_reg_37,
    SLV_REG_38      => slv_reg_38,
    SLV_REG_39      => slv_reg_39,
    SLV_REG_40      => slv_reg_40,
    SLV_REG_41      => slv_reg_41,
    SLV_REG_42      => slv_reg_42,
    SLV_REG_43      => slv_reg_43,
    SLV_REG_44      => slv_reg_44,
    SLV_REG_45      => slv_reg_45,
    SLV_REG_46      => slv_reg_46,
    SLV_REG_47      => slv_reg_47,
    SLV_REG_48      => slv_reg_48,
    SLV_REG_49      => slv_reg_49,
    SLV_REG_50      => slv_reg_50,
    SLV_REG_51      => slv_reg_51,
    SLV_REG_52      => slv_reg_52,
    SLV_REG_53      => slv_reg_53,
    SLV_REG_54      => slv_reg_54,
    SLV_REG_55      => slv_reg_55,
    SLV_REG_56      => slv_reg_56,
    SLV_REG_57      => slv_reg_57,
    SLV_REG_58      => slv_reg_58,
    SLV_REG_59      => slv_reg_59,
    SLV_REG_60      => slv_reg_60,
    SLV_REG_61      => slv_reg_61,
    SLV_REG_62      => slv_reg_62,
    SLV_REG_63      => slv_reg_63,

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

axi4streamin: AXI4_Stream_to_BRAM_II
  generic map ( 
    C_AXIS_TDATA_WIDTH   => C_S_AXIS_DATA_TDATA_WIDTH,
    C_AXIS_TUSER_WIDTH   => 0,
    C_BRAM_ADDR_WIDTH    => C_BUF_ADDR_WIDTH
  )
  port map ( 
    BRAM_ADDR_TUSER_EN   => '0',
    BRAM_BLOCK_SIZE      => std_logic_vector( ps_n_fft( ps_n_fft'left - 1 downto 0 )),
    BRAM_ADDR_OUT        => pf_rx_buf_addr,
    BRAM_WE              => pf_rx_buf_we,
    BRAM_DIN             => pf_rx_buf_din,
    START_F              => pf_start_rx_f,
    BLOCK_DONE_F         => pf_rx_symbol_done_f,
    RX_STATE_OUT         => rm_state,
    S_AXIS_TREADY        => s_axis_data_tready_i,
    S_AXIS_TVALID        => s_axis_data_tvalid,
    S_AXIS_TDATA         => s_axis_data_tdata,
    S_AXIS_TUSER         => ( others => '0' ),
    RESETP               => pf_bramc_rst_f,
    ARESETN              => resetn,
    ACLK                 => aclk
  );



axi4streamout: BRAM_to_AXI4_Stream	
  generic map ( 
    C_AXIS_TDATA_WIDTH   => C_S_AXIS_DATA_TDATA_WIDTH,
    C_BUF_ADDR_WIDTH     => C_BUF_ADDR_WIDTH,
    C_BRAM_READ_LATENCY  => C_BRAM_READ_LATENCY
  )
  port map ( 
    ACLK                 => aclk,
    ARESETN              => resetn,
    TX_STATE_OUT         => tm_state,
    TX_BUF_START_ADDR    => to_integer( pf_tx_buf_start_addr ),
    TX_BUF_ADDR          => pf_tx_buf_addr,
    TX_BUF_EN            => pf_tx_buf_en,
    TX_BUF_DATA          => pf_tx_data,
    M_AXIS_TREADY        => m_axis_data_tready,
    M_AXIS_TVALID        => m_axis_data_tvalid_i,
    M_AXIS_TDATA         => m_axis_data_tdata_b,
    SOFT_RESET           => pf_bramc_rst_f,
    START_TX_F           => pf_start_tx_f,
    TX_DONE              => pf_tx_symbol_done,
    N_DATA_WORDS         => to_integer( n_wd_symb_tx )
  ); 
  
  
ctrlreg: Control_Register
  generic map ( 
    DATA_WIDTH           => C_S00_AXI_DATA_WIDTH
  ) 
  port map ( 
    ACLK                 => aclk,
    ARESETN              => aresetn,
    CTRL_REG_IN          => ctrl_reg,
    CTRL_REG_OUT         => ctrl_reg_in,
    RESETP_OUT           => resetp,
    RESETN_OUT           => resetn
  );

intctrlr: Interrupt_Controller    
  port map ( 
    ACLK                 => aclk,
    ARESETN              => resetn,
    SOFT_RESET           => resetp,
    INTERNAL_IRQ_F       => int_rqst_f,
    EXTERNAL_IRQ         => irq_i,
    INT_ACK_F            => ps_int_ack_f
  );


ps_tsbuf_rw: BRAM_PS_RW
  generic map ( 
    C_BRAM_ADDR_WIDTH       => C_BUF_ADDR_WIDTH, 
    C_BRAM_BUF_SEL_WIDTH    => ts_buf_sel'length, 
    C_BRAM_DIN_WIDTH        => C_S_AXIS_DATA_TDATA_WIDTH, 
    C_BRAM_DOUT_WIDTH       => C_S_AXIS_DATA_TDATA_WIDTH, 
    C_PS_ADDR_REG_WIDTH     => C_S00_AXI_DATA_WIDTH, 
    C_PS_RD_DATA_REG_WIDTH  => C_S00_AXI_DATA_WIDTH, 
    C_PS_WR_DATA_REG_WIDTH  => C_S00_AXI_DATA_WIDTH, 
    C_BRAM_RD_LATENCY       => C_BRAM_READ_LATENCY 
  )                       

  port map ( 
    PS_ADDR_REG             => ps_ad_rd_wr_addr_reg,
--    PS_RD_ADDR_REG          => ps_ad_rd_wr_addr_reg,
--    PS_WR_ADDR_REG          => ps_ad_rd_wr_addr_reg,
    PS_RD_DATA_REG          => ps_ad_rd_ts_buf_reg, 
    PS_WR_DATA_REG          => ps_ad_wr_data_reg,
                        
    SYS_ADDR                => pf_tx_buf_addr_m, 
    SYS_BUF_SEL             => pf_ts_buf_sel,
--    SYS_WR_BUF_SEL          => pf_ts_buf_sel,
    SYS_EN                  => pf_ts_buf_en_t, 
                        
    BRAM_ADDR               => ts_buf_addr_i, 
    BRAM_BUF_SEL            => ts_buf_sel_i,
    BRAM_DOUT               => ts_buf_dout, 
    BRAM_DIN                => ts_buf_din_i, 
    BRAM_EN                 => ts_buf_en_i, 
    BRAM_WE                 => ts_buf_we_i, 
                        
    PS_RD_F                 => ps_ad_rd_ts_buf_f, 
    PS_RD_ACK_F             => ps_ad_rd_ack_f, 
    PS_RD_RDY               => ad_rd_ts_buf_rdy, 
    PS_WR_F                 => ps_ad_wr_ts_buf_f, 
                        
    RD_STATE_OUT            => ad_rd_ts_state, 
    PS_ENABLE               => ad_admin_en, 
    ACLK                    => aclk, 
    ARESETN                 => resetn 
  );


ps_txbuf_w_rxbuf_r: BRAM_PS_RW
  generic map ( 
    C_BRAM_RD_ADDR_WIDTH    => C_BUF_ADDR_WIDTH, 
    C_BRAM_WR_ADDR_WIDTH    => C_BUF_ADDR_WIDTH,
    C_BRAM_RD_BUF_SEL_WIDTH => tx_buf_sel'length, 
    C_BRAM_WR_BUF_SEL_WIDTH => rx_buf_sel'length, 
    C_BRAM_DIN_WIDTH        => C_S_AXIS_DATA_TDATA_WIDTH, 
    C_BRAM_DOUT_WIDTH       => C_S_AXIS_DATA_TDATA_WIDTH, 
    C_PS_RD_ADDR_REG_WIDTH  => C_S00_AXI_DATA_WIDTH, 
    C_PS_WR_ADDR_REG_WIDTH  => C_S00_AXI_DATA_WIDTH, 
    C_PS_RD_DATA_REG_WIDTH  => C_S00_AXI_DATA_WIDTH, 
    C_PS_WR_DATA_REG_WIDTH  => C_S00_AXI_DATA_WIDTH, 
    C_BRAM_RD_LATENCY       => C_BRAM_READ_LATENCY 
  )                       

  port map ( 
    PS_RD_ADDR_REG          => ps_ad_rd_wr_addr_reg,
    PS_WR_ADDR_REG          => ps_ad_rd_wr_addr_reg,
    PS_RD_DATA_REG          => ps_ad_rd_tx_buf_reg, 
    PS_WR_DATA_REG          => ps_ad_wr_data_reg,
                        
    SYS_RD_ADDR             => pf_tx_buf_addr_m,
    SYS_WR_ADDR             => pf_rx_buf_addr,
    SYS_RD_BUF_SEL          => pf_tx_buf_sel, 
    SYS_WR_BUF_SEL          => pf_rx_buf_sel, 
    SYS_WR_DATA             => pf_rx_buf_din,
    SYS_EN                  => pf_tx_buf_en_t,
    SYS_WE                  => pf_rx_buf_we,
                        
    BRAM_RD_ADDR            => tx_buf_addr_i,
    BRAM_WR_ADDR            => rx_buf_addr_i,
    BRAM_RD_BUF_SEL         => tx_buf_sel_i, 
    BRAM_WR_BUF_SEL         => rx_buf_sel_i, 
    BRAM_DOUT               => tx_buf_dout, 
    BRAM_DIN                => rx_buf_din_i, 
    BRAM_EN                 => tx_buf_en_i, 
    BRAM_WE                 => rx_buf_we_i, 
                        
    PS_RD_F                 => ps_ad_rd_tx_buf_f, 
    PS_RD_ACK_F             => ps_ad_rd_ack_f, 
    PS_RD_RDY               => ad_rd_tx_buf_rdy, 
    PS_WR_F                 => ps_ad_wr_rx_buf_f, 
                        
    RD_STATE_OUT            => ad_rd_tx_state, 
    PS_ENABLE               => ad_admin_en, 
    ACLK                    => aclk, 
    ARESETN                 => resetn 
  );

rx_stats: AXI4_Stream_Stats
  generic map (
    C_L0_COUNT_WIDTH      => n_wd_symb_rx'length,
    C_L0_ACCUM_WIDTH      => rx_data_ctr_p'length,
    C_L1_COUNT_WIDTH      => n_symb_frame_rx'length,
    C_L1_ACCUM_WIDTH      => rx_symbol_ctr_p'length,
    C_L2_COUNT_WIDTH      => ps_n_frame_block'length,
    C_L2_ACCUM_WIDTH      => rx_frame_ctr_p'length,
    C_L3_ACCUM_WIDTH      => rx_block_ctr_p'length,
    C_TV_ACCUM_WIDTH      => rx_tv_ctr_p'length
  )
  port map (
    AXIS_TREADY           => s_axis_data_tready_i,
    AXIS_TVALID           => s_axis_data_tvalid,
    N_L0_L1               => n_wd_symb_rx,
    N_L1_L2               => n_symb_frame_rx,
    N_L2_L3               => ps_n_frame_block,
    L0_ACCUM_OUT          => rx_data_ctr_p,
    L1_ACCUM_OUT          => rx_symbol_ctr_p,
    L2_ACCUM_OUT          => rx_frame_ctr_p,
    L3_ACCUM_OUT          => rx_block_ctr_p,
    TV_ACCUM_OUT          => rx_tv_ctr_p,
    SYNC_F                => ps_rd_sync_f,
    ACLK                  => aclk,
    RESETN                => resetn,
    RESETP                => resetp
  );

tx_stats: AXI4_Stream_Stats
  generic map (
    C_L0_COUNT_WIDTH      => n_wd_symb_tx'length,
    C_L0_ACCUM_WIDTH      => tx_data_ctr_p'length,
    C_L1_COUNT_WIDTH      => n_symb_frame_tx'length,
    C_L1_ACCUM_WIDTH      => tx_symbol_ctr_p'length,
    C_L2_COUNT_WIDTH      => ps_n_frame_block'length,
    C_L2_ACCUM_WIDTH      => tx_frame_ctr_p'length,
    C_L3_ACCUM_WIDTH      => tx_block_ctr_p'length,
    C_TV_ACCUM_WIDTH      => tx_tv_ctr_p'length
  )
  port map (
    AXIS_TREADY           => m_axis_data_tready,
    AXIS_TVALID           => m_axis_data_tvalid_i,
    N_L0_L1               => n_wd_symb_tx,
    N_L1_L2               => n_symb_frame_tx,
    N_L2_L3               => ps_n_frame_block,
    L0_ACCUM_OUT          => tx_data_ctr_p,
    L1_ACCUM_OUT          => tx_symbol_ctr_p,
    L2_ACCUM_OUT          => tx_frame_ctr_p,
    L3_ACCUM_OUT          => tx_block_ctr_p,
    TV_ACCUM_OUT          => tx_tv_ctr_p,
    SYNC_F                => ps_rd_sync_f,
    ACLK                  => aclk,
    RESETN                => resetn,
    RESETP                => resetp
  );

 
pf_tx_buf_start_addr       <= resize( ps_n_fft - ps_n_cpre, pf_tx_buf_start_addr'length );
pf_tx_buf_addr_mask        <= std_logic_vector( resize( ps_n_fft - 1, pf_tx_buf_addr_mask'length ));
pf_tx_buf_addr_m           <= pf_tx_buf_addr and pf_tx_buf_addr_mask;

ad_rd_rdy                  <= ad_rd_ts_buf_rdy or ad_rd_tx_buf_rdy;
ad_admin_en                <= '1' when ( ex_state = ex_admin ) else '0';

ts_buf_addr                <= ts_buf_addr_i; 
ts_buf_we                  <= ts_buf_we_i;   
ts_buf_en                  <= ts_buf_en_i;   
ts_buf_sel                 <= ts_buf_sel_i;  
ts_buf_din                 <= ts_buf_din_i;  
rx_buf_addr                <= rx_buf_addr_i; 
rx_buf_we                  <= rx_buf_we_i;   
rx_buf_din                 <= rx_buf_din_i;  
rx_buf_sel                 <= rx_buf_sel_i;  
tx_buf_addr                <= tx_buf_addr_i; 
tx_buf_en                  <= tx_buf_en_i;   
tx_buf_sel                 <= tx_buf_sel_i;  

s_axis_data_tready         <= s_axis_data_tready_i;

--m_axis_data_tdata_i        <= shr_cplx( m_axis_data_tdata_b, to_integer( unsigned( ps_dout_lsb )), m_axis_data_tdata_i'length );
m_axis_data_tdata_i        <= m_axis_data_tdata_b;
m_axis_data_tdata          <= m_axis_data_tdata_i;
m_axis_data_tvalid         <= m_axis_data_tvalid_i;
   
irq                        <= irq_i;

ps_int_ack_f               <= ctrl_reg_in( 2 );    
ps_start_f                 <= ctrl_reg_in( 3 );
ps_stop_f                  <= ctrl_reg_in( 4 );
ps_enter_admin_f           <= ctrl_reg_in( 5 );      
ps_exit_admin_f            <= ctrl_reg_in( 6 );      
ps_ad_wr_ts_buf_f          <= ctrl_reg_in( 7 );      
ps_ad_wr_rx_buf_f          <= ctrl_reg_in( 8 );      
ps_ad_rd_ts_buf_f          <= ctrl_reg_in( 9 );
ps_ad_rd_tx_buf_f          <= ctrl_reg_in( 10 );
ps_ad_rd_ack_f             <= ctrl_reg_in( 11 );
ps_rd_sync_f               <= ctrl_reg_in( 12 );

ctrl_reg                   <= slv_reg_0;      
ps_n_cpre_reg              <= slv_reg_2;
ps_n_fft_reg               <= slv_reg_3;
ps_n_symb_agc_reg          <= slv_reg_4;
ps_n_symb_nsd_reg          <= slv_reg_5;
ps_n_symb_prs_reg          <= slv_reg_6;
ps_n_symb_dta_reg          <= slv_reg_7;
ps_n_frame_block_reg       <= slv_reg_8;
ps_ad_rd_wr_addr_reg       <= slv_reg_9;
ps_ad_wr_data_reg          <= slv_reg_10;

ps_n_fft                   <= unsigned( ps_n_fft_reg( ps_n_fft'range ));
ps_n_cpre                  <= unsigned( ps_n_cpre_reg( ps_n_cpre'range ));
ps_n_symb_agc              <= unsigned( ps_n_symb_agc_reg( ps_n_symb_agc'range ));
ps_n_symb_nsd              <= unsigned( ps_n_symb_nsd_reg( ps_n_symb_nsd'range ));
ps_n_symb_prs              <= unsigned( ps_n_symb_prs_reg( ps_n_symb_prs'range ));
ps_n_symb_dta              <= unsigned( ps_n_symb_dta_reg( ps_n_symb_dta'range ));
ps_n_frame_block           <= unsigned( ps_n_frame_block_reg( ps_n_frame_block'range ));

n_wd_symb_rx               <= ps_n_fft;
n_wd_symb_tx               <= ps_n_fft      + ps_n_cpre;
n_symb_frame_rx            <= ps_n_symb_prs + ps_n_symb_dta;
n_symb_frame_tx            <= ps_n_symb_prs + ps_n_symb_dta + ps_n_symb_agc + ps_n_symb_nsd;
n_symb_data_tx             <= ps_n_symb_prs + ps_n_symb_dta;
n_symb_train               <= ps_n_symb_agc + ps_n_symb_nsd;

info_reg( C_S00_AXI_DATA_WIDTH - 1 downto 8 )    <= C_DEVICE_ID;
info_reg( 7  downto 0 )    <= std_logic_vector( to_unsigned( C_N_SLV_REG, 8 ) );
slv_reg_1                  <= info_reg;

stat_reg(  0 )           <= resetp;
stat_reg(  1 )           <= '0';
stat_reg(  2 )           <= irq_i;
stat_reg(  3 )           <= pf_rx_symbol_done;          
stat_reg(  4 )           <= pf_tx_symbol_done;          
stat_reg(  5 )           <= ad_rd_rdy;
stat_reg(  6 )           <= pf_tx_ts_en;
stat_reg(  7 )           <= '0';
stat_reg(  8 )           <= s_axis_data_tready_i;
stat_reg(  9 )           <= s_axis_data_tvalid;
stat_reg( 10 )           <= m_axis_data_tready;
stat_reg( 11 )           <= m_axis_data_tvalid_i;
stat_reg( 13 downto 12 ) <= pf_ts_buf_sel;
stat_reg( 14 )           <= pf_tx_buf_sel( 0 );
stat_reg( 15 )           <= '0';
stat_reg( 16 )           <= '0';
stat_reg( 17 )           <= '0';
stat_reg( 18 )           <= '0';
stat_reg( 19 )           <= '0';
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
slv_reg_16                 <= stat_reg;

slv_reg_17(  3 downto  0 ) <= ex_state;
slv_reg_17(  7 downto  4 ) <= pf_state;
slv_reg_17( 11 downto  8 ) <= rm_state;
slv_reg_17( 15 downto 12 ) <= tm_state;
slv_reg_17( 19 downto 16 ) <= ad_rd_ts_state;
slv_reg_17( 23 downto 20 ) <= ad_rd_tx_state;
slv_reg_17( 24 )           <= '0';
slv_reg_17( 25 )           <= '0';
slv_reg_17( 26 )           <= '0';
slv_reg_17( 27 )           <= '0';
slv_reg_17( 28 )           <= '0';
slv_reg_17( 29 )           <= '0';
slv_reg_17( 30 )           <= '0';
slv_reg_17( 31 )           <= '0';

slv_reg_18                 <= ps_ad_rd_ts_buf_reg;
slv_reg_19                 <= ps_ad_rd_tx_buf_reg;
slv_reg_20                 <= std_logic_vector( resize( rx_data_ctr_p      ,  slv_reg_0'length ) );
slv_reg_21                 <= std_logic_vector( resize( rx_symbol_ctr_p    ,  slv_reg_0'length ) );     
slv_reg_22                 <= std_logic_vector( resize( rx_frame_ctr_p     ,  slv_reg_0'length ) );      
slv_reg_23                 <= std_logic_vector( resize( rx_block_ctr_p     ,  slv_reg_0'length ) );      
slv_reg_24                 <= std_logic_vector( resize( tx_data_ctr_p      ,  slv_reg_0'length ) );       
slv_reg_25                 <= std_logic_vector( resize( tx_symbol_ctr_p    ,  slv_reg_0'length ) );     
slv_reg_26                 <= std_logic_vector( resize( tx_frame_ctr_p     ,  slv_reg_0'length ) );      
slv_reg_27                 <= std_logic_vector( resize( tx_block_ctr_p     ,  slv_reg_0'length ) );      
slv_reg_28                 <= std_logic_vector( resize( rx_tv_ctr_p        ,  slv_reg_0'length ) );
slv_reg_29                 <= std_logic_vector( resize( tx_tv_ctr_p        ,  slv_reg_0'length ) );
slv_reg_30                 <= zeros( slv_reg_0'length - 0 );
slv_reg_31                 <= zeros( slv_reg_0'length - 0 );
slv_reg_32                 <= std_logic_vector( resize( pf_rx_ds_accum     ,  slv_reg_0'length ) );
slv_reg_33                 <= std_logic_vector( resize( pf_tx_ts_accum     ,  slv_reg_0'length ) );
slv_reg_34                 <= std_logic_vector( resize( pf_tx_ds_accum     ,  slv_reg_0'length ) );
slv_reg_35                 <= std_logic_vector( resize( pf_rx_frame_count  ,  slv_reg_0'length ) );
slv_reg_36                 <= std_logic_vector( resize( pf_tx_frame_count  ,  slv_reg_0'length ) );
slv_reg_37                 <= std_logic_vector( resize( n_wd_symb_rx       ,  slv_reg_0'length ) );
slv_reg_38                 <= std_logic_vector( resize( n_wd_symb_tx       ,  slv_reg_0'length ) );
slv_reg_39                 <= std_logic_vector( resize( n_symb_frame_rx    ,  slv_reg_0'length ) );
slv_reg_40                 <= std_logic_vector( resize( n_symb_frame_tx    ,  slv_reg_0'length ) );
slv_reg_41                 <= std_logic_vector( resize( n_symb_train       ,  slv_reg_0'length ) );
slv_reg_42                 <= zeros( slv_reg_0'length - 0 );
slv_reg_43                 <= zeros( slv_reg_0'length - 0 );
slv_reg_44                 <= zeros( slv_reg_0'length - 0 );
slv_reg_45                 <= zeros( slv_reg_0'length - 0 );
slv_reg_46                 <= zeros( slv_reg_0'length - 0 );
slv_reg_47                 <= zeros( slv_reg_0'length - 0 );
slv_reg_48                 <= zeros( slv_reg_0'length - 0 );
slv_reg_49                 <= zeros( slv_reg_0'length - 0 );
slv_reg_50                 <= zeros( slv_reg_0'length - 0 );
slv_reg_51                 <= zeros( slv_reg_0'length - 0 );
slv_reg_52                 <= zeros( slv_reg_0'length - 0 );
slv_reg_53                 <= zeros( slv_reg_0'length - 0 );
slv_reg_54                 <= zeros( slv_reg_0'length - 0 );
slv_reg_55                 <= zeros( slv_reg_0'length - 0 );
slv_reg_56                 <= zeros( slv_reg_0'length - 0 );
slv_reg_57                 <= zeros( slv_reg_0'length - 0 );
slv_reg_58                 <= zeros( slv_reg_0'length - 0 );
slv_reg_59                 <= zeros( slv_reg_0'length - 0 );
slv_reg_60                 <= zeros( slv_reg_0'length - 0 );
slv_reg_61                 <= zeros( slv_reg_0'length - 0 );
slv_reg_62                 <= zeros( slv_reg_0'length - 0 );
slv_reg_63                 <= zeros( slv_reg_0'length - 0 );

      


pf_ts_buf_en_t <= pf_tx_buf_en when ( pf_symb_type = ST_TRAINING ) else '0';
pf_tx_buf_en_t <= pf_tx_buf_en when ( pf_symb_type = ST_DATA ) else '0';
pf_tx_data     <= tx_buf_dout  when ( pf_symb_type = ST_DATA ) else ts_buf_dout;
pf_rx_buf_sel  <= not pf_tx_buf_sel;

 
-- master state machine
State_Machine_p: process ( aclk )
begin
  if rising_edge( aclk ) then
    if resetn = '0' then
      ex_state       <= EX_IDLE;
      int_rqst_f     <= '0';
    else 
      int_rqst_f     <= '0';
         
      case ex_state is
        
        when EX_IDLE =>
          if ( ps_enter_admin_f = '1' ) then
            ex_state   <= EX_ADMIN;
          elsif ( ps_start_f = '1' ) then
            ex_state   <= EX_RUNNING;
          end if;  
          
        when EX_ADMIN =>
          if ( ps_exit_admin_f = '1' ) then
            ex_state <= EX_IDLE;
          end if; 
          
        when EX_RUNNING => 
          if ps_stop_f = '1' then
            ex_state <= EX_IDLE;
          end if;
          
        when others =>
          null;
      end case;
    end if;
  end if;
end process;


    
process_frame_p: process( aclk )
begin
  if rising_edge( aclk ) then
    if resetn = '0' then
      pf_state          <= PF_IDLE;
      pf_rx_ds_count    <= ( others => '0' );
      pf_tx_ds_count    <= ( others => '0' );
      pf_tx_ts_count    <= ( others => '0' );
      pf_rx_ds_accum    <= ( others => '0' );
      pf_tx_ds_accum    <= ( others => '0' );
      pf_tx_ts_accum    <= ( others => '0' );
      pf_rx_frame_count <= ( others => '0' );
      pf_tx_frame_count <= ( others => '0' );
      pf_tx_buf_sel     <= b"1";
      pf_start_rx_f     <= '0';
      pf_start_tx_f     <= '0';
      pf_bramc_rst_f    <= '1';
      pf_rx_symbol_done <= '0';
      pf_symb_type      <= ST_TRAINING;
    else
      
      pf_start_rx_f     <= '0';
      pf_start_tx_f     <= '0';
      pf_bramc_rst_f    <= '0';
      
      if ps_stop_f = '1' then
        pf_state        <= PF_IDLE;
        pf_bramc_rst_f  <= '1';
      else      
        if pf_rx_symbol_done_f = '1' then
          pf_rx_symbol_done  <= '1';
        end if;
        
        case pf_state is
        
          when PF_IDLE =>
            if ( ps_start_f = '1' ) then
              pf_rx_ds_accum       <= ( others => '0' );
              pf_tx_ds_accum       <= ( others => '0' );
              pf_tx_ts_accum       <= ( others => '0' );
              pf_rx_frame_count    <= ( others => '0' );
              pf_tx_frame_count    <= ( others => '0' );
              pf_rx_symbol_done    <= '0';
              pf_tx_buf_sel        <= b"1";
              pf_start_rx_f        <= '1';
              pf_state             <= PF_START_FRAME;
            end if;
      
          when PF_START_FRAME =>
            pf_ts_buf_sel          <= ( others => '0' );
            pf_rx_ds_count         <= ( others => '0' );
            pf_tx_ds_count         <= ( others => '0' );
            pf_tx_ts_count         <= ( others => '0' );
            if ( n_symb_train > 0 ) then
              pf_tx_ts_en          <= '1';
            else
              pf_tx_ts_en          <= '0';
            end if;
            pf_state               <= PF_WAIT_RX_DS;
      
          when PF_WAIT_RX_DS =>
            if ( pf_rx_symbol_done = '1' ) then 
              pf_rx_symbol_done    <= '0';
              pf_tx_buf_sel( 0 )   <= not pf_tx_buf_sel( 0 );
              pf_rx_ds_count       <= pf_rx_ds_count + 1;
              pf_rx_ds_accum       <= pf_rx_ds_accum + 1;
              if pf_rx_ds_count = n_symb_frame_rx - 1 then
                pf_rx_frame_count    <= pf_rx_frame_count + 1;
              end if;
              pf_start_tx_f      <= '1';
              pf_start_rx_f      <= '1';
              if pf_tx_ts_en = '1' then
                pf_tx_ts_en        <= '0';
                pf_symb_type       <= ST_TRAINING;
                pf_state           <= PF_WAIT_TX_TS_START;
              else 
                pf_symb_type       <= ST_DATA;
                pf_state           <= PF_WAIT_TX_DS_START;
              end if;
            end if;
      
          when PF_WAIT_TX_TS_START =>
            if pf_tx_symbol_done = '0' then
              pf_state             <= PF_WAIT_TX_TS;
            end if; 
          
          when PF_WAIT_TX_TS =>
            if pf_tx_symbol_done = '1' then
              pf_tx_ts_count       <= pf_tx_ts_count + 1;
              pf_tx_ts_accum       <= pf_tx_ts_accum + 1;
              pf_start_tx_f        <= '1';
              if pf_tx_ts_count  = n_symb_train - 1 then
                pf_symb_type       <= ST_DATA;
                pf_state           <= PF_WAIT_TX_DS_START;
              else
                pf_ts_buf_sel      <= std_logic_vector( unsigned( pf_ts_buf_sel ) + 1 );
                pf_state           <= PF_WAIT_TX_TS_START;
              end if;
            end if;
            
          when PF_WAIT_TX_DS_START =>
            if ( pf_tx_symbol_done = '0' ) then
              pf_state             <= PF_WAIT_TX_DS;
            end if; 
                        
          when PF_WAIT_TX_DS =>
            if pf_tx_symbol_done = '1' then
              pf_tx_ds_count       <= pf_tx_ds_count + 1;
              pf_tx_ds_accum       <= pf_tx_ds_accum + 1;
              if pf_tx_ds_count = n_symb_data_tx - 1 then
                pf_tx_frame_count  <= pf_tx_frame_count + 1;
                pf_state           <= PF_START_FRAME;
              else
                pf_state           <= PF_WAIT_RX_DS;
              end if;
            end if;
          
          when others =>
            pf_state               <= PF_IDLE;     
        end case;
      end if;
    end if;    
  end if;    
 
end process;   

--=====================
-- Statistics Gathering
--=====================
-- how these counters work, even at 100 MHz, defeats me. 
-- But they are debug only.

--rx_valid <= '1' when ( s_axis_data_tvalid   = '1' and s_axis_data_tready_i = '1' ) else '0';
--tx_valid <= '1' when ( m_axis_data_tvalid_i = '1' and m_axis_data_tready   = '1' ) else '0';


--stats_p: process( aclk )
--begin
--  if rising_edge( aclk ) then
--    if ( resetn = '0' ) then
--      int_rqst_f      <= '0';

--      rx_data_ctr     <= ( others => '0' );
--      rx_symbol_ctr   <= ( others => '0' );
--      rx_frame_ctr    <= ( others => '0' );
--      rx_block_ctr    <= ( others => '0' );    
                          
--      rx_data_ctr_p   <= ( others => '0' );
--      rx_symbol_ctr_p <= ( others => '0' );
--      rx_frame_ctr_p  <= ( others => '0' );
--      rx_block_ctr_p  <= ( others => '0' );    

--      tx_data_ctr     <= ( others => '0' );
--      tx_symbol_ctr   <= ( others => '0' );
--      tx_frame_ctr    <= ( others => '0' );
--      tx_block_ctr    <= ( others => '0' );    
                   
--      tx_data_ctr_p   <= ( others => '0' );
--      tx_symbol_ctr_p <= ( others => '0' );
--      tx_frame_ctr_p  <= ( others => '0' );
--      tx_block_ctr_p  <= ( others => '0' );    
    
--    else 
--      int_rqst_f <= '0';

--      if rx_valid = '1' then
--        rx_data_ctr_p        <= rx_data_ctr_p + 1;
--        if rx_data_ctr < n_wd_symb_rx - 1 then  
--          rx_data_ctr        <= rx_data_ctr + 1;
--        else
--          rx_data_ctr        <= ( others=> '0' );
--          rx_symbol_ctr_p    <= rx_symbol_ctr_p + 1;
--        end if;
        
--        if rx_data_ctr = n_wd_symb_rx - 1 then
--          if rx_symbol_ctr < n_symb_frame_rx - 1 then 
--            rx_symbol_ctr    <= rx_symbol_ctr + 1;
--          else
--            rx_symbol_ctr    <= ( others=> '0' );
--            rx_frame_ctr_p   <= rx_frame_ctr_p + 1;
--          end if;
--        end if;
         
--        if rx_symbol_ctr = n_symb_frame_rx - 1 and rx_data_ctr = n_wd_symb_rx - 1 then
--          if rx_frame_ctr < ps_n_frame_block - 1 then
--            rx_frame_ctr   <= rx_frame_ctr + 1;
--          else
--            rx_frame_ctr   <= ( others=> '0' );
--            rx_block_ctr_p <= rx_block_ctr_p + 1;
--            rx_block_ctr   <= rx_block_ctr + 1;
--          end if;
--        end if;
--      end if; -- rx_valid = '1'

--      if tx_valid = '1' then
--        tx_data_ctr_p      <= tx_data_ctr_p + 1;
--        if tx_data_ctr < n_wd_symb_tx - 1 then  
--          tx_data_ctr      <= tx_data_ctr + 1;
--        else
--          tx_data_ctr      <= ( others=> '0' );
--          tx_symbol_ctr_p  <= tx_symbol_ctr_p + 1;
--        end if;
        
--        if tx_data_ctr = n_wd_symb_tx - 1 then
--          if tx_symbol_ctr < n_symb_frame_tx - 1 then 
--            tx_symbol_ctr  <= tx_symbol_ctr + 1;
--          else
--            tx_symbol_ctr  <= ( others=> '0' );
--            tx_frame_ctr_p <= tx_frame_ctr_p + 1;
--          end if;
--        end if;
         
--        if tx_symbol_ctr = n_symb_frame_tx - 1 and tx_data_ctr = n_wd_symb_tx - 1 then
--          if tx_frame_ctr < ps_n_frame_block - 1 then
--            tx_frame_ctr   <= tx_frame_ctr + 1;
--          else
--            tx_frame_ctr   <= ( others=> '0' );
--            tx_block_ctr_p <= tx_block_ctr_p + 1;
--            tx_block_ctr   <= tx_block_ctr + 1;
--          end if;
--        end if;
--      end if; -- tx_valid = '1'
      
--    end if;
--  end if;
  
--end process;
                

end arch_imp;