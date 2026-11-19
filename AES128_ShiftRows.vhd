-- AES128 ShiftRows implementation (version 0.2)
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

entity AES128_ShiftRows is port (
	X : in std_logic_vector (127 downto 0);
	Y : out std_logic_vector (127 downto 0)
); end entity AES128_ShiftRows;

architecture RTL of AES128_ShiftRows is
begin
	-- ROW 0: ROLL LEFT 0
	Y (127 downto 120)	<= X (127 downto 120);
	Y (95 downto 88)		<= X (95 downto 88);
	Y (63 downto 56)		<= X (63 downto 56);
	Y (31 downto 24)		<= X (31 downto 24);
	-- ROW 1: ROLL LEFT 1
	Y (119 downto 112)	<= X (87 downto 80);
	Y (87 downto 80)		<= X (55 downto 48);
	Y (55 downto 48)		<= X (23 downto 16);
	Y (23 downto 16)		<= X (119 downto 112);
	-- ROW 2: ROLL LEFT 2
	Y (111 downto 104)	<= X (47 downto 40);
	Y (79 downto 72)		<= X (15 downto 8);
	Y (47 downto 40)		<= X (111 downto 104);
	Y (15 downto 8)		<= X (79 downto 72);
	-- ROW 3: ROLL LEFT 3
	Y (103 downto 96)		<= X (7 downto 0);
	Y (71 downto 64)		<= X (103 downto 96);
	Y (39 downto 32)		<= X (71 downto 64);
	Y (7 downto 0)			<= X (39 downto 32);
end architecture RTL;