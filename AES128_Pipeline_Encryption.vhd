-- AES128 Encryption Pipeline (version 0.2)
-- Copyright (c) 2026 Muhammad Kemal Abizar, Galvin Efrem Lesmana, Hanif Abdul Aziz
-- NOTE 20/11/2026: Cara kerja program terverifikasi dan sudah diuji benar oleh MultiSim

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

entity AES128_Pipeline_Encryption is port (
	Pr	: in std_logic_vector (127 downto 0);
	Kr	: in std_logic_vector (127 downto 0);
	Cr	: out std_logic_vector (127 downto 0);
	LastRound : in std_logic
); end entity AES128_Pipeline_Encryption;

architecture RTL of AES128_Pipeline_Encryption is
	-- SubBytes module
	component AES128_SubBytes is port (
		X : in std_logic_vector (127 downto 0);
		Y : out std_logic_vector (127 downto 0)
	); end component AES128_SubBytes;
	-- ShiftRows module
	component AES128_ShiftRows is port (
		X : in std_logic_vector (127 downto 0);
		Y : out std_logic_vector (127 downto 0)
	); end component AES128_ShiftRows;
	-- MixColumns module
	component AES128_MixColumns is port (
		X : in std_logic_vector (127 downto 0);
		Y : out std_logic_vector (127 downto 0)
	); end component AES128_MixColumns;
	-- AddRoundKey module
	component AES128_AddRoundKey is port (
		stateIn : in std_logic_vector (127 downto 0);
		roundKey : in std_logic_vector (127 downto 0);
		stateOut : out std_logic_vector (127 downto 0)
	); end component AES128_AddRoundKey;
	-- Subcomponent Multiplexer module
	component Subcomp_Mux128_2 is port (
		D0	: in std_logic_vector (127 downto 0);
		D1	: in std_logic_vector (127 downto 0);
		Q	: out std_logic_vector (127 downto 0);
		SEL : in std_logic
	); end component Subcomp_Mux128_2;
	-- Intermediate buses
	signal A		: std_logic_vector (127 downto 0);
	signal B		: std_logic_vector (127 downto 0);
	signal C		: std_logic_vector (127 downto 0);
	signal D		: std_logic_vector (127 downto 0);
	signal S		: std_logic_vector (127 downto 0);
begin
	Process_SubBytes		: AES128_SubBytes port map (X => Pr, Y => A);
	Process_ShiftRows		: AES128_ShiftRows port map (X => A, Y => B);
	Process_MixColumn		: AES128_MixColumns port map (X => B, Y => C);
	Selector_LastRound	: Subcomp_Mux128_2 port map (D0 => C, D1 => B, Q => D, SEL => LastRound);
	Process_AddRoundKey	: AES128_AddRoundKey port map (stateIn => D, roundKey => Kr, stateOut => S);
	Cr <= S;
end architecture RTL;