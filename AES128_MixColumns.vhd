-- AES128 MixColumns implementation
-- Copyright (c) 2026 Muhammad Kemal Abizar, Galvin Efrem Lesmana, Hanif Abdul Aziz
-- Per column operation mode, will be implemented as sequential circuit inside the main thing

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

entity AES128_MixColumns is port (
	X : in std_logic_vector (31 downto 0);
	Y : out std_logic_vector (31 downto 0)
); end entity AES128_MixColumns;

architecture RTL of AES128_MixColumns is
	component AES128_MultGF28 port (
		X : in std_logic_vector (7 downto 0);
		Y : out std_logic_vector (7 downto 0);
	); end component AES128_MultGF28;
	signal C0 : std_logic_vector (7 downto 0);
	signal C1 : std_logic_vector (7 downto 0);
	signal C2 : std_logic_vector (7 downto 0);
	signal C3 : std_logic_vector (7 downto 0);
	signal C4 : std_logic_vector (7 downto 0);
	signal C5 : std_logic_vector (7 downto 0);
	signal C6 : std_logic_vector (7 downto 0);
	signal C7 : std_logic_vector (7 downto 0);
begin
	MultGF28_0 : AES128_MultGF28 port map (X => X(31 downto 24), Y => C0);
	MultGF28_0 : AES128_MultGF28 port map (X => X(23 downto 16), Y => C1);
	MultGF28_0 : AES128_MultGF28 port map (X => X(23 downto 16), Y => C2);
	MultGF28_0 : AES128_MultGF28 port map (X => X(15 downto 8), Y => C3);
	MultGF28_0 : AES128_MultGF28 port map (X => X(15 downto 8), Y => C4);
	MultGF28_0 : AES128_MultGF28 port map (X => X(7 downto 0), Y => C5);
	MultGF28_0 : AES128_MultGF28 port map (X => X(7 downto 0), Y => C6);
	MultGF28_0 : AES128_MultGF28 port map (X => X(31 downto 24), Y => C7);
	Y (31 downto 24)	<=	C0 xor C1 xor X(23 downto 16) xor X(15 downto 8) xor X(7 downto 0);
	Y (23 downto 16)	<=	C2 xor C3 xor X(31 downto 24) xor X(23 downto 16) xor X(15 downto 8);
	Y (15 downto 8)	<=	C4 xor C5 xor X(31 downto 24) xor X(23 downto 16) xor X(7 downto 0);
	Y (7 downto 0)		<=	C6 xor C7 xor X(31 downto 24) xor X(23 downto 16) xor X(15 downto 8);
end architecture RTL;