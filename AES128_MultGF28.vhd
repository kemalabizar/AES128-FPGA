-- AES128 MultGF28 implementation (version 0.2)
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

entity AES128_MultGF28 is port (
	X : in std_logic_vector (7 downto 0);
	Y : out std_logic_vector (7 downto 0)
); end entity AES128_MultGF28;

architecture RTL of AES128_MultGF28 is
	signal C : std_logic_vector (7 downto 0);
	signal D : std_logic_vector (7 downto 0);
begin
	C <= std_logic_vector (unsigned(X) sll 1);
	process (C) begin
		if X(7) = '1' then D <= C xor "00011011";
		elsif X(7) = '0' then D <= C;
		end if;
	end process;
	Y <= D;
end architecture RTL;