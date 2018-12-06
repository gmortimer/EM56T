library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Training_Symbol_Injector_v1_0_S00_AXI is
	generic (
		-- Width of S_AXI data bus
      C_S_AXI_DATA_WIDTH  : integer   := 32;
		-- Width of S_AXI address bus
      C_S_AXI_ADDR_WIDTH  : integer   := 8
	);
	port (
		-- Added by author of script : read and write detection.
		-- Single cycle pulses triggered by read or write accesses to slave regs
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
end Training_Symbol_Injector_v1_0_S00_AXI;

architecture rtl of Training_Symbol_Injector_v1_0_S00_AXI is

signal slv_reg_wr_detect_f : std_logic_vector( 64 - 1 downto 0 );
signal slv_reg_rd_detect_f : std_logic_vector( 64 - 1 downto 0 );



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
   constant OPT_MEM_ADDR_BITS : integer := 5;
------------------------------------------
---- Signals for user logic register space
------------------------------------------
---- Number of Slave Registers 64
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
        else
          loc_addr := axi_awaddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
          if (slv_reg_wren = '1') then
            case loc_addr is
              when b"000000" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 0
                    slv_reg0( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"000010" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 2
                    slv_reg2( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"000011" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 3
                    slv_reg3( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"000100" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 4
                    slv_reg4( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"000101" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 5
                    slv_reg5( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"000110" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 6
                    slv_reg6( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"000111" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 7
                    slv_reg7( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"001000" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 8
                    slv_reg8( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"001001" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 9
                    slv_reg9( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"001010" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 10
                    slv_reg10( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"001011" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 11
                    slv_reg11( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"001100" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 12
                    slv_reg12( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"001101" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 13
                    slv_reg13( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"001110" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 14
                    slv_reg14( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
                  end if;
                end loop;
              when b"001111" =>
                for byte_index in 0 to ( C_S_AXI_DATA_WIDTH / 8 - 1 ) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes
                    -- slave register 15
                    slv_reg15( byte_index * 8 + 7 downto byte_index * 8 ) <= S_AXI_WDATA( byte_index * 8 + 7 downto byte_index * 8 );
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
      axi_araddr, S_AXI_ARESETN, slv_reg_rden )
    variable loc_addr : std_logic_vector( OPT_MEM_ADDR_BITS downto 0 );
    begin
        -- Address decoding for reading registers
        loc_addr := axi_araddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
        case loc_addr is
          when b"000000" =>
            reg_data_out <= slv_reg0;
          when b"000001" =>
            reg_data_out <= slv_reg1;
          when b"000010" =>
            reg_data_out <= slv_reg2;
          when b"000011" =>
            reg_data_out <= slv_reg3;
          when b"000100" =>
            reg_data_out <= slv_reg4;
          when b"000101" =>
            reg_data_out <= slv_reg5;
          when b"000110" =>
            reg_data_out <= slv_reg6;
          when b"000111" =>
            reg_data_out <= slv_reg7;
          when b"001000" =>
            reg_data_out <= slv_reg8;
          when b"001001" =>
            reg_data_out <= slv_reg9;
          when b"001010" =>
            reg_data_out <= slv_reg10;
          when b"001011" =>
            reg_data_out <= slv_reg11;
          when b"001100" =>
            reg_data_out <= slv_reg12;
          when b"001101" =>
            reg_data_out <= slv_reg13;
          when b"001110" =>
            reg_data_out <= slv_reg14;
          when b"001111" =>
            reg_data_out <= slv_reg15;
          when b"010000" =>
            reg_data_out <= slv_reg16;
          when b"010001" =>
            reg_data_out <= slv_reg17;
          when b"010010" =>
            reg_data_out <= slv_reg18;
          when b"010011" =>
            reg_data_out <= slv_reg19;
          when b"010100" =>
            reg_data_out <= slv_reg20;
          when b"010101" =>
            reg_data_out <= slv_reg21;
          when b"010110" =>
            reg_data_out <= slv_reg22;
          when b"010111" =>
            reg_data_out <= slv_reg23;
          when b"011000" =>
            reg_data_out <= slv_reg24;
          when b"011001" =>
            reg_data_out <= slv_reg25;
          when b"011010" =>
            reg_data_out <= slv_reg26;
          when b"011011" =>
            reg_data_out <= slv_reg27;
          when b"011100" =>
            reg_data_out <= slv_reg28;
          when b"011101" =>
            reg_data_out <= slv_reg29;
          when b"011110" =>
            reg_data_out <= slv_reg30;
          when b"011111" =>
            reg_data_out <= slv_reg31;
          when b"100000" =>
            reg_data_out <= slv_reg32;
          when b"100001" =>
            reg_data_out <= slv_reg33;
          when b"100010" =>
            reg_data_out <= slv_reg34;
          when b"100011" =>
            reg_data_out <= slv_reg35;
          when b"100100" =>
            reg_data_out <= slv_reg36;
          when b"100101" =>
            reg_data_out <= slv_reg37;
          when b"100110" =>
            reg_data_out <= slv_reg38;
          when b"100111" =>
            reg_data_out <= slv_reg39;
          when b"101000" =>
            reg_data_out <= slv_reg40;
          when b"101001" =>
            reg_data_out <= slv_reg41;
          when b"101010" =>
            reg_data_out <= slv_reg42;
          when b"101011" =>
            reg_data_out <= slv_reg43;
          when b"101100" =>
            reg_data_out <= slv_reg44;
          when b"101101" =>
            reg_data_out <= slv_reg45;
          when b"101110" =>
            reg_data_out <= slv_reg46;
          when b"101111" =>
            reg_data_out <= slv_reg47;
          when b"110000" =>
            reg_data_out <= slv_reg48;
          when b"110001" =>
            reg_data_out <= slv_reg49;
          when b"110010" =>
            reg_data_out <= slv_reg50;
          when b"110011" =>
            reg_data_out <= slv_reg51;
          when b"110100" =>
            reg_data_out <= slv_reg52;
          when b"110101" =>
            reg_data_out <= slv_reg53;
          when b"110110" =>
            reg_data_out <= slv_reg54;
          when b"110111" =>
            reg_data_out <= slv_reg55;
          when b"111000" =>
            reg_data_out <= slv_reg56;
          when b"111001" =>
            reg_data_out <= slv_reg57;
          when b"111010" =>
            reg_data_out <= slv_reg58;
          when b"111011" =>
            reg_data_out <= slv_reg59;
          when b"111100" =>
            reg_data_out <= slv_reg60;
          when b"111101" =>
            reg_data_out <= slv_reg61;
          when b"111110" =>
            reg_data_out <= slv_reg62;
          when b"111111" =>
            reg_data_out <= slv_reg63;
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

    -- Output Slave Registers --
    slv_reg16    <= SLV_REG_16;
    slv_reg17    <= SLV_REG_17;
    slv_reg18    <= SLV_REG_18;
    slv_reg19    <= SLV_REG_19;
    slv_reg20    <= SLV_REG_20;
    slv_reg21    <= SLV_REG_21;
    slv_reg22    <= SLV_REG_22;
    slv_reg23    <= SLV_REG_23;
    slv_reg24    <= SLV_REG_24;
    slv_reg25    <= SLV_REG_25;
    slv_reg26    <= SLV_REG_26;
    slv_reg27    <= SLV_REG_27;
    slv_reg28    <= SLV_REG_28;
    slv_reg29    <= SLV_REG_29;
    slv_reg30    <= SLV_REG_30;
    slv_reg31    <= SLV_REG_31;
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


end rtl;
