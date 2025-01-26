-- Testbench for Zero Padding
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_packet_to_cell_zero_padding is
end tb_packet_to_cell_zero_padding;

architecture behavior of tb_packet_to_cell_zero_padding is
  -- Component Declaration
  component packet_to_cell
    port (
      clk         : in  std_logic;
      reset       : in  std_logic;
      sink_valid  : in  std_logic;
      sink_ready  : out std_logic;
      sink_data   : in  std_logic_vector(7 downto 0);
      sink_sop    : in  std_logic;
      sink_eop    : in  std_logic;
      source_cell : out std_logic_vector(7 downto 0);
      source_soc  : out std_logic;
      source_eoc  : out std_logic;
      source_channel : out std_logic_vector(31 downto 0);
      source_valid: out std_logic;
      source_ready: in  std_logic;
      byte_counter: out std_logic_vector(7 downto 0);
      state_out   : out std_logic_vector(2 downto 0);
      bit_counter : out std_logic_vector(11 downto 0);
      cell_incomplete : out std_logic;
      padding_complete : out std_logic
    );
  end component;

  -- Signals
  signal clk : std_logic := '0';
  signal reset : std_logic := '1';
  signal sink_valid : std_logic := '0';
  signal sink_ready : std_logic;
  signal sink_data : std_logic_vector(7 downto 0) := (others => '0');
  signal sink_sop : std_logic := '0';
  signal sink_eop : std_logic := '0';
  signal source_cell : std_logic_vector(7 downto 0);
  signal source_soc : std_logic;
  signal source_eoc : std_logic;
  signal source_channel : std_logic_vector(31 downto 0);
  signal source_valid : std_logic;
  signal source_ready : std_logic := '1';
  signal byte_counter : std_logic_vector(7 downto 0);
  signal state_out : std_logic_vector(2 downto 0);
  signal bit_counter : std_logic_vector(11 downto 0);
  signal cell_incomplete : std_logic;
  signal padding_complete : std_logic;

  -- Clock period definition
  constant CLK_PERIOD : time := 10 ns;
  constant CELL_SIZE : integer := 64;

begin
  -- Instantiate the Unit Under Test (UUT)
  uut: packet_to_cell port map (
    clk => clk,
    reset => reset,
    sink_valid => sink_valid,
    sink_ready => sink_ready,
    sink_data => sink_data,
    sink_sop => sink_sop,
    sink_eop => sink_eop,
    source_cell => source_cell,
    source_soc => source_soc,
    source_eoc => source_eoc,
    source_channel => source_channel,
    source_valid => source_valid,
    source_ready => source_ready,
    byte_counter => byte_counter,
    state_out => state_out,
    bit_counter => bit_counter,
    cell_incomplete => cell_incomplete,
    padding_complete => padding_complete
  );

  -- Clock process
  clk_process: process
  begin
    clk <= '0';
    wait for CLK_PERIOD/2;
    clk <= '1';
    wait for CLK_PERIOD/2;
  end process;

  -- Stimulus process
  stim_proc: process
  begin
    -- Reset
    wait for CLK_PERIOD*2;
    reset <= '0';
    wait for CLK_PERIOD*2;

    -- Test Case 1: Send 65-byte packet to trigger zero padding
    sink_valid <= '1';
    sink_sop <= '1';

    -- Send first 64 bytes
    for i in 0 to 63 loop
      sink_data <= std_logic_vector(to_unsigned(i, 8));
      if i = 63 then
        sink_eop <= '1';
      end if;
      wait for CLK_PERIOD;
    end loop;

    -- Send remaining 1 byte
    sink_data <= std_logic_vector(to_unsigned(64, 8));
    sink_eop <= '1';
    wait for CLK_PERIOD;

    sink_valid <= '0';
    sink_sop <= '0';
    sink_eop <= '0';

    wait for CLK_PERIOD*2;

    -- Check cell_incomplete after sending 65 bytes
    wait for CLK_PERIOD/2;
    assert cell_incomplete = '1' report "Error: cell_incomplete should be '1' after sending 65 bytes" severity error;
    wait for CLK_PERIOD/2;

    -- Wait for padding to complete
    for i in 0 to (CELL_SIZE - (65 mod CELL_SIZE)) - 1 loop
        wait for CLK_PERIOD/2;
    end loop;

    -- Check cell_incomplete after padding
    wait for CLK_PERIOD/2;
    assert cell_incomplete = '0' report "Error: cell_incomplete should be '0' after padding" severity error;
    wait for CLK_PERIOD/2;

    -- Check source_valid after padding
    assert source_valid = '1' report "Error: source_valid should be '1' after padding" severity error;
    assert source_soc = '1' report "Error: source_soc should be '1' at the start of the padding" severity error;
    wait for CLK_PERIOD;
    assert source_valid = '0' report "Error: source_valid should be '0' after padding" severity error;

    -- Check source_eoc after padding
    assert source_eoc = '1' report "Error: source_eoc should be '1' after padding" severity error;
    wait for CLK_PERIOD/2;
    assert source_eoc = '0' report "Error: source_eoc should be '0' after padding" severity error;

    -- Check padding_complete after padding
    assert padding_complete = '1' report "Error: padding_complete should be '1' after padding" severity error;
    assert source_channel = "00000000000000000000000000000001" report "Error: source_channel is incorrect" severity error;
    wait for 500 ns;
  end process;

end behavior;
