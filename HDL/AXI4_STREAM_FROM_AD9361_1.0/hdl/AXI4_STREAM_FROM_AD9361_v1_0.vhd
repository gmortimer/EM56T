library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AXI4_STREAM_FROM_AD9361_v1_0 is
	generic (
	    C_N_CHANS                       : integer   := 1;          
	    C_ADC_DATA_WIDTH                : integer   := 16;
	    C_ADC_BITS                      : integer   := 12;
		C_M_AXIS_ADC_DATA_TDATA_WIDTH	: integer	:= 24
	);
	port (
--		aclk	                : in  std_logic;
--		aresetn	                : in  std_logic;

        adc_valid_i0            : in  std_logic;
        adc_data_i0             : in  std_logic_vector( C_ADC_DATA_WIDTH - 1 downto 0 ); 
        adc_valid_q0            : in  std_logic;
        adc_data_q0             : in  std_logic_vector( C_ADC_DATA_WIDTH - 1 downto 0 ); 
        adc_valid_i1            : in  std_logic;
        adc_data_i1             : in  std_logic_vector( C_ADC_DATA_WIDTH - 1 downto 0 ); 
        adc_valid_q1            : in  std_logic;
        adc_data_q1             : in  std_logic_vector( C_ADC_DATA_WIDTH - 1 downto 0 ); 

        adc_valid_out           : out std_logic;  

		m_axis_adc_data_tvalid	: out std_logic;
		m_axis_adc_data_tdata	: out std_logic_vector( C_M_AXIS_ADC_DATA_TDATA_WIDTH - 1 downto 0 );
		m_axis_adc_data_tready	: in  std_logic
	);
end AXI4_STREAM_FROM_AD9361_v1_0;

architecture arch_imp of AXI4_STREAM_FROM_AD9361_v1_0 is

begin

process( adc_valid_i0, adc_valid_q0, adc_data_i0, adc_data_q0, adc_data_i1, adc_data_q1 )
begin
  adc_valid_out          <= adc_valid_q0;
  m_axis_adc_data_tvalid <= adc_valid_i0;

  m_axis_adc_data_tdata( C_ADC_BITS * 1 - 1 downto C_ADC_BITS * 0 ) <= adc_data_i0( C_ADC_BITS - 1 downto 0 );
  m_axis_adc_data_tdata( C_ADC_BITS * 2 - 1 downto C_ADC_BITS * 1 ) <= adc_data_q0( C_ADC_BITS - 1 downto 0 );
  if C_N_CHANS = 2 then
    m_axis_adc_data_tdata( C_ADC_BITS * 3 - 1 downto C_ADC_BITS * 2 ) <= adc_data_i1( C_ADC_BITS - 1 downto 0 );
    m_axis_adc_data_tdata( C_ADC_BITS * 4 - 1 downto C_ADC_BITS * 3 ) <= adc_data_q1( C_ADC_BITS - 1 downto 0 );
  end if;
end process; 

end arch_imp;
