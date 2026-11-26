library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity UART_TX is
	generic (CLKS_PER_BIT : integer := 434);  -- asumsi baud rate 115200
	port (
		clk			: in std_logic;
		rst			: in std_logic;
		tx_start	: in std_logic;
		tx_data		: in std_logic_vector (7 downto 0);
		tx			: out std_logic;
		tx_busy		: out std_logic
	);
end entity UART_TX;

architecture RTL of UART_TX is
	type state_t is (IDLE, START_BIT, DATA_BITS, STOP_BIT);
	signal state		: state_t := IDLE;
	signal clk_cnt		: integer range 0 to CLKS_PER_BIT - 1 := 0;
	signal bit_idx		: integer range 0 to 7 := 0;
	signal shift_reg	: std_logic_vector (7 downto 0) := (others => '0');
	signal rx_sync1		: std_logic := '1';
	signal rx_sync2		: std_logic := '1';
	begin
		process (clk) begin
			if rising_edge(clk) then
				if rst = '1' then
					state	<= IDLE;
					tx 		<= '1';
					clk_cnt	<= 0;
					bit_idx <= 0;
				else
					case state is
						when IDLE =>