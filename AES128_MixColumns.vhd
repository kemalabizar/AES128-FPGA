-- AES128 MixColumns implementation (version 0.1)
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

entity AES128_MixColumns is port (
	X : in std_logic_vector (127 downto 0);
	Y : out std_logic_vector (127 downto 0)
); end entity AES128_MixColumns;

architecture RTL of AES128_MixColumns is
	component AES128_PerColumnMix port (
		X : in std_logic_vector (31 downto 0);
		Y : out std_logic_vector (31 downto 0)
	); end component AES128_PerColumnMix;
	signal C : std_logic_vector (127 downto 0);
begin
	ColumnProcess_0 : AES128_PerColumnMix port map (X => X(127 downto 96), Y => C(127 downto 96));
	ColumnProcess_1 : AES128_PerColumnMix port map (X => X(95 downto 64), Y => C(95 downto 64));
	ColumnProcess_2 : AES128_PerColumnMix port map (X => X(63 downto 32), Y => C(63 downto 32));
	ColumnProcess_3 : AES128_PerColumnMix port map (X => X(31 downto 0), Y => C(31 downto 0));
	Y <= C;
end architecture RTL;