-- VHDL Entity
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity packet_to_cell is
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
end packet_to_cell;

architecture rtl of packet_to_cell is
  -- FSM States
  type state_type is (IDLE, PROCESSING, BACKPRESSURE, ZERO_PADDING);
  signal state, next_state : state_type;

  -- Constants
  constant CELL_SIZE : integer := 64;

  -- Internal signals
  signal byte_counter_int : unsigned(7 downto 0);  -- Counts up to CELL_SIZE
  signal bit_counter_int : unsigned(11 downto 0);  -- Counts up to 1024
  signal packet_counter : unsigned(15 downto 0);
  signal cell_counter  : unsigned(15 downto 0);
  signal cell_incomplete_int : std_logic := '0';
  signal padding_complete_int : std_logic := '0';

begin
  -- Process: State transitions, next state logic, and output logic
  process(clk, reset)
  begin
    if reset = '1' then
      state <= IDLE;
      next_state <= IDLE;
      byte_counter_int <= (others => '0');
      bit_counter_int <= (others => '0');
      packet_counter <= (others => '0');
      cell_counter <= (others => '0');
      source_valid <= '0';
      source_cell <= (others => '0');
      source_soc <= '0';
      source_eoc <= '0';
      source_channel <= (others => '0');
      cell_incomplete_int <= '0';
      padding_complete_int <= '0';
    elsif rising_edge(clk) then
      state <= next_state;
      case state is
        when IDLE =>
          cell_counter <= (others => '0');
          cell_incomplete_int <= '0';
          if sink_valid = '1' and sink_sop = '1' then
            packet_counter <= packet_counter + 1;
            next_state <= PROCESSING;
          else
            next_state <= IDLE;
          end if;

        when PROCESSING =>
          if source_ready = '1' then
            source_valid <= '1';
            source_cell <= sink_data;
            byte_counter_int <= byte_counter_int + 1;
            bit_counter_int <= bit_counter_int + 8;

            if byte_counter_int = 0 then
              source_soc <= '1';
              cell_counter <= cell_counter + 1;
              cell_incomplete_int <= '1';
            else
              source_soc <= '0';
            end if;

            if byte_counter_int = CELL_SIZE - 1 then
              source_eoc <= '1';
              cell_incomplete_int <= '0';
            else
              source_eoc <= '0';
            end if;

            if sink_eop = '1' and cell_incomplete_int = '1' then
              next_state <= ZERO_PADDING;
            elsif sink_eop = '1' and cell_incomplete_int = '0' then
              next_state <= IDLE;
            else
              next_state <= PROCESSING;
            end if;
          else
            next_state <= BACKPRESSURE;
          end if;

        when BACKPRESSURE =>
          source_valid <= '0';
          if source_ready = '1' then
            next_state <= PROCESSING;
          elsif sink_eop = '1' and cell_incomplete_int = '1' then
            next_state <= ZERO_PADDING;
          elsif sink_eop = '1' and cell_incomplete_int = '0' then
            next_state <= IDLE;
          else
            next_state <= BACKPRESSURE;
          end if;

        when ZERO_PADDING =>
          if source_ready = '1' then
            source_valid <= '1';
            source_cell <= x"00";
            byte_counter_int <= byte_counter_int + 1;
            bit_counter_int <= bit_counter_int + 8;

            if byte_counter_int = CELL_SIZE - 1 then
              source_eoc <= '1';
              padding_complete_int <= '1';
              byte_counter_int <= (others => '0');
              bit_counter_int <= (others => '0');
              next_state <= IDLE;
            else
              source_eoc <= '0';
              next_state <= ZERO_PADDING;
            end if;
          else
            next_state <= ZERO_PADDING;
          end if;
      end case;

      if state = IDLE then
        padding_complete_int <= '0';
      end if;

      -- Update channel signal
      source_channel <= std_logic_vector(packet_counter) & std_logic_vector(cell_counter);
    end if;
  end process;

  -- Combinatorial assignments
  sink_ready <= '1' when state = PROCESSING and source_ready = '1' else '0';
  byte_counter <= std_logic_vector(byte_counter_int);
  bit_counter <= std_logic_vector(bit_counter_int);
  cell_incomplete <= cell_incomplete_int;
  padding_complete <= padding_complete_int;

  -- State encoding
  with state select
    state_out <= "000" when IDLE,
                 "001" when PROCESSING,
                 "010" when BACKPRESSURE,
                 "011" when ZERO_PADDING;

end rtl;
