onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group TOP -radix hexadecimal /AES_128_TB/rst_n
add wave -noupdate -expand -group TOP -radix hexadecimal /AES_128_TB/clk
add wave -noupdate -expand -group TOP -radix hexadecimal /AES_128_TB/start_tb
add wave -noupdate -expand -group TOP -radix hexadecimal /AES_128_TB/done_tb
add wave -noupdate -expand -group TOP -radix hexadecimal /AES_128_TB/in_state_tb
add wave -noupdate -expand -group TOP -radix hexadecimal /AES_128_TB/aes_inst/aes_controller_inst/round
add wave -noupdate -expand -group TOP -color Magenta -radix hexadecimal /AES_128_TB/out_state_tb
add wave -noupdate -expand -group TOP -radix hexadecimal /AES_128_TB/in_key_tb
add wave -noupdate -expand -group TOP -radix hexadecimal /AES_128_TB/i
add wave -noupdate -expand -group TOP -radix hexadecimal /AES_128_TB/tests
add wave -noupdate -expand -group TOP -radix hexadecimal /AES_128_TB/test_num
add wave -noupdate -expand -group ADD_ROUND_KEY -radix hexadecimal /AES_128_TB/aes_inst/add_round_key_inst/clk
add wave -noupdate -expand -group ADD_ROUND_KEY -radix hexadecimal /AES_128_TB/aes_inst/add_round_key_inst/rst_n
add wave -noupdate -expand -group ADD_ROUND_KEY -radix hexadecimal /AES_128_TB/aes_inst/add_round_key_inst/round_key_en
add wave -noupdate -expand -group ADD_ROUND_KEY -radix hexadecimal /AES_128_TB/aes_inst/add_round_key_inst/state
add wave -noupdate -expand -group ADD_ROUND_KEY -radix hexadecimal /AES_128_TB/aes_inst/add_round_key_inst/key
add wave -noupdate -expand -group ADD_ROUND_KEY -radix hexadecimal /AES_128_TB/aes_inst/add_round_key_inst/round_key_state
add wave -noupdate -group sub_bytes /AES_128_TB/aes_inst/sub_bytes_inst/clk
add wave -noupdate -group sub_bytes /AES_128_TB/aes_inst/sub_bytes_inst/rst_n
add wave -noupdate -group sub_bytes -radix hexadecimal /AES_128_TB/aes_inst/sub_bytes_inst/in_state
add wave -noupdate -group sub_bytes -radix hexadecimal /AES_128_TB/aes_inst/sub_bytes_inst/s_bytes_state
add wave -noupdate -group sub_bytes /AES_128_TB/aes_inst/sub_bytes_inst/byte_0
add wave -noupdate -group sub_bytes /AES_128_TB/aes_inst/sub_bytes_inst/byte_1
add wave -noupdate -group sub_bytes /AES_128_TB/aes_inst/sub_bytes_inst/byte_2
add wave -noupdate -group sub_bytes /AES_128_TB/aes_inst/sub_bytes_inst/byte_3
add wave -noupdate -group sub_bytes /AES_128_TB/aes_inst/sub_bytes_inst/byte_4
add wave -noupdate -group sub_bytes /AES_128_TB/aes_inst/sub_bytes_inst/byte_5
add wave -noupdate -group sub_bytes /AES_128_TB/aes_inst/sub_bytes_inst/byte_6
add wave -noupdate -group sub_bytes /AES_128_TB/aes_inst/sub_bytes_inst/byte_7
add wave -noupdate -group sub_bytes /AES_128_TB/aes_inst/sub_bytes_inst/byte_8
add wave -noupdate -group sub_bytes /AES_128_TB/aes_inst/sub_bytes_inst/byte_9
add wave -noupdate -group sub_bytes /AES_128_TB/aes_inst/sub_bytes_inst/byte_10
add wave -noupdate -group sub_bytes /AES_128_TB/aes_inst/sub_bytes_inst/byte_11
add wave -noupdate -group sub_bytes /AES_128_TB/aes_inst/sub_bytes_inst/byte_12
add wave -noupdate -group sub_bytes /AES_128_TB/aes_inst/sub_bytes_inst/byte_13
add wave -noupdate -group sub_bytes /AES_128_TB/aes_inst/sub_bytes_inst/byte_14
add wave -noupdate -group sub_bytes /AES_128_TB/aes_inst/sub_bytes_inst/byte_15
add wave -noupdate -expand -group shift_rows -radix hexadecimal /AES_128_TB/aes_inst/shift_rows_inst/state_in
add wave -noupdate -expand -group shift_rows -radix hexadecimal /AES_128_TB/aes_inst/shift_rows_inst/state_out
add wave -noupdate -group state_mux /AES_128_TB/aes_inst/state_selector_inst/sel
add wave -noupdate -group state_mux /AES_128_TB/aes_inst/state_selector_inst/in_0
add wave -noupdate -group state_mux /AES_128_TB/aes_inst/state_selector_inst/in_1
add wave -noupdate -group state_mux /AES_128_TB/aes_inst/state_selector_inst/out
add wave -noupdate -expand -group mix_column -radix hexadecimal /AES_128_TB/aes_inst/mix_column_inst/clk
add wave -noupdate -expand -group mix_column -radix hexadecimal /AES_128_TB/aes_inst/mix_column_inst/rst_n
add wave -noupdate -expand -group mix_column -radix hexadecimal /AES_128_TB/aes_inst/mix_column_inst/state
add wave -noupdate -expand -group mix_column -radix hexadecimal /AES_128_TB/aes_inst/mix_column_inst/mixed_state
add wave -noupdate -expand -group mix_column -radix hexadecimal /AES_128_TB/aes_inst/mix_column_inst/in_column
add wave -noupdate -expand -group mix_column -radix hexadecimal /AES_128_TB/aes_inst/mix_column_inst/out_column
add wave -noupdate -expand -group Key_Expansion -radix hexadecimal /AES_128_TB/aes_inst/key_expansion_inst/rst_n
add wave -noupdate -expand -group Key_Expansion -radix hexadecimal /AES_128_TB/aes_inst/key_expansion_inst/clk
add wave -noupdate -expand -group Key_Expansion -radix hexadecimal /AES_128_TB/aes_inst/key_expansion_inst/in_key
add wave -noupdate -expand -group Key_Expansion -radix hexadecimal /AES_128_TB/aes_inst/key_expansion_inst/round
add wave -noupdate -expand -group Key_Expansion -color {Medium Slate Blue} -radix hexadecimal /AES_128_TB/aes_inst/key_expansion_inst/out_key
add wave -noupdate -expand -group Key_Expansion -radix hexadecimal /AES_128_TB/aes_inst/key_expansion_inst/rcon_nx
add wave -noupdate -expand -group Key_Expansion -radix hexadecimal /AES_128_TB/aes_inst/key_expansion_inst/rcon
add wave -noupdate -expand -group Key_Expansion -radix hexadecimal /AES_128_TB/aes_inst/key_expansion_inst/rot_word
add wave -noupdate -expand -group Key_Expansion -radix hexadecimal /AES_128_TB/aes_inst/key_expansion_inst/sub_word
add wave -noupdate -expand -group Key_Expansion -radix hexadecimal /AES_128_TB/aes_inst/key_expansion_inst/out_key_nx
add wave -noupdate -expand -group Key_Expansion -radix hexadecimal /AES_128_TB/aes_inst/key_expansion_inst/out_key_r
add wave -noupdate -expand -group Key_Expansion -radix hexadecimal /AES_128_TB/aes_inst/key_expansion_inst/word_0
add wave -noupdate -expand -group Key_Expansion -radix hexadecimal /AES_128_TB/aes_inst/key_expansion_inst/word_1
add wave -noupdate -expand -group Key_Expansion -radix hexadecimal /AES_128_TB/aes_inst/key_expansion_inst/word_2
add wave -noupdate -expand -group Key_Expansion -radix hexadecimal /AES_128_TB/aes_inst/key_expansion_inst/word_3
add wave -noupdate -expand -group Key_Expansion -radix hexadecimal /AES_128_TB/aes_inst/key_expansion_inst/new_word_0_nx
add wave -noupdate -expand -group Key_Expansion -radix hexadecimal /AES_128_TB/aes_inst/key_expansion_inst/new_word_0_r
add wave -noupdate -expand -group Key_Expansion -radix hexadecimal /AES_128_TB/aes_inst/key_expansion_inst/new_word_1_nx
add wave -noupdate -expand -group Key_Expansion -radix hexadecimal /AES_128_TB/aes_inst/key_expansion_inst/new_word_1_r
add wave -noupdate -expand -group Key_Expansion -radix hexadecimal /AES_128_TB/aes_inst/key_expansion_inst/new_word_2_nx
add wave -noupdate -expand -group Key_Expansion -radix hexadecimal /AES_128_TB/aes_inst/key_expansion_inst/new_word_2_r
add wave -noupdate -expand -group Key_Expansion -radix hexadecimal /AES_128_TB/aes_inst/key_expansion_inst/new_word_3_nx
add wave -noupdate -expand -group Key_Expansion -radix hexadecimal /AES_128_TB/aes_inst/key_expansion_inst/new_word_3_r
add wave -noupdate -expand -group Key_Expansion -radix hexadecimal /AES_128_TB/aes_inst/key_expansion_inst/g_w3_nx
add wave -noupdate -expand -group Key_Expansion -radix hexadecimal /AES_128_TB/aes_inst/key_expansion_inst/g_w3_r
add wave -noupdate -expand -group AES_CONTROLLER -radix hexadecimal /AES_128_TB/aes_inst/aes_controller_inst/clk
add wave -noupdate -expand -group AES_CONTROLLER -radix hexadecimal /AES_128_TB/aes_inst/aes_controller_inst/rst_n
add wave -noupdate -expand -group AES_CONTROLLER -radix hexadecimal /AES_128_TB/aes_inst/aes_controller_inst/start
add wave -noupdate -expand -group AES_CONTROLLER -radix hexadecimal /AES_128_TB/aes_inst/aes_controller_inst/load
add wave -noupdate -expand -group AES_CONTROLLER -radix hexadecimal /AES_128_TB/aes_inst/aes_controller_inst/round_key_en
add wave -noupdate -expand -group AES_CONTROLLER -radix hexadecimal /AES_128_TB/aes_inst/aes_controller_inst/final_round_sel
add wave -noupdate -expand -group AES_CONTROLLER -radix hexadecimal /AES_128_TB/aes_inst/aes_controller_inst/key_capture_nx
add wave -noupdate -expand -group AES_CONTROLLER -radix hexadecimal /AES_128_TB/aes_inst/aes_controller_inst/key_sel_nx
add wave -noupdate -expand -group AES_CONTROLLER -radix hexadecimal /AES_128_TB/aes_inst/aes_controller_inst/key_sel_r
add wave -noupdate -expand -group AES_CONTROLLER -radix hexadecimal /AES_128_TB/aes_inst/aes_controller_inst/done
add wave -noupdate -expand -group AES_CONTROLLER -radix hexadecimal /AES_128_TB/aes_inst/aes_controller_inst/round
add wave -noupdate -expand -group AES_CONTROLLER -radix hexadecimal /AES_128_TB/aes_inst/aes_controller_inst/current_state
add wave -noupdate -expand -group AES_CONTROLLER -radix hexadecimal /AES_128_TB/aes_inst/aes_controller_inst/next_state
add wave -noupdate -expand -group AES_CONTROLLER -radix hexadecimal /AES_128_TB/aes_inst/aes_controller_inst/round_nx
add wave -noupdate -expand -group AES_CONTROLLER -radix hexadecimal /AES_128_TB/aes_inst/aes_controller_inst/round_r
add wave -noupdate -expand -group AES_CONTROLLER -radix hexadecimal /AES_128_TB/aes_inst/aes_controller_inst/load_nx
add wave -noupdate -expand -group AES_CONTROLLER -radix hexadecimal /AES_128_TB/aes_inst/aes_controller_inst/load_r
add wave -noupdate -expand -group AES_CONTROLLER -radix hexadecimal /AES_128_TB/aes_inst/aes_controller_inst/round_key_en_nx
add wave -noupdate -expand -group AES_CONTROLLER -color {Orange Red} -radix hexadecimal /AES_128_TB/aes_inst/aes_controller_inst/key_capture_r
add wave -noupdate -expand -group AES_CONTROLLER -color {Orange Red} -radix hexadecimal /AES_128_TB/aes_inst/aes_controller_inst/round_key_en_r
add wave -noupdate -expand -group AES_CONTROLLER -radix hexadecimal /AES_128_TB/aes_inst/aes_controller_inst/final_round_sel_nx
add wave -noupdate -expand -group AES_CONTROLLER -radix hexadecimal /AES_128_TB/aes_inst/aes_controller_inst/final_round_sel_r
add wave -noupdate -expand -group AES_CONTROLLER -radix hexadecimal /AES_128_TB/aes_inst/aes_controller_inst/done_nx
add wave -noupdate -expand -group AES_CONTROLLER -radix hexadecimal /AES_128_TB/aes_inst/aes_controller_inst/done_r
add wave -noupdate -expand -group AES_CONTROLLER -radix hexadecimal /AES_128_TB/aes_inst/aes_controller_inst/round_timer_nx
add wave -noupdate -expand -group AES_CONTROLLER -radix hexadecimal /AES_128_TB/aes_inst/aes_controller_inst/round_timer_r
add wave -noupdate -group final_stage_mux /AES_128_TB/aes_inst/final_stage_selector_inst/sel
add wave -noupdate -group final_stage_mux /AES_128_TB/aes_inst/final_stage_selector_inst/in_0
add wave -noupdate -group final_stage_mux /AES_128_TB/aes_inst/final_stage_selector_inst/in_1
add wave -noupdate -group final_stage_mux /AES_128_TB/aes_inst/final_stage_selector_inst/out
add wave -noupdate -expand -group key_mux /AES_128_TB/aes_inst/key_selector_o_inst/sel
add wave -noupdate -expand -group key_mux -radix hexadecimal /AES_128_TB/aes_inst/key_selector_o_inst/in_0
add wave -noupdate -expand -group key_mux -radix hexadecimal /AES_128_TB/aes_inst/key_selector_o_inst/in_1
add wave -noupdate -expand -group key_mux -radix hexadecimal /AES_128_TB/aes_inst/key_selector_o_inst/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {577 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 547
configure wave -valuecolwidth 264
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {439 ns} {593 ns}
