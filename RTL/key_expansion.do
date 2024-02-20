onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /key_expansion/rst_n
add wave -noupdate /key_expansion/clk
add wave -noupdate -radix hexadecimal /key_expansion/in_key
add wave -noupdate /key_expansion/round
add wave -noupdate -radix hexadecimal /key_expansion/out_key
add wave -noupdate -radix binary /key_expansion/rcon
add wave -noupdate -radix hexadecimal /key_expansion/sub_word
add wave -noupdate -radix hexadecimal /key_expansion/rot_word
add wave -noupdate -radix hexadecimal /key_expansion/word_0
add wave -noupdate -color {Medium Orchid} -radix hexadecimal /key_expansion/g_w3_r
add wave -noupdate -radix hexadecimal /key_expansion/word_1
add wave -noupdate -radix hexadecimal /key_expansion/word_2
add wave -noupdate -radix hexadecimal /key_expansion/word_3
add wave -noupdate -radix hexadecimal /key_expansion/new_word_0_nx
add wave -noupdate -radix hexadecimal /key_expansion/new_word_0_r
add wave -noupdate -radix hexadecimal /key_expansion/new_word_1_nx
add wave -noupdate -radix hexadecimal /key_expansion/new_word_1_r
add wave -noupdate -radix hexadecimal /key_expansion/new_word_2_nx
add wave -noupdate -radix hexadecimal /key_expansion/new_word_2_r
add wave -noupdate -radix hexadecimal /key_expansion/new_word_3_nx
add wave -noupdate -radix hexadecimal /key_expansion/new_word_3_r
add wave -noupdate -radix hexadecimal /key_expansion/g_w3_nx
add wave -noupdate -expand -group rcon /key_expansion/rcon_inst/round
add wave -noupdate -expand -group rcon /key_expansion/rcon_inst/rcon
add wave -noupdate -expand -group sub_word /key_expansion/s_word_inst/clk
add wave -noupdate -expand -group sub_word /key_expansion/s_word_inst/rst_n
add wave -noupdate -expand -group sub_word /key_expansion/s_word_inst/in_word
add wave -noupdate -expand -group sub_word -radix hexadecimal /key_expansion/s_word_inst/sub_word
add wave -noupdate -expand -group sub_word /key_expansion/s_word_inst/byte_0
add wave -noupdate -expand -group sub_word /key_expansion/s_word_inst/byte_1
add wave -noupdate -expand -group sub_word /key_expansion/s_word_inst/byte_2
add wave -noupdate -expand -group sub_word /key_expansion/s_word_inst/byte_3
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {367 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 337
configure wave -valuecolwidth 100
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
configure wave -timelineunits ps
update
WaveRestoreZoom {302 ps} {741 ps}
