library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.emm_telsys.all;

entity %ip_name is
	generic (

		C_S00_AXI_DATA_WIDTH	: integer	:= 32;
		C_S00_AXI_ADDR_WIDTH	: integer	:= 9;

	    C_DEVICE_ID             : std_logic_vector(23 downto 0) := x"FAECE5"
	 );
	port (
      aclk                    : in  std_logic;
      aresetn                 : in  std_logic;


		-- Ports of Axi Slave Bus Interface S00_AXI
      s00_axi_awaddr          : in  std_logic_vector( C_S00_AXI_ADDR_WIDTH - 1 downto 0 );
      s00_axi_awprot          : in  std_logic_vector( 2 downto 0 );
      s00_axi_awvalid         : in  std_logic;
      s00_axi_awready         : out std_logic;
      s00_axi_wdata           : in  std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
      s00_axi_wstrb           : in  std_logic_vector(( C_S00_AXI_DATA_WIDTH/8 ) - 1 downto 0 );
      s00_axi_wvalid          : in  std_logic;
      s00_axi_wready          : out std_logic;
      s00_axi_bresp           : out std_logic_vector( 1 downto 0 );
      s00_axi_bvalid          : out std_logic;
      s00_axi_bready          : in  std_logic;
      s00_axi_araddr          : in  std_logic_vector( C_S00_AXI_ADDR_WIDTH - 1 downto 0 );
      s00_axi_arprot          : in  std_logic_vector( 2 downto 0 );
      s00_axi_arvalid         : in  std_logic;
      s00_axi_arready         : out std_logic;
      s00_axi_rdata           : out std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
      s00_axi_rresp           : out std_logic_vector( 1 downto 0 );
      s00_axi_rvalid          : out std_logic;
      s00_axi_rready          : in std_logic
);
end Training_Symbol_Injector_v1_0;

architecture rtl of Training_Symbol_Injector_v1_0 is

constant C_N_SLV_REG         : integer := 2 ** (C_S00_AXI_ADDR_WIDTH - 2);


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
    INTERNAL_IRQ_F  : in  std_logic;
    EXTERNAL_IRQ    : out std_logic;
    INT_ACK_F       : in  std_logic
  );
end component Interrupt_Controller;


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

signal ctrl_reg                 : std_logic_vector( slv_reg_0'range );
signal ctrl_reg_in              : std_logic_vector( slv_reg_0'range );
signal info_reg                 : std_logic_vector( slv_reg_0'range );
signal stat_reg                 : std_logic_vector( slv_reg_0'range );

signal resetp                   : std_logic;
signal resetn                   : std_logic;

signal int_rqst_f               : std_logic;
signal irq_i                    : std_logic;
signal ps_int_ack_f             : std_logic;

signal slv_reg_wr_f             : std_logic_vector( C_N_SLV_REG - 1 downto 0 );
signal slv_reg_rd_f             : std_logic_vector( C_N_SLV_REG - 1 downto 0 );

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
    SOFT_RESET      => '0',
    INTERNAL_IRQ_F  => int_rqst_f,
    EXTERNAL_IRQ    => irq_i,
    INT_ACK_F       => ps_int_ack_f
  );

info_reg                   <= C_DEVICE_ID & std_logic_vector( to_unsigned( C_N_SLV_REG, 8 ));

status_reg( 0   )          <= irq_i;
status_reg( 1   )          <= '0';
status_reg( 2   )          <= '0';
status_reg( 3   )          <= '0';
status_reg( 4   )          <= '0';
status_reg( 5   )          <= '0';
status_reg( 6   )          <= '0';
status_reg( 7   )          <= '0';
status_reg( 8   )          <= '0';
status_reg( 9   )          <= '0';
status_reg( 10  )          <= '0';
status_reg( 11  )          <= '0';
status_reg( 12  )          <= '0';
status_reg( 13  )          <= '0';
status_reg( 14  )          <= '0';
status_reg( 15  )          <= '0';
status_reg( 16  )          <= '0';
status_reg( 17  )          <= '0';
status_reg( 18  )          <= '0';
status_reg( 19  )          <= '0';
status_reg( 20  )          <= '0';
status_reg( 21  )          <= '0';
status_reg( 22  )          <= '0';
status_reg( 23  )          <= '0';
status_reg( 24  )          <= '0';
status_reg( 25  )          <= '0';
status_reg( 26  )          <= '0';
status_reg( 27  )          <= '0';
status_reg( 28  )          <= '0';
status_reg( 29  )          <= '0';
status_reg( 30  )          <= '0';
status_reg( 31  )          <= '0';

ctrl_reg                   <= slv_reg_0;
slv_reg_1                  <= info_reg;

slv_reg_16                 <= status_reg;
slv_reg_17                 <= zeros( slv_reg_0'length - 0 );
slv_reg_18                 <= zeros( slv_reg_0'length - 0 );
slv_reg_19                 <= zeros( slv_reg_0'length - 0 );
slv_reg_20                 <= zeros( slv_reg_0'length - 0 );
slv_reg_21                 <= zeros( slv_reg_0'length - 0 );
slv_reg_22                 <= zeros( slv_reg_0'length - 0 );
slv_reg_23                 <= zeros( slv_reg_0'length - 0 );
slv_reg_24                 <= zeros( slv_reg_0'length - 0 );
slv_reg_25                 <= zeros( slv_reg_0'length - 0 );
slv_reg_26                 <= zeros( slv_reg_0'length - 0 );
slv_reg_27                 <= zeros( slv_reg_0'length - 0 );
slv_reg_28                 <= zeros( slv_reg_0'length - 0 );
slv_reg_29                 <= zeros( slv_reg_0'length - 0 );
slv_reg_30                 <= zeros( slv_reg_0'length - 0 );
slv_reg_31                 <= zeros( slv_reg_0'length - 0 );
slv_reg_32                 <= zeros( slv_reg_0'length - 0 );
slv_reg_33                 <= zeros( slv_reg_0'length - 0 );
slv_reg_34                 <= zeros( slv_reg_0'length - 0 );
slv_reg_35                 <= zeros( slv_reg_0'length - 0 );
slv_reg_36                 <= zeros( slv_reg_0'length - 0 );
slv_reg_37                 <= zeros( slv_reg_0'length - 0 );
slv_reg_38                 <= zeros( slv_reg_0'length - 0 );
slv_reg_39                 <= zeros( slv_reg_0'length - 0 );
slv_reg_40                 <= zeros( slv_reg_0'length - 0 );
slv_reg_41                 <= zeros( slv_reg_0'length - 0 );
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


end rtl;
