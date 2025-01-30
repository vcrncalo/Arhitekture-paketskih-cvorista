-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"

-- DATE "01/26/2025 22:31:51"

-- 
-- Device: Altera EP4CE6F17C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_F16,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	packet_to_cell IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	sink_valid : IN std_logic;
	sink_ready : OUT std_logic;
	sink_data : IN std_logic_vector(7 DOWNTO 0);
	sink_sop : IN std_logic;
	sink_eop : IN std_logic;
	source_cell : OUT std_logic_vector(7 DOWNTO 0);
	source_soc : OUT std_logic;
	source_eoc : OUT std_logic;
	source_channel : OUT std_logic_vector(31 DOWNTO 0);
	source_valid : OUT std_logic;
	source_ready : IN std_logic;
	byte_counter : OUT std_logic_vector(7 DOWNTO 0);
	state_out : OUT std_logic_vector(2 DOWNTO 0);
	bit_counter : OUT std_logic_vector(11 DOWNTO 0);
	cell_incomplete : OUT std_logic;
	padding_complete : OUT std_logic
	);
END packet_to_cell;

-- Design Ports Information
-- sink_ready	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_cell[0]	=>  Location: PIN_J12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_cell[1]	=>  Location: PIN_T11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_cell[2]	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_cell[3]	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_cell[4]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_cell[5]	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_cell[6]	=>  Location: PIN_K10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_cell[7]	=>  Location: PIN_R13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_soc	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_eoc	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[0]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[1]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[2]	=>  Location: PIN_B9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[3]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[4]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[5]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[6]	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[7]	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[8]	=>  Location: PIN_E9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[9]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[10]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[11]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[12]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[13]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[14]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[15]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[16]	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[17]	=>  Location: PIN_K12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[18]	=>  Location: PIN_L13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[19]	=>  Location: PIN_L12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[20]	=>  Location: PIN_K11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[21]	=>  Location: PIN_P14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[22]	=>  Location: PIN_M12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[23]	=>  Location: PIN_L16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[24]	=>  Location: PIN_R16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[25]	=>  Location: PIN_N12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[26]	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[27]	=>  Location: PIN_K16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[28]	=>  Location: PIN_L14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[29]	=>  Location: PIN_N14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[30]	=>  Location: PIN_P15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_channel[31]	=>  Location: PIN_N15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_valid	=>  Location: PIN_J14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- byte_counter[0]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- byte_counter[1]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- byte_counter[2]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- byte_counter[3]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- byte_counter[4]	=>  Location: PIN_B14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- byte_counter[5]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- byte_counter[6]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- byte_counter[7]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- state_out[0]	=>  Location: PIN_B16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- state_out[1]	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- state_out[2]	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bit_counter[0]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bit_counter[1]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bit_counter[2]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bit_counter[3]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bit_counter[4]	=>  Location: PIN_G11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bit_counter[5]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bit_counter[6]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bit_counter[7]	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bit_counter[8]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bit_counter[9]	=>  Location: PIN_D16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bit_counter[10]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bit_counter[11]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cell_incomplete	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- padding_complete	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- source_ready	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_M2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sink_data[0]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sink_data[1]	=>  Location: PIN_M10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sink_data[2]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sink_data[3]	=>  Location: PIN_P9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sink_data[4]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sink_data[5]	=>  Location: PIN_T9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sink_data[6]	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sink_data[7]	=>  Location: PIN_L10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sink_eop	=>  Location: PIN_K15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sink_valid	=>  Location: PIN_J11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sink_sop	=>  Location: PIN_L15,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF packet_to_cell IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_sink_valid : std_logic;
SIGNAL ww_sink_ready : std_logic;
SIGNAL ww_sink_data : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_sink_sop : std_logic;
SIGNAL ww_sink_eop : std_logic;
SIGNAL ww_source_cell : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_source_soc : std_logic;
SIGNAL ww_source_eoc : std_logic;
SIGNAL ww_source_channel : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_source_valid : std_logic;
SIGNAL ww_source_ready : std_logic;
SIGNAL ww_byte_counter : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_state_out : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_bit_counter : std_logic_vector(11 DOWNTO 0);
SIGNAL ww_cell_incomplete : std_logic;
SIGNAL ww_padding_complete : std_logic;
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \sink_ready~output_o\ : std_logic;
SIGNAL \source_cell[0]~output_o\ : std_logic;
SIGNAL \source_cell[1]~output_o\ : std_logic;
SIGNAL \source_cell[2]~output_o\ : std_logic;
SIGNAL \source_cell[3]~output_o\ : std_logic;
SIGNAL \source_cell[4]~output_o\ : std_logic;
SIGNAL \source_cell[5]~output_o\ : std_logic;
SIGNAL \source_cell[6]~output_o\ : std_logic;
SIGNAL \source_cell[7]~output_o\ : std_logic;
SIGNAL \source_soc~output_o\ : std_logic;
SIGNAL \source_eoc~output_o\ : std_logic;
SIGNAL \source_channel[0]~output_o\ : std_logic;
SIGNAL \source_channel[1]~output_o\ : std_logic;
SIGNAL \source_channel[2]~output_o\ : std_logic;
SIGNAL \source_channel[3]~output_o\ : std_logic;
SIGNAL \source_channel[4]~output_o\ : std_logic;
SIGNAL \source_channel[5]~output_o\ : std_logic;
SIGNAL \source_channel[6]~output_o\ : std_logic;
SIGNAL \source_channel[7]~output_o\ : std_logic;
SIGNAL \source_channel[8]~output_o\ : std_logic;
SIGNAL \source_channel[9]~output_o\ : std_logic;
SIGNAL \source_channel[10]~output_o\ : std_logic;
SIGNAL \source_channel[11]~output_o\ : std_logic;
SIGNAL \source_channel[12]~output_o\ : std_logic;
SIGNAL \source_channel[13]~output_o\ : std_logic;
SIGNAL \source_channel[14]~output_o\ : std_logic;
SIGNAL \source_channel[15]~output_o\ : std_logic;
SIGNAL \source_channel[16]~output_o\ : std_logic;
SIGNAL \source_channel[17]~output_o\ : std_logic;
SIGNAL \source_channel[18]~output_o\ : std_logic;
SIGNAL \source_channel[19]~output_o\ : std_logic;
SIGNAL \source_channel[20]~output_o\ : std_logic;
SIGNAL \source_channel[21]~output_o\ : std_logic;
SIGNAL \source_channel[22]~output_o\ : std_logic;
SIGNAL \source_channel[23]~output_o\ : std_logic;
SIGNAL \source_channel[24]~output_o\ : std_logic;
SIGNAL \source_channel[25]~output_o\ : std_logic;
SIGNAL \source_channel[26]~output_o\ : std_logic;
SIGNAL \source_channel[27]~output_o\ : std_logic;
SIGNAL \source_channel[28]~output_o\ : std_logic;
SIGNAL \source_channel[29]~output_o\ : std_logic;
SIGNAL \source_channel[30]~output_o\ : std_logic;
SIGNAL \source_channel[31]~output_o\ : std_logic;
SIGNAL \source_valid~output_o\ : std_logic;
SIGNAL \byte_counter[0]~output_o\ : std_logic;
SIGNAL \byte_counter[1]~output_o\ : std_logic;
SIGNAL \byte_counter[2]~output_o\ : std_logic;
SIGNAL \byte_counter[3]~output_o\ : std_logic;
SIGNAL \byte_counter[4]~output_o\ : std_logic;
SIGNAL \byte_counter[5]~output_o\ : std_logic;
SIGNAL \byte_counter[6]~output_o\ : std_logic;
SIGNAL \byte_counter[7]~output_o\ : std_logic;
SIGNAL \state_out[0]~output_o\ : std_logic;
SIGNAL \state_out[1]~output_o\ : std_logic;
SIGNAL \state_out[2]~output_o\ : std_logic;
SIGNAL \bit_counter[0]~output_o\ : std_logic;
SIGNAL \bit_counter[1]~output_o\ : std_logic;
SIGNAL \bit_counter[2]~output_o\ : std_logic;
SIGNAL \bit_counter[3]~output_o\ : std_logic;
SIGNAL \bit_counter[4]~output_o\ : std_logic;
SIGNAL \bit_counter[5]~output_o\ : std_logic;
SIGNAL \bit_counter[6]~output_o\ : std_logic;
SIGNAL \bit_counter[7]~output_o\ : std_logic;
SIGNAL \bit_counter[8]~output_o\ : std_logic;
SIGNAL \bit_counter[9]~output_o\ : std_logic;
SIGNAL \bit_counter[10]~output_o\ : std_logic;
SIGNAL \bit_counter[11]~output_o\ : std_logic;
SIGNAL \cell_incomplete~output_o\ : std_logic;
SIGNAL \padding_complete~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \sink_eop~input_o\ : std_logic;
SIGNAL \Selector19~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \source_ready~input_o\ : std_logic;
SIGNAL \next_state.BACKPRESSURE~q\ : std_logic;
SIGNAL \state.BACKPRESSURE~q\ : std_logic;
SIGNAL \Selector18~0_combout\ : std_logic;
SIGNAL \sink_valid~input_o\ : std_logic;
SIGNAL \sink_sop~input_o\ : std_logic;
SIGNAL \Selector20~0_combout\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \source_cell[0]~1_combout\ : std_logic;
SIGNAL \Add1~1\ : std_logic;
SIGNAL \Add1~2_combout\ : std_logic;
SIGNAL \Add1~3\ : std_logic;
SIGNAL \Add1~4_combout\ : std_logic;
SIGNAL \Add1~5\ : std_logic;
SIGNAL \Add1~6_combout\ : std_logic;
SIGNAL \Add1~7\ : std_logic;
SIGNAL \Add1~8_combout\ : std_logic;
SIGNAL \Add1~9\ : std_logic;
SIGNAL \Add1~10_combout\ : std_logic;
SIGNAL \Add1~11\ : std_logic;
SIGNAL \Add1~12_combout\ : std_logic;
SIGNAL \Equal1~1_combout\ : std_logic;
SIGNAL \Selector31~0_combout\ : std_logic;
SIGNAL \Add1~13\ : std_logic;
SIGNAL \Add1~14_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \Selector20~1_combout\ : std_logic;
SIGNAL \Selector20~2_combout\ : std_logic;
SIGNAL \next_state.ZERO_PADDING~q\ : std_logic;
SIGNAL \state.ZERO_PADDING~feeder_combout\ : std_logic;
SIGNAL \state.ZERO_PADDING~q\ : std_logic;
SIGNAL \cell_incomplete_int~2_combout\ : std_logic;
SIGNAL \Selector16~1_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Selector16~0_combout\ : std_logic;
SIGNAL \Selector16~2_combout\ : std_logic;
SIGNAL \cell_incomplete_int~q\ : std_logic;
SIGNAL \padding_complete_int~1_combout\ : std_logic;
SIGNAL \Selector17~0_combout\ : std_logic;
SIGNAL \Selector17~1_combout\ : std_logic;
SIGNAL \next_state.IDLE~q\ : std_logic;
SIGNAL \state.IDLE~q\ : std_logic;
SIGNAL \Selector18~1_combout\ : std_logic;
SIGNAL \next_state.PROCESSING~q\ : std_logic;
SIGNAL \state.PROCESSING~q\ : std_logic;
SIGNAL \sink_ready~0_combout\ : std_logic;
SIGNAL \sink_data[0]~input_o\ : std_logic;
SIGNAL \Selector29~0_combout\ : std_logic;
SIGNAL \source_cell[0]~reg0_q\ : std_logic;
SIGNAL \sink_data[1]~input_o\ : std_logic;
SIGNAL \Selector28~0_combout\ : std_logic;
SIGNAL \source_cell[1]~reg0_q\ : std_logic;
SIGNAL \sink_data[2]~input_o\ : std_logic;
SIGNAL \Selector27~0_combout\ : std_logic;
SIGNAL \source_cell[2]~reg0_q\ : std_logic;
SIGNAL \sink_data[3]~input_o\ : std_logic;
SIGNAL \Selector26~0_combout\ : std_logic;
SIGNAL \source_cell[3]~reg0_q\ : std_logic;
SIGNAL \sink_data[4]~input_o\ : std_logic;
SIGNAL \Selector25~0_combout\ : std_logic;
SIGNAL \source_cell[4]~reg0_q\ : std_logic;
SIGNAL \sink_data[5]~input_o\ : std_logic;
SIGNAL \Selector24~0_combout\ : std_logic;
SIGNAL \source_cell[5]~reg0_q\ : std_logic;
SIGNAL \sink_data[6]~input_o\ : std_logic;
SIGNAL \Selector23~0_combout\ : std_logic;
SIGNAL \source_cell[6]~reg0_q\ : std_logic;
SIGNAL \sink_data[7]~input_o\ : std_logic;
SIGNAL \Selector22~0_combout\ : std_logic;
SIGNAL \source_cell[7]~reg0_q\ : std_logic;
SIGNAL \source_soc~0_combout\ : std_logic;
SIGNAL \source_soc~reg0_q\ : std_logic;
SIGNAL \source_eoc~0_combout\ : std_logic;
SIGNAL \source_eoc~reg0_q\ : std_logic;
SIGNAL \cell_counter~0_combout\ : std_logic;
SIGNAL \Add3~0_combout\ : std_logic;
SIGNAL \Selector15~0_combout\ : std_logic;
SIGNAL \source_channel[0]~reg0_q\ : std_logic;
SIGNAL \Add3~1\ : std_logic;
SIGNAL \Add3~2_combout\ : std_logic;
SIGNAL \Selector14~0_combout\ : std_logic;
SIGNAL \source_channel[1]~reg0_q\ : std_logic;
SIGNAL \Add3~3\ : std_logic;
SIGNAL \Add3~4_combout\ : std_logic;
SIGNAL \Selector13~0_combout\ : std_logic;
SIGNAL \source_channel[2]~reg0feeder_combout\ : std_logic;
SIGNAL \source_channel[2]~reg0_q\ : std_logic;
SIGNAL \Add3~5\ : std_logic;
SIGNAL \Add3~6_combout\ : std_logic;
SIGNAL \Selector12~0_combout\ : std_logic;
SIGNAL \source_channel[3]~reg0_q\ : std_logic;
SIGNAL \Add3~7\ : std_logic;
SIGNAL \Add3~8_combout\ : std_logic;
SIGNAL \Selector11~0_combout\ : std_logic;
SIGNAL \source_channel[4]~reg0_q\ : std_logic;
SIGNAL \Add3~9\ : std_logic;
SIGNAL \Add3~10_combout\ : std_logic;
SIGNAL \Selector10~0_combout\ : std_logic;
SIGNAL \source_channel[5]~reg0feeder_combout\ : std_logic;
SIGNAL \source_channel[5]~reg0_q\ : std_logic;
SIGNAL \Add3~11\ : std_logic;
SIGNAL \Add3~12_combout\ : std_logic;
SIGNAL \Selector9~0_combout\ : std_logic;
SIGNAL \source_channel[6]~reg0_q\ : std_logic;
SIGNAL \Add3~13\ : std_logic;
SIGNAL \Add3~14_combout\ : std_logic;
SIGNAL \Selector8~0_combout\ : std_logic;
SIGNAL \source_channel[7]~reg0_q\ : std_logic;
SIGNAL \Add3~15\ : std_logic;
SIGNAL \Add3~16_combout\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \source_channel[8]~reg0feeder_combout\ : std_logic;
SIGNAL \source_channel[8]~reg0_q\ : std_logic;
SIGNAL \Add3~17\ : std_logic;
SIGNAL \Add3~18_combout\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \source_channel[9]~reg0_q\ : std_logic;
SIGNAL \Add3~19\ : std_logic;
SIGNAL \Add3~20_combout\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \source_channel[10]~reg0_q\ : std_logic;
SIGNAL \Add3~21\ : std_logic;
SIGNAL \Add3~22_combout\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \source_channel[11]~reg0_q\ : std_logic;
SIGNAL \Add3~23\ : std_logic;
SIGNAL \Add3~24_combout\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \source_channel[12]~reg0feeder_combout\ : std_logic;
SIGNAL \source_channel[12]~reg0_q\ : std_logic;
SIGNAL \Add3~25\ : std_logic;
SIGNAL \Add3~26_combout\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \source_channel[13]~reg0feeder_combout\ : std_logic;
SIGNAL \source_channel[13]~reg0_q\ : std_logic;
SIGNAL \Add3~27\ : std_logic;
SIGNAL \Add3~28_combout\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \source_channel[14]~reg0_q\ : std_logic;
SIGNAL \Add3~29\ : std_logic;
SIGNAL \Add3~30_combout\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \source_channel[15]~reg0_q\ : std_logic;
SIGNAL \packet_counter[0]~15_combout\ : std_logic;
SIGNAL \source_channel[16]~reg0feeder_combout\ : std_logic;
SIGNAL \source_channel[16]~reg0_q\ : std_logic;
SIGNAL \packet_counter[1]~16_combout\ : std_logic;
SIGNAL \Selector18~2_combout\ : std_logic;
SIGNAL \source_channel[17]~reg0feeder_combout\ : std_logic;
SIGNAL \source_channel[17]~reg0_q\ : std_logic;
SIGNAL \packet_counter[1]~17\ : std_logic;
SIGNAL \packet_counter[2]~18_combout\ : std_logic;
SIGNAL \source_channel[18]~reg0_q\ : std_logic;
SIGNAL \packet_counter[2]~19\ : std_logic;
SIGNAL \packet_counter[3]~20_combout\ : std_logic;
SIGNAL \source_channel[19]~reg0_q\ : std_logic;
SIGNAL \packet_counter[3]~21\ : std_logic;
SIGNAL \packet_counter[4]~22_combout\ : std_logic;
SIGNAL \source_channel[20]~reg0_q\ : std_logic;
SIGNAL \packet_counter[4]~23\ : std_logic;
SIGNAL \packet_counter[5]~24_combout\ : std_logic;
SIGNAL \source_channel[21]~reg0feeder_combout\ : std_logic;
SIGNAL \source_channel[21]~reg0_q\ : std_logic;
SIGNAL \packet_counter[5]~25\ : std_logic;
SIGNAL \packet_counter[6]~26_combout\ : std_logic;
SIGNAL \source_channel[22]~reg0feeder_combout\ : std_logic;
SIGNAL \source_channel[22]~reg0_q\ : std_logic;
SIGNAL \packet_counter[6]~27\ : std_logic;
SIGNAL \packet_counter[7]~28_combout\ : std_logic;
SIGNAL \source_channel[23]~reg0feeder_combout\ : std_logic;
SIGNAL \source_channel[23]~reg0_q\ : std_logic;
SIGNAL \packet_counter[7]~29\ : std_logic;
SIGNAL \packet_counter[8]~30_combout\ : std_logic;
SIGNAL \source_channel[24]~reg0_q\ : std_logic;
SIGNAL \packet_counter[8]~31\ : std_logic;
SIGNAL \packet_counter[9]~32_combout\ : std_logic;
SIGNAL \source_channel[25]~reg0feeder_combout\ : std_logic;
SIGNAL \source_channel[25]~reg0_q\ : std_logic;
SIGNAL \packet_counter[9]~33\ : std_logic;
SIGNAL \packet_counter[10]~34_combout\ : std_logic;
SIGNAL \source_channel[26]~reg0feeder_combout\ : std_logic;
SIGNAL \source_channel[26]~reg0_q\ : std_logic;
SIGNAL \packet_counter[10]~35\ : std_logic;
SIGNAL \packet_counter[11]~36_combout\ : std_logic;
SIGNAL \source_channel[27]~reg0feeder_combout\ : std_logic;
SIGNAL \source_channel[27]~reg0_q\ : std_logic;
SIGNAL \packet_counter[11]~37\ : std_logic;
SIGNAL \packet_counter[12]~38_combout\ : std_logic;
SIGNAL \source_channel[28]~reg0feeder_combout\ : std_logic;
SIGNAL \source_channel[28]~reg0_q\ : std_logic;
SIGNAL \packet_counter[12]~39\ : std_logic;
SIGNAL \packet_counter[13]~40_combout\ : std_logic;
SIGNAL \source_channel[29]~reg0_q\ : std_logic;
SIGNAL \packet_counter[13]~41\ : std_logic;
SIGNAL \packet_counter[14]~42_combout\ : std_logic;
SIGNAL \source_channel[30]~reg0feeder_combout\ : std_logic;
SIGNAL \source_channel[30]~reg0_q\ : std_logic;
SIGNAL \packet_counter[14]~43\ : std_logic;
SIGNAL \packet_counter[15]~44_combout\ : std_logic;
SIGNAL \source_channel[31]~reg0feeder_combout\ : std_logic;
SIGNAL \source_channel[31]~reg0_q\ : std_logic;
SIGNAL \Selector21~0_combout\ : std_logic;
SIGNAL \Selector21~1_combout\ : std_logic;
SIGNAL \source_valid~reg0_q\ : std_logic;
SIGNAL \source_cell~0_combout\ : std_logic;
SIGNAL \state_out~0_combout\ : std_logic;
SIGNAL \bit_counter_int[3]~9_combout\ : std_logic;
SIGNAL \bit_counter_int[11]~11_combout\ : std_logic;
SIGNAL \bit_counter_int[3]~10\ : std_logic;
SIGNAL \bit_counter_int[4]~12_combout\ : std_logic;
SIGNAL \bit_counter_int[4]~13\ : std_logic;
SIGNAL \bit_counter_int[5]~14_combout\ : std_logic;
SIGNAL \bit_counter_int[5]~15\ : std_logic;
SIGNAL \bit_counter_int[6]~16_combout\ : std_logic;
SIGNAL \bit_counter_int[6]~17\ : std_logic;
SIGNAL \bit_counter_int[7]~18_combout\ : std_logic;
SIGNAL \bit_counter_int[7]~19\ : std_logic;
SIGNAL \bit_counter_int[8]~20_combout\ : std_logic;
SIGNAL \bit_counter_int[8]~21\ : std_logic;
SIGNAL \bit_counter_int[9]~22_combout\ : std_logic;
SIGNAL \bit_counter_int[9]~23\ : std_logic;
SIGNAL \bit_counter_int[10]~24_combout\ : std_logic;
SIGNAL \bit_counter_int[10]~25\ : std_logic;
SIGNAL \bit_counter_int[11]~26_combout\ : std_logic;
SIGNAL \padding_complete_int~0_combout\ : std_logic;
SIGNAL \padding_complete_int~q\ : std_logic;
SIGNAL bit_counter_int : std_logic_vector(11 DOWNTO 0);
SIGNAL packet_counter : std_logic_vector(15 DOWNTO 0);
SIGNAL byte_counter_int : std_logic_vector(7 DOWNTO 0);
SIGNAL cell_counter : std_logic_vector(15 DOWNTO 0);
SIGNAL \ALT_INV_reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_state_out~0_combout\ : std_logic;
SIGNAL \ALT_INV_source_cell~0_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_sink_valid <= sink_valid;
sink_ready <= ww_sink_ready;
ww_sink_data <= sink_data;
ww_sink_sop <= sink_sop;
ww_sink_eop <= sink_eop;
source_cell <= ww_source_cell;
source_soc <= ww_source_soc;
source_eoc <= ww_source_eoc;
source_channel <= ww_source_channel;
source_valid <= ww_source_valid;
ww_source_ready <= source_ready;
byte_counter <= ww_byte_counter;
state_out <= ww_state_out;
bit_counter <= ww_bit_counter;
cell_incomplete <= ww_cell_incomplete;
padding_complete <= ww_padding_complete;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_reset~inputclkctrl_outclk\ <= NOT \reset~inputclkctrl_outclk\;
\ALT_INV_state_out~0_combout\ <= NOT \state_out~0_combout\;
\ALT_INV_source_cell~0_combout\ <= NOT \source_cell~0_combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X34_Y18_N16
\sink_ready~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sink_ready~0_combout\,
	devoe => ww_devoe,
	o => \sink_ready~output_o\);

-- Location: IOOBUF_X34_Y11_N9
\source_cell[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_cell[0]~reg0_q\,
	devoe => ww_devoe,
	o => \source_cell[0]~output_o\);

-- Location: IOOBUF_X23_Y0_N9
\source_cell[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_cell[1]~reg0_q\,
	devoe => ww_devoe,
	o => \source_cell[1]~output_o\);

-- Location: IOOBUF_X21_Y0_N16
\source_cell[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_cell[2]~reg0_q\,
	devoe => ww_devoe,
	o => \source_cell[2]~output_o\);

-- Location: IOOBUF_X21_Y0_N2
\source_cell[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_cell[3]~reg0_q\,
	devoe => ww_devoe,
	o => \source_cell[3]~output_o\);

-- Location: IOOBUF_X23_Y0_N16
\source_cell[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_cell[4]~reg0_q\,
	devoe => ww_devoe,
	o => \source_cell[4]~output_o\);

-- Location: IOOBUF_X23_Y0_N2
\source_cell[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_cell[5]~reg0_q\,
	devoe => ww_devoe,
	o => \source_cell[5]~output_o\);

-- Location: IOOBUF_X25_Y0_N16
\source_cell[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_cell[6]~reg0_q\,
	devoe => ww_devoe,
	o => \source_cell[6]~output_o\);

-- Location: IOOBUF_X28_Y0_N16
\source_cell[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_cell[7]~reg0_q\,
	devoe => ww_devoe,
	o => \source_cell[7]~output_o\);

-- Location: IOOBUF_X34_Y17_N23
\source_soc~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_soc~reg0_q\,
	devoe => ww_devoe,
	o => \source_soc~output_o\);

-- Location: IOOBUF_X34_Y17_N2
\source_eoc~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_eoc~reg0_q\,
	devoe => ww_devoe,
	o => \source_eoc~output_o\);

-- Location: IOOBUF_X23_Y24_N2
\source_channel[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[0]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[0]~output_o\);

-- Location: IOOBUF_X18_Y24_N9
\source_channel[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[1]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[1]~output_o\);

-- Location: IOOBUF_X16_Y24_N9
\source_channel[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[2]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[2]~output_o\);

-- Location: IOOBUF_X25_Y24_N16
\source_channel[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[3]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[3]~output_o\);

-- Location: IOOBUF_X25_Y24_N23
\source_channel[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[4]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[4]~output_o\);

-- Location: IOOBUF_X23_Y24_N23
\source_channel[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[5]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[5]~output_o\);

-- Location: IOOBUF_X23_Y24_N9
\source_channel[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[6]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[6]~output_o\);

-- Location: IOOBUF_X32_Y24_N16
\source_channel[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[7]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[7]~output_o\);

-- Location: IOOBUF_X18_Y24_N23
\source_channel[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[8]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[8]~output_o\);

-- Location: IOOBUF_X23_Y24_N16
\source_channel[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[9]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[9]~output_o\);

-- Location: IOOBUF_X21_Y24_N16
\source_channel[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[10]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[10]~output_o\);

-- Location: IOOBUF_X21_Y24_N2
\source_channel[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[11]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[11]~output_o\);

-- Location: IOOBUF_X16_Y24_N23
\source_channel[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[12]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[12]~output_o\);

-- Location: IOOBUF_X16_Y24_N2
\source_channel[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[13]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[13]~output_o\);

-- Location: IOOBUF_X21_Y24_N9
\source_channel[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[14]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[14]~output_o\);

-- Location: IOOBUF_X18_Y24_N16
\source_channel[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[15]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[15]~output_o\);

-- Location: IOOBUF_X34_Y7_N23
\source_channel[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[16]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[16]~output_o\);

-- Location: IOOBUF_X34_Y3_N16
\source_channel[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[17]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[17]~output_o\);

-- Location: IOOBUF_X34_Y8_N23
\source_channel[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[18]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[18]~output_o\);

-- Location: IOOBUF_X34_Y3_N23
\source_channel[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[19]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[19]~output_o\);

-- Location: IOOBUF_X34_Y6_N16
\source_channel[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[20]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[20]~output_o\);

-- Location: IOOBUF_X32_Y0_N23
\source_channel[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[21]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[21]~output_o\);

-- Location: IOOBUF_X34_Y2_N16
\source_channel[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[22]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[22]~output_o\);

-- Location: IOOBUF_X34_Y8_N16
\source_channel[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[23]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[23]~output_o\);

-- Location: IOOBUF_X34_Y5_N16
\source_channel[24]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[24]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[24]~output_o\);

-- Location: IOOBUF_X32_Y0_N2
\source_channel[25]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[25]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[25]~output_o\);

-- Location: IOOBUF_X34_Y5_N23
\source_channel[26]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[26]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[26]~output_o\);

-- Location: IOOBUF_X34_Y9_N16
\source_channel[27]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[27]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[27]~output_o\);

-- Location: IOOBUF_X34_Y7_N9
\source_channel[28]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[28]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[28]~output_o\);

-- Location: IOOBUF_X34_Y4_N23
\source_channel[29]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[29]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[29]~output_o\);

-- Location: IOOBUF_X34_Y4_N16
\source_channel[30]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[30]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[30]~output_o\);

-- Location: IOOBUF_X34_Y7_N16
\source_channel[31]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_channel[31]~reg0_q\,
	devoe => ww_devoe,
	o => \source_channel[31]~output_o\);

-- Location: IOOBUF_X34_Y10_N2
\source_valid~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \source_valid~reg0_q\,
	devoe => ww_devoe,
	o => \source_valid~output_o\);

-- Location: IOOBUF_X28_Y24_N23
\byte_counter[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => byte_counter_int(0),
	devoe => ww_devoe,
	o => \byte_counter[0]~output_o\);

-- Location: IOOBUF_X28_Y24_N2
\byte_counter[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => byte_counter_int(1),
	devoe => ww_devoe,
	o => \byte_counter[1]~output_o\);

-- Location: IOOBUF_X30_Y24_N9
\byte_counter[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => byte_counter_int(2),
	devoe => ww_devoe,
	o => \byte_counter[2]~output_o\);

-- Location: IOOBUF_X25_Y24_N2
\byte_counter[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => byte_counter_int(3),
	devoe => ww_devoe,
	o => \byte_counter[3]~output_o\);

-- Location: IOOBUF_X28_Y24_N9
\byte_counter[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => byte_counter_int(4),
	devoe => ww_devoe,
	o => \byte_counter[4]~output_o\);

-- Location: IOOBUF_X30_Y24_N23
\byte_counter[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => byte_counter_int(5),
	devoe => ww_devoe,
	o => \byte_counter[5]~output_o\);

-- Location: IOOBUF_X25_Y24_N9
\byte_counter[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => byte_counter_int(6),
	devoe => ww_devoe,
	o => \byte_counter[6]~output_o\);

-- Location: IOOBUF_X28_Y24_N16
\byte_counter[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => byte_counter_int(7),
	devoe => ww_devoe,
	o => \byte_counter[7]~output_o\);

-- Location: IOOBUF_X34_Y18_N2
\state_out[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_source_cell~0_combout\,
	devoe => ww_devoe,
	o => \state_out[0]~output_o\);

-- Location: IOOBUF_X34_Y10_N9
\state_out[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_state_out~0_combout\,
	devoe => ww_devoe,
	o => \state_out[1]~output_o\);

-- Location: IOOBUF_X0_Y10_N23
\state_out[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \state_out[2]~output_o\);

-- Location: IOOBUF_X13_Y0_N23
\bit_counter[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \bit_counter[0]~output_o\);

-- Location: IOOBUF_X30_Y24_N2
\bit_counter[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \bit_counter[1]~output_o\);

-- Location: IOOBUF_X16_Y24_N16
\bit_counter[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \bit_counter[2]~output_o\);

-- Location: IOOBUF_X34_Y19_N16
\bit_counter[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => bit_counter_int(3),
	devoe => ww_devoe,
	o => \bit_counter[3]~output_o\);

-- Location: IOOBUF_X34_Y20_N16
\bit_counter[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => bit_counter_int(4),
	devoe => ww_devoe,
	o => \bit_counter[4]~output_o\);

-- Location: IOOBUF_X34_Y20_N2
\bit_counter[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => bit_counter_int(5),
	devoe => ww_devoe,
	o => \bit_counter[5]~output_o\);

-- Location: IOOBUF_X34_Y19_N2
\bit_counter[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => bit_counter_int(6),
	devoe => ww_devoe,
	o => \bit_counter[6]~output_o\);

-- Location: IOOBUF_X32_Y24_N9
\bit_counter[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => bit_counter_int(7),
	devoe => ww_devoe,
	o => \bit_counter[7]~output_o\);

-- Location: IOOBUF_X34_Y11_N2
\bit_counter[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => bit_counter_int(8),
	devoe => ww_devoe,
	o => \bit_counter[8]~output_o\);

-- Location: IOOBUF_X34_Y19_N9
\bit_counter[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => bit_counter_int(9),
	devoe => ww_devoe,
	o => \bit_counter[9]~output_o\);

-- Location: IOOBUF_X34_Y17_N16
\bit_counter[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => bit_counter_int(10),
	devoe => ww_devoe,
	o => \bit_counter[10]~output_o\);

-- Location: IOOBUF_X34_Y20_N9
\bit_counter[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => bit_counter_int(11),
	devoe => ww_devoe,
	o => \bit_counter[11]~output_o\);

-- Location: IOOBUF_X34_Y9_N2
\cell_incomplete~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \cell_incomplete_int~q\,
	devoe => ww_devoe,
	o => \cell_incomplete~output_o\);

-- Location: IOOBUF_X32_Y24_N23
\padding_complete~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \padding_complete_int~q\,
	devoe => ww_devoe,
	o => \padding_complete~output_o\);

-- Location: IOIBUF_X0_Y11_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G2
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X34_Y9_N8
\sink_eop~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sink_eop,
	o => \sink_eop~input_o\);

-- Location: LCCOMB_X32_Y14_N16
\Selector19~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector19~0_combout\ = (\state.PROCESSING~q\) # ((\state.BACKPRESSURE~q\ & !\sink_eop~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.BACKPRESSURE~q\,
	datac => \state.PROCESSING~q\,
	datad => \sink_eop~input_o\,
	combout => \Selector19~0_combout\);

-- Location: IOIBUF_X0_Y11_N15
\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: CLKCTRL_G4
\reset~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset~inputclkctrl_outclk\);

-- Location: IOIBUF_X34_Y12_N8
\source_ready~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_source_ready,
	o => \source_ready~input_o\);

-- Location: FF_X32_Y14_N17
\next_state.BACKPRESSURE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector19~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \source_ready~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.BACKPRESSURE~q\);

-- Location: FF_X33_Y14_N19
\state.BACKPRESSURE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.BACKPRESSURE~q\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.BACKPRESSURE~q\);

-- Location: LCCOMB_X33_Y14_N10
\Selector18~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector18~0_combout\ = (\source_ready~input_o\ & ((\state.BACKPRESSURE~q\) # ((!\sink_eop~input_o\ & \state.PROCESSING~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sink_eop~input_o\,
	datab => \state.BACKPRESSURE~q\,
	datac => \state.PROCESSING~q\,
	datad => \source_ready~input_o\,
	combout => \Selector18~0_combout\);

-- Location: IOIBUF_X34_Y9_N22
\sink_valid~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sink_valid,
	o => \sink_valid~input_o\);

-- Location: IOIBUF_X34_Y8_N8
\sink_sop~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sink_sop,
	o => \sink_sop~input_o\);

-- Location: LCCOMB_X33_Y14_N14
\Selector20~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector20~0_combout\ = (\sink_eop~input_o\ & ((\source_ready~input_o\ & ((\state.PROCESSING~q\))) # (!\source_ready~input_o\ & (\state.BACKPRESSURE~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sink_eop~input_o\,
	datab => \state.BACKPRESSURE~q\,
	datac => \state.PROCESSING~q\,
	datad => \source_ready~input_o\,
	combout => \Selector20~0_combout\);

-- Location: LCCOMB_X26_Y16_N12
\Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = byte_counter_int(0) $ (VCC)
-- \Add1~1\ = CARRY(byte_counter_int(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => byte_counter_int(0),
	datad => VCC,
	combout => \Add1~0_combout\,
	cout => \Add1~1\);

-- Location: LCCOMB_X33_Y14_N2
\source_cell[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \source_cell[0]~1_combout\ = (\state.IDLE~q\ & (\source_ready~input_o\ & !\state.BACKPRESSURE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.IDLE~q\,
	datab => \source_ready~input_o\,
	datad => \state.BACKPRESSURE~q\,
	combout => \source_cell[0]~1_combout\);

-- Location: FF_X26_Y16_N13
\byte_counter_int[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add1~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \source_cell[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => byte_counter_int(0));

-- Location: LCCOMB_X26_Y16_N14
\Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~2_combout\ = (byte_counter_int(1) & (!\Add1~1\)) # (!byte_counter_int(1) & ((\Add1~1\) # (GND)))
-- \Add1~3\ = CARRY((!\Add1~1\) # (!byte_counter_int(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => byte_counter_int(1),
	datad => VCC,
	cin => \Add1~1\,
	combout => \Add1~2_combout\,
	cout => \Add1~3\);

-- Location: FF_X26_Y16_N15
\byte_counter_int[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add1~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \source_cell[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => byte_counter_int(1));

-- Location: LCCOMB_X26_Y16_N16
\Add1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~4_combout\ = (byte_counter_int(2) & (\Add1~3\ $ (GND))) # (!byte_counter_int(2) & (!\Add1~3\ & VCC))
-- \Add1~5\ = CARRY((byte_counter_int(2) & !\Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => byte_counter_int(2),
	datad => VCC,
	cin => \Add1~3\,
	combout => \Add1~4_combout\,
	cout => \Add1~5\);

-- Location: FF_X26_Y16_N17
\byte_counter_int[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add1~4_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \source_cell[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => byte_counter_int(2));

-- Location: LCCOMB_X26_Y16_N18
\Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~6_combout\ = (byte_counter_int(3) & (!\Add1~5\)) # (!byte_counter_int(3) & ((\Add1~5\) # (GND)))
-- \Add1~7\ = CARRY((!\Add1~5\) # (!byte_counter_int(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => byte_counter_int(3),
	datad => VCC,
	cin => \Add1~5\,
	combout => \Add1~6_combout\,
	cout => \Add1~7\);

-- Location: FF_X26_Y16_N19
\byte_counter_int[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add1~6_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \source_cell[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => byte_counter_int(3));

-- Location: LCCOMB_X26_Y16_N20
\Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~8_combout\ = (byte_counter_int(4) & (\Add1~7\ $ (GND))) # (!byte_counter_int(4) & (!\Add1~7\ & VCC))
-- \Add1~9\ = CARRY((byte_counter_int(4) & !\Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => byte_counter_int(4),
	datad => VCC,
	cin => \Add1~7\,
	combout => \Add1~8_combout\,
	cout => \Add1~9\);

-- Location: FF_X26_Y16_N21
\byte_counter_int[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add1~8_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \source_cell[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => byte_counter_int(4));

-- Location: LCCOMB_X26_Y16_N22
\Add1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~10_combout\ = (byte_counter_int(5) & (!\Add1~9\)) # (!byte_counter_int(5) & ((\Add1~9\) # (GND)))
-- \Add1~11\ = CARRY((!\Add1~9\) # (!byte_counter_int(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => byte_counter_int(5),
	datad => VCC,
	cin => \Add1~9\,
	combout => \Add1~10_combout\,
	cout => \Add1~11\);

-- Location: FF_X26_Y16_N23
\byte_counter_int[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add1~10_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \source_cell[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => byte_counter_int(5));

-- Location: LCCOMB_X26_Y16_N24
\Add1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~12_combout\ = (byte_counter_int(6) & (\Add1~11\ $ (GND))) # (!byte_counter_int(6) & (!\Add1~11\ & VCC))
-- \Add1~13\ = CARRY((byte_counter_int(6) & !\Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => byte_counter_int(6),
	datad => VCC,
	cin => \Add1~11\,
	combout => \Add1~12_combout\,
	cout => \Add1~13\);

-- Location: LCCOMB_X26_Y16_N4
\Equal1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~1_combout\ = (byte_counter_int(3) & (byte_counter_int(0) & (byte_counter_int(2) & byte_counter_int(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => byte_counter_int(3),
	datab => byte_counter_int(0),
	datac => byte_counter_int(2),
	datad => byte_counter_int(1),
	combout => \Equal1~1_combout\);

-- Location: LCCOMB_X26_Y16_N0
\Selector31~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector31~0_combout\ = (\Add1~12_combout\ & (((!\state.ZERO_PADDING~q\) # (!\Equal1~1_combout\)) # (!\Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~0_combout\,
	datab => \Add1~12_combout\,
	datac => \Equal1~1_combout\,
	datad => \state.ZERO_PADDING~q\,
	combout => \Selector31~0_combout\);

-- Location: FF_X26_Y16_N1
\byte_counter_int[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector31~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \source_cell[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => byte_counter_int(6));

-- Location: LCCOMB_X26_Y16_N26
\Add1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~14_combout\ = \Add1~13\ $ (byte_counter_int(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => byte_counter_int(7),
	cin => \Add1~13\,
	combout => \Add1~14_combout\);

-- Location: FF_X26_Y16_N27
\byte_counter_int[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add1~14_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \source_cell[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => byte_counter_int(7));

-- Location: LCCOMB_X26_Y16_N6
\Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = (byte_counter_int(4) & (!byte_counter_int(6) & (byte_counter_int(5) & !byte_counter_int(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => byte_counter_int(4),
	datab => byte_counter_int(6),
	datac => byte_counter_int(5),
	datad => byte_counter_int(7),
	combout => \Equal1~0_combout\);

-- Location: LCCOMB_X33_Y16_N30
\Selector20~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector20~1_combout\ = ((!\Equal1~1_combout\) # (!\Equal1~0_combout\)) # (!\source_ready~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \source_ready~input_o\,
	datac => \Equal1~0_combout\,
	datad => \Equal1~1_combout\,
	combout => \Selector20~1_combout\);

-- Location: LCCOMB_X33_Y14_N20
\Selector20~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector20~2_combout\ = (\state.ZERO_PADDING~q\ & ((\Selector20~1_combout\) # ((\Selector20~0_combout\ & \cell_incomplete_int~q\)))) # (!\state.ZERO_PADDING~q\ & (\Selector20~0_combout\ & (\cell_incomplete_int~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.ZERO_PADDING~q\,
	datab => \Selector20~0_combout\,
	datac => \cell_incomplete_int~q\,
	datad => \Selector20~1_combout\,
	combout => \Selector20~2_combout\);

-- Location: FF_X33_Y14_N21
\next_state.ZERO_PADDING\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector20~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.ZERO_PADDING~q\);

-- Location: LCCOMB_X33_Y14_N16
\state.ZERO_PADDING~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.ZERO_PADDING~feeder_combout\ = \next_state.ZERO_PADDING~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \next_state.ZERO_PADDING~q\,
	combout => \state.ZERO_PADDING~feeder_combout\);

-- Location: FF_X33_Y14_N17
\state.ZERO_PADDING\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state.ZERO_PADDING~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.ZERO_PADDING~q\);

-- Location: LCCOMB_X33_Y14_N0
\cell_incomplete_int~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \cell_incomplete_int~2_combout\ = (\state.ZERO_PADDING~q\) # (\state.BACKPRESSURE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.ZERO_PADDING~q\,
	datad => \state.BACKPRESSURE~q\,
	combout => \cell_incomplete_int~2_combout\);

-- Location: LCCOMB_X33_Y16_N2
\Selector16~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector16~1_combout\ = (\state.PROCESSING~q\ & (((!\source_ready~input_o\) # (!\Equal1~0_combout\)) # (!\Equal1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~1_combout\,
	datab => \state.PROCESSING~q\,
	datac => \Equal1~0_combout\,
	datad => \source_ready~input_o\,
	combout => \Selector16~1_combout\);

-- Location: LCCOMB_X26_Y16_N28
\Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (!byte_counter_int(0) & (!byte_counter_int(2) & (!byte_counter_int(1) & !byte_counter_int(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => byte_counter_int(0),
	datab => byte_counter_int(2),
	datac => byte_counter_int(1),
	datad => byte_counter_int(3),
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X26_Y16_N30
\Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!byte_counter_int(5) & (!byte_counter_int(6) & (!byte_counter_int(7) & !byte_counter_int(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => byte_counter_int(5),
	datab => byte_counter_int(6),
	datac => byte_counter_int(7),
	datad => byte_counter_int(4),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X30_Y16_N18
\Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (\Equal0~1_combout\ & \Equal0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Equal0~1_combout\,
	datad => \Equal0~0_combout\,
	combout => \Equal0~2_combout\);

-- Location: LCCOMB_X30_Y16_N16
\Selector16~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector16~0_combout\ = (\sink_ready~0_combout\ & (\Equal0~2_combout\ & ((!\Equal1~0_combout\) # (!\Equal1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sink_ready~0_combout\,
	datab => \Equal1~1_combout\,
	datac => \Equal1~0_combout\,
	datad => \Equal0~2_combout\,
	combout => \Selector16~0_combout\);

-- Location: LCCOMB_X33_Y16_N22
\Selector16~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector16~2_combout\ = (\Selector16~0_combout\) # ((\cell_incomplete_int~q\ & ((\cell_incomplete_int~2_combout\) # (\Selector16~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cell_incomplete_int~2_combout\,
	datab => \Selector16~1_combout\,
	datac => \cell_incomplete_int~q\,
	datad => \Selector16~0_combout\,
	combout => \Selector16~2_combout\);

-- Location: FF_X33_Y16_N23
cell_incomplete_int : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector16~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cell_incomplete_int~q\);

-- Location: LCCOMB_X33_Y16_N28
\padding_complete_int~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \padding_complete_int~1_combout\ = (\source_ready~input_o\ & (\state.ZERO_PADDING~q\ & (\Equal1~0_combout\ & \Equal1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \source_ready~input_o\,
	datab => \state.ZERO_PADDING~q\,
	datac => \Equal1~0_combout\,
	datad => \Equal1~1_combout\,
	combout => \padding_complete_int~1_combout\);

-- Location: LCCOMB_X33_Y14_N28
\Selector17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector17~0_combout\ = (!\state.IDLE~q\ & ((!\sink_valid~input_o\) # (!\sink_sop~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.IDLE~q\,
	datac => \sink_sop~input_o\,
	datad => \sink_valid~input_o\,
	combout => \Selector17~0_combout\);

-- Location: LCCOMB_X33_Y14_N8
\Selector17~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector17~1_combout\ = (!\padding_complete_int~1_combout\ & (!\Selector17~0_combout\ & ((\cell_incomplete_int~q\) # (!\Selector20~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector20~0_combout\,
	datab => \cell_incomplete_int~q\,
	datac => \padding_complete_int~1_combout\,
	datad => \Selector17~0_combout\,
	combout => \Selector17~1_combout\);

-- Location: FF_X33_Y14_N9
\next_state.IDLE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector17~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.IDLE~q\);

-- Location: FF_X33_Y14_N7
\state.IDLE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.IDLE~q\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.IDLE~q\);

-- Location: LCCOMB_X33_Y14_N26
\Selector18~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector18~1_combout\ = (\Selector18~0_combout\) # ((\sink_valid~input_o\ & (\sink_sop~input_o\ & !\state.IDLE~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector18~0_combout\,
	datab => \sink_valid~input_o\,
	datac => \sink_sop~input_o\,
	datad => \state.IDLE~q\,
	combout => \Selector18~1_combout\);

-- Location: FF_X33_Y14_N27
\next_state.PROCESSING\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector18~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.PROCESSING~q\);

-- Location: FF_X33_Y14_N15
\state.PROCESSING\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.PROCESSING~q\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.PROCESSING~q\);

-- Location: LCCOMB_X33_Y14_N24
\sink_ready~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sink_ready~0_combout\ = (\state.PROCESSING~q\ & \source_ready~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.PROCESSING~q\,
	datad => \source_ready~input_o\,
	combout => \sink_ready~0_combout\);

-- Location: IOIBUF_X34_Y12_N1
\sink_data[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sink_data(0),
	o => \sink_data[0]~input_o\);

-- Location: LCCOMB_X33_Y14_N30
\Selector29~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector29~0_combout\ = (!\state.ZERO_PADDING~q\ & \sink_data[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.ZERO_PADDING~q\,
	datad => \sink_data[0]~input_o\,
	combout => \Selector29~0_combout\);

-- Location: FF_X33_Y14_N31
\source_cell[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector29~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \source_cell[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_cell[0]~reg0_q\);

-- Location: IOIBUF_X28_Y0_N1
\sink_data[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sink_data(1),
	o => \sink_data[1]~input_o\);

-- Location: LCCOMB_X25_Y1_N12
\Selector28~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector28~0_combout\ = (\sink_data[1]~input_o\ & !\state.ZERO_PADDING~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \sink_data[1]~input_o\,
	datad => \state.ZERO_PADDING~q\,
	combout => \Selector28~0_combout\);

-- Location: FF_X25_Y1_N13
\source_cell[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector28~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \source_cell[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_cell[1]~reg0_q\);

-- Location: IOIBUF_X28_Y0_N8
\sink_data[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sink_data(2),
	o => \sink_data[2]~input_o\);

-- Location: LCCOMB_X25_Y1_N10
\Selector27~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector27~0_combout\ = (\sink_data[2]~input_o\ & !\state.ZERO_PADDING~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \sink_data[2]~input_o\,
	datad => \state.ZERO_PADDING~q\,
	combout => \Selector27~0_combout\);

-- Location: FF_X25_Y1_N11
\source_cell[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector27~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \source_cell[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_cell[2]~reg0_q\);

-- Location: IOIBUF_X25_Y0_N1
\sink_data[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sink_data(3),
	o => \sink_data[3]~input_o\);

-- Location: LCCOMB_X25_Y1_N8
\Selector26~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector26~0_combout\ = (\sink_data[3]~input_o\ & !\state.ZERO_PADDING~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \sink_data[3]~input_o\,
	datad => \state.ZERO_PADDING~q\,
	combout => \Selector26~0_combout\);

-- Location: FF_X25_Y1_N9
\source_cell[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector26~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \source_cell[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_cell[3]~reg0_q\);

-- Location: IOIBUF_X25_Y0_N22
\sink_data[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sink_data(4),
	o => \sink_data[4]~input_o\);

-- Location: LCCOMB_X25_Y1_N6
\Selector25~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector25~0_combout\ = (\sink_data[4]~input_o\ & !\state.ZERO_PADDING~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \sink_data[4]~input_o\,
	datad => \state.ZERO_PADDING~q\,
	combout => \Selector25~0_combout\);

-- Location: FF_X25_Y1_N7
\source_cell[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector25~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \source_cell[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_cell[4]~reg0_q\);

-- Location: IOIBUF_X18_Y0_N15
\sink_data[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sink_data(5),
	o => \sink_data[5]~input_o\);

-- Location: LCCOMB_X25_Y1_N28
\Selector24~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector24~0_combout\ = (\sink_data[5]~input_o\ & !\state.ZERO_PADDING~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \sink_data[5]~input_o\,
	datad => \state.ZERO_PADDING~q\,
	combout => \Selector24~0_combout\);

-- Location: FF_X25_Y1_N29
\source_cell[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector24~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \source_cell[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_cell[5]~reg0_q\);

-- Location: IOIBUF_X21_Y0_N22
\sink_data[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sink_data(6),
	o => \sink_data[6]~input_o\);

-- Location: LCCOMB_X25_Y1_N26
\Selector23~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector23~0_combout\ = (\sink_data[6]~input_o\ & !\state.ZERO_PADDING~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \sink_data[6]~input_o\,
	datad => \state.ZERO_PADDING~q\,
	combout => \Selector23~0_combout\);

-- Location: FF_X25_Y1_N27
\source_cell[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector23~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \source_cell[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_cell[6]~reg0_q\);

-- Location: IOIBUF_X25_Y0_N8
\sink_data[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sink_data(7),
	o => \sink_data[7]~input_o\);

-- Location: LCCOMB_X25_Y1_N24
\Selector22~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector22~0_combout\ = (\sink_data[7]~input_o\ & !\state.ZERO_PADDING~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \sink_data[7]~input_o\,
	datad => \state.ZERO_PADDING~q\,
	combout => \Selector22~0_combout\);

-- Location: FF_X25_Y1_N25
\source_cell[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector22~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \source_cell[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_cell[7]~reg0_q\);

-- Location: LCCOMB_X30_Y16_N0
\source_soc~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \source_soc~0_combout\ = (\sink_ready~0_combout\ & (\Equal0~0_combout\ & (\Equal0~1_combout\))) # (!\sink_ready~0_combout\ & (((\source_soc~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => \Equal0~1_combout\,
	datac => \source_soc~reg0_q\,
	datad => \sink_ready~0_combout\,
	combout => \source_soc~0_combout\);

-- Location: FF_X30_Y16_N1
\source_soc~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \source_soc~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_soc~reg0_q\);

-- Location: LCCOMB_X33_Y16_N0
\source_eoc~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \source_eoc~0_combout\ = (\source_cell[0]~1_combout\ & (\Equal1~0_combout\ & ((\Equal1~1_combout\)))) # (!\source_cell[0]~1_combout\ & (((\source_eoc~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~0_combout\,
	datab => \source_cell[0]~1_combout\,
	datac => \source_eoc~reg0_q\,
	datad => \Equal1~1_combout\,
	combout => \source_eoc~0_combout\);

-- Location: FF_X33_Y16_N1
\source_eoc~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \source_eoc~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_eoc~reg0_q\);

-- Location: LCCOMB_X26_Y16_N10
\cell_counter~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \cell_counter~0_combout\ = (\source_ready~input_o\ & (\Equal0~0_combout\ & \Equal0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \source_ready~input_o\,
	datac => \Equal0~0_combout\,
	datad => \Equal0~1_combout\,
	combout => \cell_counter~0_combout\);

-- Location: LCCOMB_X25_Y16_N0
\Add3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~0_combout\ = (cell_counter(0) & (\cell_counter~0_combout\ $ (VCC))) # (!cell_counter(0) & (\cell_counter~0_combout\ & VCC))
-- \Add3~1\ = CARRY((cell_counter(0) & \cell_counter~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cell_counter(0),
	datab => \cell_counter~0_combout\,
	datad => VCC,
	combout => \Add3~0_combout\,
	cout => \Add3~1\);

-- Location: LCCOMB_X24_Y16_N16
\Selector15~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector15~0_combout\ = (\state.PROCESSING~q\ & ((\Add3~0_combout\) # ((cell_counter(0) & \cell_incomplete_int~2_combout\)))) # (!\state.PROCESSING~q\ & (((cell_counter(0) & \cell_incomplete_int~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.PROCESSING~q\,
	datab => \Add3~0_combout\,
	datac => cell_counter(0),
	datad => \cell_incomplete_int~2_combout\,
	combout => \Selector15~0_combout\);

-- Location: FF_X24_Y16_N17
\cell_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector15~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cell_counter(0));

-- Location: FF_X25_Y16_N21
\source_channel[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => cell_counter(0),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[0]~reg0_q\);

-- Location: LCCOMB_X25_Y16_N2
\Add3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~2_combout\ = (cell_counter(1) & (!\Add3~1\)) # (!cell_counter(1) & ((\Add3~1\) # (GND)))
-- \Add3~3\ = CARRY((!\Add3~1\) # (!cell_counter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => cell_counter(1),
	datad => VCC,
	cin => \Add3~1\,
	combout => \Add3~2_combout\,
	cout => \Add3~3\);

-- Location: LCCOMB_X24_Y16_N6
\Selector14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector14~0_combout\ = (\state.PROCESSING~q\ & ((\Add3~2_combout\) # ((\cell_incomplete_int~2_combout\ & cell_counter(1))))) # (!\state.PROCESSING~q\ & (\cell_incomplete_int~2_combout\ & (cell_counter(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.PROCESSING~q\,
	datab => \cell_incomplete_int~2_combout\,
	datac => cell_counter(1),
	datad => \Add3~2_combout\,
	combout => \Selector14~0_combout\);

-- Location: FF_X24_Y16_N7
\cell_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector14~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cell_counter(1));

-- Location: FF_X25_Y16_N3
\source_channel[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => cell_counter(1),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[1]~reg0_q\);

-- Location: LCCOMB_X25_Y16_N4
\Add3~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~4_combout\ = (cell_counter(2) & (\Add3~3\ $ (GND))) # (!cell_counter(2) & (!\Add3~3\ & VCC))
-- \Add3~5\ = CARRY((cell_counter(2) & !\Add3~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => cell_counter(2),
	datad => VCC,
	cin => \Add3~3\,
	combout => \Add3~4_combout\,
	cout => \Add3~5\);

-- Location: LCCOMB_X24_Y16_N20
\Selector13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector13~0_combout\ = (\state.PROCESSING~q\ & ((\Add3~4_combout\) # ((\cell_incomplete_int~2_combout\ & cell_counter(2))))) # (!\state.PROCESSING~q\ & (\cell_incomplete_int~2_combout\ & (cell_counter(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.PROCESSING~q\,
	datab => \cell_incomplete_int~2_combout\,
	datac => cell_counter(2),
	datad => \Add3~4_combout\,
	combout => \Selector13~0_combout\);

-- Location: FF_X24_Y16_N21
\cell_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector13~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cell_counter(2));

-- Location: LCCOMB_X24_Y16_N24
\source_channel[2]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \source_channel[2]~reg0feeder_combout\ = cell_counter(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => cell_counter(2),
	combout => \source_channel[2]~reg0feeder_combout\);

-- Location: FF_X24_Y16_N25
\source_channel[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \source_channel[2]~reg0feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[2]~reg0_q\);

-- Location: LCCOMB_X25_Y16_N6
\Add3~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~6_combout\ = (cell_counter(3) & (!\Add3~5\)) # (!cell_counter(3) & ((\Add3~5\) # (GND)))
-- \Add3~7\ = CARRY((!\Add3~5\) # (!cell_counter(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => cell_counter(3),
	datad => VCC,
	cin => \Add3~5\,
	combout => \Add3~6_combout\,
	cout => \Add3~7\);

-- Location: LCCOMB_X24_Y16_N26
\Selector12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector12~0_combout\ = (\state.PROCESSING~q\ & ((\Add3~6_combout\) # ((\cell_incomplete_int~2_combout\ & cell_counter(3))))) # (!\state.PROCESSING~q\ & (\cell_incomplete_int~2_combout\ & (cell_counter(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.PROCESSING~q\,
	datab => \cell_incomplete_int~2_combout\,
	datac => cell_counter(3),
	datad => \Add3~6_combout\,
	combout => \Selector12~0_combout\);

-- Location: FF_X24_Y16_N27
\cell_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector12~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cell_counter(3));

-- Location: FF_X25_Y16_N1
\source_channel[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => cell_counter(3),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[3]~reg0_q\);

-- Location: LCCOMB_X25_Y16_N8
\Add3~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~8_combout\ = (cell_counter(4) & (\Add3~7\ $ (GND))) # (!cell_counter(4) & (!\Add3~7\ & VCC))
-- \Add3~9\ = CARRY((cell_counter(4) & !\Add3~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => cell_counter(4),
	datad => VCC,
	cin => \Add3~7\,
	combout => \Add3~8_combout\,
	cout => \Add3~9\);

-- Location: LCCOMB_X24_Y16_N12
\Selector11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector11~0_combout\ = (\state.PROCESSING~q\ & ((\Add3~8_combout\) # ((\cell_incomplete_int~2_combout\ & cell_counter(4))))) # (!\state.PROCESSING~q\ & (\cell_incomplete_int~2_combout\ & (cell_counter(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.PROCESSING~q\,
	datab => \cell_incomplete_int~2_combout\,
	datac => cell_counter(4),
	datad => \Add3~8_combout\,
	combout => \Selector11~0_combout\);

-- Location: FF_X24_Y16_N13
\cell_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector11~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cell_counter(4));

-- Location: FF_X25_Y16_N27
\source_channel[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => cell_counter(4),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[4]~reg0_q\);

-- Location: LCCOMB_X25_Y16_N10
\Add3~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~10_combout\ = (cell_counter(5) & (!\Add3~9\)) # (!cell_counter(5) & ((\Add3~9\) # (GND)))
-- \Add3~11\ = CARRY((!\Add3~9\) # (!cell_counter(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => cell_counter(5),
	datad => VCC,
	cin => \Add3~9\,
	combout => \Add3~10_combout\,
	cout => \Add3~11\);

-- Location: LCCOMB_X24_Y16_N22
\Selector10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector10~0_combout\ = (\state.PROCESSING~q\ & ((\Add3~10_combout\) # ((\cell_incomplete_int~2_combout\ & cell_counter(5))))) # (!\state.PROCESSING~q\ & (\cell_incomplete_int~2_combout\ & (cell_counter(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.PROCESSING~q\,
	datab => \cell_incomplete_int~2_combout\,
	datac => cell_counter(5),
	datad => \Add3~10_combout\,
	combout => \Selector10~0_combout\);

-- Location: FF_X24_Y16_N23
\cell_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector10~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cell_counter(5));

-- Location: LCCOMB_X23_Y16_N12
\source_channel[5]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \source_channel[5]~reg0feeder_combout\ = cell_counter(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => cell_counter(5),
	combout => \source_channel[5]~reg0feeder_combout\);

-- Location: FF_X23_Y16_N13
\source_channel[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \source_channel[5]~reg0feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[5]~reg0_q\);

-- Location: LCCOMB_X25_Y16_N12
\Add3~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~12_combout\ = (cell_counter(6) & (\Add3~11\ $ (GND))) # (!cell_counter(6) & (!\Add3~11\ & VCC))
-- \Add3~13\ = CARRY((cell_counter(6) & !\Add3~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => cell_counter(6),
	datad => VCC,
	cin => \Add3~11\,
	combout => \Add3~12_combout\,
	cout => \Add3~13\);

-- Location: LCCOMB_X24_Y16_N0
\Selector9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector9~0_combout\ = (\state.PROCESSING~q\ & ((\Add3~12_combout\) # ((\cell_incomplete_int~2_combout\ & cell_counter(6))))) # (!\state.PROCESSING~q\ & (\cell_incomplete_int~2_combout\ & (cell_counter(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.PROCESSING~q\,
	datab => \cell_incomplete_int~2_combout\,
	datac => cell_counter(6),
	datad => \Add3~12_combout\,
	combout => \Selector9~0_combout\);

-- Location: FF_X24_Y16_N1
\cell_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector9~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cell_counter(6));

-- Location: FF_X25_Y16_N7
\source_channel[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => cell_counter(6),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[6]~reg0_q\);

-- Location: LCCOMB_X25_Y16_N14
\Add3~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~14_combout\ = (cell_counter(7) & (!\Add3~13\)) # (!cell_counter(7) & ((\Add3~13\) # (GND)))
-- \Add3~15\ = CARRY((!\Add3~13\) # (!cell_counter(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => cell_counter(7),
	datad => VCC,
	cin => \Add3~13\,
	combout => \Add3~14_combout\,
	cout => \Add3~15\);

-- Location: LCCOMB_X24_Y16_N10
\Selector8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector8~0_combout\ = (\state.PROCESSING~q\ & ((\Add3~14_combout\) # ((cell_counter(7) & \cell_incomplete_int~2_combout\)))) # (!\state.PROCESSING~q\ & (((cell_counter(7) & \cell_incomplete_int~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.PROCESSING~q\,
	datab => \Add3~14_combout\,
	datac => cell_counter(7),
	datad => \cell_incomplete_int~2_combout\,
	combout => \Selector8~0_combout\);

-- Location: FF_X24_Y16_N11
\cell_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector8~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cell_counter(7));

-- Location: FF_X25_Y16_N31
\source_channel[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => cell_counter(7),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[7]~reg0_q\);

-- Location: LCCOMB_X25_Y16_N16
\Add3~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~16_combout\ = (cell_counter(8) & (\Add3~15\ $ (GND))) # (!cell_counter(8) & (!\Add3~15\ & VCC))
-- \Add3~17\ = CARRY((cell_counter(8) & !\Add3~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => cell_counter(8),
	datad => VCC,
	cin => \Add3~15\,
	combout => \Add3~16_combout\,
	cout => \Add3~17\);

-- Location: LCCOMB_X24_Y16_N4
\Selector7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = (\state.PROCESSING~q\ & ((\Add3~16_combout\) # ((\cell_incomplete_int~2_combout\ & cell_counter(8))))) # (!\state.PROCESSING~q\ & (\cell_incomplete_int~2_combout\ & (cell_counter(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.PROCESSING~q\,
	datab => \cell_incomplete_int~2_combout\,
	datac => cell_counter(8),
	datad => \Add3~16_combout\,
	combout => \Selector7~0_combout\);

-- Location: FF_X24_Y16_N5
\cell_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector7~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cell_counter(8));

-- Location: LCCOMB_X22_Y16_N0
\source_channel[8]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \source_channel[8]~reg0feeder_combout\ = cell_counter(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => cell_counter(8),
	combout => \source_channel[8]~reg0feeder_combout\);

-- Location: FF_X22_Y16_N1
\source_channel[8]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \source_channel[8]~reg0feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[8]~reg0_q\);

-- Location: LCCOMB_X25_Y16_N18
\Add3~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~18_combout\ = (cell_counter(9) & (!\Add3~17\)) # (!cell_counter(9) & ((\Add3~17\) # (GND)))
-- \Add3~19\ = CARRY((!\Add3~17\) # (!cell_counter(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => cell_counter(9),
	datad => VCC,
	cin => \Add3~17\,
	combout => \Add3~18_combout\,
	cout => \Add3~19\);

-- Location: LCCOMB_X24_Y16_N30
\Selector6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = (\state.PROCESSING~q\ & ((\Add3~18_combout\) # ((\cell_incomplete_int~2_combout\ & cell_counter(9))))) # (!\state.PROCESSING~q\ & (\cell_incomplete_int~2_combout\ & (cell_counter(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.PROCESSING~q\,
	datab => \cell_incomplete_int~2_combout\,
	datac => cell_counter(9),
	datad => \Add3~18_combout\,
	combout => \Selector6~0_combout\);

-- Location: FF_X24_Y16_N31
\cell_counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector6~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cell_counter(9));

-- Location: FF_X24_Y16_N3
\source_channel[9]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => cell_counter(9),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[9]~reg0_q\);

-- Location: LCCOMB_X25_Y16_N20
\Add3~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~20_combout\ = (cell_counter(10) & (\Add3~19\ $ (GND))) # (!cell_counter(10) & (!\Add3~19\ & VCC))
-- \Add3~21\ = CARRY((cell_counter(10) & !\Add3~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => cell_counter(10),
	datad => VCC,
	cin => \Add3~19\,
	combout => \Add3~20_combout\,
	cout => \Add3~21\);

-- Location: LCCOMB_X24_Y16_N8
\Selector5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = (\state.PROCESSING~q\ & ((\Add3~20_combout\) # ((\cell_incomplete_int~2_combout\ & cell_counter(10))))) # (!\state.PROCESSING~q\ & (\cell_incomplete_int~2_combout\ & (cell_counter(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.PROCESSING~q\,
	datab => \cell_incomplete_int~2_combout\,
	datac => cell_counter(10),
	datad => \Add3~20_combout\,
	combout => \Selector5~0_combout\);

-- Location: FF_X24_Y16_N9
\cell_counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector5~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cell_counter(10));

-- Location: FF_X25_Y16_N29
\source_channel[10]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => cell_counter(10),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[10]~reg0_q\);

-- Location: LCCOMB_X25_Y16_N22
\Add3~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~22_combout\ = (cell_counter(11) & (!\Add3~21\)) # (!cell_counter(11) & ((\Add3~21\) # (GND)))
-- \Add3~23\ = CARRY((!\Add3~21\) # (!cell_counter(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => cell_counter(11),
	datad => VCC,
	cin => \Add3~21\,
	combout => \Add3~22_combout\,
	cout => \Add3~23\);

-- Location: LCCOMB_X26_Y16_N2
\Selector4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = (\state.PROCESSING~q\ & ((\Add3~22_combout\) # ((\cell_incomplete_int~2_combout\ & cell_counter(11))))) # (!\state.PROCESSING~q\ & (\cell_incomplete_int~2_combout\ & (cell_counter(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.PROCESSING~q\,
	datab => \cell_incomplete_int~2_combout\,
	datac => cell_counter(11),
	datad => \Add3~22_combout\,
	combout => \Selector4~0_combout\);

-- Location: FF_X26_Y16_N3
\cell_counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector4~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cell_counter(11));

-- Location: FF_X25_Y16_N25
\source_channel[11]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => cell_counter(11),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[11]~reg0_q\);

-- Location: LCCOMB_X25_Y16_N24
\Add3~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~24_combout\ = (cell_counter(12) & (\Add3~23\ $ (GND))) # (!cell_counter(12) & (!\Add3~23\ & VCC))
-- \Add3~25\ = CARRY((cell_counter(12) & !\Add3~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => cell_counter(12),
	datad => VCC,
	cin => \Add3~23\,
	combout => \Add3~24_combout\,
	cout => \Add3~25\);

-- Location: LCCOMB_X24_Y16_N18
\Selector3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = (\state.PROCESSING~q\ & ((\Add3~24_combout\) # ((\cell_incomplete_int~2_combout\ & cell_counter(12))))) # (!\state.PROCESSING~q\ & (\cell_incomplete_int~2_combout\ & (cell_counter(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.PROCESSING~q\,
	datab => \cell_incomplete_int~2_combout\,
	datac => cell_counter(12),
	datad => \Add3~24_combout\,
	combout => \Selector3~0_combout\);

-- Location: FF_X24_Y16_N19
\cell_counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector3~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cell_counter(12));

-- Location: LCCOMB_X23_Y16_N18
\source_channel[12]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \source_channel[12]~reg0feeder_combout\ = cell_counter(12)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => cell_counter(12),
	combout => \source_channel[12]~reg0feeder_combout\);

-- Location: FF_X23_Y16_N19
\source_channel[12]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \source_channel[12]~reg0feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[12]~reg0_q\);

-- Location: LCCOMB_X25_Y16_N26
\Add3~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~26_combout\ = (cell_counter(13) & (!\Add3~25\)) # (!cell_counter(13) & ((\Add3~25\) # (GND)))
-- \Add3~27\ = CARRY((!\Add3~25\) # (!cell_counter(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => cell_counter(13),
	datad => VCC,
	cin => \Add3~25\,
	combout => \Add3~26_combout\,
	cout => \Add3~27\);

-- Location: LCCOMB_X24_Y16_N28
\Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (\state.PROCESSING~q\ & ((\Add3~26_combout\) # ((\cell_incomplete_int~2_combout\ & cell_counter(13))))) # (!\state.PROCESSING~q\ & (\cell_incomplete_int~2_combout\ & (cell_counter(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.PROCESSING~q\,
	datab => \cell_incomplete_int~2_combout\,
	datac => cell_counter(13),
	datad => \Add3~26_combout\,
	combout => \Selector2~0_combout\);

-- Location: FF_X24_Y16_N29
\cell_counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector2~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cell_counter(13));

-- Location: LCCOMB_X23_Y16_N16
\source_channel[13]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \source_channel[13]~reg0feeder_combout\ = cell_counter(13)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => cell_counter(13),
	combout => \source_channel[13]~reg0feeder_combout\);

-- Location: FF_X23_Y16_N17
\source_channel[13]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \source_channel[13]~reg0feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[13]~reg0_q\);

-- Location: LCCOMB_X25_Y16_N28
\Add3~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~28_combout\ = (cell_counter(14) & (\Add3~27\ $ (GND))) # (!cell_counter(14) & (!\Add3~27\ & VCC))
-- \Add3~29\ = CARRY((cell_counter(14) & !\Add3~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => cell_counter(14),
	datad => VCC,
	cin => \Add3~27\,
	combout => \Add3~28_combout\,
	cout => \Add3~29\);

-- Location: LCCOMB_X26_Y16_N8
\Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = (\state.PROCESSING~q\ & ((\Add3~28_combout\) # ((\cell_incomplete_int~2_combout\ & cell_counter(14))))) # (!\state.PROCESSING~q\ & (\cell_incomplete_int~2_combout\ & (cell_counter(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.PROCESSING~q\,
	datab => \cell_incomplete_int~2_combout\,
	datac => cell_counter(14),
	datad => \Add3~28_combout\,
	combout => \Selector1~0_combout\);

-- Location: FF_X26_Y16_N9
\cell_counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector1~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cell_counter(14));

-- Location: FF_X25_Y16_N5
\source_channel[14]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => cell_counter(14),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[14]~reg0_q\);

-- Location: LCCOMB_X25_Y16_N30
\Add3~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~30_combout\ = \Add3~29\ $ (cell_counter(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => cell_counter(15),
	cin => \Add3~29\,
	combout => \Add3~30_combout\);

-- Location: LCCOMB_X24_Y16_N14
\Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (\state.PROCESSING~q\ & ((\Add3~30_combout\) # ((\cell_incomplete_int~2_combout\ & cell_counter(15))))) # (!\state.PROCESSING~q\ & (\cell_incomplete_int~2_combout\ & (cell_counter(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.PROCESSING~q\,
	datab => \cell_incomplete_int~2_combout\,
	datac => cell_counter(15),
	datad => \Add3~30_combout\,
	combout => \Selector0~0_combout\);

-- Location: FF_X24_Y16_N15
\cell_counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector0~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cell_counter(15));

-- Location: FF_X23_Y16_N3
\source_channel[15]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => cell_counter(15),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[15]~reg0_q\);

-- Location: LCCOMB_X33_Y7_N18
\packet_counter[0]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_counter[0]~15_combout\ = packet_counter(0) $ (((\sink_sop~input_o\ & (\sink_valid~input_o\ & !\state.IDLE~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sink_sop~input_o\,
	datab => \sink_valid~input_o\,
	datac => packet_counter(0),
	datad => \state.IDLE~q\,
	combout => \packet_counter[0]~15_combout\);

-- Location: FF_X33_Y7_N19
\packet_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \packet_counter[0]~15_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_counter(0));

-- Location: LCCOMB_X33_Y7_N4
\source_channel[16]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \source_channel[16]~reg0feeder_combout\ = packet_counter(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => packet_counter(0),
	combout => \source_channel[16]~reg0feeder_combout\);

-- Location: FF_X33_Y7_N5
\source_channel[16]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \source_channel[16]~reg0feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[16]~reg0_q\);

-- Location: LCCOMB_X32_Y7_N2
\packet_counter[1]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_counter[1]~16_combout\ = (packet_counter(1) & (packet_counter(0) $ (VCC))) # (!packet_counter(1) & (packet_counter(0) & VCC))
-- \packet_counter[1]~17\ = CARRY((packet_counter(1) & packet_counter(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => packet_counter(1),
	datab => packet_counter(0),
	datad => VCC,
	combout => \packet_counter[1]~16_combout\,
	cout => \packet_counter[1]~17\);

-- Location: LCCOMB_X33_Y14_N22
\Selector18~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector18~2_combout\ = (\sink_valid~input_o\ & (\sink_sop~input_o\ & !\state.IDLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sink_valid~input_o\,
	datac => \sink_sop~input_o\,
	datad => \state.IDLE~q\,
	combout => \Selector18~2_combout\);

-- Location: FF_X32_Y7_N3
\packet_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \packet_counter[1]~16_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Selector18~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_counter(1));

-- Location: LCCOMB_X33_Y7_N6
\source_channel[17]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \source_channel[17]~reg0feeder_combout\ = packet_counter(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => packet_counter(1),
	combout => \source_channel[17]~reg0feeder_combout\);

-- Location: FF_X33_Y7_N7
\source_channel[17]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \source_channel[17]~reg0feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[17]~reg0_q\);

-- Location: LCCOMB_X32_Y7_N4
\packet_counter[2]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_counter[2]~18_combout\ = (packet_counter(2) & (!\packet_counter[1]~17\)) # (!packet_counter(2) & ((\packet_counter[1]~17\) # (GND)))
-- \packet_counter[2]~19\ = CARRY((!\packet_counter[1]~17\) # (!packet_counter(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => packet_counter(2),
	datad => VCC,
	cin => \packet_counter[1]~17\,
	combout => \packet_counter[2]~18_combout\,
	cout => \packet_counter[2]~19\);

-- Location: FF_X32_Y7_N5
\packet_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \packet_counter[2]~18_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Selector18~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_counter(2));

-- Location: FF_X33_Y7_N9
\source_channel[18]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => packet_counter(2),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[18]~reg0_q\);

-- Location: LCCOMB_X32_Y7_N6
\packet_counter[3]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_counter[3]~20_combout\ = (packet_counter(3) & (\packet_counter[2]~19\ $ (GND))) # (!packet_counter(3) & (!\packet_counter[2]~19\ & VCC))
-- \packet_counter[3]~21\ = CARRY((packet_counter(3) & !\packet_counter[2]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => packet_counter(3),
	datad => VCC,
	cin => \packet_counter[2]~19\,
	combout => \packet_counter[3]~20_combout\,
	cout => \packet_counter[3]~21\);

-- Location: FF_X32_Y7_N7
\packet_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \packet_counter[3]~20_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Selector18~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_counter(3));

-- Location: FF_X33_Y7_N3
\source_channel[19]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => packet_counter(3),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[19]~reg0_q\);

-- Location: LCCOMB_X32_Y7_N8
\packet_counter[4]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_counter[4]~22_combout\ = (packet_counter(4) & (!\packet_counter[3]~21\)) # (!packet_counter(4) & ((\packet_counter[3]~21\) # (GND)))
-- \packet_counter[4]~23\ = CARRY((!\packet_counter[3]~21\) # (!packet_counter(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => packet_counter(4),
	datad => VCC,
	cin => \packet_counter[3]~21\,
	combout => \packet_counter[4]~22_combout\,
	cout => \packet_counter[4]~23\);

-- Location: FF_X32_Y7_N9
\packet_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \packet_counter[4]~22_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Selector18~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_counter(4));

-- Location: FF_X33_Y7_N29
\source_channel[20]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => packet_counter(4),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[20]~reg0_q\);

-- Location: LCCOMB_X32_Y7_N10
\packet_counter[5]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_counter[5]~24_combout\ = (packet_counter(5) & (\packet_counter[4]~23\ $ (GND))) # (!packet_counter(5) & (!\packet_counter[4]~23\ & VCC))
-- \packet_counter[5]~25\ = CARRY((packet_counter(5) & !\packet_counter[4]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => packet_counter(5),
	datad => VCC,
	cin => \packet_counter[4]~23\,
	combout => \packet_counter[5]~24_combout\,
	cout => \packet_counter[5]~25\);

-- Location: FF_X32_Y7_N11
\packet_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \packet_counter[5]~24_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Selector18~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_counter(5));

-- Location: LCCOMB_X32_Y7_N0
\source_channel[21]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \source_channel[21]~reg0feeder_combout\ = packet_counter(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => packet_counter(5),
	combout => \source_channel[21]~reg0feeder_combout\);

-- Location: FF_X32_Y7_N1
\source_channel[21]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \source_channel[21]~reg0feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[21]~reg0_q\);

-- Location: LCCOMB_X32_Y7_N12
\packet_counter[6]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_counter[6]~26_combout\ = (packet_counter(6) & (!\packet_counter[5]~25\)) # (!packet_counter(6) & ((\packet_counter[5]~25\) # (GND)))
-- \packet_counter[6]~27\ = CARRY((!\packet_counter[5]~25\) # (!packet_counter(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => packet_counter(6),
	datad => VCC,
	cin => \packet_counter[5]~25\,
	combout => \packet_counter[6]~26_combout\,
	cout => \packet_counter[6]~27\);

-- Location: FF_X32_Y7_N13
\packet_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \packet_counter[6]~26_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Selector18~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_counter(6));

-- Location: LCCOMB_X33_Y7_N30
\source_channel[22]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \source_channel[22]~reg0feeder_combout\ = packet_counter(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => packet_counter(6),
	combout => \source_channel[22]~reg0feeder_combout\);

-- Location: FF_X33_Y7_N31
\source_channel[22]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \source_channel[22]~reg0feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[22]~reg0_q\);

-- Location: LCCOMB_X32_Y7_N14
\packet_counter[7]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_counter[7]~28_combout\ = (packet_counter(7) & (\packet_counter[6]~27\ $ (GND))) # (!packet_counter(7) & (!\packet_counter[6]~27\ & VCC))
-- \packet_counter[7]~29\ = CARRY((packet_counter(7) & !\packet_counter[6]~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => packet_counter(7),
	datad => VCC,
	cin => \packet_counter[6]~27\,
	combout => \packet_counter[7]~28_combout\,
	cout => \packet_counter[7]~29\);

-- Location: FF_X32_Y7_N15
\packet_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \packet_counter[7]~28_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Selector18~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_counter(7));

-- Location: LCCOMB_X33_Y7_N24
\source_channel[23]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \source_channel[23]~reg0feeder_combout\ = packet_counter(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => packet_counter(7),
	combout => \source_channel[23]~reg0feeder_combout\);

-- Location: FF_X33_Y7_N25
\source_channel[23]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \source_channel[23]~reg0feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[23]~reg0_q\);

-- Location: LCCOMB_X32_Y7_N16
\packet_counter[8]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_counter[8]~30_combout\ = (packet_counter(8) & (!\packet_counter[7]~29\)) # (!packet_counter(8) & ((\packet_counter[7]~29\) # (GND)))
-- \packet_counter[8]~31\ = CARRY((!\packet_counter[7]~29\) # (!packet_counter(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => packet_counter(8),
	datad => VCC,
	cin => \packet_counter[7]~29\,
	combout => \packet_counter[8]~30_combout\,
	cout => \packet_counter[8]~31\);

-- Location: FF_X32_Y7_N17
\packet_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \packet_counter[8]~30_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Selector18~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_counter(8));

-- Location: FF_X33_Y7_N15
\source_channel[24]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => packet_counter(8),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[24]~reg0_q\);

-- Location: LCCOMB_X32_Y7_N18
\packet_counter[9]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_counter[9]~32_combout\ = (packet_counter(9) & (\packet_counter[8]~31\ $ (GND))) # (!packet_counter(9) & (!\packet_counter[8]~31\ & VCC))
-- \packet_counter[9]~33\ = CARRY((packet_counter(9) & !\packet_counter[8]~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => packet_counter(9),
	datad => VCC,
	cin => \packet_counter[8]~31\,
	combout => \packet_counter[9]~32_combout\,
	cout => \packet_counter[9]~33\);

-- Location: FF_X32_Y7_N19
\packet_counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \packet_counter[9]~32_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Selector18~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_counter(9));

-- Location: LCCOMB_X33_Y7_N12
\source_channel[25]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \source_channel[25]~reg0feeder_combout\ = packet_counter(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => packet_counter(9),
	combout => \source_channel[25]~reg0feeder_combout\);

-- Location: FF_X33_Y7_N13
\source_channel[25]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \source_channel[25]~reg0feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[25]~reg0_q\);

-- Location: LCCOMB_X32_Y7_N20
\packet_counter[10]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_counter[10]~34_combout\ = (packet_counter(10) & (!\packet_counter[9]~33\)) # (!packet_counter(10) & ((\packet_counter[9]~33\) # (GND)))
-- \packet_counter[10]~35\ = CARRY((!\packet_counter[9]~33\) # (!packet_counter(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => packet_counter(10),
	datad => VCC,
	cin => \packet_counter[9]~33\,
	combout => \packet_counter[10]~34_combout\,
	cout => \packet_counter[10]~35\);

-- Location: FF_X32_Y7_N21
\packet_counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \packet_counter[10]~34_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Selector18~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_counter(10));

-- Location: LCCOMB_X33_Y7_N26
\source_channel[26]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \source_channel[26]~reg0feeder_combout\ = packet_counter(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => packet_counter(10),
	combout => \source_channel[26]~reg0feeder_combout\);

-- Location: FF_X33_Y7_N27
\source_channel[26]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \source_channel[26]~reg0feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[26]~reg0_q\);

-- Location: LCCOMB_X32_Y7_N22
\packet_counter[11]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_counter[11]~36_combout\ = (packet_counter(11) & (\packet_counter[10]~35\ $ (GND))) # (!packet_counter(11) & (!\packet_counter[10]~35\ & VCC))
-- \packet_counter[11]~37\ = CARRY((packet_counter(11) & !\packet_counter[10]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => packet_counter(11),
	datad => VCC,
	cin => \packet_counter[10]~35\,
	combout => \packet_counter[11]~36_combout\,
	cout => \packet_counter[11]~37\);

-- Location: FF_X32_Y7_N23
\packet_counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \packet_counter[11]~36_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Selector18~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_counter(11));

-- Location: LCCOMB_X33_Y7_N16
\source_channel[27]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \source_channel[27]~reg0feeder_combout\ = packet_counter(11)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => packet_counter(11),
	combout => \source_channel[27]~reg0feeder_combout\);

-- Location: FF_X33_Y7_N17
\source_channel[27]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \source_channel[27]~reg0feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[27]~reg0_q\);

-- Location: LCCOMB_X32_Y7_N24
\packet_counter[12]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_counter[12]~38_combout\ = (packet_counter(12) & (!\packet_counter[11]~37\)) # (!packet_counter(12) & ((\packet_counter[11]~37\) # (GND)))
-- \packet_counter[12]~39\ = CARRY((!\packet_counter[11]~37\) # (!packet_counter(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => packet_counter(12),
	datad => VCC,
	cin => \packet_counter[11]~37\,
	combout => \packet_counter[12]~38_combout\,
	cout => \packet_counter[12]~39\);

-- Location: FF_X32_Y7_N25
\packet_counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \packet_counter[12]~38_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Selector18~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_counter(12));

-- Location: LCCOMB_X33_Y7_N22
\source_channel[28]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \source_channel[28]~reg0feeder_combout\ = packet_counter(12)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => packet_counter(12),
	combout => \source_channel[28]~reg0feeder_combout\);

-- Location: FF_X33_Y7_N23
\source_channel[28]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \source_channel[28]~reg0feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[28]~reg0_q\);

-- Location: LCCOMB_X32_Y7_N26
\packet_counter[13]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_counter[13]~40_combout\ = (packet_counter(13) & (\packet_counter[12]~39\ $ (GND))) # (!packet_counter(13) & (!\packet_counter[12]~39\ & VCC))
-- \packet_counter[13]~41\ = CARRY((packet_counter(13) & !\packet_counter[12]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => packet_counter(13),
	datad => VCC,
	cin => \packet_counter[12]~39\,
	combout => \packet_counter[13]~40_combout\,
	cout => \packet_counter[13]~41\);

-- Location: FF_X32_Y7_N27
\packet_counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \packet_counter[13]~40_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Selector18~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_counter(13));

-- Location: FF_X33_Y7_N1
\source_channel[29]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => packet_counter(13),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[29]~reg0_q\);

-- Location: LCCOMB_X32_Y7_N28
\packet_counter[14]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_counter[14]~42_combout\ = (packet_counter(14) & (!\packet_counter[13]~41\)) # (!packet_counter(14) & ((\packet_counter[13]~41\) # (GND)))
-- \packet_counter[14]~43\ = CARRY((!\packet_counter[13]~41\) # (!packet_counter(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => packet_counter(14),
	datad => VCC,
	cin => \packet_counter[13]~41\,
	combout => \packet_counter[14]~42_combout\,
	cout => \packet_counter[14]~43\);

-- Location: FF_X32_Y7_N29
\packet_counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \packet_counter[14]~42_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Selector18~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_counter(14));

-- Location: LCCOMB_X33_Y7_N10
\source_channel[30]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \source_channel[30]~reg0feeder_combout\ = packet_counter(14)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => packet_counter(14),
	combout => \source_channel[30]~reg0feeder_combout\);

-- Location: FF_X33_Y7_N11
\source_channel[30]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \source_channel[30]~reg0feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[30]~reg0_q\);

-- Location: LCCOMB_X32_Y7_N30
\packet_counter[15]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_counter[15]~44_combout\ = packet_counter(15) $ (!\packet_counter[14]~43\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => packet_counter(15),
	cin => \packet_counter[14]~43\,
	combout => \packet_counter[15]~44_combout\);

-- Location: FF_X32_Y7_N31
\packet_counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \packet_counter[15]~44_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Selector18~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_counter(15));

-- Location: LCCOMB_X33_Y7_N20
\source_channel[31]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \source_channel[31]~reg0feeder_combout\ = packet_counter(15)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => packet_counter(15),
	combout => \source_channel[31]~reg0feeder_combout\);

-- Location: FF_X33_Y7_N21
\source_channel[31]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \source_channel[31]~reg0feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_channel[31]~reg0_q\);

-- Location: LCCOMB_X33_Y14_N12
\Selector21~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector21~0_combout\ = (\state.ZERO_PADDING~q\ & (((\source_valid~reg0_q\) # (\source_ready~input_o\)))) # (!\state.ZERO_PADDING~q\ & (\state.PROCESSING~q\ & ((\source_valid~reg0_q\) # (\source_ready~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.ZERO_PADDING~q\,
	datab => \state.PROCESSING~q\,
	datac => \source_valid~reg0_q\,
	datad => \source_ready~input_o\,
	combout => \Selector21~0_combout\);

-- Location: LCCOMB_X33_Y14_N4
\Selector21~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector21~1_combout\ = (\Selector21~0_combout\) # ((\source_valid~reg0_q\ & !\state.IDLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector21~0_combout\,
	datac => \source_valid~reg0_q\,
	datad => \state.IDLE~q\,
	combout => \Selector21~1_combout\);

-- Location: FF_X33_Y14_N5
\source_valid~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector21~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \source_valid~reg0_q\);

-- Location: LCCOMB_X33_Y14_N18
\source_cell~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \source_cell~0_combout\ = (\state.BACKPRESSURE~q\) # (!\state.IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.BACKPRESSURE~q\,
	datad => \state.IDLE~q\,
	combout => \source_cell~0_combout\);

-- Location: LCCOMB_X33_Y14_N6
\state_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \state_out~0_combout\ = (\state.PROCESSING~q\) # (!\state.IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.PROCESSING~q\,
	datac => \state.IDLE~q\,
	combout => \state_out~0_combout\);

-- Location: LCCOMB_X33_Y16_N4
\bit_counter_int[3]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_counter_int[3]~9_combout\ = bit_counter_int(3) $ (VCC)
-- \bit_counter_int[3]~10\ = CARRY(bit_counter_int(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => bit_counter_int(3),
	datad => VCC,
	combout => \bit_counter_int[3]~9_combout\,
	cout => \bit_counter_int[3]~10\);

-- Location: LCCOMB_X33_Y16_N24
\bit_counter_int[11]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_counter_int[11]~11_combout\ = (\Equal1~1_combout\ & (\Equal1~0_combout\ & \state.ZERO_PADDING~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~1_combout\,
	datac => \Equal1~0_combout\,
	datad => \state.ZERO_PADDING~q\,
	combout => \bit_counter_int[11]~11_combout\);

-- Location: FF_X33_Y16_N5
\bit_counter_int[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \bit_counter_int[3]~9_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \bit_counter_int[11]~11_combout\,
	ena => \source_cell[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_counter_int(3));

-- Location: LCCOMB_X33_Y16_N6
\bit_counter_int[4]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_counter_int[4]~12_combout\ = (bit_counter_int(4) & (!\bit_counter_int[3]~10\)) # (!bit_counter_int(4) & ((\bit_counter_int[3]~10\) # (GND)))
-- \bit_counter_int[4]~13\ = CARRY((!\bit_counter_int[3]~10\) # (!bit_counter_int(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bit_counter_int(4),
	datad => VCC,
	cin => \bit_counter_int[3]~10\,
	combout => \bit_counter_int[4]~12_combout\,
	cout => \bit_counter_int[4]~13\);

-- Location: FF_X33_Y16_N7
\bit_counter_int[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \bit_counter_int[4]~12_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \bit_counter_int[11]~11_combout\,
	ena => \source_cell[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_counter_int(4));

-- Location: LCCOMB_X33_Y16_N8
\bit_counter_int[5]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_counter_int[5]~14_combout\ = (bit_counter_int(5) & (\bit_counter_int[4]~13\ $ (GND))) # (!bit_counter_int(5) & (!\bit_counter_int[4]~13\ & VCC))
-- \bit_counter_int[5]~15\ = CARRY((bit_counter_int(5) & !\bit_counter_int[4]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bit_counter_int(5),
	datad => VCC,
	cin => \bit_counter_int[4]~13\,
	combout => \bit_counter_int[5]~14_combout\,
	cout => \bit_counter_int[5]~15\);

-- Location: FF_X33_Y16_N9
\bit_counter_int[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \bit_counter_int[5]~14_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \bit_counter_int[11]~11_combout\,
	ena => \source_cell[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_counter_int(5));

-- Location: LCCOMB_X33_Y16_N10
\bit_counter_int[6]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_counter_int[6]~16_combout\ = (bit_counter_int(6) & (!\bit_counter_int[5]~15\)) # (!bit_counter_int(6) & ((\bit_counter_int[5]~15\) # (GND)))
-- \bit_counter_int[6]~17\ = CARRY((!\bit_counter_int[5]~15\) # (!bit_counter_int(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bit_counter_int(6),
	datad => VCC,
	cin => \bit_counter_int[5]~15\,
	combout => \bit_counter_int[6]~16_combout\,
	cout => \bit_counter_int[6]~17\);

-- Location: FF_X33_Y16_N11
\bit_counter_int[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \bit_counter_int[6]~16_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \bit_counter_int[11]~11_combout\,
	ena => \source_cell[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_counter_int(6));

-- Location: LCCOMB_X33_Y16_N12
\bit_counter_int[7]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_counter_int[7]~18_combout\ = (bit_counter_int(7) & (\bit_counter_int[6]~17\ $ (GND))) # (!bit_counter_int(7) & (!\bit_counter_int[6]~17\ & VCC))
-- \bit_counter_int[7]~19\ = CARRY((bit_counter_int(7) & !\bit_counter_int[6]~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bit_counter_int(7),
	datad => VCC,
	cin => \bit_counter_int[6]~17\,
	combout => \bit_counter_int[7]~18_combout\,
	cout => \bit_counter_int[7]~19\);

-- Location: FF_X33_Y16_N13
\bit_counter_int[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \bit_counter_int[7]~18_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \bit_counter_int[11]~11_combout\,
	ena => \source_cell[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_counter_int(7));

-- Location: LCCOMB_X33_Y16_N14
\bit_counter_int[8]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_counter_int[8]~20_combout\ = (bit_counter_int(8) & (!\bit_counter_int[7]~19\)) # (!bit_counter_int(8) & ((\bit_counter_int[7]~19\) # (GND)))
-- \bit_counter_int[8]~21\ = CARRY((!\bit_counter_int[7]~19\) # (!bit_counter_int(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bit_counter_int(8),
	datad => VCC,
	cin => \bit_counter_int[7]~19\,
	combout => \bit_counter_int[8]~20_combout\,
	cout => \bit_counter_int[8]~21\);

-- Location: FF_X33_Y16_N15
\bit_counter_int[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \bit_counter_int[8]~20_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \bit_counter_int[11]~11_combout\,
	ena => \source_cell[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_counter_int(8));

-- Location: LCCOMB_X33_Y16_N16
\bit_counter_int[9]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_counter_int[9]~22_combout\ = (bit_counter_int(9) & (\bit_counter_int[8]~21\ $ (GND))) # (!bit_counter_int(9) & (!\bit_counter_int[8]~21\ & VCC))
-- \bit_counter_int[9]~23\ = CARRY((bit_counter_int(9) & !\bit_counter_int[8]~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bit_counter_int(9),
	datad => VCC,
	cin => \bit_counter_int[8]~21\,
	combout => \bit_counter_int[9]~22_combout\,
	cout => \bit_counter_int[9]~23\);

-- Location: FF_X33_Y16_N17
\bit_counter_int[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \bit_counter_int[9]~22_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \bit_counter_int[11]~11_combout\,
	ena => \source_cell[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_counter_int(9));

-- Location: LCCOMB_X33_Y16_N18
\bit_counter_int[10]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_counter_int[10]~24_combout\ = (bit_counter_int(10) & (!\bit_counter_int[9]~23\)) # (!bit_counter_int(10) & ((\bit_counter_int[9]~23\) # (GND)))
-- \bit_counter_int[10]~25\ = CARRY((!\bit_counter_int[9]~23\) # (!bit_counter_int(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bit_counter_int(10),
	datad => VCC,
	cin => \bit_counter_int[9]~23\,
	combout => \bit_counter_int[10]~24_combout\,
	cout => \bit_counter_int[10]~25\);

-- Location: FF_X33_Y16_N19
\bit_counter_int[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \bit_counter_int[10]~24_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \bit_counter_int[11]~11_combout\,
	ena => \source_cell[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_counter_int(10));

-- Location: LCCOMB_X33_Y16_N20
\bit_counter_int[11]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_counter_int[11]~26_combout\ = \bit_counter_int[10]~25\ $ (!bit_counter_int(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => bit_counter_int(11),
	cin => \bit_counter_int[10]~25\,
	combout => \bit_counter_int[11]~26_combout\);

-- Location: FF_X33_Y16_N21
\bit_counter_int[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \bit_counter_int[11]~26_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \bit_counter_int[11]~11_combout\,
	ena => \source_cell[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_counter_int(11));

-- Location: LCCOMB_X33_Y16_N26
\padding_complete_int~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \padding_complete_int~0_combout\ = (\state.IDLE~q\ & ((\padding_complete_int~q\) # ((\source_ready~input_o\ & \bit_counter_int[11]~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \source_ready~input_o\,
	datab => \state.IDLE~q\,
	datac => \padding_complete_int~q\,
	datad => \bit_counter_int[11]~11_combout\,
	combout => \padding_complete_int~0_combout\);

-- Location: FF_X33_Y16_N27
padding_complete_int : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \padding_complete_int~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \padding_complete_int~q\);

ww_sink_ready <= \sink_ready~output_o\;

ww_source_cell(0) <= \source_cell[0]~output_o\;

ww_source_cell(1) <= \source_cell[1]~output_o\;

ww_source_cell(2) <= \source_cell[2]~output_o\;

ww_source_cell(3) <= \source_cell[3]~output_o\;

ww_source_cell(4) <= \source_cell[4]~output_o\;

ww_source_cell(5) <= \source_cell[5]~output_o\;

ww_source_cell(6) <= \source_cell[6]~output_o\;

ww_source_cell(7) <= \source_cell[7]~output_o\;

ww_source_soc <= \source_soc~output_o\;

ww_source_eoc <= \source_eoc~output_o\;

ww_source_channel(0) <= \source_channel[0]~output_o\;

ww_source_channel(1) <= \source_channel[1]~output_o\;

ww_source_channel(2) <= \source_channel[2]~output_o\;

ww_source_channel(3) <= \source_channel[3]~output_o\;

ww_source_channel(4) <= \source_channel[4]~output_o\;

ww_source_channel(5) <= \source_channel[5]~output_o\;

ww_source_channel(6) <= \source_channel[6]~output_o\;

ww_source_channel(7) <= \source_channel[7]~output_o\;

ww_source_channel(8) <= \source_channel[8]~output_o\;

ww_source_channel(9) <= \source_channel[9]~output_o\;

ww_source_channel(10) <= \source_channel[10]~output_o\;

ww_source_channel(11) <= \source_channel[11]~output_o\;

ww_source_channel(12) <= \source_channel[12]~output_o\;

ww_source_channel(13) <= \source_channel[13]~output_o\;

ww_source_channel(14) <= \source_channel[14]~output_o\;

ww_source_channel(15) <= \source_channel[15]~output_o\;

ww_source_channel(16) <= \source_channel[16]~output_o\;

ww_source_channel(17) <= \source_channel[17]~output_o\;

ww_source_channel(18) <= \source_channel[18]~output_o\;

ww_source_channel(19) <= \source_channel[19]~output_o\;

ww_source_channel(20) <= \source_channel[20]~output_o\;

ww_source_channel(21) <= \source_channel[21]~output_o\;

ww_source_channel(22) <= \source_channel[22]~output_o\;

ww_source_channel(23) <= \source_channel[23]~output_o\;

ww_source_channel(24) <= \source_channel[24]~output_o\;

ww_source_channel(25) <= \source_channel[25]~output_o\;

ww_source_channel(26) <= \source_channel[26]~output_o\;

ww_source_channel(27) <= \source_channel[27]~output_o\;

ww_source_channel(28) <= \source_channel[28]~output_o\;

ww_source_channel(29) <= \source_channel[29]~output_o\;

ww_source_channel(30) <= \source_channel[30]~output_o\;

ww_source_channel(31) <= \source_channel[31]~output_o\;

ww_source_valid <= \source_valid~output_o\;

ww_byte_counter(0) <= \byte_counter[0]~output_o\;

ww_byte_counter(1) <= \byte_counter[1]~output_o\;

ww_byte_counter(2) <= \byte_counter[2]~output_o\;

ww_byte_counter(3) <= \byte_counter[3]~output_o\;

ww_byte_counter(4) <= \byte_counter[4]~output_o\;

ww_byte_counter(5) <= \byte_counter[5]~output_o\;

ww_byte_counter(6) <= \byte_counter[6]~output_o\;

ww_byte_counter(7) <= \byte_counter[7]~output_o\;

ww_state_out(0) <= \state_out[0]~output_o\;

ww_state_out(1) <= \state_out[1]~output_o\;

ww_state_out(2) <= \state_out[2]~output_o\;

ww_bit_counter(0) <= \bit_counter[0]~output_o\;

ww_bit_counter(1) <= \bit_counter[1]~output_o\;

ww_bit_counter(2) <= \bit_counter[2]~output_o\;

ww_bit_counter(3) <= \bit_counter[3]~output_o\;

ww_bit_counter(4) <= \bit_counter[4]~output_o\;

ww_bit_counter(5) <= \bit_counter[5]~output_o\;

ww_bit_counter(6) <= \bit_counter[6]~output_o\;

ww_bit_counter(7) <= \bit_counter[7]~output_o\;

ww_bit_counter(8) <= \bit_counter[8]~output_o\;

ww_bit_counter(9) <= \bit_counter[9]~output_o\;

ww_bit_counter(10) <= \bit_counter[10]~output_o\;

ww_bit_counter(11) <= \bit_counter[11]~output_o\;

ww_cell_incomplete <= \cell_incomplete~output_o\;

ww_padding_complete <= \padding_complete~output_o\;
END structure;


