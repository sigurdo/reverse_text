library IEEE;
use IEEE.std_logic_1164.all;

entity reverse_string is
	generic (
    	length : integer
    );
	port (
    	input_string : in string(0 to length-1);
        output_string : out string(0 to length-1)
    );
end entity;

architecture rtl of reverse_string is
begin
	reverse_g : for i in input_string'range generate
    	output_string(i) <= input_string(input_string'length-1 - i);
    end generate;
end architecture;


library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.all;

entity reverse_string_tb is
	generic (
		to_reverse : string := "<sett inn tekst her>"
    );
end entity;

architecture rtl of reverse_string_tb is
	signal input_string : string(0 to to_reverse'length-1);
    signal output_string : string(0 to to_reverse'length-1);
begin
	dut : entity reverse_string
    	generic map (
        	length => to_reverse'length
        )
    	port map (
        	input_string => input_string,
            output_string => output_string
        );

    print_p : process
    begin
    	input_string <= to_reverse;
        wait for 1 ns;
    	report output_string;
        wait;
    end process;
end architecture;
