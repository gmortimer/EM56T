library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity NULL_SYMBOL_DETECTOR_v1_0_S00_AXI is
	generic (
		-- Width of S_AXI data bus
      C_S_AXI_DATA_WIDTH  : integer   := 32;
		-- Width of S_AXI address bus
      C_S_AXI_ADDR_WIDTH  : integer   := 9
	);
	port (
		-- Added by author of script : read and write detection.
		-- Single cycle pulses triggered by read or write accesses to slave regs
        SLV_REG_WRITE_F : out std_logic_vector( 128 - 1 downto 0 );
        SLV_REG_READ_F  : out std_logic_vector( 128 - 1 downto 0 );

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
        SLV_REG_16      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_17      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_18      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_19      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_20      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_21      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_22      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_23      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_24      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_25      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_26      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_27      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_28      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_29      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_30      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_31      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
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
        SLV_REG_64      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_65      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_66      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_67      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_68      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_69      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_70      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_71      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_72      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_73      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_74      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_75      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_76      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_77      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_78      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_79      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_80      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_81      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_82      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_83      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_84      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_85      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_86      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_87      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_88      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_89      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_90      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_91      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_92      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_93      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_94      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_95      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_96      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_97      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_98      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_99      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_100     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_101     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_102     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_103     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_104     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_105     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_106     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_107     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_108     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_109     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_110     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_111     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_112     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_113     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_114     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_115     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_116     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_117     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_118     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_119     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_120     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_121     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_122     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_123     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_124     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_125     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_126     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
        SLV_REG_127     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );

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
end NULL_SYMBOL_DETECTOR_v1_0_S00_AXI;

architecture rtl of NULL_SYMBOL_DETECTOR_v1_0_S00_AXI is

signal slv_reg_wr_detect_f : std_logic_vector( 128 - 1 downto 0 );
signal slv_reg_rd_detect_f : std_logic_vector( 128 - 1 downto 0 );



-- AXI4LITE signals
signal axi_awaddr       : std_logic_vector( C_S_AXI_ADDR_WIDTH - 1 downto 0 );
signal axi_awready      : std_logic;
signal axi_wready       : std_logic;
signal axi_bresp        : std_logic_vector( 1 downto 0 );
signal axi_bvalid       : std_logic;
signal axi_araddr       : std_logic_vector( C_S_AXI_ADDR_WIDTH - 1 downto 0 );
signal axi_arready      : std_logic;
signal axi_rdata        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal axi_rresp        : std_logic_vector( 1 downto 0 );
signal axi_rvalid       : std_logic;

-- Example-specific design signals
-- local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
-- ADDR_LSB is used for addressing 32/64 bit registers/memories
-- ADDR_LSB = 2 for 32 bits (n downto 2)
-- ADDR_LSB = 3 for 64 bits (n downto 3)
    constant ADDR_LSB          : integer := ( C_S_AXI_DATA_WIDTH / 32 ) + 1;
   constant OPT_MEM_ADDR_BITS : integer := 6;
------------------------------------------
---- Signals for user logic register space
------------------------------------------
---- Number of Slave Registers 128
signal slv_reg0         : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg1         : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg2         : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg3         : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg4         : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg5         : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg6         : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg7         : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg8         : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg9         : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg10        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg11        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg12        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg13        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg14        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg15        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg16        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg17        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg18        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg19        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg20        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg21        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg22        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg23        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg24        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg25        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg26        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg27        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg28        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg29        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg30        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg31        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg32        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg33        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg34        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg35        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg36        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg37        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg38        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg39        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg40        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg41        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg42        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg43        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg44        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg45        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg46        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg47        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg48        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg49        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg50        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg51        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg52        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg53        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg54        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg55        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg56        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg57        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg58        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg59        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg60        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg61        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg62        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg63        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg64        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg65        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg66        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg67        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg68        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg69        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg70        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg71        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg72        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg73        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg74        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg75        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg76        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg77        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg78        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg79        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg80        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg81        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg82        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg83        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg84        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg85        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg86        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg87        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg88        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg89        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg90        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg91        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg92        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg93        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg94        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg95        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg96        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg97        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg98        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg99        : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg100       : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg101       : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg102       : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg103       : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg104       : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg105       : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg106       : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg107       : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg108       : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg109       : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg110       : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg111       : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg112       : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg113       : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg114       : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg115       : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg116       : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg117       : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg118       : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg119       : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg120       : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg121       : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg122       : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg123       : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg124       : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg125       : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg126       : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg127       : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_rden     : std_logic;
signal slv_reg_wren     : std_logic;
signal reg_data_out     : std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
signal byte_index       : integer;

signal slv_reg_rden_o   : std_logic;
signal slv_reg_wren_o   : std_logic;


begin
	-- I/O Connections assignments

    S_AXI_AWREADY   <= axi_awready;
    S_AXI_WREADY    <= axi_wready;
    S_AXI_BRESP     <= axi_bresp;
    S_AXI_BVALID    <= axi_bvalid;
    S_AXI_ARREADY   <= axi_arready;
    S_AXI_RDATA     <= axi_rdata;
    S_AXI_RRESP     <= axi_rresp;
    S_AXI_RVALID    <= axi_rvalid;
    -- Implement axi_awready generation
    -- axi_awready is asserted for one S_AXI_ACLK clock cycle when both
    -- S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
    -- de-asserted when reset is low.

    process (S_AXI_ACLK)
    begin
      if rising_edge(S_AXI_ACLK) then
        if S_AXI_ARESETN = '0' then
          axi_awready <= '0';
        else
          if (axi_awready = '0' and S_AXI_AWVALID = '1' and S_AXI_WVALID = '1') then
            -- slave is ready to accept write address when
            -- there is a valid write address and write data
            -- on the write address and data bus. This design
            -- expects no outstanding transactions.
            axi_awready <= '1';
          else
            axi_awready <= '0';
          end if;
        end if;
      end if;
    end process;

    -- Implement axi_awaddr latching
    -- This process is used to latch the address when both
    -- S_AXI_AWVALID and S_AXI_WVALID are valid.

    process (S_AXI_ACLK)
    begin
      if rising_edge(S_AXI_ACLK) then
        if S_AXI_ARESETN = '0' then
          axi_awaddr <= (others => '0');
        else
          if (axi_awready = '0' and S_AXI_AWVALID = '1' and S_AXI_WVALID = '1') then
            -- Write Address latching
            axi_awaddr <= S_AXI_AWADDR;
          end if;
        end if;
      end if;
    end process;

    -- Implement axi_wready generation
    -- axi_wready is asserted for one S_AXI_ACLK clock cycle when both
    -- S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is
    -- de-asserted when reset is low.

    process (S_AXI_ACLK)
    begin
      if rising_edge(S_AXI_ACLK) then
        if S_AXI_ARESETN = '0' then
          axi_wready <= '0';
        else
          if (axi_wready = '0' and S_AXI_WVALID = '1' and S_AXI_AWVALID = '1') then
              -- slave is ready to accept write data when
              -- there is a valid write address and write data
              -- on the write address and data bus. This design
              -- expects no outstanding transactions.
              axi_wready <= '1';
          else
            axi_wready <= '0';
          end if;
        end if;
      end if;
    end process;

    -- Implement memory mapped register select and write logic generation
    -- The write data is accepted and written to memory mapped registers when
    -- axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
    -- select byte enables of slave registers while writing.
    -- These registers are cleared when reset (active low) is applied.
    -- Slave register write enable is asserted when valid address and data are available
    -- and the slave is ready to accept the write address and write data.
    slv_reg_wren <= axi_wready and S_AXI_WVALID and axi_awready and S_AXI_AWVALID ;

    process (S_AXI_ACLK)
    variable loc_addr :std_logic_vector(OPT_MEM_ADDR_BITS downto 0);
    begin
      if rising_edge(S_AXI_ACLK) then
        if S_AXI_ARESETN = '0' then
          slv_reg0   <= (others => '0');
          slv_reg2   <= (others => '0');
          slv_reg3   <= (others => '0');
          slv_reg4   <= (others => '0');
          slv_reg5   <= (others => '0');
          slv_reg6   <= (others => '0');
          slv_reg7   <= (others => '0');
          slv_reg8   <= (others => '0');
          slv_reg9   <= (others => '0');
          slv_reg10  <= (others => '0');
          slv_reg11  <= (others => '0');
          slv_reg12  <= (others => '0');
          slv_reg13  <= (others => '0');
          slv_reg14  <= (others => '0');
          slv_reg15  <= (others => '0');
          slv_reg16  <= (others => '0');
          slv_reg17  <= (others => '0');
          slv_reg18  <= (others => '0');
          slv_reg19  <= (others => '0');
          slv_reg20  <= (others => '0');
          slv_reg21  <= (others => '0');
          slv_reg22  <= (others => '0');
          slv_reg23  <= (others => '0');
          slv_reg24  <= (others => '0');
          slv_reg25  <= (others => '0');
          slv_reg26  <= (others => '0');
          slv_reg27  <= (others => '0');
          slv_reg28  <= (others => '0');
          slv_reg29  <= (others => '0');
          slv_reg30  <= (others => '0');
          slv_reg31  <= (others => '0');
        else
          loc_addr := axi_awaddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
          if (slv_reg_wren = '1') then
            case loc_addr is
              when b"0000000" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 0
                    slv_reg0( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"0000010" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 2
                    slv_reg2( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"0000011" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 3
                    slv_reg3( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"0000100" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 4
                    slv_reg4( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"0000101" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 5
                    slv_reg5( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"0000110" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 6
                    slv_reg6( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"0000111" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 7
                    slv_reg7( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"0001000" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 8
                    slv_reg8( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"0001001" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 9
                    slv_reg9( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"0001010" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 10
                    slv_reg10( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"0001011" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 11
                    slv_reg11( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"0001100" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 12
                    slv_reg12( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"0001101" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 13
                    slv_reg13( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"0001110" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 14
                    slv_reg14( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"0001111" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 15
                    slv_reg15( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"0010000" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 16
                    slv_reg16( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"0010001" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 17
                    slv_reg17( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"0010010" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 18
                    slv_reg18( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"0010011" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 19
                    slv_reg19( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"0010100" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 20
                    slv_reg20( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"0010101" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 21
                    slv_reg21( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"0010110" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 22
                    slv_reg22( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"0010111" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 23
                    slv_reg23( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"0011000" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 24
                    slv_reg24( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"0011001" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 25
                    slv_reg25( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"0011010" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 26
                    slv_reg26( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"0011011" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 27
                    slv_reg27( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"0011100" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 28
                    slv_reg28( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"0011101" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 29
                    slv_reg29( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"0011110" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 30
                    slv_reg30( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"0011111" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 31
                    slv_reg31( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
	          when others =>
                slv_reg0   <= slv_reg0;
                slv_reg2   <= slv_reg2;
                slv_reg3   <= slv_reg3;
                slv_reg4   <= slv_reg4;
                slv_reg5   <= slv_reg5;
                slv_reg6   <= slv_reg6;
                slv_reg7   <= slv_reg7;
                slv_reg8   <= slv_reg8;
                slv_reg9   <= slv_reg9;
                slv_reg10  <= slv_reg10;
                slv_reg11  <= slv_reg11;
                slv_reg12  <= slv_reg12;
                slv_reg13  <= slv_reg13;
                slv_reg14  <= slv_reg14;
                slv_reg15  <= slv_reg15;
                slv_reg16  <= slv_reg16;
                slv_reg17  <= slv_reg17;
                slv_reg18  <= slv_reg18;
                slv_reg19  <= slv_reg19;
                slv_reg20  <= slv_reg20;
                slv_reg21  <= slv_reg21;
                slv_reg22  <= slv_reg22;
                slv_reg23  <= slv_reg23;
                slv_reg24  <= slv_reg24;
                slv_reg25  <= slv_reg25;
                slv_reg26  <= slv_reg26;
                slv_reg27  <= slv_reg27;
                slv_reg28  <= slv_reg28;
                slv_reg29  <= slv_reg29;
                slv_reg30  <= slv_reg30;
                slv_reg31  <= slv_reg31;
            end case;
          end if;
        end if;
      end if;
    end process;

    -- Implement write response logic generation
    -- The write response and response valid signals are asserted by the slave
    -- when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.
    -- This marks the acceptance of address and indicates the status of
    -- write transaction.

    process (S_AXI_ACLK)
    begin
      if rising_edge(S_AXI_ACLK) then
        if S_AXI_ARESETN = '0' then
          axi_bvalid  <= '0';
          axi_bresp   <= "00"; --need to work more on the responses
        else
          if (axi_awready = '1' and S_AXI_AWVALID = '1' and axi_wready = '1' and S_AXI_WVALID = '1' and axi_bvalid = '0'  ) then
            axi_bvalid <= '1';
            axi_bresp  <= "00";
          elsif (S_AXI_BREADY = '1' and axi_bvalid = '1') then   --check if bready is asserted while bvalid is high)
            axi_bvalid <= '0';                                 -- (there is a possibility that bready is always asserted high)
          end if;
        end if;
      end if;
    end process;

    -- Implement axi_arready generation
    -- axi_arready is asserted for one S_AXI_ACLK clock cycle when
    -- S_AXI_ARVALID is asserted. axi_awready is
    -- de-asserted when reset (active low) is asserted.
    -- The read address is also latched when S_AXI_ARVALID is
    -- asserted. axi_araddr is reset to zero on reset assertion.

    process (S_AXI_ACLK)
    begin
      if rising_edge(S_AXI_ACLK) then
        if S_AXI_ARESETN = '0' then
          axi_arready <= '0';
          axi_araddr  <= (others => '1');
        else
          if (axi_arready = '0' and S_AXI_ARVALID = '1') then
            -- indicates that the slave has acceped the valid read address
            axi_arready <= '1';
            -- Read Address latching
            axi_araddr  <= S_AXI_ARADDR;
          else
            axi_arready <= '0';
          end if;
        end if;
      end if;
    end process;

    -- Implement axi_arvalid generation
    -- axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both
    -- S_AXI_ARVALID and axi_arready are asserted. The slave registers
    -- data are available on the axi_rdata bus at this instance. The
    -- assertion of axi_rvalid marks the validity of read data on the
    -- bus and axi_rresp indicates the status of read transaction.axi_rvalid
    -- is deasserted on reset (active low). axi_rresp and axi_rdata are
    -- cleared to zero on reset (active low).
    process (S_AXI_ACLK)
    begin
      if rising_edge(S_AXI_ACLK) then
        if S_AXI_ARESETN = '0' then
          axi_rvalid <= '0';
          axi_rresp  <= "00";
        else
          if (axi_arready = '1' and S_AXI_ARVALID = '1' and axi_rvalid = '0') then
            -- Valid read data is available at the read data bus
            axi_rvalid <= '1';
            axi_rresp  <= "00"; -- 'OKAY' response
          elsif (axi_rvalid = '1' and S_AXI_RREADY = '1') then
            -- Read data is accepted by the master
            axi_rvalid <= '0';
          end if;
        end if;
      end if;
    end process;

    -- Implement memory mapped register select and read logic generation
    -- Slave register read enable is asserted when valid address is available
    -- and the slave is ready to accept the read address.
    slv_reg_rden <= axi_arready and S_AXI_ARVALID and ( not axi_rvalid );

    process (
      slv_reg0,
      slv_reg1,
      slv_reg2,
      slv_reg3,
      slv_reg4,
      slv_reg5,
      slv_reg6,
      slv_reg7,
      slv_reg8,
      slv_reg9,
      slv_reg10,
      slv_reg11,
      slv_reg12,
      slv_reg13,
      slv_reg14,
      slv_reg15,
      slv_reg16,
      slv_reg17,
      slv_reg18,
      slv_reg19,
      slv_reg20,
      slv_reg21,
      slv_reg22,
      slv_reg23,
      slv_reg24,
      slv_reg25,
      slv_reg26,
      slv_reg27,
      slv_reg28,
      slv_reg29,
      slv_reg30,
      slv_reg31,
      slv_reg32,
      slv_reg33,
      slv_reg34,
      slv_reg35,
      slv_reg36,
      slv_reg37,
      slv_reg38,
      slv_reg39,
      slv_reg40,
      slv_reg41,
      slv_reg42,
      slv_reg43,
      slv_reg44,
      slv_reg45,
      slv_reg46,
      slv_reg47,
      slv_reg48,
      slv_reg49,
      slv_reg50,
      slv_reg51,
      slv_reg52,
      slv_reg53,
      slv_reg54,
      slv_reg55,
      slv_reg56,
      slv_reg57,
      slv_reg58,
      slv_reg59,
      slv_reg60,
      slv_reg61,
      slv_reg62,
      slv_reg63,
      slv_reg64,
      slv_reg65,
      slv_reg66,
      slv_reg67,
      slv_reg68,
      slv_reg69,
      slv_reg70,
      slv_reg71,
      slv_reg72,
      slv_reg73,
      slv_reg74,
      slv_reg75,
      slv_reg76,
      slv_reg77,
      slv_reg78,
      slv_reg79,
      slv_reg80,
      slv_reg81,
      slv_reg82,
      slv_reg83,
      slv_reg84,
      slv_reg85,
      slv_reg86,
      slv_reg87,
      slv_reg88,
      slv_reg89,
      slv_reg90,
      slv_reg91,
      slv_reg92,
      slv_reg93,
      slv_reg94,
      slv_reg95,
      slv_reg96,
      slv_reg97,
      slv_reg98,
      slv_reg99,
      slv_reg100,
      slv_reg101,
      slv_reg102,
      slv_reg103,
      slv_reg104,
      slv_reg105,
      slv_reg106,
      slv_reg107,
      slv_reg108,
      slv_reg109,
      slv_reg110,
      slv_reg111,
      slv_reg112,
      slv_reg113,
      slv_reg114,
      slv_reg115,
      slv_reg116,
      slv_reg117,
      slv_reg118,
      slv_reg119,
      slv_reg120,
      slv_reg121,
      slv_reg122,
      slv_reg123,
      slv_reg124,
      slv_reg125,
      slv_reg126,
      slv_reg127,
      axi_araddr, S_AXI_ARESETN, slv_reg_rden )
    variable loc_addr : std_logic_vector( OPT_MEM_ADDR_BITS downto 0 );
    begin
        -- Address decoding for reading registers
        loc_addr := axi_araddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
        case loc_addr is
          when b"0000000" =>
            reg_data_out <= slv_reg0;
          when b"0000001" =>
            reg_data_out <= slv_reg1;
          when b"0000010" =>
            reg_data_out <= slv_reg2;
          when b"0000011" =>
            reg_data_out <= slv_reg3;
          when b"0000100" =>
            reg_data_out <= slv_reg4;
          when b"0000101" =>
            reg_data_out <= slv_reg5;
          when b"0000110" =>
            reg_data_out <= slv_reg6;
          when b"0000111" =>
            reg_data_out <= slv_reg7;
          when b"0001000" =>
            reg_data_out <= slv_reg8;
          when b"0001001" =>
            reg_data_out <= slv_reg9;
          when b"0001010" =>
            reg_data_out <= slv_reg10;
          when b"0001011" =>
            reg_data_out <= slv_reg11;
          when b"0001100" =>
            reg_data_out <= slv_reg12;
          when b"0001101" =>
            reg_data_out <= slv_reg13;
          when b"0001110" =>
            reg_data_out <= slv_reg14;
          when b"0001111" =>
            reg_data_out <= slv_reg15;
          when b"0010000" =>
            reg_data_out <= slv_reg16;
          when b"0010001" =>
            reg_data_out <= slv_reg17;
          when b"0010010" =>
            reg_data_out <= slv_reg18;
          when b"0010011" =>
            reg_data_out <= slv_reg19;
          when b"0010100" =>
            reg_data_out <= slv_reg20;
          when b"0010101" =>
            reg_data_out <= slv_reg21;
          when b"0010110" =>
            reg_data_out <= slv_reg22;
          when b"0010111" =>
            reg_data_out <= slv_reg23;
          when b"0011000" =>
            reg_data_out <= slv_reg24;
          when b"0011001" =>
            reg_data_out <= slv_reg25;
          when b"0011010" =>
            reg_data_out <= slv_reg26;
          when b"0011011" =>
            reg_data_out <= slv_reg27;
          when b"0011100" =>
            reg_data_out <= slv_reg28;
          when b"0011101" =>
            reg_data_out <= slv_reg29;
          when b"0011110" =>
            reg_data_out <= slv_reg30;
          when b"0011111" =>
            reg_data_out <= slv_reg31;
          when b"0100000" =>
            reg_data_out <= slv_reg32;
          when b"0100001" =>
            reg_data_out <= slv_reg33;
          when b"0100010" =>
            reg_data_out <= slv_reg34;
          when b"0100011" =>
            reg_data_out <= slv_reg35;
          when b"0100100" =>
            reg_data_out <= slv_reg36;
          when b"0100101" =>
            reg_data_out <= slv_reg37;
          when b"0100110" =>
            reg_data_out <= slv_reg38;
          when b"0100111" =>
            reg_data_out <= slv_reg39;
          when b"0101000" =>
            reg_data_out <= slv_reg40;
          when b"0101001" =>
            reg_data_out <= slv_reg41;
          when b"0101010" =>
            reg_data_out <= slv_reg42;
          when b"0101011" =>
            reg_data_out <= slv_reg43;
          when b"0101100" =>
            reg_data_out <= slv_reg44;
          when b"0101101" =>
            reg_data_out <= slv_reg45;
          when b"0101110" =>
            reg_data_out <= slv_reg46;
          when b"0101111" =>
            reg_data_out <= slv_reg47;
          when b"0110000" =>
            reg_data_out <= slv_reg48;
          when b"0110001" =>
            reg_data_out <= slv_reg49;
          when b"0110010" =>
            reg_data_out <= slv_reg50;
          when b"0110011" =>
            reg_data_out <= slv_reg51;
          when b"0110100" =>
            reg_data_out <= slv_reg52;
          when b"0110101" =>
            reg_data_out <= slv_reg53;
          when b"0110110" =>
            reg_data_out <= slv_reg54;
          when b"0110111" =>
            reg_data_out <= slv_reg55;
          when b"0111000" =>
            reg_data_out <= slv_reg56;
          when b"0111001" =>
            reg_data_out <= slv_reg57;
          when b"0111010" =>
            reg_data_out <= slv_reg58;
          when b"0111011" =>
            reg_data_out <= slv_reg59;
          when b"0111100" =>
            reg_data_out <= slv_reg60;
          when b"0111101" =>
            reg_data_out <= slv_reg61;
          when b"0111110" =>
            reg_data_out <= slv_reg62;
          when b"0111111" =>
            reg_data_out <= slv_reg63;
          when b"1000000" =>
            reg_data_out <= slv_reg64;
          when b"1000001" =>
            reg_data_out <= slv_reg65;
          when b"1000010" =>
            reg_data_out <= slv_reg66;
          when b"1000011" =>
            reg_data_out <= slv_reg67;
          when b"1000100" =>
            reg_data_out <= slv_reg68;
          when b"1000101" =>
            reg_data_out <= slv_reg69;
          when b"1000110" =>
            reg_data_out <= slv_reg70;
          when b"1000111" =>
            reg_data_out <= slv_reg71;
          when b"1001000" =>
            reg_data_out <= slv_reg72;
          when b"1001001" =>
            reg_data_out <= slv_reg73;
          when b"1001010" =>
            reg_data_out <= slv_reg74;
          when b"1001011" =>
            reg_data_out <= slv_reg75;
          when b"1001100" =>
            reg_data_out <= slv_reg76;
          when b"1001101" =>
            reg_data_out <= slv_reg77;
          when b"1001110" =>
            reg_data_out <= slv_reg78;
          when b"1001111" =>
            reg_data_out <= slv_reg79;
          when b"1010000" =>
            reg_data_out <= slv_reg80;
          when b"1010001" =>
            reg_data_out <= slv_reg81;
          when b"1010010" =>
            reg_data_out <= slv_reg82;
          when b"1010011" =>
            reg_data_out <= slv_reg83;
          when b"1010100" =>
            reg_data_out <= slv_reg84;
          when b"1010101" =>
            reg_data_out <= slv_reg85;
          when b"1010110" =>
            reg_data_out <= slv_reg86;
          when b"1010111" =>
            reg_data_out <= slv_reg87;
          when b"1011000" =>
            reg_data_out <= slv_reg88;
          when b"1011001" =>
            reg_data_out <= slv_reg89;
          when b"1011010" =>
            reg_data_out <= slv_reg90;
          when b"1011011" =>
            reg_data_out <= slv_reg91;
          when b"1011100" =>
            reg_data_out <= slv_reg92;
          when b"1011101" =>
            reg_data_out <= slv_reg93;
          when b"1011110" =>
            reg_data_out <= slv_reg94;
          when b"1011111" =>
            reg_data_out <= slv_reg95;
          when b"1100000" =>
            reg_data_out <= slv_reg96;
          when b"1100001" =>
            reg_data_out <= slv_reg97;
          when b"1100010" =>
            reg_data_out <= slv_reg98;
          when b"1100011" =>
            reg_data_out <= slv_reg99;
          when b"1100100" =>
            reg_data_out <= slv_reg100;
          when b"1100101" =>
            reg_data_out <= slv_reg101;
          when b"1100110" =>
            reg_data_out <= slv_reg102;
          when b"1100111" =>
            reg_data_out <= slv_reg103;
          when b"1101000" =>
            reg_data_out <= slv_reg104;
          when b"1101001" =>
            reg_data_out <= slv_reg105;
          when b"1101010" =>
            reg_data_out <= slv_reg106;
          when b"1101011" =>
            reg_data_out <= slv_reg107;
          when b"1101100" =>
            reg_data_out <= slv_reg108;
          when b"1101101" =>
            reg_data_out <= slv_reg109;
          when b"1101110" =>
            reg_data_out <= slv_reg110;
          when b"1101111" =>
            reg_data_out <= slv_reg111;
          when b"1110000" =>
            reg_data_out <= slv_reg112;
          when b"1110001" =>
            reg_data_out <= slv_reg113;
          when b"1110010" =>
            reg_data_out <= slv_reg114;
          when b"1110011" =>
            reg_data_out <= slv_reg115;
          when b"1110100" =>
            reg_data_out <= slv_reg116;
          when b"1110101" =>
            reg_data_out <= slv_reg117;
          when b"1110110" =>
            reg_data_out <= slv_reg118;
          when b"1110111" =>
            reg_data_out <= slv_reg119;
          when b"1111000" =>
            reg_data_out <= slv_reg120;
          when b"1111001" =>
            reg_data_out <= slv_reg121;
          when b"1111010" =>
            reg_data_out <= slv_reg122;
          when b"1111011" =>
            reg_data_out <= slv_reg123;
          when b"1111100" =>
            reg_data_out <= slv_reg124;
          when b"1111101" =>
            reg_data_out <= slv_reg125;
          when b"1111110" =>
            reg_data_out <= slv_reg126;
          when b"1111111" =>
            reg_data_out <= slv_reg127;
          when others =>
            reg_data_out  <= (others => '0');
        end case;
    end process;

    -- Output register or memory read data
    process( S_AXI_ACLK ) is
    begin
      if (rising_edge (S_AXI_ACLK)) then
        if ( S_AXI_ARESETN = '0' ) then
          axi_rdata  <= (others => '0');
        else
          if (slv_reg_rden = '1') then
            -- When there is a valid read address (S_AXI_ARVALID) with
            -- acceptance of read address by the slave (axi_arready),
            -- output the read dada
            -- Read address mux
              axi_rdata <= reg_data_out;     -- register read data
          end if;
        end if;
      end if;
    end process;


    --------------- BEWARE ------------------
    ----- User Logic By Author of Script ----
    -- Slave register read/write detection --
    -----------------------------------------
wr_det: process (S_AXI_ACLK)
      variable wr_idx : integer range 0 to (2 ** OPT_MEM_ADDR_BITS + 1) - 1;
    begin
      if rising_edge(S_AXI_ACLK) then
        if S_AXI_ARESETN = '0' then
          slv_reg_wren_o      <= '0';
          slv_reg_wr_detect_f <= ( others => '0' );
        else
          slv_reg_wren_o      <= slv_reg_wren;
          slv_reg_wr_detect_f <= ( others => '0' );
          wr_idx              := to_integer( unsigned( axi_awaddr( ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB )));
          if ( slv_reg_wren = '1' ) and ( slv_reg_wren_o = '0' ) then
            slv_reg_wr_detect_f( wr_idx ) <= '1';
          end if;
        end if;
      end if;
    end process;

rd_det:   process( S_AXI_ACLK ) is
      variable rd_idx : integer range 0 to ( 2 ** OPT_MEM_ADDR_BITS + 1 ) - 1;
    begin
      if ( rising_edge ( S_AXI_ACLK )) then
        if ( S_AXI_ARESETN = '0' ) then
          slv_reg_rden_o       <= '0';
          slv_reg_rd_detect_f  <= ( others => '0' );
        else
          slv_reg_rden_o       <= slv_reg_rden;
          slv_reg_rd_detect_f  <= ( others => '0' );
          rd_idx               := to_integer( unsigned( axi_araddr( ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB )));
          if ( slv_reg_rden = '1' ) and ( slv_reg_rden_o = '0' ) then
            slv_reg_rd_detect_f( rd_idx ) <= '1';
          end if;
        end if;
      end if;
    end process;


    -- Read/Write Detect Flags --
    SLV_REG_WRITE_F <= slv_reg_wr_detect_f;
    SLV_REG_READ_F  <= slv_reg_rd_detect_f;

    -- Dedicated Slave Registers --
    SLV_REG_0    <= slv_reg0;   -- CTRL REG
    slv_reg1     <= SLV_REG_1;  -- INFO REG

    -- Input Slave Registers --
    SLV_REG_2    <= slv_reg2;
    SLV_REG_3    <= slv_reg3;
    SLV_REG_4    <= slv_reg4;
    SLV_REG_5    <= slv_reg5;
    SLV_REG_6    <= slv_reg6;
    SLV_REG_7    <= slv_reg7;
    SLV_REG_8    <= slv_reg8;
    SLV_REG_9    <= slv_reg9;
    SLV_REG_10   <= slv_reg10;
    SLV_REG_11   <= slv_reg11;
    SLV_REG_12   <= slv_reg12;
    SLV_REG_13   <= slv_reg13;
    SLV_REG_14   <= slv_reg14;
    SLV_REG_15   <= slv_reg15;
    SLV_REG_16   <= slv_reg16;
    SLV_REG_17   <= slv_reg17;
    SLV_REG_18   <= slv_reg18;
    SLV_REG_19   <= slv_reg19;
    SLV_REG_20   <= slv_reg20;
    SLV_REG_21   <= slv_reg21;
    SLV_REG_22   <= slv_reg22;
    SLV_REG_23   <= slv_reg23;
    SLV_REG_24   <= slv_reg24;
    SLV_REG_25   <= slv_reg25;
    SLV_REG_26   <= slv_reg26;
    SLV_REG_27   <= slv_reg27;
    SLV_REG_28   <= slv_reg28;
    SLV_REG_29   <= slv_reg29;
    SLV_REG_30   <= slv_reg30;
    SLV_REG_31   <= slv_reg31;

    -- Output Slave Registers --
    slv_reg32    <= SLV_REG_32;
    slv_reg33    <= SLV_REG_33;
    slv_reg34    <= SLV_REG_34;
    slv_reg35    <= SLV_REG_35;
    slv_reg36    <= SLV_REG_36;
    slv_reg37    <= SLV_REG_37;
    slv_reg38    <= SLV_REG_38;
    slv_reg39    <= SLV_REG_39;
    slv_reg40    <= SLV_REG_40;
    slv_reg41    <= SLV_REG_41;
    slv_reg42    <= SLV_REG_42;
    slv_reg43    <= SLV_REG_43;
    slv_reg44    <= SLV_REG_44;
    slv_reg45    <= SLV_REG_45;
    slv_reg46    <= SLV_REG_46;
    slv_reg47    <= SLV_REG_47;
    slv_reg48    <= SLV_REG_48;
    slv_reg49    <= SLV_REG_49;
    slv_reg50    <= SLV_REG_50;
    slv_reg51    <= SLV_REG_51;
    slv_reg52    <= SLV_REG_52;
    slv_reg53    <= SLV_REG_53;
    slv_reg54    <= SLV_REG_54;
    slv_reg55    <= SLV_REG_55;
    slv_reg56    <= SLV_REG_56;
    slv_reg57    <= SLV_REG_57;
    slv_reg58    <= SLV_REG_58;
    slv_reg59    <= SLV_REG_59;
    slv_reg60    <= SLV_REG_60;
    slv_reg61    <= SLV_REG_61;
    slv_reg62    <= SLV_REG_62;
    slv_reg63    <= SLV_REG_63;
    slv_reg64    <= SLV_REG_64;
    slv_reg65    <= SLV_REG_65;
    slv_reg66    <= SLV_REG_66;
    slv_reg67    <= SLV_REG_67;
    slv_reg68    <= SLV_REG_68;
    slv_reg69    <= SLV_REG_69;
    slv_reg70    <= SLV_REG_70;
    slv_reg71    <= SLV_REG_71;
    slv_reg72    <= SLV_REG_72;
    slv_reg73    <= SLV_REG_73;
    slv_reg74    <= SLV_REG_74;
    slv_reg75    <= SLV_REG_75;
    slv_reg76    <= SLV_REG_76;
    slv_reg77    <= SLV_REG_77;
    slv_reg78    <= SLV_REG_78;
    slv_reg79    <= SLV_REG_79;
    slv_reg80    <= SLV_REG_80;
    slv_reg81    <= SLV_REG_81;
    slv_reg82    <= SLV_REG_82;
    slv_reg83    <= SLV_REG_83;
    slv_reg84    <= SLV_REG_84;
    slv_reg85    <= SLV_REG_85;
    slv_reg86    <= SLV_REG_86;
    slv_reg87    <= SLV_REG_87;
    slv_reg88    <= SLV_REG_88;
    slv_reg89    <= SLV_REG_89;
    slv_reg90    <= SLV_REG_90;
    slv_reg91    <= SLV_REG_91;
    slv_reg92    <= SLV_REG_92;
    slv_reg93    <= SLV_REG_93;
    slv_reg94    <= SLV_REG_94;
    slv_reg95    <= SLV_REG_95;
    slv_reg96    <= SLV_REG_96;
    slv_reg97    <= SLV_REG_97;
    slv_reg98    <= SLV_REG_98;
    slv_reg99    <= SLV_REG_99;
    slv_reg100   <= SLV_REG_100;
    slv_reg101   <= SLV_REG_101;
    slv_reg102   <= SLV_REG_102;
    slv_reg103   <= SLV_REG_103;
    slv_reg104   <= SLV_REG_104;
    slv_reg105   <= SLV_REG_105;
    slv_reg106   <= SLV_REG_106;
    slv_reg107   <= SLV_REG_107;
    slv_reg108   <= SLV_REG_108;
    slv_reg109   <= SLV_REG_109;
    slv_reg110   <= SLV_REG_110;
    slv_reg111   <= SLV_REG_111;
    slv_reg112   <= SLV_REG_112;
    slv_reg113   <= SLV_REG_113;
    slv_reg114   <= SLV_REG_114;
    slv_reg115   <= SLV_REG_115;
    slv_reg116   <= SLV_REG_116;
    slv_reg117   <= SLV_REG_117;
    slv_reg118   <= SLV_REG_118;
    slv_reg119   <= SLV_REG_119;
    slv_reg120   <= SLV_REG_120;
    slv_reg121   <= SLV_REG_121;
    slv_reg122   <= SLV_REG_122;
    slv_reg123   <= SLV_REG_123;
    slv_reg124   <= SLV_REG_124;
    slv_reg125   <= SLV_REG_125;
    slv_reg126   <= SLV_REG_126;
    slv_reg127   <= SLV_REG_127;


end rtl;
