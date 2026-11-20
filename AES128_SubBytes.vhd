-- AES128 SubBytes implementation (version 0.3)
-- Copyright (c) 2026 Muhammad Kemal Abizar, Galvin Efrem Lesmana, Hanif Abdul Aziz
-- NOTE 10/11/2026: Belum dicek lagi kesesuaian SBox secara manual
-- NOTE 17/11/2026: Revisi dari "when A = " dan "when B =" menjadi "when" saja, masih belum dites ulang
-- NOTE 18/11/2026: Rebuilt besar-besaran, ga pake case, ganti jadi array aja (verdammten scheisse)
-- NOTE 19/11/2026: Rebuilt besar-besaran kedua; fungsi SBox masing2 byte diwakili *_SBox.vhd, jadinya modul ini langsung 128-bit masuk, 128-bit keluar
-- NOTE 19/11/2026: Cara kerja program terverifikasi dan sudah diuji benar oleh MultiSim; menggunakan test vector sebagaimana dalam dokumen FIPS 197

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
	X : in std_logic_vector (127 downto 0);
	Y : out std_logic_vector (127 downto 0)
); end entity AES128_SubBytes;

architecture RTL of AES128_SubBytes is
	component AES128_SBox is port (
		X : in std_logic_vector (7 downto 0);
		Y : out std_logic_vector (7 downto 0)
	); end component AES128_SBox;
	signal C : std_logic_vector (127 downto 0);
begin
	Sub_00 : AES128_SBox port map (X => X(127 downto 120), Y => C(127 downto 120));
	Sub_10 : AES128_SBox port map (X => X(119 downto 112), Y => C(119 downto 112));
	Sub_20 : AES128_SBox port map (X => X(111 downto 104), Y => C(111 downto 104));
	Sub_30 : AES128_SBox port map (X => X(103 downto 96), Y => C(103 downto 96));
	Sub_01 : AES128_SBox port map (X => X(95 downto 88), Y => C(95 downto 88));
	Sub_11 : AES128_SBox port map (X => X(87 downto 80), Y => C(87 downto 80));
	Sub_21 : AES128_SBox port map (X => X(79 downto 72), Y => C(79 downto 72));
	Sub_31 : AES128_SBox port map (X => X(71 downto 64), Y => C(71 downto 64));
	Sub_02 : AES128_SBox port map (X => X(63 downto 56), Y => C(63 downto 56));
	Sub_12 : AES128_SBox port map (X => X(55 downto 48), Y => C(55 downto 48));
	Sub_22 : AES128_SBox port map (X => X(47 downto 40), Y => C(47 downto 40));
	Sub_32 : AES128_SBox port map (X => X(39 downto 32), Y => C(39 downto 32));
	Sub_03 : AES128_SBox port map (X => X(31 downto 24), Y => C(31 downto 24));
	Sub_13 : AES128_SBox port map (X => X(23 downto 16), Y => C(23 downto 16));
	Sub_23 : AES128_SBox port map (X => X(15 downto 8), Y => C(15 downto 8));
	Sub_33 : AES128_SBox port map (X => X(7 downto 0), Y => C(7 downto 0));
	Y <= C;
end architecture RTL;