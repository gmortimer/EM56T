library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.emm_telsys.all;

entity AXI4_Stream_Broadcast_Delayed_v1_0 is
	generic (
		-- Parameters of Axi Bus Interface
		C_AXIS_DATA_TDATA_WIDTH   : integer   := 24;
        C_HAS_TLAST               : boolean   := false;
        C_HAS_DELAY               : boolean   := false;
        C_N_PORTS_MASTER          : integer   := 16

	);
	port (
        aclk                      : in  std_logic;
        aresetn                   : in  std_logic;

		-- Ports of Axi Slave Bus Interface S_AXIS_DATA
		s_axis_data_tready	      : out std_logic;
		s_axis_data_tdata	      : in std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
        s_axis_data_tlast         : in  std_logic := '0';
		s_axis_data_tvalid	      : in std_logic;

		-- Ports of Axi Master Bus Interface M00_AXIS_DATA
		m00_axis_data_tvalid	  : out std_logic;
		m00_axis_data_tdata	      : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m00_axis_data_tlast       : out std_logic;
		m00_axis_data_tready	  : in std_logic;

		-- Ports of Axi Master Bus Interface M01_AXIS_DATA
		m01_axis_data_tvalid	  : out std_logic;
		m01_axis_data_tdata	      : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m01_axis_data_tlast       : out std_logic;
		m01_axis_data_tready	  : in  std_logic;

		-- Ports of Axi Master Bus Interface M02_AXIS_DATA
		m02_axis_data_tvalid	  : out std_logic;
		m02_axis_data_tdata	      : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m02_axis_data_tlast       : out std_logic;
		m02_axis_data_tready	  : in  std_logic := '1';

		-- Ports of Axi Master Bus Interface M03_AXIS_DATA
		m03_axis_data_tvalid	  : out std_logic;
		m03_axis_data_tdata	      : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m03_axis_data_tlast       : out std_logic;
		m03_axis_data_tready	  : in  std_logic := '1';

		-- Ports of Axi Master Bus Interface M04_AXIS_DATA
		m04_axis_data_tvalid	  : out std_logic;
		m04_axis_data_tdata	      : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m04_axis_data_tlast       : out std_logic;
		m04_axis_data_tready	  : in  std_logic := '1';

		-- Ports of Axi Master Bus Interface M05_AXIS_DATA
		m05_axis_data_tvalid	  : out std_logic;
		m05_axis_data_tdata	      : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m05_axis_data_tlast       : out std_logic;
		m05_axis_data_tready	  : in  std_logic := '1';

		-- Ports of Axi Master Bus Interface M06_AXIS_DATA
		m06_axis_data_tvalid	  : out std_logic;
		m06_axis_data_tdata	      : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m06_axis_data_tlast       : out std_logic;
		m06_axis_data_tready	  : in  std_logic := '1';

		-- Ports of Axi Master Bus Interface M07_AXIS_DATA
		m07_axis_data_tvalid	  : out std_logic;
		m07_axis_data_tdata	      : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m07_axis_data_tlast       : out std_logic;
		m07_axis_data_tready	  : in  std_logic := '1';

		-- Ports of Axi Master Bus Interface M08_AXIS_DATA
		m08_axis_data_tvalid	  : out std_logic;
		m08_axis_data_tdata	      : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m08_axis_data_tlast       : out std_logic;
		m08_axis_data_tready	  : in  std_logic := '1';

		-- Ports of Axi Master Bus Interface M09_AXIS_DATA
		m09_axis_data_tvalid	  : out std_logic;
		m09_axis_data_tdata	      : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m09_axis_data_tlast       : out std_logic;
		m09_axis_data_tready	  : in  std_logic := '1';

		-- Ports of Axi Master Bus Interface M10_AXIS_DATA
		m10_axis_data_tvalid	  : out std_logic;
		m10_axis_data_tdata	      : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m10_axis_data_tlast       : out std_logic;
		m10_axis_data_tready	  : in  std_logic := '1';

		-- Ports of Axi Master Bus Interface M11_AXIS_DATA
		m11_axis_data_tvalid	  : out std_logic;
		m11_axis_data_tdata	      : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m11_axis_data_tlast       : out std_logic;
		m11_axis_data_tready	  : in  std_logic := '1';

		-- Ports of Axi Master Bus Interface M12_AXIS_DATA
		m12_axis_data_tvalid	  : out std_logic;
		m12_axis_data_tdata	      : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m12_axis_data_tlast       : out std_logic;
		m12_axis_data_tready	  : in  std_logic := '1';

		-- Ports of Axi Master Bus Interface M13_AXIS_DATA
		m13_axis_data_tvalid	  : out std_logic;
		m13_axis_data_tdata	      : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m13_axis_data_tlast       : out std_logic;
		m13_axis_data_tready	  : in  std_logic := '1';

		-- Ports of Axi Master Bus Interface M14_AXIS_DATA
		m14_axis_data_tvalid	  : out std_logic;
		m14_axis_data_tdata	      : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m14_axis_data_tlast       : out std_logic;
		m14_axis_data_tready	  : in  std_logic := '1';

		-- Ports of Axi Master Bus Interface M15_AXIS_DATA
        m15_axis_data_tvalid      : out std_logic;
        m15_axis_data_tdata       : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m15_axis_data_tlast       : out std_logic;
        m15_axis_data_tready      : in  std_logic := '1';

		-- Ports of Axi Master Bus Interface M15_AXIS_DATA
        m16_axis_data_tvalid      : out std_logic;
        m16_axis_data_tdata       : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m16_axis_data_tlast       : out std_logic;
        m16_axis_data_tready      : in  std_logic := '1';

		-- Ports of Axi Master Bus Interface M15_AXIS_DATA
        m17_axis_data_tvalid      : out std_logic;
        m17_axis_data_tdata       : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m17_axis_data_tlast       : out std_logic;
        m17_axis_data_tready      : in  std_logic := '1';

        -- Ports of Axi Master Bus Interface M15_AXIS_DATA
        m18_axis_data_tvalid      : out std_logic;
        m18_axis_data_tdata       : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m18_axis_data_tlast       : out std_logic;
        m18_axis_data_tready      : in  std_logic := '1';
        
        -- Ports of Axi Master Bus Interface M15_AXIS_DATA
        m19_axis_data_tvalid      : out std_logic;
        m19_axis_data_tdata       : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m19_axis_data_tlast       : out std_logic;
        m19_axis_data_tready      : in  std_logic := '1';

        -- Ports of Axi Master Bus Interface M15_AXIS_DATA
        m20_axis_data_tvalid      : out std_logic;
        m20_axis_data_tdata       : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m20_axis_data_tlast       : out std_logic;
        m20_axis_data_tready      : in  std_logic := '1';
        
        -- Ports of Axi Master Bus Interface M15_AXIS_DATA
        m21_axis_data_tvalid      : out std_logic;
        m21_axis_data_tdata       : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m21_axis_data_tlast       : out std_logic;
        m21_axis_data_tready      : in  std_logic := '1';

        -- Ports of Axi Master Bus Interface M15_AXIS_DATA
        m22_axis_data_tvalid      : out std_logic;
        m22_axis_data_tdata       : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m22_axis_data_tlast       : out std_logic;
        m22_axis_data_tready      : in  std_logic := '1';
        
        -- Ports of Axi Master Bus Interface M15_AXIS_DATA
        m23_axis_data_tvalid      : out std_logic;
        m23_axis_data_tdata       : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m23_axis_data_tlast       : out std_logic;
        m23_axis_data_tready      : in  std_logic := '1';

		-- Ports of Axi Master Bus Interface M15_AXIS_DATA
        m24_axis_data_tvalid      : out std_logic;
        m24_axis_data_tdata       : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m24_axis_data_tlast       : out std_logic;
        m24_axis_data_tready      : in  std_logic := '1';

        -- Ports of Axi Master Bus Interface M15_AXIS_DATA
        m25_axis_data_tvalid      : out std_logic;
        m25_axis_data_tdata       : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m25_axis_data_tlast       : out std_logic;
        m25_axis_data_tready      : in  std_logic := '1';

        -- Ports of Axi Master Bus Interface M15_AXIS_DATA
        m26_axis_data_tvalid      : out std_logic;
        m26_axis_data_tdata       : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m26_axis_data_tlast       : out std_logic;
        m26_axis_data_tready      : in  std_logic := '1';
        
        -- Ports of Axi Master Bus Interface M15_AXIS_DATA
        m27_axis_data_tvalid      : out std_logic;
        m27_axis_data_tdata       : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m27_axis_data_tlast       : out std_logic;
        m27_axis_data_tready      : in  std_logic := '1';

        -- Ports of Axi Master Bus Interface M15_AXIS_DATA
        m28_axis_data_tvalid      : out std_logic;
        m28_axis_data_tdata       : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m28_axis_data_tlast       : out std_logic;
        m28_axis_data_tready      : in  std_logic := '1';
        
        -- Ports of Axi Master Bus Interface M15_AXIS_DATA
        m29_axis_data_tvalid      : out std_logic;
        m29_axis_data_tdata       : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m29_axis_data_tlast       : out std_logic;
        m29_axis_data_tready      : in  std_logic := '1';

        -- Ports of Axi Master Bus Interface M15_AXIS_DATA
        m30_axis_data_tvalid      : out std_logic;
        m30_axis_data_tdata       : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m30_axis_data_tlast       : out std_logic;
        m30_axis_data_tready      : in  std_logic := '1';
        
        -- Ports of Axi Master Bus Interface M15_AXIS_DATA
        m31_axis_data_tvalid      : out std_logic;
        m31_axis_data_tdata       : out std_logic_vector(C_AXIS_DATA_TDATA_WIDTH-1 downto 0);
		m31_axis_data_tlast       : out std_logic;
        m31_axis_data_tready      : in  std_logic := '1'
	);
end AXI4_Stream_Broadcast_Delayed_v1_0;

architecture rtl of AXI4_Stream_Broadcast_Delayed_v1_0 is

constant C_TLAST_WIDTH : integer := bool2int( C_HAS_TLAST );

component AXI4_Stream_FIFO is
  generic (
    C_AXIS_TDATA_WIDTH   :  integer := 32;
    C_FIFO_DEPTH         :  integer := 8
  );
  port (
    S_AXIS_TVALID        : in  std_logic;
    S_AXIS_TDATA         : in  std_logic_vector(C_AXIS_TDATA_WIDTH - 1 downto 0);
    S_AXIS_TREADY        : out std_logic;

    M_AXIS_TVALID        : out std_logic;
    M_AXIS_TDATA         : out std_logic_vector(C_AXIS_TDATA_WIDTH - 1 downto 0);
    M_AXIS_TREADY        : in  std_logic;

    ACLK                 : in  std_logic;
    ARESETN              : in  std_logic;
    PS_RESET             : in  std_logic := '0'
  );
end component AXI4_Stream_FIFO;

component Reset_Sync is  
  port (
    RSTN_I     : in  std_logic;
    RSTP_I     : in  std_logic;
    RSTN_O     : out std_logic;
    RSTP_O     : out std_logic;
    CLK        : in  std_logic
  ); 
end component Reset_Sync;


type T_TDATA_DELAY is array( C_N_PORTS_MASTER - 1 downto 0 ) of std_logic_vector( C_AXIS_DATA_TDATA_WIDTH - 1 downto 0 ); 
signal m_axis_tdata      : T_TDATA_DELAY;
signal m_axis_tvalid     : std_logic_vector( C_N_PORTS_MASTER - 1 downto 0 );
signal m_axis_tready     : std_logic_vector( C_N_PORTS_MASTER - 1 downto 0 );
signal m_axis_tlast      : std_logic_vector( C_N_PORTS_MASTER - 1 downto 0 );

signal fifo_tready       : std_logic;
signal fifo_tvalid       : std_logic;
signal fifo_tdata        : std_logic_vector( C_AXIS_DATA_TDATA_WIDTH + C_TLAST_WIDTH - 1 downto 0 );
signal fifo_data_in      : std_logic_vector( C_AXIS_DATA_TDATA_WIDTH + C_TLAST_WIDTH - 1 downto 0 );

signal fifo_out_valid    : std_logic;

signal slave_tready      : std_logic;
signal local_tready      : std_logic;

--signal delay_ctr         : unsigned( clogb2( C_N_PORTS_MASTER - 1 ) - 1 downto 0 );
signal resetn            : std_logic;

begin

input_FIFO: AXI4_Stream_FIFO
  generic map (
    C_AXIS_TDATA_WIDTH => C_AXIS_DATA_TDATA_WIDTH + C_TLAST_WIDTH,
    C_FIFO_DEPTH       => 2
  )
  port map (
    S_AXIS_TVALID      => s_axis_data_tvalid,
    S_AXIS_TDATA       => fifo_data_in,
    S_AXIS_TREADY      => s_axis_data_tready,
    
    M_AXIS_TVALID      => fifo_tvalid,
    M_AXIS_TDATA       => fifo_tdata,
    M_AXIS_TREADY      => fifo_tready,
    
    ACLK               => aclk,
    ARESETN            => resetn,
    PS_RESET           => '0'
  );

reset_sync_i : Reset_Sync
  port map (
    RSTN_I     => aresetn,
    RSTP_I     => '0',
    RSTN_O     => resetn,
    RSTP_O     => open,
    CLK        => aclk
  );



fifo_data_in <= s_axis_data_tlast & s_axis_data_tdata when C_HAS_TLAST else s_axis_data_tdata;
process( m_axis_tdata, m_axis_tlast, m_axis_tvalid,
         m00_axis_data_tready,
         m01_axis_data_tready,
         m02_axis_data_tready,
         m03_axis_data_tready,
         m04_axis_data_tready,
         m05_axis_data_tready,
         m06_axis_data_tready,
         m07_axis_data_tready,
         m08_axis_data_tready,
         m09_axis_data_tready,
         m10_axis_data_tready,
         m11_axis_data_tready,
         m12_axis_data_tready,
         m13_axis_data_tready,
         m14_axis_data_tready,
         m15_axis_data_tready,
         m16_axis_data_tready,
         m17_axis_data_tready,
         m18_axis_data_tready,
         m19_axis_data_tready,
         m20_axis_data_tready,
         m21_axis_data_tready,
         m22_axis_data_tready,
         m23_axis_data_tready,
         m24_axis_data_tready,
         m25_axis_data_tready,
         m26_axis_data_tready,
         m27_axis_data_tready,
         m28_axis_data_tready,
         m29_axis_data_tready,
         m30_axis_data_tready,
         m31_axis_data_tready
       )
begin
  if C_N_PORTS_MASTER > 00 then m00_axis_data_tdata    <= m_axis_tdata( 00 ); end if;
  if C_N_PORTS_MASTER > 01 then m01_axis_data_tdata    <= m_axis_tdata( 01 ); end if;
  if C_N_PORTS_MASTER > 02 then m02_axis_data_tdata    <= m_axis_tdata( 02 ); end if;
  if C_N_PORTS_MASTER > 03 then m03_axis_data_tdata    <= m_axis_tdata( 03 ); end if;
  if C_N_PORTS_MASTER > 04 then m04_axis_data_tdata    <= m_axis_tdata( 04 ); end if;
  if C_N_PORTS_MASTER > 05 then m05_axis_data_tdata    <= m_axis_tdata( 05 ); end if;
  if C_N_PORTS_MASTER > 06 then m06_axis_data_tdata    <= m_axis_tdata( 06 ); end if;
  if C_N_PORTS_MASTER > 07 then m07_axis_data_tdata    <= m_axis_tdata( 07 ); end if;
  if C_N_PORTS_MASTER > 08 then m08_axis_data_tdata    <= m_axis_tdata( 08 ); end if;
  if C_N_PORTS_MASTER > 09 then m09_axis_data_tdata    <= m_axis_tdata( 09 ); end if;
  if C_N_PORTS_MASTER > 10 then m10_axis_data_tdata    <= m_axis_tdata( 10 ); end if;
  if C_N_PORTS_MASTER > 11 then m11_axis_data_tdata    <= m_axis_tdata( 11 ); end if;
  if C_N_PORTS_MASTER > 12 then m12_axis_data_tdata    <= m_axis_tdata( 12 ); end if;
  if C_N_PORTS_MASTER > 13 then m13_axis_data_tdata    <= m_axis_tdata( 13 ); end if;
  if C_N_PORTS_MASTER > 14 then m14_axis_data_tdata    <= m_axis_tdata( 14 ); end if;
  if C_N_PORTS_MASTER > 15 then m15_axis_data_tdata    <= m_axis_tdata( 15 ); end if;
  if C_N_PORTS_MASTER > 16 then m16_axis_data_tdata    <= m_axis_tdata( 16 ); end if;
  if C_N_PORTS_MASTER > 17 then m17_axis_data_tdata    <= m_axis_tdata( 17 ); end if;
  if C_N_PORTS_MASTER > 18 then m18_axis_data_tdata    <= m_axis_tdata( 18 ); end if;
  if C_N_PORTS_MASTER > 19 then m19_axis_data_tdata    <= m_axis_tdata( 19 ); end if;
  if C_N_PORTS_MASTER > 20 then m20_axis_data_tdata    <= m_axis_tdata( 20 ); end if;
  if C_N_PORTS_MASTER > 21 then m21_axis_data_tdata    <= m_axis_tdata( 21 ); end if;
  if C_N_PORTS_MASTER > 22 then m22_axis_data_tdata    <= m_axis_tdata( 22 ); end if;
  if C_N_PORTS_MASTER > 23 then m23_axis_data_tdata    <= m_axis_tdata( 23 ); end if;
  if C_N_PORTS_MASTER > 24 then m24_axis_data_tdata    <= m_axis_tdata( 24 ); end if;
  if C_N_PORTS_MASTER > 25 then m25_axis_data_tdata    <= m_axis_tdata( 25 ); end if;
  if C_N_PORTS_MASTER > 26 then m26_axis_data_tdata    <= m_axis_tdata( 26 ); end if;
  if C_N_PORTS_MASTER > 27 then m27_axis_data_tdata    <= m_axis_tdata( 27 ); end if;
  if C_N_PORTS_MASTER > 28 then m28_axis_data_tdata    <= m_axis_tdata( 28 ); end if;
  if C_N_PORTS_MASTER > 29 then m29_axis_data_tdata    <= m_axis_tdata( 29 ); end if;
  if C_N_PORTS_MASTER > 30 then m30_axis_data_tdata    <= m_axis_tdata( 30 ); end if;
  if C_N_PORTS_MASTER > 31 then m31_axis_data_tdata    <= m_axis_tdata( 31 ); end if;
  
  if C_N_PORTS_MASTER > 00 then m00_axis_data_tlast    <= m_axis_tlast( 00 ); end if; 
  if C_N_PORTS_MASTER > 01 then m01_axis_data_tlast    <= m_axis_tlast( 01 ); end if; 
  if C_N_PORTS_MASTER > 02 then m02_axis_data_tlast    <= m_axis_tlast( 02 ); end if; 
  if C_N_PORTS_MASTER > 03 then m03_axis_data_tlast    <= m_axis_tlast( 03 ); end if; 
  if C_N_PORTS_MASTER > 04 then m04_axis_data_tlast    <= m_axis_tlast( 04 ); end if; 
  if C_N_PORTS_MASTER > 05 then m05_axis_data_tlast    <= m_axis_tlast( 05 ); end if; 
  if C_N_PORTS_MASTER > 06 then m06_axis_data_tlast    <= m_axis_tlast( 06 ); end if; 
  if C_N_PORTS_MASTER > 07 then m07_axis_data_tlast    <= m_axis_tlast( 07 ); end if; 
  if C_N_PORTS_MASTER > 08 then m08_axis_data_tlast    <= m_axis_tlast( 08 ); end if; 
  if C_N_PORTS_MASTER > 09 then m09_axis_data_tlast    <= m_axis_tlast( 09 ); end if; 
  if C_N_PORTS_MASTER > 10 then m10_axis_data_tlast    <= m_axis_tlast( 10 ); end if; 
  if C_N_PORTS_MASTER > 11 then m11_axis_data_tlast    <= m_axis_tlast( 11 ); end if; 
  if C_N_PORTS_MASTER > 12 then m12_axis_data_tlast    <= m_axis_tlast( 12 ); end if; 
  if C_N_PORTS_MASTER > 13 then m13_axis_data_tlast    <= m_axis_tlast( 13 ); end if; 
  if C_N_PORTS_MASTER > 14 then m14_axis_data_tlast    <= m_axis_tlast( 14 ); end if; 
  if C_N_PORTS_MASTER > 15 then m15_axis_data_tlast    <= m_axis_tlast( 15 ); end if; 
  if C_N_PORTS_MASTER > 16 then m16_axis_data_tlast    <= m_axis_tlast( 16 ); end if; 
  if C_N_PORTS_MASTER > 17 then m17_axis_data_tlast    <= m_axis_tlast( 17 ); end if; 
  if C_N_PORTS_MASTER > 18 then m18_axis_data_tlast    <= m_axis_tlast( 18 ); end if; 
  if C_N_PORTS_MASTER > 19 then m19_axis_data_tlast    <= m_axis_tlast( 19 ); end if; 
  if C_N_PORTS_MASTER > 20 then m20_axis_data_tlast    <= m_axis_tlast( 20 ); end if; 
  if C_N_PORTS_MASTER > 21 then m21_axis_data_tlast    <= m_axis_tlast( 21 ); end if; 
  if C_N_PORTS_MASTER > 22 then m22_axis_data_tlast    <= m_axis_tlast( 22 ); end if; 
  if C_N_PORTS_MASTER > 23 then m23_axis_data_tlast    <= m_axis_tlast( 23 ); end if; 
  if C_N_PORTS_MASTER > 24 then m24_axis_data_tlast    <= m_axis_tlast( 24 ); end if; 
  if C_N_PORTS_MASTER > 25 then m25_axis_data_tlast    <= m_axis_tlast( 25 ); end if; 
  if C_N_PORTS_MASTER > 26 then m26_axis_data_tlast    <= m_axis_tlast( 26 ); end if; 
  if C_N_PORTS_MASTER > 27 then m27_axis_data_tlast    <= m_axis_tlast( 27 ); end if; 
  if C_N_PORTS_MASTER > 28 then m28_axis_data_tlast    <= m_axis_tlast( 28 ); end if; 
  if C_N_PORTS_MASTER > 29 then m29_axis_data_tlast    <= m_axis_tlast( 29 ); end if; 
  if C_N_PORTS_MASTER > 30 then m30_axis_data_tlast    <= m_axis_tlast( 30 ); end if; 
  if C_N_PORTS_MASTER > 31 then m31_axis_data_tlast    <= m_axis_tlast( 31 ); end if; 

  if C_N_PORTS_MASTER > 00 then m00_axis_data_tvalid  <= m_axis_tvalid( 00 ); end if;  
  if C_N_PORTS_MASTER > 01 then m01_axis_data_tvalid  <= m_axis_tvalid( 01 ); end if;
  if C_N_PORTS_MASTER > 02 then m02_axis_data_tvalid  <= m_axis_tvalid( 02 ); end if;  
  if C_N_PORTS_MASTER > 03 then m03_axis_data_tvalid  <= m_axis_tvalid( 03 ); end if;
  if C_N_PORTS_MASTER > 04 then m04_axis_data_tvalid  <= m_axis_tvalid( 04 ); end if;  
  if C_N_PORTS_MASTER > 05 then m05_axis_data_tvalid  <= m_axis_tvalid( 05 ); end if;
  if C_N_PORTS_MASTER > 06 then m06_axis_data_tvalid  <= m_axis_tvalid( 06 ); end if;  
  if C_N_PORTS_MASTER > 07 then m07_axis_data_tvalid  <= m_axis_tvalid( 07 ); end if;
  if C_N_PORTS_MASTER > 08 then m08_axis_data_tvalid  <= m_axis_tvalid( 08 ); end if;  
  if C_N_PORTS_MASTER > 09 then m09_axis_data_tvalid  <= m_axis_tvalid( 09 ); end if;
  if C_N_PORTS_MASTER > 10 then m10_axis_data_tvalid  <= m_axis_tvalid( 10 ); end if;  
  if C_N_PORTS_MASTER > 11 then m11_axis_data_tvalid  <= m_axis_tvalid( 11 ); end if;
  if C_N_PORTS_MASTER > 12 then m12_axis_data_tvalid  <= m_axis_tvalid( 12 ); end if;  
  if C_N_PORTS_MASTER > 13 then m13_axis_data_tvalid  <= m_axis_tvalid( 13 ); end if;
  if C_N_PORTS_MASTER > 14 then m14_axis_data_tvalid  <= m_axis_tvalid( 14 ); end if;  
  if C_N_PORTS_MASTER > 15 then m15_axis_data_tvalid  <= m_axis_tvalid( 15 ); end if;
  if C_N_PORTS_MASTER > 16 then m16_axis_data_tvalid  <= m_axis_tvalid( 16 ); end if;  
  if C_N_PORTS_MASTER > 17 then m17_axis_data_tvalid  <= m_axis_tvalid( 17 ); end if;
  if C_N_PORTS_MASTER > 18 then m18_axis_data_tvalid  <= m_axis_tvalid( 18 ); end if;  
  if C_N_PORTS_MASTER > 19 then m19_axis_data_tvalid  <= m_axis_tvalid( 19 ); end if;
  if C_N_PORTS_MASTER > 20 then m20_axis_data_tvalid  <= m_axis_tvalid( 20 ); end if;  
  if C_N_PORTS_MASTER > 21 then m21_axis_data_tvalid  <= m_axis_tvalid( 21 ); end if;
  if C_N_PORTS_MASTER > 22 then m22_axis_data_tvalid  <= m_axis_tvalid( 22 ); end if;  
  if C_N_PORTS_MASTER > 23 then m23_axis_data_tvalid  <= m_axis_tvalid( 23 ); end if;
  if C_N_PORTS_MASTER > 24 then m24_axis_data_tvalid  <= m_axis_tvalid( 24 ); end if;  
  if C_N_PORTS_MASTER > 25 then m25_axis_data_tvalid  <= m_axis_tvalid( 25 ); end if;
  if C_N_PORTS_MASTER > 26 then m26_axis_data_tvalid  <= m_axis_tvalid( 26 ); end if;  
  if C_N_PORTS_MASTER > 27 then m27_axis_data_tvalid  <= m_axis_tvalid( 27 ); end if;
  if C_N_PORTS_MASTER > 28 then m28_axis_data_tvalid  <= m_axis_tvalid( 28 ); end if;  
  if C_N_PORTS_MASTER > 29 then m29_axis_data_tvalid  <= m_axis_tvalid( 29 ); end if;
  if C_N_PORTS_MASTER > 30 then m30_axis_data_tvalid  <= m_axis_tvalid( 30 ); end if;  
  if C_N_PORTS_MASTER > 31 then m31_axis_data_tvalid  <= m_axis_tvalid( 31 ); end if;

  if C_N_PORTS_MASTER > 00 then m_axis_tready( 00 )  <= m00_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 01 then m_axis_tready( 01 )  <= m01_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 02 then m_axis_tready( 02 )  <= m02_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 03 then m_axis_tready( 03 )  <= m03_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 04 then m_axis_tready( 04 )  <= m04_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 05 then m_axis_tready( 05 )  <= m05_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 06 then m_axis_tready( 06 )  <= m06_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 07 then m_axis_tready( 07 )  <= m07_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 08 then m_axis_tready( 08 )  <= m08_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 09 then m_axis_tready( 09 )  <= m09_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 10 then m_axis_tready( 10 )  <= m10_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 11 then m_axis_tready( 11 )  <= m11_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 12 then m_axis_tready( 12 )  <= m12_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 13 then m_axis_tready( 13 )  <= m13_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 14 then m_axis_tready( 14 )  <= m14_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 15 then m_axis_tready( 15 )  <= m15_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 16 then m_axis_tready( 16 )  <= m16_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 17 then m_axis_tready( 17 )  <= m17_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 18 then m_axis_tready( 18 )  <= m18_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 19 then m_axis_tready( 19 )  <= m19_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 20 then m_axis_tready( 20 )  <= m20_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 21 then m_axis_tready( 21 )  <= m21_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 22 then m_axis_tready( 22 )  <= m22_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 23 then m_axis_tready( 23 )  <= m23_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 24 then m_axis_tready( 24 )  <= m24_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 25 then m_axis_tready( 25 )  <= m25_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 26 then m_axis_tready( 26 )  <= m26_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 27 then m_axis_tready( 27 )  <= m27_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 28 then m_axis_tready( 28 )  <= m28_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 29 then m_axis_tready( 29 )  <= m29_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 30 then m_axis_tready( 30 )  <= m30_axis_data_tready; end if;
  if C_N_PORTS_MASTER > 31 then m_axis_tready( 31 )  <= m31_axis_data_tready; end if;
end process;

process( s_axis_data_tdata, s_axis_data_tlast )
begin
  if C_HAS_TLAST then
    fifo_data_in <= s_axis_data_tlast & s_axis_data_tdata;
  else
    fifo_data_in <= s_axis_data_tdata;
  end if;
end process;

local_tready   <= '1' when ( m_axis_tvalid = ( m_axis_tvalid'range => '0' ) ) else '0';
slave_tready   <= '1' when ( m_axis_tready = ( m_axis_tready'range => '1' ) ) else '0';
fifo_tready    <= ( local_tready or slave_tready );
fifo_out_valid <= fifo_tvalid and fifo_tready;


bcast_delay: process ( aclk )
begin
  if rising_edge( aclk ) then
    if ( resetn = '0' ) then
--      delay_ctr      <= ( others => '0');
      m_axis_tvalid  <= ( others => '0' );
      m_axis_tdata   <= ( others => ( others => '0' ) );         
    else
      -- clear tvalid for each channel if data has been transferred
--      if C_HAS_DELAY and ( delay_ctr < C_N_PORTS_MASTER - 1 ) then
--        m_axis_tvalid <= ( others => '0' );
--      else
        for i in C_N_PORTS_MASTER - 1 downto 0 loop
          if ( m_axis_tvalid( i ) and not m_axis_tready( i ) ) = '1' then
            m_axis_tvalid( i ) <= '1';
          else
            m_axis_tvalid( i ) <= fifo_out_valid;
          end if;
        end loop;
--      end if;
      
      
      if fifo_out_valid = '1' then
        if C_HAS_DELAY then
          m_axis_tdata     <= m_axis_tdata( C_N_PORTS_MASTER - 2 downto 0 ) & fifo_tdata( m00_axis_data_tdata'range );
          if C_HAS_TLAST then
            m_axis_tlast   <= m_axis_tlast( C_N_PORTS_MASTER - 2 downto 0 ) & fifo_tdata( fifo_tdata'left );
          else
            m_axis_tlast   <= ( others => '0' );
          end if;
--          if delay_ctr < C_N_PORTS_MASTER - 1 then
--            delay_ctr      <= delay_ctr + 1;
--          end if;
        else
          for i in C_N_PORTS_MASTER - 1 downto 0 loop
            M_AXIS_TDATA( i )    <= fifo_tdata( m00_axis_data_tdata'range );
            if C_HAS_TLAST then
              m_axis_tlast( i )  <= fifo_tdata( fifo_tdata'left );
            else
              m_axis_tlast( i )  <= '0';
            end if;
          end loop;
        end if;
      end if;

    end if; -- reset
  end if; -- rising edge clock
end process;



end rtl;
