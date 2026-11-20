-- AES128 PerColumnMix implementation (version 0.3)
-- Copyright (c) 2026 Muhammad Kemal Abizar, Galvin Efrem Lesmana, Hanif Abdul Aziz
-- NOTE 19/11/2026: Cara kerja program terverifikasi dan sudah diuji benar oleh MultiSim

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

entity AES128_PerColumnMix is port (
	X : in std_logic_vector (31 downto 0);
	Y : out std_logic_vector (31 downto 0)
); end entity AES128_PerColumnMix;

architecture RTL of AES128_PerColumnMix is
	component AES128_MultGF28 port (
		X : in std_logic_vector (7 downto 0);
		Y : out std_logic_vector (7 downto 0)
	); end component AES128_MultGF28;
	signal S_0C : std_logic_vector (7 downto 0);
	signal S_1C : std_logic_vector (7 downto 0);
	signal S_2C : std_logic_vector (7 downto 0);
	signal S_3C : std_logic_vector (7 downto 0);
begin
	XTIMES_0C : AES128_MultGF28 port map (X => X(31 downto 24), Y => S_0C);
	XTIMES_1C : AES128_MultGF28 port map (X => X(23 downto 16), Y => S_1C);
	XTIMES_2C : AES128_MultGF28 port map (X => X(15 downto 8), Y => S_2C);
	XTIMES_3C : AES128_MultGF28 port map (X => X(7 downto 0), Y => S_3C);
	--
	Y (31 downto 24)	<= S_0C xor S_1C xor X(23 downto 16) xor X(15 downto 8) xor X(7 downto 0);
	Y (23 downto 16)	<= X(31 downto 24) xor S_1C xor S_2C xor X(15 downto 8) xor X(7 downto 0);
	Y (15 downto 8)	<= X(31 downto 24) xor X(23 downto 16) xor S_2C xor S_3C xor X(7 downto 0);
	Y (7 downto 0)		<= S_0C xor X(31 downto 24) xor X(23 downto 16) xor X(15 downto 8) xor S_3C;
end architecture RTL;