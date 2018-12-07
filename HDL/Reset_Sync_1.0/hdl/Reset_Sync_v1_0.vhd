library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Reset_Sync_v1_0 is
    generic (
      C_EN_RSTN_I : boolean := true;
      C_EN_RSTP_I : boolean := true;
      C_EN_RSTN_O : boolean := true;
      C_EN_RSTP_O : boolean := true
    );
    port (
      aclk	      : in  std_logic;
      resetn_in   : in  std_logic := '1';
      resetp_in   : in  std_logic := '0';
      resetn_out  : out std_logic;
      resetp_out  : out std_logic
    );
end Reset_Sync_v1_0;

architecture rtl of Reset_Sync_v1_0 is
component Reset_Sync is  
  port (
    RSTN_I     : in  std_logic;
    RSTP_I     : in  std_logic;
    RSTN_O     : out std_logic;
    RSTP_O     : out std_logic;
    CLK        : in  std_logic
  ); 
end component Reset_Sync;

begin

reset_sync_i : Reset_Sync
  port map (
    RSTN_I     => resetn_in,
    RSTP_I     => resetp_in,
    RSTN_O     => resetn_out,
    RSTP_O     => resetp_out,
    CLK        => aclk
  );

end rtl;
