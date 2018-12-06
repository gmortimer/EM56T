library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FFT_Config_v1_0 is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Master Bus Interface M00_AXIS
		C_M00_AXIS_TDATA_WIDTH	: integer	:= 24
	);
	port (
		-- Users to add ports here
        fft_cfg_data            : in  std_logic_vector(C_M00_AXIS_TDATA_WIDTH-1 downto 0);
        fft_cfg_en              : in  std_logic;
        fft_reset_in            : in  std_logic;
        fft_aresetn             : out std_logic;
        fft_cfg_done            : out std_logic;
		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Master Bus Interface M00_AXIS
		aclk	                : in std_logic;
		aresetn	                : in std_logic;
		m_axis_config_tvalid	: out std_logic;
		m_axis_config_tdata	    : out std_logic_vector(C_M00_AXIS_TDATA_WIDTH-1 downto 0);
		m_axis_config_tready	: in std_logic
	);        
end FFT_Config_v1_0;

architecture arch_imp of FFT_Config_v1_0 is

    type T_CFG_STATE is (CFG_IDLE, CFG_TX_FFT);
    signal cfg_state : T_CFG_STATE;

    signal fft_aresetn_i          : std_logic;
    signal fft_cfg_done_i         : std_logic;

    signal fft_cfg_t              : std_logic;
    signal fft_cfg_f              : std_logic;

begin


	-- Add user logic here
    m_axis_config_tdata    <= fft_cfg_data;
    m_axis_config_tvalid   <= '1' when (cfg_state = CFG_TX_FFT) else '0';

    fft_aresetn_i          <= '0' when ((aresetn = '0') or (fft_reset_in = '1')) else '1';
    fft_aresetn            <= fft_aresetn_i; 
    fft_cfg_done           <= fft_cfg_done_i;
 
    CFG_FFT_CMD_p : process ( m00_axis_aclk )
      begin
        if rising_edge( m00_axis_aclk ) then
          if (fft_aresetn_i = '0') then
            fft_cfg_t <= '0';
            fft_cfg_f <= '0';
          else
            fft_cfg_t <= fft_cfg_en;
            fft_cfg_f <= '0';
            if (fft_cfg_en = '1') and (fft_cfg_t = '0') then
              fft_cfg_f <= '1';
            end if;
          end if;
        end if;     
      end process;

    CFG_FFT_p : process ( m00_axis_aclk )
      begin
        if rising_edge( m00_axis_aclk ) then
          if (fft_aresetn_i = '0') then
            cfg_state          <= CFG_IDLE;
            fft_cfg_done_i     <= '0';
                         
          else 
            case cfg_state is
            
              when CFG_IDLE =>
                if (fft_cfg_f = '1') then
                  fft_cfg_done_i    <= '0';
                  cfg_state         <= CFG_TX_FFT;
                end if;
                
              when CFG_TX_FFT =>
                if (m_axis_config_tready = '1') then
                  fft_cfg_done_i    <= '1';
                  cfg_state         <= CFG_IDLE;
                end if; 

              when others =>
                null;

            end case;
          end if;
        end if;
      end process;

	-- User logic ends

end arch_imp;
