library ieee;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.emm_telsys.all;
 
entity bitsel_v1_0 is
	generic ( 
	
		-- Users to add parameters here
		C_INPUT_SIZE   : integer   := 32;
		
        C_BIT_SEL_0  : integer range 0 to 2 := 0;
        C_BIT_SEL_1  : integer range 0 to 2 := 0;
        C_BIT_SEL_2  : integer range 0 to 2 := 0;
        C_BIT_SEL_3  : integer range 0 to 2 := 0;
        C_BIT_SEL_4  : integer range 0 to 2 := 0;
        C_BIT_SEL_5  : integer range 0 to 2 := 0;
        C_BIT_SEL_6  : integer range 0 to 2 := 0;
        C_BIT_SEL_7  : integer range 0 to 2 := 0;
        C_BIT_SEL_8  : integer range 0 to 2 := 0;
        C_BIT_SEL_9  : integer range 0 to 2 := 0;
        C_BIT_SEL_10 : integer range 0 to 2 := 0;
        C_BIT_SEL_11 : integer range 0 to 2 := 0;
        C_BIT_SEL_12 : integer range 0 to 2 := 0;
        C_BIT_SEL_13 : integer range 0 to 2 := 0;
        C_BIT_SEL_14 : integer range 0 to 2 := 0;
        C_BIT_SEL_15 : integer range 0 to 2 := 0;
        C_BIT_SEL_16 : integer range 0 to 2 := 0;
        C_BIT_SEL_17 : integer range 0 to 2 := 0;
        C_BIT_SEL_18 : integer range 0 to 2 := 0;
        C_BIT_SEL_19 : integer range 0 to 2 := 0;
        C_BIT_SEL_20 : integer range 0 to 2 := 0;
        C_BIT_SEL_21 : integer range 0 to 2 := 0;
        C_BIT_SEL_22 : integer range 0 to 2 := 0;
        C_BIT_SEL_23 : integer range 0 to 2 := 0;
        C_BIT_SEL_24 : integer range 0 to 2 := 0;
        C_BIT_SEL_25 : integer range 0 to 2 := 0;
        C_BIT_SEL_26 : integer range 0 to 2 := 0;
        C_BIT_SEL_27 : integer range 0 to 2 := 0;
        C_BIT_SEL_28 : integer range 0 to 2 := 0;
        C_BIT_SEL_29 : integer range 0 to 2 := 0;
        C_BIT_SEL_30 : integer range 0 to 2 := 0;
        C_BIT_SEL_31 : integer range 0 to 2 := 0;
        C_BIT_SEL_32 : integer range 0 to 2 := 0;
        C_BIT_SEL_33 : integer range 0 to 2 := 0;
        C_BIT_SEL_34 : integer range 0 to 2 := 0;
        C_BIT_SEL_35 : integer range 0 to 2 := 0;
        C_BIT_SEL_36 : integer range 0 to 2 := 0;
        C_BIT_SEL_37 : integer range 0 to 2 := 0;
        C_BIT_SEL_38 : integer range 0 to 2 := 0;
        C_BIT_SEL_39 : integer range 0 to 2 := 0;
        C_BIT_SEL_40 : integer range 0 to 2 := 0;
        C_BIT_SEL_41 : integer range 0 to 2 := 0;
        C_BIT_SEL_42 : integer range 0 to 2 := 0;
        C_BIT_SEL_43 : integer range 0 to 2 := 0;
        C_BIT_SEL_44 : integer range 0 to 2 := 0;
        C_BIT_SEL_45 : integer range 0 to 2 := 0;
        C_BIT_SEL_46 : integer range 0 to 2 := 0;
        C_BIT_SEL_47 : integer range 0 to 2 := 0;
        C_BIT_SEL_48 : integer range 0 to 2 := 0;
        C_BIT_SEL_49 : integer range 0 to 2 := 0;
        C_BIT_SEL_50 : integer range 0 to 2 := 0;
        C_BIT_SEL_51 : integer range 0 to 2 := 0;
        C_BIT_SEL_52 : integer range 0 to 2 := 0;
        C_BIT_SEL_53 : integer range 0 to 2 := 0;
        C_BIT_SEL_54 : integer range 0 to 2 := 0;
        C_BIT_SEL_55 : integer range 0 to 2 := 0;
        C_BIT_SEL_56 : integer range 0 to 2 := 0;
        C_BIT_SEL_57 : integer range 0 to 2 := 0;
        C_BIT_SEL_58 : integer range 0 to 2 := 0;
        C_BIT_SEL_59 : integer range 0 to 2 := 0;
        C_BIT_SEL_60 : integer range 0 to 2 := 0;
        C_BIT_SEL_61 : integer range 0 to 2 := 0;
        C_BIT_SEL_62 : integer range 0 to 2 := 0;
        C_BIT_SEL_63 : integer range 0 to 2 := 0;
 
        C_BIT_EN_0  : boolean := true;
        C_BIT_EN_1  : boolean := false;
        C_BIT_EN_2  : boolean := false;
        C_BIT_EN_3  : boolean := false;
        C_BIT_EN_4  : boolean := false;
        C_BIT_EN_5  : boolean := false;
        C_BIT_EN_6  : boolean := false;
        C_BIT_EN_7  : boolean := false;
        C_BIT_EN_8  : boolean := false;
        C_BIT_EN_9  : boolean := false;
        C_BIT_EN_10 : boolean := false;
        C_BIT_EN_11 : boolean := false;
        C_BIT_EN_12 : boolean := false;
        C_BIT_EN_13 : boolean := false;
        C_BIT_EN_14 : boolean := false;
        C_BIT_EN_15 : boolean := false;
        C_BIT_EN_16 : boolean := false;
        C_BIT_EN_17 : boolean := false;
        C_BIT_EN_18 : boolean := false;
        C_BIT_EN_19 : boolean := false;
        C_BIT_EN_20 : boolean := false;
        C_BIT_EN_21 : boolean := false;
        C_BIT_EN_22 : boolean := false;
        C_BIT_EN_23 : boolean := false;
        C_BIT_EN_24 : boolean := false;
        C_BIT_EN_25 : boolean := false;
        C_BIT_EN_26 : boolean := false;
        C_BIT_EN_27 : boolean := false;
        C_BIT_EN_28 : boolean := false;
        C_BIT_EN_29 : boolean := false;
        C_BIT_EN_30 : boolean := false;
        C_BIT_EN_31 : boolean := false;
        C_BIT_EN_32 : boolean := false;
        C_BIT_EN_33 : boolean := false;
        C_BIT_EN_34 : boolean := false;
        C_BIT_EN_35 : boolean := false;
        C_BIT_EN_36 : boolean := false;
        C_BIT_EN_37 : boolean := false;
        C_BIT_EN_38 : boolean := false;
        C_BIT_EN_39 : boolean := false;
        C_BIT_EN_40 : boolean := false;
        C_BIT_EN_41 : boolean := false;
        C_BIT_EN_42 : boolean := false;
        C_BIT_EN_43 : boolean := false;
        C_BIT_EN_44 : boolean := false;
        C_BIT_EN_45 : boolean := false;
        C_BIT_EN_46 : boolean := false;
        C_BIT_EN_47 : boolean := false;
        C_BIT_EN_48 : boolean := false;
        C_BIT_EN_49 : boolean := false;
        C_BIT_EN_50 : boolean := false;
        C_BIT_EN_51 : boolean := false;
        C_BIT_EN_52 : boolean := false;
        C_BIT_EN_53 : boolean := false;
        C_BIT_EN_54 : boolean := false;
        C_BIT_EN_55 : boolean := false;
        C_BIT_EN_56 : boolean := false;
        C_BIT_EN_57 : boolean := false;
        C_BIT_EN_58 : boolean := false;
        C_BIT_EN_59 : boolean := false;
        C_BIT_EN_60 : boolean := false;
        C_BIT_EN_61 : boolean := false;
        C_BIT_EN_62 : boolean := false;
        C_BIT_EN_63 : boolean := false;

 
        C_BUS_0_SEL    : boolean := false;
        C_BUS_0_LEFT   : integer := 0;
        C_BUS_0_RIGHT  : integer := 0;
        C_BUS_1_SEL    : boolean := false;
        C_BUS_1_LEFT   : integer := 0;
        C_BUS_1_RIGHT  : integer := 0;
        C_BUS_2_SEL    : boolean := false;
        C_BUS_2_LEFT   : integer := 0;
        C_BUS_2_RIGHT  : integer := 0;
        C_BUS_3_SEL    : boolean := false;
        C_BUS_3_LEFT   : integer := 0;
        C_BUS_3_RIGHT  : integer := 0
	 );
	port ( 
        d     : in  std_logic_vector( C_INPUT_SIZE - 1 downto 0 ) := ( others => '0' );
        d0    : out std_logic;
        d1    : out std_logic;
        d2    : out std_logic;
        d3    : out std_logic;
        d4    : out std_logic;
        d5    : out std_logic;
        d6    : out std_logic;
        d7    : out std_logic;
        d8    : out std_logic;
        d9    : out std_logic;
        d10   : out std_logic;
        d11   : out std_logic;
        d12   : out std_logic;
        d13   : out std_logic;
        d14   : out std_logic;
        d15   : out std_logic;
        d16   : out std_logic;
        d17   : out std_logic;
        d18   : out std_logic;
        d19   : out std_logic;
        d20   : out std_logic;
        d21   : out std_logic;
        d22   : out std_logic;
        d23   : out std_logic;
        d24   : out std_logic;
        d25   : out std_logic;
        d26   : out std_logic;
        d27   : out std_logic;
        d28   : out std_logic;
        d29   : out std_logic;
        d30   : out std_logic;
        d31   : out std_logic;
        d32   : out std_logic;
        d33   : out std_logic;
        d34   : out std_logic;
        d35   : out std_logic;
        d36   : out std_logic;
        d37   : out std_logic;
        d38   : out std_logic;
        d39   : out std_logic;
        d40   : out std_logic;
        d41   : out std_logic;
        d42   : out std_logic;
        d43   : out std_logic;
        d44   : out std_logic;
        d45   : out std_logic;
        d46   : out std_logic;
        d47   : out std_logic;
        d48   : out std_logic;
        d49   : out std_logic;
        d50   : out std_logic;
        d51   : out std_logic;
        d52   : out std_logic;
        d53   : out std_logic;
        d54   : out std_logic;
        d55   : out std_logic;
        d56   : out std_logic;
        d57   : out std_logic;
        d58   : out std_logic;
        d59   : out std_logic;
        d60   : out std_logic;
        d61   : out std_logic;
        d62   : out std_logic;
        d63   : out std_logic;
           
        bus0  : out std_logic_vector( C_BUS_0_LEFT downto C_BUS_0_RIGHT );
        bus1  : out std_logic_vector( C_BUS_1_LEFT downto C_BUS_1_RIGHT );
        bus2  : out std_logic_vector( C_BUS_2_LEFT downto C_BUS_2_RIGHT );
        bus3  : out std_logic_vector( C_BUS_3_LEFT downto C_BUS_3_RIGHT )

            

	 );
end bitsel_v1_0;

architecture arch_imp of bitsel_v1_0 is
 
    function bit_def_msk( sel : integer range 0 to 3 ) return std_logic is
    begin
      case sel is
        when 0 =>
          return '1';
        when 1 =>
          return '0';
        when 2 =>
          return '1';
        when others =>
          return '0';
      end case;
    end bit_def_msk;

    function bit_def_set( sel : integer range 0 to 3 ) return std_logic is
    begin
      case sel is
        when 0 =>
          return '0';
        when 1 =>
          return '0';
        when 2 =>
          return '1';
        when others =>
          return '0';
      end case;
    end bit_def_set;



    constant C_BIT_DEF_MSK : std_logic_vector( 63 downto 0 ) := 
               bit_def_msk ( C_BIT_SEL_63 ) &
               bit_def_msk ( C_BIT_SEL_62 ) &
               bit_def_msk ( C_BIT_SEL_61 ) &
               bit_def_msk ( C_BIT_SEL_60 ) &
               bit_def_msk ( C_BIT_SEL_59 ) &
               bit_def_msk ( C_BIT_SEL_58 ) &
               bit_def_msk ( C_BIT_SEL_57 ) &
               bit_def_msk ( C_BIT_SEL_56 ) &
               bit_def_msk ( C_BIT_SEL_55 ) &
               bit_def_msk ( C_BIT_SEL_54 ) &
               bit_def_msk ( C_BIT_SEL_53 ) &
               bit_def_msk ( C_BIT_SEL_52 ) &
               bit_def_msk ( C_BIT_SEL_51 ) &
               bit_def_msk ( C_BIT_SEL_50 ) &
               bit_def_msk ( C_BIT_SEL_49 ) &
               bit_def_msk ( C_BIT_SEL_48 ) &
               bit_def_msk ( C_BIT_SEL_47 ) &
               bit_def_msk ( C_BIT_SEL_46 ) &
               bit_def_msk ( C_BIT_SEL_45 ) &
               bit_def_msk ( C_BIT_SEL_44 ) &
               bit_def_msk ( C_BIT_SEL_43 ) &
               bit_def_msk ( C_BIT_SEL_42 ) &
               bit_def_msk ( C_BIT_SEL_41 ) &
               bit_def_msk ( C_BIT_SEL_40 ) &
               bit_def_msk ( C_BIT_SEL_39 ) &
               bit_def_msk ( C_BIT_SEL_38 ) &
               bit_def_msk ( C_BIT_SEL_37 ) &
               bit_def_msk ( C_BIT_SEL_36 ) &
               bit_def_msk ( C_BIT_SEL_35 ) &
               bit_def_msk ( C_BIT_SEL_34 ) &
               bit_def_msk ( C_BIT_SEL_33 ) &
               bit_def_msk ( C_BIT_SEL_32 ) &
               bit_def_msk ( C_BIT_SEL_31 ) &
               bit_def_msk ( C_BIT_SEL_30 ) &
               bit_def_msk ( C_BIT_SEL_29 ) &
               bit_def_msk ( C_BIT_SEL_28 ) &
               bit_def_msk ( C_BIT_SEL_27 ) &
               bit_def_msk ( C_BIT_SEL_26 ) &
               bit_def_msk ( C_BIT_SEL_25 ) &
               bit_def_msk ( C_BIT_SEL_24 ) &
               bit_def_msk ( C_BIT_SEL_23 ) &
               bit_def_msk ( C_BIT_SEL_22 ) &
               bit_def_msk ( C_BIT_SEL_21 ) &
               bit_def_msk ( C_BIT_SEL_20 ) &
               bit_def_msk ( C_BIT_SEL_19 ) &
               bit_def_msk ( C_BIT_SEL_18 ) &
               bit_def_msk ( C_BIT_SEL_17 ) &
               bit_def_msk ( C_BIT_SEL_16 ) &
               bit_def_msk ( C_BIT_SEL_15 ) &
               bit_def_msk ( C_BIT_SEL_14 ) &
               bit_def_msk ( C_BIT_SEL_13 ) &
               bit_def_msk ( C_BIT_SEL_12 ) &
               bit_def_msk ( C_BIT_SEL_11 ) &
               bit_def_msk ( C_BIT_SEL_10 ) &
               bit_def_msk ( C_BIT_SEL_9  ) &
               bit_def_msk ( C_BIT_SEL_8  ) &
               bit_def_msk ( C_BIT_SEL_7  ) &
               bit_def_msk ( C_BIT_SEL_6  ) &
               bit_def_msk ( C_BIT_SEL_5  ) &
               bit_def_msk ( C_BIT_SEL_4  ) &
               bit_def_msk ( C_BIT_SEL_3  ) &
               bit_def_msk ( C_BIT_SEL_2  ) &
               bit_def_msk ( C_BIT_SEL_1  ) &
               bit_def_msk ( C_BIT_SEL_0  );
               
    constant C_BIT_DEF_SET : std_logic_vector( 63 downto 0 ) := 
               bit_def_set ( C_BIT_SEL_63 ) &
               bit_def_set ( C_BIT_SEL_62 ) &
               bit_def_set ( C_BIT_SEL_61 ) &
               bit_def_set ( C_BIT_SEL_60 ) &
               bit_def_set ( C_BIT_SEL_59 ) &
               bit_def_set ( C_BIT_SEL_58 ) &
               bit_def_set ( C_BIT_SEL_57 ) &
               bit_def_set ( C_BIT_SEL_56 ) &
               bit_def_set ( C_BIT_SEL_55 ) &
               bit_def_set ( C_BIT_SEL_54 ) &
               bit_def_set ( C_BIT_SEL_53 ) &
               bit_def_set ( C_BIT_SEL_52 ) &
               bit_def_set ( C_BIT_SEL_51 ) &
               bit_def_set ( C_BIT_SEL_50 ) &
               bit_def_set ( C_BIT_SEL_49 ) &
               bit_def_set ( C_BIT_SEL_48 ) &
               bit_def_set ( C_BIT_SEL_47 ) &
               bit_def_set ( C_BIT_SEL_46 ) &
               bit_def_set ( C_BIT_SEL_45 ) &
               bit_def_set ( C_BIT_SEL_44 ) &
               bit_def_set ( C_BIT_SEL_43 ) &
               bit_def_set ( C_BIT_SEL_42 ) &
               bit_def_set ( C_BIT_SEL_41 ) &
               bit_def_set ( C_BIT_SEL_40 ) &
               bit_def_set ( C_BIT_SEL_39 ) &
               bit_def_set ( C_BIT_SEL_38 ) &
               bit_def_set ( C_BIT_SEL_37 ) &
               bit_def_set ( C_BIT_SEL_36 ) &
               bit_def_set ( C_BIT_SEL_35 ) &
               bit_def_set ( C_BIT_SEL_34 ) &
               bit_def_set ( C_BIT_SEL_33 ) &
               bit_def_set ( C_BIT_SEL_32 ) &
               bit_def_set ( C_BIT_SEL_31 ) &
               bit_def_set ( C_BIT_SEL_30 ) &
               bit_def_set ( C_BIT_SEL_29 ) &
               bit_def_set ( C_BIT_SEL_28 ) &
               bit_def_set ( C_BIT_SEL_27 ) &
               bit_def_set ( C_BIT_SEL_26 ) &
               bit_def_set ( C_BIT_SEL_25 ) &
               bit_def_set ( C_BIT_SEL_24 ) &
               bit_def_set ( C_BIT_SEL_23 ) &
               bit_def_set ( C_BIT_SEL_22 ) &
               bit_def_set ( C_BIT_SEL_21 ) &
               bit_def_set ( C_BIT_SEL_20 ) &
               bit_def_set ( C_BIT_SEL_19 ) &
               bit_def_set ( C_BIT_SEL_18 ) &
               bit_def_set ( C_BIT_SEL_17 ) &
               bit_def_set ( C_BIT_SEL_16 ) &
               bit_def_set ( C_BIT_SEL_15 ) &
               bit_def_set ( C_BIT_SEL_14 ) &
               bit_def_set ( C_BIT_SEL_13 ) &
               bit_def_set ( C_BIT_SEL_12 ) &
               bit_def_set ( C_BIT_SEL_11 ) &
               bit_def_set ( C_BIT_SEL_10 ) &
               bit_def_set ( C_BIT_SEL_9  ) &
               bit_def_set ( C_BIT_SEL_8  ) &
               bit_def_set ( C_BIT_SEL_7  ) &
               bit_def_set ( C_BIT_SEL_6  ) &
               bit_def_set ( C_BIT_SEL_5  ) &
               bit_def_set ( C_BIT_SEL_4  ) &
               bit_def_set ( C_BIT_SEL_3  ) &
               bit_def_set ( C_BIT_SEL_2  ) &
               bit_def_set ( C_BIT_SEL_1  ) &
               bit_def_set ( C_BIT_SEL_0  );
 
    signal d_i    : std_logic_vector( 63 downto 0 );

begin

    d_i <= (( zeros( 64 - d'length ) & d ) or C_BIT_DEF_SET ) and C_BIT_DEF_MSK;
    
    process (  d_i  )
    begin
      d0  <= d_i( 0  );
      d1  <= d_i( 1  );
      d2  <= d_i( 2  );
      d3  <= d_i( 3  );
      d4  <= d_i( 4  );
      d5  <= d_i( 5  );
      d6  <= d_i( 6  );
      d7  <= d_i( 7  );
      d8  <= d_i( 8  );
      d9  <= d_i( 9  );
      d10 <= d_i( 10 );
      d11 <= d_i( 11 );
      d12 <= d_i( 12 );
      d13 <= d_i( 13 );
      d14 <= d_i( 14 );
      d15 <= d_i( 15 );
      d16 <= d_i( 16 );
      d17 <= d_i( 17 );
      d18 <= d_i( 18 );
      d19 <= d_i( 19 );
      d20 <= d_i( 20 );
      d21 <= d_i( 21 );
      d22 <= d_i( 22 );
      d23 <= d_i( 23 );
      d24 <= d_i( 24 );
      d25 <= d_i( 25 );
      d26 <= d_i( 26 );
      d27 <= d_i( 27 );
      d28 <= d_i( 28 );
      d29 <= d_i( 29 );
      d30 <= d_i( 30 );
      d31 <= d_i( 31 );
      d32 <= d_i( 32 );
      d33 <= d_i( 33 );
      d34 <= d_i( 34 );
      d35 <= d_i( 35 );
      d36 <= d_i( 36 );
      d37 <= d_i( 37 );
      d38 <= d_i( 38 );
      d39 <= d_i( 39 );
      d40 <= d_i( 40 );
      d41 <= d_i( 41 );
      d42 <= d_i( 42 );
      d43 <= d_i( 43 );
      d44 <= d_i( 44 );
      d45 <= d_i( 45 );
      d46 <= d_i( 46 );
      d47 <= d_i( 47 );
      d48 <= d_i( 48 );
      d49 <= d_i( 49 );
      d50 <= d_i( 50 );
      d51 <= d_i( 51 );
      d52 <= d_i( 52 );
      d53 <= d_i( 53 );
      d54 <= d_i( 54 );
      d55 <= d_i( 55 );
      d56 <= d_i( 56 );
      d57 <= d_i( 57 );
      d58 <= d_i( 58 );
      d59 <= d_i( 59 );
      d60 <= d_i( 60 );
      d61 <= d_i( 61 );
      d62 <= d_i( 62 );
      d63 <= d_i( 63 );
      
     
      bus0 <= d_i( C_BUS_0_LEFT downto C_BUS_0_RIGHT );
      bus1 <= d_i( C_BUS_1_LEFT downto C_BUS_1_RIGHT );
      bus2 <= d_i( C_BUS_2_LEFT downto C_BUS_2_RIGHT );
      bus3 <= d_i( C_BUS_3_LEFT downto C_BUS_3_RIGHT );
      
    end process;
	-- User logic ends

end arch_imp;