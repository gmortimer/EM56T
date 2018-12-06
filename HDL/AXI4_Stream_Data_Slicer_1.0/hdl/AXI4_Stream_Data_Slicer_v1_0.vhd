library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.emm_telsys.all;

-- This allows any contiguous part of the master tdata and tuser buses
-- to be output at any width to the slave bus,
-- padded up to msb with zeros
-- It allows TUSER data to be transferred to TDATA and vice-versa
-- TDATA and TUSER are combined into a single word, mapped and then re-split

entity AXI4_Stream_Data_Slicer_v1_0 is
	generic (
        C_S_AXIS_MAP                      : std_logic_vector( 127 downto 0 ) := x"00000000_00000000_00000000_FFFFFFFF";
        C_M_AXIS_MAP                      : std_logic_vector( 127 downto 0 ) := x"00000000_00000000_00000000_FFFFFFFF";
        
        C_SEXT_R0                         : integer   := -1;
        C_SEXT_L0                         : integer   :=  0;         
        C_SEXT_R1                         : integer   := -1;
        C_SEXT_L1                         : integer   :=  0;         

		C_S_AXIS_TDATA_WIDTH              : integer	  := 32;
        C_S_AXIS_TUSER_WIDTH              : integer   := 0;

		C_M_AXIS_TDATA_WIDTH	          : integer	  := 32;
        C_M_AXIS_TUSER_WIDTH              : integer   := 0
	);
	port (
        aclk                : in  std_logic;
        aresetn             : in  std_logic;

		-- Ports of Axi Slave Bus Interface S_AXIS_DATA
		s_axis_data_tready	: out std_logic;
		s_axis_data_tdata	: in  std_logic_vector( C_S_AXIS_TDATA_WIDTH - 1 downto 0 );
        s_axis_data_tlast   : in  std_logic := '0';
		s_axis_data_tvalid	: in  std_logic;
        s_axis_data_tuser   : in  std_logic_vector( C_S_AXIS_TUSER_WIDTH - 1 downto 0 ) := ( others=>'0' );
        
		-- Ports of Axi Master Bus Interface M_AXIS_DATA
		m_axis_data_tvalid	: out std_logic;
		m_axis_data_tdata	: out std_logic_vector( C_M_AXIS_TDATA_WIDTH - 1 downto 0 );
        m_axis_data_tlast   : out std_logic;
		m_axis_data_tready	: in  std_logic := '1';
        m_axis_data_tuser   : out std_logic_vector( C_M_AXIS_TUSER_WIDTH - 1 downto 0 )
	);
end AXI4_Stream_Data_Slicer_v1_0;

architecture arch_imp of AXI4_Stream_Data_Slicer_v1_0 is
constant C_S_AXIS_DATA_WIDTH : integer := C_S_AXIS_TDATA_WIDTH + C_S_AXIS_TUSER_WIDTH;
constant C_M_AXIS_DATA_WIDTH : integer := C_M_AXIS_TDATA_WIDTH + C_M_AXIS_TUSER_WIDTH;

component Data_Mapper is
  generic ( 
    S_WIDTH              : integer;
    D_WIDTH              : integer;
    S_MAP                : std_logic_vector( 127 downto 0 );
    D_MAP                : std_logic_vector( 127 downto 0 )
   );

  port ( 
    S_DATA               : in  std_logic_vector( S_WIDTH - 1 downto 0 );
    D_DATA               : out std_logic_vector( D_WIDTH - 1 downto 0 )
   );
end component Data_Mapper;



signal s_axis_data     : std_logic_vector( C_S_AXIS_DATA_WIDTH - 1 downto 0 );
signal m_axis_data_map : std_logic_vector( C_M_AXIS_DATA_WIDTH - 1 downto 0 );
signal m_axis_data_out : std_logic_vector( C_M_AXIS_DATA_WIDTH - 1 downto 0 );

alias m_axis_tuser : std_logic_vector( m_axis_data_tuser'range ) is m_axis_data_out( C_M_AXIS_TUSER_WIDTH + C_M_AXIS_TDATA_WIDTH - 1 downto  C_M_AXIS_TDATA_WIDTH ); 
alias m_axis_tdata : std_logic_vector( m_axis_data_tdata'range ) is m_axis_data_out( m_axis_data_tdata'range );

begin

mapper: Data_Mapper
  generic map ( 
    S_WIDTH              => C_S_AXIS_DATA_WIDTH,
    D_WIDTH              => C_M_AXIS_DATA_WIDTH,
    S_MAP                => C_S_AXIS_MAP,
    D_MAP                => C_M_AXIS_MAP
   )

  port map ( 
    S_DATA               => s_axis_data,
    D_DATA               => m_axis_data_map
   );

m_axis_data_tlast  <= s_axis_data_tlast;
m_axis_data_tvalid <= s_axis_data_tvalid;
s_axis_data_tready <= m_axis_data_tready;

process( m_axis_data_out, m_axis_data_map, s_axis_data_tdata, s_axis_data_tuser )
begin
  s_axis_data <= s_axis_data_tuser & s_axis_data_tdata;
  m_axis_data_out <= m_axis_data_map;
  if C_SEXT_R0 >= 0 and C_SEXT_L0 > C_SEXT_R0 and C_SEXT_L0 <= m_axis_data_out'left then
    m_axis_data_out( C_SEXT_L0 downto C_SEXT_R0 + 1 ) <= bits( C_SEXT_L0 - C_SEXT_R0, m_axis_data_out( C_SEXT_R0 ) );
  end if;
  if C_SEXT_R1 >= 0 and C_SEXT_L1 > C_SEXT_R1 and C_SEXT_L1 <= m_axis_data_out'left then 
    m_axis_data_out( C_SEXT_L1 downto C_SEXT_R1 + 1 ) <= bits( C_SEXT_L1 - C_SEXT_R1, m_axis_data_out( C_SEXT_R1 ) );
  end if;
  m_axis_data_tdata <= m_axis_tdata;
  m_axis_data_tuser <= m_axis_tuser;
end process;

  
end arch_imp;
