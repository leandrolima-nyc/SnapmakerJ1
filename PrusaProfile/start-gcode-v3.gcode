;***** Snapmaker J1
;***** Update  : 20221222
;***** Printer : [printer_preset]
;***** Profile : [print_preset]

; ----- bed_temperature_0: {bed_temperature[0]}
; ----- bed_temperature_1: {bed_temperature[1]}
; ----- extruder_temperature_0: {temperature[0]}
; ----- extruder_temperature_1: {temperature[1]}

; ----- initial_extruder: [initial_extruder]
; ----- is_extruder_used (0): {is_extruder_used[0]}
; ----- is_extruder_used (1): {is_extruder_used[1]}

M355 S1 P16    ;------------OPTIONAL                ;dim led 
M82                                                 ;absolute extrusion mode
T[initial_extruder]

{if is_extruder_used[0] && is_extruder_used[1]}
  M104 S{first_layer_temperature[0]} T0             ;preheat T0
  M104 S{first_layer_temperature[1]} T1             ;preheat T1
  M190 S{(bed_temperature[0] > bed_temperature[1] ? bed_temperature[0] : bed_temperature[1] )} ;wait for bed temp

{else}

  {if is_extruder_used[0]}
    M104 S{first_layer_temperature[0]} T0           ;preheat T0
    M190 S{first_layer_bed_temperature[0]} C3 W2    ;wait for bed temp

  {else}

    M104 S{first_layer_temperature[1]} T1           ;preheat T1
    M190 S{first_layer_bed_temperature[1]} C3 W2    ;wait for bed temp

  {endif}
{endif}

{if 1==1}      ;-----------OPTIONAL                 ;led effect
  M355 S1 P32
  G4 S1
  M355 S1 P48
  G4 S1
  M355 S1 P64
  G4 S1
  M355 S1 P96
  G4 S1
  M355 S1 P128
  G4 S1
  M355 S1 P255
{endif}


M201 X20000 Y20000 Z500 E3000                       ;snapmaker settings
G28                                                 ;home all axes

{if 1 == 1}       ;-----------OPTIONAL              ;purge line
  {if is_extruder_used[0]}
    M109 S{first_layer_temperature[0]} T0 C5 W1     ;wait for nozzle temp
    T0
    G1 Z0.8 Y-0.5 F1500                             ;move bed up fast
    G1 X50 F6000                                    ;position nozzle
    G1 Z0.4 F6000                                   ;set nozzle height
    G1 X163 E22.6 F1500                             ;purge 113mm line / 22.6mm filament in 1.5sec
    {if is_extruder_used[1]}G28 X F6000{endif}      ;park
  {endif}

  G92 E0                                            ;reset extruder

  {if is_extruder_used[1]}
    M109 S{first_layer_temperature[1]} T1 C5 W1     ;wait for nozzle temp
    T1
    G1 Z0.8 Y-0.5 F1500                             ;move bed up fast
    G1 X276 F6000                                   ;position nozzle
    G1 Z0.4 F6000                                   ;set nozzle height
    G1 X163 E22.6 F1500                             ;purge 113mm line / 22.6mm filament in 1.5sec
    {if initial_extruder == 0}G28 X F6000 {endif}   ;park

  {endif}
{endif}

;===== ready to go
