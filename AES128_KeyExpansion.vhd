library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity AES128_KeyExpansion is port (
        keyIn		: in std_logic_vector (127 downto 0);
        roundnum	: in std_logic_vector (3 downto 0);
        keyOut		: out std_logic_vector (127 downto 0)
); end entity AES128_KeyExpansion;

architecture RTL of AES128_KeyExpansion is

component AES128_SBox is port (
	X :	in std_logic_vector (7 downto 0);
	Y : out std_logic_vector (7 downto 0)
); end component AES128_SBox;

	signal W0, W1, W2, W3				: std_logic_vector (31 downto 0);
	signal RotWord, SubWord, Temp		: std_logic_vector (31 downto 0);
	signal RCon							: std_logic_vector (7 downto 0);
	signal newW0, newW1, newW2, newW3	: std_logic_vector (31 downto 0);

begin

	-- Pisah bit di key menjadi Words
	W0 <= keyIn (127 downto 96);
	W1 <= keyIn (95 downto 64);
	W2 <= keyIn (63 downto 32);
	W3 <= keyIn (31 downto 0);

	-- RotWord
	RotWord <= W3 (23 downto 0) & W3 (31 downto 24);

	-- SubWord
	sbox_b0 : AES128_SBox port map (X => RotWord (31 downto 24), Y => SubWord (31 downto 24));
	sbox_b1 : AES128_SBox port map (X => RotWord (23 downto 16), Y => SubWord (23 downto 16));
	sbox_b2 : AES128_SBox port map (X => RotWord (15 downto 8),  Y => SubWord (15 downto 8));
	sbox_b3 : AES128_SBox port map (X => RotWord (7 downto 0),   Y => SubWord (7 downto 0));

	-- RCon
	with roundnum select Rcon <=
		x"01" when "0001",
		x"02" when "0010",
		x"04" when "0011",
		x"08" when "0100",
		x"10" when "0101",
		x"20" when "0110",
		x"40" when "0111",
		x"80" when "1000",
		x"1B" when "1001",
		x"36" when "1010",
		x"00" when others;

	-- Fungsi g
	Temp <= SubWord xor (Rcon & x"000000");

	-- Word baru
	newW0 <= W0 xor Temp;
	newW1 <= W1 xor newW0;
	newW2 <= W2 xor newW1;
	newW3 <= W3 xor newW2;

	-- Hubungkan new word ke output
	keyOut <= newW0 & newW1 & newW2 & newW3;
end architecture RTL;
