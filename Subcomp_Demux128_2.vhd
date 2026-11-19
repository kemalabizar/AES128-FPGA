-- Subcomponent Demultiplexer-2 128-bit (version 0.2)
-- Copyright (c) 2026 Muhammad Kemal Abizar, Galvin Efrem Lesmana, Hanif Abdul Aziz

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

entity Subcomp_Mux128_2 is port (
	D	: in std_logic_vector (127 downto 0);
	Q0	: out std_logic_vector (127 downto 0);
	Q1	: out std_logic_vector (127 downto 0);
	SEL : in std_logic
); end entity Subcomp_Mux128_2;

architecture RTL of Subcomp_Mux128_2 is
begin
	process (SEL) begin
		if SEL = '1' then
			Q0 <= x"00000000000000000000000000000000";
			Q1 <= D;
		elsif SEL = '0' then
			Q0 <= D;
			Q1 <= x"00000000000000000000000000000000";
		end if;
	end process;
end architecture RTL;