-- AES128 SubBytes implementation
-- Copyright (c) 2026 Muhammad Kemal Abizar, Galvin Efrem Lesmana, Hanif Abdul Aziz
-- NOTE 10/11/2026: Belum dicek lagi kesesuaian SBox secara manual
-- NOTE 17/11/2026: Revisi dari "when A = " dan "when B =" menjadi "when" saja, masih belum dites ulang

--	MIT License
--
--	Copyright (c) 2026 KemalAbizar, galvin-cloud, hanifaziz123
--
--	Permission is hereby granted, free of charge, to any person obtaining a copy
--	of this software and associated documentation files (the "Software"), to deal
--	in the Software without restriction, including without limitation the rights
--	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
--	copies of the Software, and to permit persons to whom the Software is
--	furnished to do so, subject to the following conditions:
--
--	The above copyright notice and this permission notice shall be included in all
--	copies or substantial portions of the Software.
--
--	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
--	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
--	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
--	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
--	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
--	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
--	SOFTWARE.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity AES128_SubBytes is port (
	X : in std_logic_vector (7 downto 0);
	Y : out std_logic_vector (7 downto 0)
); end entity AES128_SubBytes;

architecture RTL of AES128_SubBytes is
	signal A : std_logic_vector (3 downto 0);
	signal B : std_logic_vector (3 downto 0);
	signal C : std_logic_vector (7 downto 0);
begin
	process (A, B, C) begin
		A <= X (7 downto 4);
		B <= X (3 downto 0);
		case B is
			when "0000" =>
				case A is
					when "0000" => C <= x"63";
					when "0001" => C <= x"CA";
					when "0010" => C <= x"B7";
					when "0011" => C <= x"04";
					when "0100" => C <= x"09";
					when "0101" => C <= x"53";
					when "0110" => C <= x"D0";
					when "0111" => C <= x"51";
					when "1000" => C <= x"CD";
					when "1001" => C <= x"60";
					when "1010" => C <= x"E0";
					when "1011" => C <= x"E7";
					when "1100" => C <= x"BA";
					when "1101" => C <= x"70";
					when "1110" => C <= x"E1";
					when "1111" => C <= x"8C";
				end case;
			when "0001" =>
				case A is
					when "0000" => C <= x"7C";
					when "0001" => C <= x"82";
					when "0010" => C <= x"FD";
					when "0011" => C <= x"C7";
					when "0100" => C <= x"83";
					when "0101" => C <= x"D1";
					when "0110" => C <= x"EF";
					when "0111" => C <= x"A3";
					when "1000" => C <= x"0C";
					when "1001" => C <= x"81";
					when "1010" => C <= x"32";
					when "1011" => C <= x"C8";
					when "1100" => C <= x"78";
					when "1101" => C <= x"3E";
					when "1110" => C <= x"F8";
					when "1111" => C <= x"A1";
				end case;
			when "0010" =>
				case A is
					when "0000" => C <= x"77";
					when "0001" => C <= x"C9";
					when "0010" => C <= x"93";
					when "0011" => C <= x"23";
					when "0100" => C <= x"2C";
					when "0101" => C <= x"00";
					when "0110" => C <= x"AA";
					when "0111" => C <= x"40";
					when "1000" => C <= x"13";
					when "1001" => C <= x"4F";
					when "1010" => C <= x"3A";
					when "1011" => C <= x"37";
					when "1100" => C <= x"25";
					when "1101" => C <= x"B5";
					when "1110" => C <= x"98";
					when "1111" => C <= x"89";
				end case;
			when "0011" =>
				case A is
					when "0000" => C <= x"7B";
					when "0001" => C <= x"7D";
					when "0010" => C <= x"26";
					when "0011" => C <= x"C3";
					when "0100" => C <= x"1A";
					when "0101" => C <= x"ED";
					when "0110" => C <= x"FB";
					when "0111" => C <= x"8F";
					when "1000" => C <= x"EC";
					when "1001" => C <= x"DC";
					when "1010" => C <= x"0A";
					when "1011" => C <= x"6D";
					when "1100" => C <= x"2E";
					when "1101" => C <= x"66";
					when "1110" => C <= x"11";
					when "1111" => C <= x"0D";
				end case;
			when "0100" =>
				case A is
					when "0000" => C <= x"F2";
					when "0001" => C <= x"FA";
					when "0010" => C <= x"36";
					when "0011" => C <= x"18";
					when "0100" => C <= x"1B";
					when "0101" => C <= x"20";
					when "0110" => C <= x"43";
					when "0111" => C <= x"92";
					when "1000" => C <= x"5F";
					when "1001" => C <= x"22";
					when "1010" => C <= x"49";
					when "1011" => C <= x"8D";
					when "1100" => C <= x"1C";
					when "1101" => C <= x"48";
					when "1110" => C <= x"69";
					when "1111" => C <= x"BF";
				end case;
			when "0101" =>
				case A is
					when "0000" => C <= x"6B";
					when "0001" => C <= x"59";
					when "0010" => C <= x"3F";
					when "0011" => C <= x"96";
					when "0100" => C <= x"6E";
					when "0101" => C <= x"FC";
					when "0110" => C <= x"4D";
					when "0111" => C <= x"9D";
					when "1000" => C <= x"97";
					when "1001" => C <= x"2A";
					when "1010" => C <= x"06";
					when "1011" => C <= x"D5";
					when "1100" => C <= x"A6";
					when "1101" => C <= x"03";
					when "1110" => C <= x"D9";
					when "1111" => C <= x"E6";
				end case;
			when "0110" =>
				case A is
					when "0000" => C <= x"6F";
					when "0001" => C <= x"47";
					when "0010" => C <= x"F7";
					when "0011" => C <= x"05";
					when "0100" => C <= x"5A";
					when "0101" => C <= x"B1";
					when "0110" => C <= x"33";
					when "0111" => C <= x"38";
					when "1000" => C <= x"44";
					when "1001" => C <= x"90";
					when "1010" => C <= x"24";
					when "1011" => C <= x"4E";
					when "1100" => C <= x"B4";
					when "1101" => C <= x"F6";
					when "1110" => C <= x"8E";
					when "1111" => C <= x"42";
				end case;
			when "0111" =>
				case A is
					when "0000" => C <= x"C5";
					when "0001" => C <= x"F0";
					when "0010" => C <= x"CC";
					when "0011" => C <= x"9A";
					when "0100" => C <= x"A0";
					when "0101" => C <= x"5B";
					when "0110" => C <= x"85";
					when "0111" => C <= x"F5";
					when "1000" => C <= x"16";
					when "1001" => C <= x"88";
					when "1010" => C <= x"5C";
					when "1011" => C <= x"A9";
					when "1100" => C <= x"C6";
					when "1101" => C <= x"0E";
					when "1110" => C <= x"94";
					when "1111" => C <= x"68";
				end case;
			when "1000" =>
				case A is
					when "0000" => C <= x"30";
					when "0001" => C <= x"AD";
					when "0010" => C <= x"34";
					when "0011" => C <= x"07";
					when "0100" => C <= x"52";
					when "0101" => C <= x"6A";
					when "0110" => C <= x"45";
					when "0111" => C <= x"BC";
					when "1000" => C <= x"C4";
					when "1001" => C <= x"46";
					when "1010" => C <= x"C2";
					when "1011" => C <= x"6C";
					when "1100" => C <= x"E8";
					when "1101" => C <= x"61";
					when "1110" => C <= x"9B";
					when "1111" => C <= x"41";
				end case;
			when "1001" =>
				case A is
					when "0000" => C <= x"01";
					when "0001" => C <= x"D4";
					when "0010" => C <= x"A5";
					when "0011" => C <= x"12";
					when "0100" => C <= x"3B";
					when "0101" => C <= x"CB";
					when "0110" => C <= x"F9";
					when "0111" => C <= x"B6";
					when "1000" => C <= x"A7";
					when "1001" => C <= x"EE";
					when "1010" => C <= x"D3";
					when "1011" => C <= x"56";
					when "1100" => C <= x"DD";
					when "1101" => C <= x"35";
					when "1110" => C <= x"1E";
					when "1111" => C <= x"99";
				end case;
			when "1010" =>
				case A is
					when "0000" => C <= x"67";
					when "0001" => C <= x"A2";
					when "0010" => C <= x"E5";
					when "0011" => C <= x"80";
					when "0100" => C <= x"D6";
					when "0101" => C <= x"BE";
					when "0110" => C <= x"02";
					when "0111" => C <= x"DA";
					when "1000" => C <= x"7E";
					when "1001" => C <= x"B8";
					when "1010" => C <= x"AC";
					when "1011" => C <= x"F4";
					when "1100" => C <= x"74";
					when "1101" => C <= x"57";
					when "1110" => C <= x"87";
					when "1111" => C <= x"2D";
				end case;
			when "1011" =>
				case A is
					when "0000" => C <= x"2B";
					when "0001" => C <= x"AF";
					when "0010" => C <= x"F1";
					when "0011" => C <= x"E2";
					when "0100" => C <= x"B3";
					when "0101" => C <= x"39";
					when "0110" => C <= x"7F";
					when "0111" => C <= x"21";
					when "1000" => C <= x"3D";
					when "1001" => C <= x"14";
					when "1010" => C <= x"62";
					when "1011" => C <= x"EA";
					when "1100" => C <= x"1F";
					when "1101" => C <= x"B9";
					when "1110" => C <= x"E9";
					when "1111" => C <= x"0F";
				end case;
			when "1100" =>
				case A is
					when "0000" => C <= x"FE";
					when "0001" => C <= x"9C";
					when "0010" => C <= x"71";
					when "0011" => C <= x"EB";
					when "0100" => C <= x"29";
					when "0101" => C <= x"4A";
					when "0110" => C <= x"50";
					when "0111" => C <= x"10";
					when "1000" => C <= x"64";
					when "1001" => C <= x"DE";
					when "1010" => C <= x"91";
					when "1011" => C <= x"65";
					when "1100" => C <= x"4B";
					when "1101" => C <= x"86";
					when "1110" => C <= x"CE";
					when "1111" => C <= x"B0";
				end case;
			when "1101" =>
				case A is
					when "0000" => C <= x"D7";
					when "0001" => C <= x"A4";
					when "0010" => C <= x"D8";
					when "0011" => C <= x"27";
					when "0100" => C <= x"E3";
					when "0101" => C <= x"4C";
					when "0110" => C <= x"3C";
					when "0111" => C <= x"FF";
					when "1000" => C <= x"5D";
					when "1001" => C <= x"5E";
					when "1010" => C <= x"95";
					when "1011" => C <= x"7A";
					when "1100" => C <= x"BD";
					when "1101" => C <= x"C1";
					when "1110" => C <= x"55";
					when "1111" => C <= x"54";
				end case;
			when "1110" =>
				case A is
					when "0000" => C <= x"AB";
					when "0001" => C <= x"72";
					when "0010" => C <= x"31";
					when "0011" => C <= x"B2";
					when "0100" => C <= x"2F";
					when "0101" => C <= x"58";
					when "0110" => C <= x"9F";
					when "0111" => C <= x"F3";
					when "1000" => C <= x"19";
					when "1001" => C <= x"0B";
					when "1010" => C <= x"E4";
					when "1011" => C <= x"AE";
					when "1100" => C <= x"8B";
					when "1101" => C <= x"1D";
					when "1110" => C <= x"28";
					when "1111" => C <= x"BB";
				end case;
			when "1111" =>
				case A is
					when "0000" => C <= x"76";
					when "0001" => C <= x"C0";
					when "0010" => C <= x"15";
					when "0011" => C <= x"75";
					when "0100" => C <= x"84";
					when "0101" => C <= x"CF";
					when "0110" => C <= x"A8";
					when "0111" => C <= x"D2";
					when "1000" => C <= x"73";
					when "1001" => C <= x"DB";
					when "1010" => C <= x"79";
					when "1011" => C <= x"08";
					when "1100" => C <= x"8A";
					when "1101" => C <= x"9E";
					when "1110" => C <= x"DF";
					when "1111" => C <= x"16";
				end case;
		end case;
		Y <= C;
	end process;
end architecture RTL;