library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AXI4_Stream_to_AD9361_v1_0 is
	generic (
        C_N_CHANS                     : integer := 1;                    

		C_S_AXIS_DAC_DATA_TDATA_WIDTH : integer := 24;
		C_DAC_DATA_WIDTH    	      : integer	:= 16;
		C_DAC_BITS                    : integer := 12
	);
	port (
--		aclk	                : in std_logic;
--        aresetn                 : in std_logic;

        dac_data_i0             : out std_logic_vector( C_DAC_DATA_WIDTH - 1 downto 0 ); 
        dac_data_q0             : out std_logic_vector( C_DAC_DATA_WIDTH - 1 downto 0 ); 
        dac_data_i1             : out std_logic_vector( C_DAC_DATA_WIDTH - 1 downto 0 ); 
        dac_data_q1             : out std_logic_vector( C_DAC_DATA_WIDTH - 1 downto 0 ); 
         
        dac_valid_i0            : in  std_logic; 
        dac_valid_q0            : in  std_logic; 
        dac_valid_i1            : in  std_logic; 
        dac_valid_q1            : in  std_logic; 

        dac_valid_out           : out std_logic;

		s_axis_dac_data_tready	: out std_logic;
		s_axis_dac_data_tdata	: in std_logic_vector( C_S_AXIS_DAC_DATA_TDATA_WIDTH - 1 downto 0 );
		s_axis_dac_data_tvalid	: in std_logic
	);
end AXI4_Stream_to_AD9361_v1_0;

architecture arch_imp of AXI4_Stream_to_AD9361_v1_0 is

constant C_DAC_LSBS : std_logic_vector( C_DAC_DATA_WIDTH - C_DAC_BITS - 1 downto 0 ) := ( others => '0' );

begin

process( s_axis_dac_data_tdata, dac_valid_i0, dac_valid_q0 )
begin
  s_axis_dac_data_tready  <=  dac_valid_i0;
  dac_valid_out           <=  dac_valid_q0;
  
  dac_data_i0             <= s_axis_dac_data_tdata( 1 * C_DAC_BITS - 1 downto 0 * C_DAC_BITS ) & C_DAC_LSBS; 
  dac_data_q0             <= s_axis_dac_data_tdata( 2 * C_DAC_BITS - 1 downto 1 * C_DAC_BITS ) & C_DAC_LSBS; 
  if C_N_CHANS = 2 then
    dac_data_i1           <= s_axis_dac_data_tdata( 3 * C_DAC_BITS - 1 downto 2 * C_DAC_BITS ) & C_DAC_LSBS; 
    dac_data_q1           <= s_axis_dac_data_tdata( 4 * C_DAC_BITS - 1 downto 3 * C_DAC_BITS ) & C_DAC_LSBS; 
  else
    dac_data_i1           <= ( others => '0' );
    dac_data_q1           <= ( others => '0' );
  end if;
end process;
  

end arch_imp;
