library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.emm_telsys.all;

--===========================
-- Data and Phase Demodulator
--===========================
-- C_DEMOD_MODE is 0 for data, 1 for Phase
--                        DATA  PHASE
-- C_S_AXIS_TDATA_WIDTH     32     32
-- C_M_AXIS_TDATA_WIDTH     24     16 
-- C_DEMOD_DATA_WIDTH       12     16
-- C_DEMOD_ADDR_WIDTH       12     16

-- DATA MODE
-- soft decision data format:
-----------------------------
-- codes are 4 bits, range -7 ( best '1' ) to +7 ( best '0' )
-- 3 downto 0           : bit 0 soft code ( lsb )   
-- 7 downto 4           : bit 1 soft code 
-- 11 downto 8          : bit 2 soft code 
-- 15 downto 12         : bit 3 soft code 
-- 19 downto 16         : bit 4 soft code 
-- 23 downto 20         : bit 5 soft code 
-- dual-port memory, I on port A, Q on port B
-- ( For bits 0-2 Q is don't care, for bits 3-5 I is don't care.

-- demod addr from input stream : 12 bits address 
-- 31 downto 20           : Q => addrb
-- 15 downto 4            : I => addra

-- PHASE MODE
-- Outputs phase error for input I and Q. 
-- I and Q inputs are 
-- phase error data format currently in use:
--------------------------------------------
-- fix 15:13, but normalized ( scaled radians )  - 1.0 to +1.0 = -pi to pi
-- -pi            = f11.00000_00000000
-- +pi            = f01.00000_00000000
-- non 4-QAM value = 111.11111_11111111 

-- demod addr from input stream : 16 bits address 
-- 15 downto 8            : Q => addra( 15 downto 8 );
--  7 downto 0            : I => addra( 7 downto 0 );
--                        : 0 => addrb

entity DEMODULATOR_v1_0 is
  generic ( 
  
    C_DEMOD_MODE              : integer := 0;
    C_DEMOD_DATA_WIDTH        : integer := 12;
    C_DEMOD_ADDR_WIDTH        : integer := 12;
    C_S_AXIS_TDATA_WIDTH      : integer := 32;
    C_M_AXIS_TDATA_WIDTH      : integer := 32;
         
    C_NEG_ADDR_B              : boolean := true;
         
   -- Parameters of Axi Slave Bus Interface S00_AXI
    C_S00_AXI_DATA_WIDTH	  : integer := 32;
    C_S00_AXI_ADDR_WIDTH	  : integer := 7;
    
  -- Parameters of BRAM
    C_BRAM_READ_LATENCY       : integer := 2
    );
  port ( 
  -- Users to add ports here
    aclk	        : in std_logic;
    aresetn         : in std_logic;
   
    demod_dina      : out std_logic_vector( C_DEMOD_DATA_WIDTH - 1 downto 0 );
    demod_douta     : in  std_logic_vector( C_DEMOD_DATA_WIDTH - 1 downto 0 );
    demod_addra     : out std_logic_vector( C_DEMOD_ADDR_WIDTH - 1 downto 0 );                           
    demod_ena       : out std_logic;
    demod_wea       : out std_logic;

    demod_dinb      : out std_logic_vector( C_DEMOD_DATA_WIDTH - 1 downto 0 );
    demod_doutb     : in  std_logic_vector( C_DEMOD_DATA_WIDTH - 1 downto 0 );
    demod_addrb     : out std_logic_vector( C_DEMOD_ADDR_WIDTH - 1 downto 0 );                           
    demod_enb       : out std_logic;
    demod_web       : out std_logic;

    -- Ports of Axi Slave Bus Interface S_AXIS_DIN
    s_axis_data_tready	: out std_logic;
    s_axis_data_tdata	: in  std_logic_vector( C_S_AXIS_TDATA_WIDTH - 1 downto 0 );
    s_axis_data_tvalid	: in  std_logic;
    
    -- Ports of Axi Master Bus Interface M_AXIS_DOUT
    m_axis_data_tvalid	: out std_logic;
    m_axis_data_tdata	: out std_logic_vector( C_M_AXIS_TDATA_WIDTH - 1 downto 0 );
    m_axis_data_tready	: in  std_logic;
    
    irq             : out std_logic;
  
-- Ports of Axi Slave Bus Interface S00_AXI
    s00_axi_awaddr	: in std_logic_vector( C_S00_AXI_ADDR_WIDTH - 1 downto 0 );
    s00_axi_awprot	: in std_logic_vector( 2 downto 0 );
    s00_axi_awvalid	: in std_logic;
    s00_axi_awready	: out std_logic;
    s00_axi_wdata	: in std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
    s00_axi_wstrb	: in std_logic_vector( ( C_S00_AXI_DATA_WIDTH / 8 ) - 1 downto 0 );
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
    s00_axi_rready	: in std_logic
    
    );
    
end DEMODULATOR_v1_0;

architecture rtl of DEMODULATOR_v1_0 is

type     T_BIT_MAP_ARRAY is array ( integer range <> ) of std_logic_vector( C_BIT_MAP_WIDTH - 1 downto 0 );
type     T_INT_ARRAY     is array ( integer range <> ) of integer;

constant C_SEL_DEMOD_IQ_BITS            : T_INT_ARRAY( 0 to 1 ) := ( 12, 8 );
constant C_SEL_DEMOD_LUT_IN_DATA_WIDTH  : T_INT_ARRAY( 0 to 1 ) := ( C_DEMOD_ADDR_WIDTH * 2, C_DEMOD_ADDR_WIDTH );
constant C_SEL_DEMOD_LUT_OUT_DATA_WIDTH : T_INT_ARRAY( 0 to 1 ) := ( 24, 16 );

constant C_DEMOD_MODE_DATA              : integer := 0;
constant C_DEMOD_MODE_PHASE             : integer := 1;

constant C_DEMOD_IQ_BITS                : integer := C_SEL_DEMOD_IQ_BITS( C_DEMOD_MODE );
constant C_DEMOD_LUT_IN_DATA_WIDTH      : integer := C_SEL_DEMOD_LUT_IN_DATA_WIDTH( C_DEMOD_MODE ); 
constant C_DEMOD_LUT_OUT_DATA_WIDTH     : integer := C_SEL_DEMOD_LUT_OUT_DATA_WIDTH( C_DEMOD_MODE ); 

constant C_DATA_DEMOD_IN_WD_MAP         : std_logic_vector( C_S_AXIS_TDATA_WIDTH / 2 - 1 downto 0 ) := zeros( C_S_AXIS_TDATA_WIDTH / 2 - C_DEMOD_IQ_BITS ) & ones( C_DEMOD_IQ_BITS );
constant C_DATA_DEMOD_OUT_WD_MAP        : std_logic_vector( C_M_AXIS_TDATA_WIDTH / 2 - 1 downto 0 ) := zeros( C_M_AXIS_TDATA_WIDTH / 2 - C_DEMOD_IQ_BITS ) & ones( C_DEMOD_IQ_BITS );
constant C_DATA_DEMOD_AXIS_IN_MAP       : std_logic_vector( C_BIT_MAP_WIDTH - 1 downto 0 ) := zeros( C_BIT_MAP_WIDTH - C_S_AXIS_TDATA_WIDTH ) & C_DATA_DEMOD_IN_WD_MAP  & C_DATA_DEMOD_IN_WD_MAP; 
constant C_DATA_DEMOD_AXIS_OUT_MAP      : std_logic_vector( C_BIT_MAP_WIDTH - 1 downto 0 ) := zeros( C_BIT_MAP_WIDTH - C_M_AXIS_TDATA_WIDTH ) & C_DATA_DEMOD_OUT_WD_MAP & C_DATA_DEMOD_OUT_WD_MAP; 

constant C_SEL_DEMOD_IN_S_MAP           : T_BIT_MAP_ARRAY( 0 to 1 ) := ( C_DATA_DEMOD_AXIS_IN_MAP              , x"00000000_00000000_00000000_0000ffff" );
constant C_SEL_DEMOD_IN_D_MAP           : T_BIT_MAP_ARRAY( 0 to 1 ) := ( x"00000000_00000000_00000000_00ffffff", x"00000000_00000000_00000000_0000ffff" );
constant C_SEL_DEMOD_OUT_S_MAP          : T_BIT_MAP_ARRAY( 0 to 1 ) := ( x"00000000_00000000_00000000_00ffffff", x"00000000_00000000_00000000_0000ffff" );
constant C_SEL_DEMOD_OUT_D_MAP          : T_BIT_MAP_ARRAY( 0 to 1 ) := ( C_DATA_DEMOD_AXIS_OUT_MAP             , x"00000000_00000000_00000000_0000ffff" );

constant C_DEMOD_IN_S_MAP               : std_logic_vector( C_BIT_MAP_WIDTH - 1 downto 0 ) := C_SEL_DEMOD_IN_S_MAP( C_DEMOD_MODE );
constant C_DEMOD_IN_D_MAP               : std_logic_vector( C_BIT_MAP_WIDTH - 1 downto 0 ) := C_SEL_DEMOD_IN_D_MAP( C_DEMOD_MODE );
constant C_DEMOD_OUT_S_MAP              : std_logic_vector( C_BIT_MAP_WIDTH - 1 downto 0 ) := C_SEL_DEMOD_OUT_S_MAP( C_DEMOD_MODE );
constant C_DEMOD_OUT_D_MAP              : std_logic_vector( C_BIT_MAP_WIDTH - 1 downto 0 ) := C_SEL_DEMOD_OUT_D_MAP( C_DEMOD_MODE );

constant C_DEMOD_ADDR_MIN               : std_logic_vector( demod_addra'length - 1 downto 0 ) := std_logic_vector( to_unsigned( 2 ** ( C_DEMOD_ADDR_WIDTH - 1 ),     demod_addra'length ) );
constant C_DEMOD_ADDR_MAX               : std_logic_vector( demod_addra'length - 1 downto 0 ) := std_logic_vector( to_unsigned( 2 ** ( C_DEMOD_ADDR_WIDTH - 1 ) - 1, demod_addra'length ) );

constant C_N_SLV_REG                    : integer := 32;

component DEMODULATOR_v1_0_S00_AXI is
  generic ( 
    C_S_AXI_DATA_WIDTH	: integer	:= 32;
    C_S_AXI_ADDR_WIDTH	: integer	:= 7
    );

  port ( 
    SLV_REG_0         : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_1         : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_2         : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_3         : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_4         : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_5         : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_6         : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_7         : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_8         : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_9         : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_10        : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_11        : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_12        : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_13        : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_14        : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_15        : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    
    SLV_REG_16        : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_17        : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_18        : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_19        : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_20        : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_21        : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_22        : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_23        : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_24        : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_25        : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_26        : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_27        : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_28        : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_29        : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_30        : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_31        : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    
    
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
end component DEMODULATOR_v1_0_S00_AXI;

--=============================================================
-- System Level Components 
--=============================================================
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

--=============================================================
-- This handles the whole demodulation process. 
-- Can operate continuously 
-- Reads a Slave Bus through an external device to a Master Bus
-- External device in this case the BRAM containing the maps
--=============================================================
component AXI4_Stream_Device_SISO is
  generic ( 
    C_S_AXIS_TDATA_WIDTH    :  integer := 32;
    C_S_AXIS_TUSER_WIDTH    :  integer := 0;
    C_M_AXIS_TDATA_WIDTH    :  integer := 32;
    C_HAS_TLAST             :  boolean := false;
    C_DEVICE_DATA_IN_WIDTH  :  integer := 32;
    C_DEVICE_DATA_OUT_WIDTH :  integer := 32;
    C_IN_S_MAP              :  std_logic_vector( C_BIT_MAP_WIDTH - 1 downto 0 ) := ( others => '1' );
    C_IN_D_MAP              :  std_logic_vector( C_BIT_MAP_WIDTH - 1 downto 0 ) := ( others => '1' );
    C_OUT_S_MAP             :  std_logic_vector( C_BIT_MAP_WIDTH - 1 downto 0 ) := ( others => '1' );
    C_OUT_D_MAP             :  std_logic_vector( C_BIT_MAP_WIDTH - 1 downto 0 ) := ( others => '1' );
    C_DEVICE_LATENCY        :  integer := 2
  );
  
  port ( 
    S_AXIS_TVALID        : in  std_logic;
    S_AXIS_TDATA         : in  std_logic_vector( C_S_AXIS_TDATA_WIDTH - 1 downto 0 );
    S_AXIS_TREADY        : out std_logic;
    S_AXIS_TUSER         : in  std_logic_vector( C_S_AXIS_TUSER_WIDTH - 1 downto 0 ) := ( others => '0' );
    S_AXIS_TLAST         : in  std_logic := '0';
  
    M_AXIS_TVALID        : out std_logic;
    M_AXIS_TDATA         : out std_logic_vector( C_M_AXIS_TDATA_WIDTH - 1 downto 0 );
    M_AXIS_TREADY        : in  std_logic;
    M_AXIS_TUSER         : out std_logic_vector( C_S_AXIS_TUSER_WIDTH - 1 downto 0 );
    M_AXIS_TLAST         : out std_logic;
  
    DEVICE_CLK_ENABLE    : out std_logic;
    DEVICE_DATA_IN       : out std_logic_vector( C_DEMOD_LUT_IN_DATA_WIDTH - 1 downto 0 );
    DEVICE_DATA_OUT      : in  std_logic_vector( C_DEMOD_LUT_OUT_DATA_WIDTH - 1 downto 0 );
  
    ACLK                 : in  std_logic;
    ARESETN              : in  std_logic;
    PS_RESET             : in  std_logic := '0'
  );
end component AXI4_Stream_Device_SISO;

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


  
--============================
-- Processing System Interface
--============================
-- input registers from AXI lite port
signal slv_reg_0               : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
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

-- output registers to AXI lite port
signal slv_reg_1               : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_16              : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_17              : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_18              : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_19              : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_20              : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_21              : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_22              : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_23              : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_24              : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_25              : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_26              : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_27              : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_28              : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_29              : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_30              : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_31              : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );

signal irq_i                   : std_logic;
signal int_rqst_f              : std_logic;

signal ps_n_fft_reg            : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal ps_n_cpre_reg           : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal ps_n_symbols_frame_reg  : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal ps_n_frames_block_reg   : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal ps_ad_rd_data_reg       : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal ps_ad_rd_wr_addr_reg    : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal ps_ad_wr_data_reg       : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );

signal ctrl_reg                : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );      
signal ctrl_reg_in             : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal info_reg                : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
alias  info_mode               : std_logic_vector( 7 downto 0 ) is info_reg( 31 downto 24 );
alias  info_lut_size           : std_logic_vector( 7 downto 0 ) is info_reg( 23 downto 16 );
alias  info_lut_bits           : std_logic_vector( 7 downto 0 ) is info_reg( 15 downto  8 );
alias  info_n_slv_reg          : std_logic_vector( 7 downto 0 ) is info_reg( 7 downto  0 );
signal status_reg              : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );

signal demod_ena_i : std_logic;
signal demod_enb_i : std_logic;


signal resetn                  : std_logic;
signal resetp                  : std_logic;

signal ps_int_ack_f            : std_logic;
signal ps_enter_admin_f        : std_logic;
signal ps_exit_admin_f         : std_logic;
signal ps_start_f              : std_logic;
signal ps_stop_f               : std_logic;
signal ps_ad_rd_demod_f        : std_logic;
signal ps_ad_wr_demod_f        : std_logic;
signal ps_ad_rd_demod_ack_f    : std_logic;

--========================
-- Executive state machine
--========================
constant EX_IDLE               : T_SM_STATE := b"1001";
constant EX_ADMIN              : T_SM_STATE := b"1011";
constant EX_RUN                : T_SM_STATE := b"1111";

signal ex_state                : T_SM_STATE;
signal ex_nxtst                : T_SM_STATE;

--=====================
-- Admin access signals
--=====================
signal ad_demod_rd_rdy         : std_logic;
signal ad_demod_rd_rdy_a       : std_logic;
signal ad_demod_rd_rdy_b       : std_logic;
signal ad_admin_en             : std_logic;
signal ad_rd_state_a           : T_SM_STATE;
signal ad_rd_state_b           : T_SM_STATE;

--==================================================
-- Lookup table for demodulation function is in BRAM
--==================================================
signal m_axis_lut_tready       : std_logic;
signal m_axis_lut_tdata        : std_logic_vector( C_S_AXIS_TDATA_WIDTH - 1 downto 0 );
signal m_axis_lut_tvalid       : std_logic;

alias  s_axis_data_I           : std_logic_vector( C_DEMOD_IQ_BITS - 1 downto 0 ) is s_axis_data_tdata( C_DEMOD_IQ_BITS - 1 downto 0 );
alias  s_axis_data_Q           : std_logic_vector( C_DEMOD_IQ_BITS - 1 downto 0 ) is s_axis_data_tdata( s_axis_data_tdata'length/2 + C_DEMOD_IQ_BITS - 1 downto s_axis_data_tdata'length/2 );

signal pf_demod_addra          : std_logic_vector( C_DEMOD_ADDR_WIDTH - 1 downto 0 ); 
signal pf_demod_addrb          : std_logic_vector( C_DEMOD_ADDR_WIDTH - 1 downto 0 ); 
signal pf_demod_addra_r        : std_logic_vector( C_DEMOD_ADDR_WIDTH - 1 downto 0 ); 
signal pf_demod_addrb_r        : std_logic_vector( C_DEMOD_ADDR_WIDTH - 1 downto 0 ); 
signal pf_demod_clk_en         : std_logic;
signal pf_demod_din            : std_logic_vector( C_DEMOD_LUT_IN_DATA_WIDTH - 1 downto 0 );
signal pf_demod_dout           : std_logic_vector( C_DEMOD_LUT_OUT_DATA_WIDTH - 1 downto 0 );
alias  pf_data_I               : std_logic_vector( demod_addra'length - 1 downto 0 ) is pf_demod_din( pf_demod_din'length / 2 - 1 downto pf_demod_din'length / 2 - demod_addra'length ); 
alias  pf_data_Q               : std_logic_vector( demod_addra'length - 1 downto 0 ) is pf_demod_din( pf_demod_din'length - 1     downto pf_demod_din'length     - demod_addra'length );
alias  pf_phase_I              : std_logic_vector( demod_addra'length - 1 downto 0 ) is pf_demod_din( pf_demod_din'length / 2 - 1 downto pf_demod_din'length / 2 - demod_addra'length / 2 ); 
alias  pf_phase_Q              : std_logic_vector( demod_addra'length - 1 downto 0 ) is pf_demod_din( pf_demod_din'length - 1     downto pf_demod_din'length     - demod_addra'length / 2 ); 

--================================================
-- demod addresses, addrb may be negated as option
-- to allow reverse use of table as needed by 
-- i.e. MATLAB gray-coded constellations
--================================================ 

signal demod_addra_i           : std_logic_vector( C_DEMOD_ADDR_WIDTH - 1 downto 0 ); 
signal demod_addrb_i           : std_logic_vector( C_DEMOD_ADDR_WIDTH - 1 downto 0 ); 

--========================
-- Stats gathering signals
--======================== 
signal ps_n_fft                : unsigned( clogb2( C_N_FFT_MAX )          - 1 + 1 downto 0 );
signal ps_n_cpre               : unsigned( clogb2( C_N_FFT_MAX )          - 1 + 1 downto 0 );
signal ps_n_wd_symb            : unsigned( clogb2( C_N_FFT_MAX )          - 1 + 1 downto 0 );
signal ps_n_symbols_frame      : unsigned( clogb2( C_N_SYMBS_FRAME_MAX )  - 1 downto 0 );
signal ps_n_frames_block       : unsigned( clogb2( C_N_FRAMES_BLOCK_MAX ) - 1 downto 0 );

signal rx_data_ctr             : unsigned( ps_n_fft'length           - 1 downto 0 );   
signal rx_symbol_ctr           : unsigned( ps_n_symbols_frame'length - 1 downto 0 );   
signal rx_frame_ctr            : unsigned( ps_n_frames_block'length  - 1 downto 0 );   
signal rx_block_ctr            : unsigned( clogb2( C_N_BLOCKS_MAX )  - 1 downto 0 );   

signal rx_data_ctr_p           : unsigned( 31 downto 0 ); 
signal rx_symbol_ctr_p         : unsigned( 31 downto 0 ); 
signal rx_frame_ctr_p          : unsigned( 31 downto 0 ); 
signal rx_block_ctr_p          : unsigned( 31 downto 0 );

signal tx_data_ctr             : unsigned( ps_n_fft'length           - 1 downto 0 );   
signal tx_symbol_ctr           : unsigned( ps_n_symbols_frame'length - 1 downto 0 );   
signal tx_frame_ctr            : unsigned( ps_n_frames_block'length  - 1 downto 0 );   
signal tx_block_ctr            : unsigned( clogb2( C_N_BLOCKS_MAX )  - 1 downto 0 );   

signal tx_data_ctr_p           : unsigned( 31 downto 0 ); 
signal tx_symbol_ctr_p         : unsigned( 31 downto 0 ); 
signal tx_frame_ctr_p          : unsigned( 31 downto 0 ); 
signal tx_block_ctr_p          : unsigned( 31 downto 0 );

signal rx_valid                : std_logic;
signal tx_valid                : std_logic;

---------------------------------
-- internal AXI4 protocol signals
---------------------------------
signal s_axis_data_tready_i : std_logic;
signal m_axis_data_tvalid_i : std_logic;    


begin

-- Instantiation of Axi Bus Interface S00_AXI
DEMODULATOR_v1_0_S00_AXI_inst : DEMODULATOR_v1_0_S00_AXI
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
    SLV_REG_24      => slv_reg_24   ,
    SLV_REG_25      => slv_reg_25,
    SLV_REG_26      => slv_reg_26,
    SLV_REG_27      => slv_reg_27,
    SLV_REG_28      => slv_reg_28,
    SLV_REG_29      => slv_reg_29,
    SLV_REG_30      => slv_reg_30,
    SLV_REG_31      => slv_reg_31,
  
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
    INTERNAL_IRQ_F  => int_rqst_f,
    EXTERNAL_IRQ    => irq_i,
    INT_ACK_F       => ps_int_ack_f
    );
    
--===================================================
-- This component handles the BRAM device at run time
--===================================================
bram_lut_processor : AXI4_Stream_Device_SISO
  generic map ( 
    C_S_AXIS_TDATA_WIDTH     =>  C_S_AXIS_TDATA_WIDTH,
    C_S_AXIS_TUSER_WIDTH     =>  0,
    C_M_AXIS_TDATA_WIDTH     =>  C_M_AXIS_TDATA_WIDTH,
    C_HAS_TLAST              =>  false,
    C_DEVICE_DATA_IN_WIDTH   =>  C_DEMOD_LUT_IN_DATA_WIDTH,
    C_DEVICE_DATA_OUT_WIDTH  =>  C_DEMOD_LUT_OUT_DATA_WIDTH,
    C_IN_S_MAP               =>  C_DEMOD_IN_S_MAP,
    C_IN_D_MAP               =>  C_DEMOD_IN_D_MAP,
    C_OUT_S_MAP              =>  C_DEMOD_OUT_S_MAP,
    C_OUT_D_MAP              =>  C_DEMOD_OUT_D_MAP,
    C_DEVICE_LATENCY         =>  C_BRAM_READ_LATENCY
    )                   
  port map ( 
    S_AXIS_TVALID            =>  s_axis_data_tvalid,
    S_AXIS_TDATA             =>  s_axis_data_tdata,
    S_AXIS_TREADY            =>  m_axis_lut_tready,
    S_AXIS_TUSER             =>  ( others=>'0' ),
    S_AXIS_TLAST             =>  '0',                      
    
    M_AXIS_TVALID            =>  m_axis_data_tvalid_i,
    M_AXIS_TDATA             =>  m_axis_data_tdata,
    M_AXIS_TREADY            =>  m_axis_data_tready,
    M_AXIS_TUSER             =>  open,
    M_AXIS_TLAST             =>  open,                      
                              
    DEVICE_CLK_ENABLE        =>  pf_demod_clk_en,
    DEVICE_DATA_IN           =>  pf_demod_din,
    DEVICE_DATA_OUT          =>  pf_demod_dout,
                              
    ACLK                     =>  aclk,
    ARESETN                  =>  resetn,
    PS_RESET                 =>  resetp
  );

--============================================
-- Admin section : Read, write Demodulator map
--============================================
--=========================
-- BRAM Port A - Read/Write
--=========================
bram_ps_rw_I : BRAM_PS_RW
  generic map ( 
    C_BRAM_ADDR_WIDTH       => C_DEMOD_ADDR_WIDTH,
    C_BRAM_DOUT_WIDTH       => C_DEMOD_DATA_WIDTH,
    C_BRAM_DIN_WIDTH        => C_DEMOD_DATA_WIDTH,
    C_PS_ADDR_REG_WIDTH     => C_S00_AXI_DATA_WIDTH,
    C_PS_RD_DATA_REG_WIDTH  => C_S00_AXI_DATA_WIDTH / 2,
    C_PS_WR_DATA_REG_WIDTH  => C_S00_AXI_DATA_WIDTH,
    C_BRAM_RD_LATENCY       => C_BRAM_READ_LATENCY
  )
  port map ( 
    PS_ADDR_REG             => ps_ad_rd_wr_addr_reg,
    PS_RD_DATA_REG          => ps_ad_rd_data_reg( C_S00_AXI_DATA_WIDTH / 2 - 1 downto 0 ), 
    PS_WR_DATA_REG          => ps_ad_wr_data_reg,

    SYS_ADDR                => pf_demod_addra, 
    SYS_EN                  => pf_demod_clk_en,

    BRAM_ADDR               => demod_addra_i,
    BRAM_DOUT               => demod_douta,
    BRAM_DIN                => demod_dina,
    BRAM_EN                 => demod_ena_i,
    BRAM_WE                 => demod_wea,
                           
    PS_RD_F                 => ps_ad_rd_demod_f,
    PS_RD_ACK_F             => ps_ad_rd_demod_ack_f, 
    PS_RD_RDY               => ad_demod_rd_rdy_a,
    PS_WR_F                 => ps_ad_wr_demod_f,
                           
    RD_STATE_OUT            => ad_rd_state_a,
    PS_ENABLE               => ad_admin_en,
    ACLK                    => aclk,
    ARESETN                 => resetn
  );

--========================
-- BRAM Port B - Read only
--========================
bram_ps_rw_Q : BRAM_PS_RW
  generic map ( 
    C_BRAM_ADDR_WIDTH       => C_DEMOD_ADDR_WIDTH,
    C_BRAM_DOUT_WIDTH       => C_DEMOD_DATA_WIDTH,
    C_PS_ADDR_REG_WIDTH     => C_S00_AXI_DATA_WIDTH,
    C_PS_RD_DATA_REG_WIDTH  => C_S00_AXI_DATA_WIDTH / 2,
    C_BRAM_RD_LATENCY       => C_BRAM_READ_LATENCY
  )

  port map ( 
    PS_ADDR_REG             => ps_ad_rd_wr_addr_reg,
    PS_RD_DATA_REG          => ps_ad_rd_data_reg( C_S00_AXI_DATA_WIDTH - 1 downto C_S00_AXI_DATA_WIDTH / 2 ), 

    SYS_ADDR                => pf_demod_addrb, 
    SYS_EN                  => pf_demod_clk_en,

    BRAM_ADDR               => demod_addrb_i,
    BRAM_DOUT               => demod_doutb,
    BRAM_EN                 => demod_enb_i,
                           
    PS_RD_F                 => ps_ad_rd_demod_f,
    PS_RD_ACK_F             => ps_ad_rd_demod_ack_f, 
    PS_RD_RDY               => ad_demod_rd_rdy_b,
                           
    RD_STATE_OUT            => ad_rd_state_b,
    PS_ENABLE               => ad_admin_en,
    ACLK                    => aclk,
    ARESETN                 => resetn
  );





--============================
-- Processing System Interface
--============================

ctrl_reg                 <= slv_reg_0;
ps_n_fft_reg             <= slv_reg_2;
ps_n_cpre_reg            <= slv_reg_3;    
ps_n_symbols_frame_reg   <= slv_reg_4;
ps_n_frames_block_reg    <= slv_reg_5;
ps_ad_rd_wr_addr_reg     <= slv_reg_6;
ps_ad_wr_data_reg        <= slv_reg_7;

info_mode                <= std_logic_vector( to_unsigned( C_DEMOD_MODE, info_mode'length ) );
info_lut_size            <= std_logic_vector( to_unsigned( C_DEMOD_ADDR_WIDTH, info_mode'length ) );
info_lut_bits            <= std_logic_vector( to_unsigned( C_DEMOD_DATA_WIDTH, info_mode'length ) );
info_n_slv_reg           <= std_logic_vector( to_unsigned( C_N_SLV_REG, info_mode'length ) );

ps_n_fft                 <= unsigned( ps_n_fft_reg( ps_n_fft'range ) );
ps_n_cpre                <= unsigned( ps_n_cpre_reg( ps_n_cpre'range ) );
ps_n_symbols_frame       <= unsigned( ps_n_symbols_frame_reg( ps_n_symbols_frame'range ) );
ps_n_frames_block        <= unsigned( ps_n_frames_block_reg( ps_n_frames_block'range ) );
ps_n_wd_symb             <= ps_n_fft + ps_n_cpre;

status_reg( 0 )            <= resetp;
status_reg( 1 )            <= irq_i;
status_reg( 2 )            <= '0';
status_reg( 3 )            <= ad_demod_rd_rdy;
status_reg( 4 )            <= '0';
status_reg( 5 )            <= '0';

status_reg( 6 )            <= '0';
status_reg( 7 )            <= '0';

status_reg( 8 )            <= s_axis_data_tvalid;
status_reg( 9 )            <= s_axis_data_tready_i;
status_reg( 10 )           <= m_axis_data_tvalid_i;
status_reg( 11 )           <= m_axis_data_tready;

status_reg( 12 )           <= m_axis_lut_tready;
status_reg( 13 )           <= '0';
status_reg( 14 )           <= '0';
status_reg( 15 )           <= '0';

status_reg( 19 downto 16 ) <= ex_state;   
status_reg( 23 downto 20 ) <= ad_rd_state_a;   
status_reg( 27 downto 24 ) <= ad_rd_state_b;   
status_reg( 31 downto 28 ) <= ( others=>'0' );  

slv_reg_1                <= info_reg; --Read by PS
slv_reg_16               <= status_reg;
slv_reg_17               <= ps_ad_rd_data_reg;
slv_reg_18               <= ( others=>'0' ); 
slv_reg_19               <= ( others=>'0' );
slv_reg_20               <= std_logic_vector( resize( rx_data_ctr_p   , slv_reg_0'length ) );
slv_reg_21               <= std_logic_vector( resize( rx_symbol_ctr_p , slv_reg_0'length ) );     
slv_reg_22               <= std_logic_vector( resize( rx_frame_ctr_p  , slv_reg_0'length ) );      
slv_reg_23               <= std_logic_vector( resize( rx_block_ctr_p  , slv_reg_0'length ) );      
slv_reg_24               <= std_logic_vector( resize( tx_data_ctr_p   , slv_reg_0'length ) );       
slv_reg_25               <= std_logic_vector( resize( tx_symbol_ctr_p , slv_reg_0'length ) );     
slv_reg_26               <= std_logic_vector( resize( tx_frame_ctr_p  , slv_reg_0'length ) );      
slv_reg_27               <= std_logic_vector( resize( tx_block_ctr_p  , slv_reg_0'length ) );      
--slv_reg_28               <= ( others=>'0' );
--slv_reg_29               <= ( others=>'0' );
--slv_reg_30               <= ( others=>'0' );
--slv_reg_31               <= ( others=>'0' );

ps_int_ack_f             <= ctrl_reg_in( 1 );
ps_start_f               <= ctrl_reg_in( 2 );
ps_stop_f                <= ctrl_reg_in( 3 );
ps_enter_admin_f         <= ctrl_reg_in( 4 );
ps_exit_admin_f          <= ctrl_reg_in( 5 );
ps_ad_wr_demod_f         <= ctrl_reg_in( 6 );
ps_ad_rd_demod_f         <= ctrl_reg_in( 7 );
ps_ad_rd_demod_ack_f     <= ctrl_reg_in( 8 );

irq                      <= irq_i;


------------------------------
-- What's left of Admin mode
------------------------------
ad_admin_en     <= '1' when ( ex_state = EX_ADMIN ) else '0';
ad_demod_rd_rdy <= ad_demod_rd_rdy_a and ad_demod_rd_rdy_b;


-------------------------------
-- Observable handshake signals
-------------------------------
s_axis_data_tready <= s_axis_data_tready_i;
m_axis_data_tvalid <= m_axis_data_tvalid_i;


--==============  
-- Executive FSM
--==============
exec_fsm: process ( aclk, int_rqst_f, ps_start_f, ps_enter_admin_f, ps_exit_admin_f, ps_stop_f, ex_state, ex_nxtst )
begin
  if rising_edge( aclk ) then
    if ( resetn = '0' ) then
      ex_state   <= EX_IDLE;
    else 
      ex_state   <= ex_nxtst;
    end if;
  end if;

  ex_nxtst   <= ex_state;
         
  case ex_state is
    when EX_IDLE =>
      if ( ps_enter_admin_f = '1' ) then
        ex_nxtst <= EX_ADMIN;
      elsif ( ps_start_f = '1' ) then
        ex_nxtst <= EX_RUN;
      end if;  
        
    when EX_ADMIN =>
      if ( ps_exit_admin_f = '1' ) then
        ex_nxtst <= EX_IDLE;
      end if; 
        
    when EX_RUN => 
      if ps_stop_f = '1' then
        ex_nxtst <= EX_IDLE;
      end if;
        
    when others =>
      ex_nxtst   <= EX_IDLE;
  end case;

end process;

--===========================
-- Run-time Execution Section
--===========================

demod_addra   <=  demod_addra_i;
-- if demod_addrb is negated, saturate between max and min.
demod_addrb   <=  demod_addrb_i when ( not C_NEG_ADDR_B ) 
                  else std_logic_vector( -signed( demod_addrb_i ) ) when ( demod_addrb_i /= C_DEMOD_ADDR_MIN )
                  else C_DEMOD_ADDR_MAX;


--==================================
-- Miscellaneous 
--==================================
-- We turn off tready in idle and admin states
s_axis_data_tready_i <= m_axis_lut_tready when ( ex_state = EX_RUN ) else '0';

-- these are never used but need to be tied to zero
demod_dinb <= ( others=>'0' );
demod_web  <= '0';

--==================================
-- Demod mode selection 
--==================================
process ( 
  pf_data_I,
  pf_data_Q,
  pf_phase_I,
  pf_phase_Q,
  demod_doutb,
  demod_douta )
begin
  if C_DEMOD_MODE = C_DEMOD_MODE_DATA then
    pf_demod_addra <= pf_data_I;
    pf_demod_addrb <= pf_data_Q;
    pf_demod_dout  <= demod_doutb & demod_douta;
  else
    pf_demod_addra <= pf_phase_Q & pf_phase_I;
    pf_demod_addrb <= ( others=>'0' );
    pf_demod_dout  <= demod_douta;
  end if;
  
end process;


--=====================
-- Statistics Gathering
--=====================
-- how these counters work, even at 100 MHz, defeats me. 
-- But they are debug only.

rx_valid <= '1' when ( s_axis_data_tvalid   = '1' and s_axis_data_tready_i = '1' ) else '0';
tx_valid <= '1' when ( m_axis_data_tvalid_i = '1' and m_axis_data_tready   = '1' ) else '0';


stats_p: process( aclk )
begin
  if rising_edge( aclk ) then
    if ( resetn = '0' ) then
      int_rqst_f      <= '0';

      rx_data_ctr     <= ( others=> '0' );
      rx_symbol_ctr   <= ( others=> '0' );
      rx_frame_ctr    <= ( others=> '0' );
      rx_block_ctr    <= ( others=> '0' );    
                          
      rx_data_ctr_p   <= ( others=> '0' );
      rx_symbol_ctr_p <= ( others=> '0' );
      rx_frame_ctr_p  <= ( others=> '0' );
      rx_block_ctr_p  <= ( others=> '0' );    

      tx_data_ctr     <= ( others=> '0' );
      tx_symbol_ctr   <= ( others=> '0' );
      tx_frame_ctr    <= ( others=> '0' );
      tx_block_ctr    <= ( others=> '0' );    
                   
      tx_data_ctr_p   <= ( others=> '0' );
      tx_symbol_ctr_p <= ( others=> '0' );
      tx_frame_ctr_p  <= ( others=> '0' );
      tx_block_ctr_p  <= ( others=> '0' );    
    
    else 
      int_rqst_f <= '0';

      if rx_valid = '1' then
        rx_data_ctr_p        <= rx_data_ctr_p + 1;
        if rx_data_ctr < ps_n_wd_symb - 1 then  
          rx_data_ctr        <= rx_data_ctr + 1;
        else
          rx_data_ctr        <= ( others=> '0' );
          rx_symbol_ctr_p    <= rx_symbol_ctr_p + 1;
        end if;
        
        if rx_data_ctr = ps_n_wd_symb - 1 then
          if rx_symbol_ctr < ps_n_symbols_frame - 1 then 
            rx_symbol_ctr    <= rx_symbol_ctr + 1;
          else
            rx_symbol_ctr    <= ( others=> '0' );
            rx_frame_ctr_p   <= rx_frame_ctr_p + 1;
          end if;
        end if;
         
        if rx_symbol_ctr = ps_n_symbols_frame - 1 and rx_data_ctr = ps_n_wd_symb - 1 then
          if rx_frame_ctr < ps_n_frames_block - 1 then
            rx_frame_ctr   <= rx_frame_ctr + 1;
          else
            rx_frame_ctr   <= ( others=> '0' );
            rx_block_ctr_p <= rx_block_ctr_p + 1;
            rx_block_ctr   <= rx_block_ctr + 1;
          end if;
        end if;
      end if; -- rx_valid = '1'

      if tx_valid = '1' then
        tx_data_ctr_p      <= tx_data_ctr_p + 1;
        if tx_data_ctr < ps_n_wd_symb - 1 then  
          tx_data_ctr      <= tx_data_ctr + 1;
        else
          tx_data_ctr      <= ( others=> '0' );
          tx_symbol_ctr_p  <= tx_symbol_ctr_p + 1;
        end if;
        
        if tx_data_ctr = ps_n_wd_symb - 1 then
          if tx_symbol_ctr < ps_n_symbols_frame - 1 then 
            tx_symbol_ctr  <= tx_symbol_ctr + 1;
          else
            tx_symbol_ctr  <= ( others=> '0' );
            tx_frame_ctr_p <= tx_frame_ctr_p + 1;
          end if;
        end if;
         
        if tx_symbol_ctr = ps_n_symbols_frame - 1 and tx_data_ctr = ps_n_wd_symb - 1 then
          if tx_frame_ctr < ps_n_frames_block - 1 then
            tx_frame_ctr   <= tx_frame_ctr + 1;
          else
            tx_frame_ctr   <= ( others=> '0' );
            tx_block_ctr_p <= tx_block_ctr_p + 1;
            tx_block_ctr   <= tx_block_ctr + 1;
          end if;
        end if;
      end if; -- tx_valid = '1'
      
    end if;
  end if;
  
end process;

--================
-- Address monitor
--================
demod_ena       <= demod_ena_i;
demod_enb       <= demod_enb_i;

addrmon: process( aclk )
begin
  if rising_edge( aclk ) then
    if ( resetn = '0' ) or ( ps_start_f = '1' ) then
      slv_reg_28 <= ( others => '0' ); 
      slv_reg_29 <= ( others => '0' );
      slv_reg_30 <= ( others => '0' ); 
      slv_reg_31 <= ( others => '1' );
    else 
      if demod_ena_i = '1' then
        slv_reg_28 <= std_logic_vector( unsigned( slv_reg_28 ) + 1 );
        slv_reg_30( 11 downto  0 ) <=  slv_reg_30( 11 downto  0 ) or  demod_addra_i;
        slv_reg_31( 11 downto  0 ) <=  slv_reg_31( 11 downto  0 ) and demod_addra_i;
      end if;
      
      if demod_enb_i = '1' then 
        slv_reg_29 <= std_logic_vector( unsigned( slv_reg_29 ) + 1 );
        slv_reg_30( 27 downto 16 ) <=  slv_reg_30( 27 downto 16 ) or  demod_addrb_i;
        slv_reg_31( 27 downto 16 ) <=  slv_reg_31( 27 downto 16 ) and demod_addrb_i;
      end if;
      
    end if;
  end if;
end process;
   

end rtl;

  

