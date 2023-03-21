; End G-code >>>
;***** Update   : 20221222
M140 S0                         ;turn off bed

G92 E0                          ;zero the extruder

                                ;clean the nozzle
{if is_extruder_used[0]}
  T0
  G1 X-5  F6000
  G1 X-20 F3000
  G1 X-5  F6000
  G1 X-20 F3000
{endif}
{if is_extruder_used[1]}
  T1
  G1 X332 F6000
  G1 X340 F3000
  G1 X332 F6000
  G1 X340 F3000
{endif}

T{current_extruder}

M220 S100                       ;reset feedrate
M82                             ;reset absolute extrusion mode

; <<< End G-code
;
; DON'T REMOVE these lines if you're using the smfix (https://github.com/macdylan/Snapmaker2Slic3rPostProcessor)
; min_x = [first_layer_print_min_0]
; min_y = [first_layer_print_min_1]
; max_x = [first_layer_print_max_0]
; max_y = [first_layer_print_max_1]
; max_z = [max_layer_z]
