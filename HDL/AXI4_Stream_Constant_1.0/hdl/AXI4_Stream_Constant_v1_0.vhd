library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AXI4_Stream_Constant_v1_0 is
	generic (
	    C_USE_TRIG_IN           : boolean   := false; 
		C_M_AXIS_K_TDATA_WIDTH	: integer	:= 32;
		C_K_MODE                : integer   := 0;
		C_K_VALUE               : std_logic_vector( 63 downto 0 ) := x"0000000000000000"
	);
	port (
		aclk	        : in  std_logic;
        aresetn         : in  std_logic;

        trig_in         : in  std_logic := '1';

		-- Ports of Axi Master Bus Interface M_AXIS_K
		m_axis_k_tvalid	: out std_logic;
		m_axis_k_tdata	: out std_logic_vector(C_M_AXIS_K_TDATA_WIDTH-1 downto 0);
		m_axis_k_tlast	: out std_logic;
		m_axis_k_tready	: in  std_logic
	);
end AXI4_Stream_Constant_v1_0;

architecture rtl of AXI4_Stream_Constant_v1_0 is
component Reset_Sync is  
  port (
    RSTN_I     : in  std_logic;
    RSTP_I     : in  std_logic;
    RSTN_O     : out std_logic;
    RSTP_O     : out std_logic;
    CLK        : in  std_logic
  ); 
end component Reset_Sync;

constant C_K_ON_TRIGGER       : integer := 0;
constant C_K_ALWAYS_ON_TREADY : integer := 1;

signal trig_in_sync      : std_logic_vector( 3 downto 0 );
signal trig_f            : std_logic;
signal m_axis_k_tvalid_i : std_logic;
signal resetn            : std_logic;

begin

reset_sync_i : Reset_Sync
  port map (
    RSTN_I     => aresetn,
    RSTP_I     => '0',
    RSTN_O     => resetn,
    RSTP_O     => open,
    CLK        => aclk
  );

m_axis_k_tvalid <= m_axis_k_tvalid_i;
m_axis_k_tdata  <= C_K_VALUE( m_axis_k_tdata'range );
m_axis_k_tlast  <= '0';

trig: process( aclk )
begin
  if rising_edge( aclk ) then
    if resetn = '0' then
      trig_in_sync <= ( others=>'0' );
      trig_f       <= '0';
    else
      trig_f       <= '0';
      trig_in_sync <= trig_in & trig_in_sync( trig_in_sync'left downto 1 );
      if trig_in_sync( 0 ) = '0' and trig_in_sync( 1 ) = '1' then
        trig_f     <= '1';
      end if;
    end if;
  end if;
end process;

const: process( aclk )
begin
  if rising_edge( aclk ) then
    if resetn = '0' then
      m_axis_k_tvalid_i <= '0';
    else
      case C_K_MODE is
        when C_K_ALWAYS_ON_TREADY =>
          m_axis_k_tvalid_i     <= '1';
        when C_K_ON_TRIGGER =>
          if trig_f = '1' then
            m_axis_k_tvalid_i <= '1';
          end if;
          if ( m_axis_k_tready and m_axis_k_tvalid_i ) = '1' then 
            m_axis_k_tvalid_i <= '0';
          end if;
        when others =>
          null;
      end case;
    end if;
  end if;
end process;


end rtl;
