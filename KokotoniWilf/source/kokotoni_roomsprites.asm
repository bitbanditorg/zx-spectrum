; room #1
        db      $FF, $FF         ; trailing bytes for previous structure

        ; cloud
        db      $19              ; x start: 25
        db      $9C              ; y start: 156
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L93A8            ; pointer to anim struct
        dw      L9B78            ; pointer to movement struct

        ; dino's head
        db      $50              ; x start: 80
        db      $54              ; y start: 84
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L93AE            ; pointer to anim struct
        dw      L9B87            ; pointer to movement struct

        ; dino's tail
        db      $98              ; x start: 152
        db      $4A              ; y start: 74
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L93BD            ; pointer to anim struct
        dw      L9B91            ; pointer to movement struct

; room #2
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $B0              ; x start: 176
        db      $40              ; y start: 64
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L949E            ; pointer to anim struct
        dw      L9B9B            ; pointer to movement struct

        db      $3A              ; x start: 58
        db      $48              ; y start: 72
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9BAA            ; pointer to movement struct

; room #3
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $DC              ; x start: 220
        db      $48              ; y start: 72
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L95B2            ; pointer to anim struct
        dw      L9BBE            ; pointer to movement struct

        db      $20              ; x start: 32
        db      $7D              ; y start: 125
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9BAA            ; pointer to movement struct

        db      $C6              ; x start: 198
        db      $6F              ; y start: 111
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L95C1            ; pointer to anim struct
        dw      L9BD2            ; pointer to movement struct

; room #4
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $BE              ; x start: 190
        db      $9F              ; y start: 159
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L95C7            ; pointer to anim struct
        dw      L9BE1            ; pointer to movement struct

        db      $64              ; x start: 100
        db      $5C              ; y start: 92
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L93FF            ; pointer to anim struct
        dw      L9BF5            ; pointer to movement struct

        db      $21              ; x start: 33
        db      $87              ; y start: 135
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L95C7            ; pointer to anim struct
        dw      L9BE1            ; pointer to movement struct

; room #5
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $E7              ; x start: 231
        db      $50              ; y start: 80
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L95BB            ; pointer to anim struct
        dw      L9BBE            ; pointer to movement struct

        db      $CF              ; x start: 207
        db      $50              ; y start: 80
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L95BB            ; pointer to anim struct
        dw      L9BBE            ; pointer to movement struct

; room #6
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $38              ; x start: 56
        db      $5F              ; y start: 95
        db      $03              ; width: 3 chars
        db      $08              ; height: 8 pixels
        dw      L942F            ; pointer to anim struct
        dw      L9C40            ; pointer to movement struct

        db      $B0              ; x start: 176
        db      $7F              ; y start: 127
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L949E            ; pointer to anim struct
        dw      L9B9B            ; pointer to movement struct

        db      $69              ; x start: 105
        db      $8F              ; y start: 143
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L95B2            ; pointer to anim struct
        dw      L9BBE            ; pointer to movement struct

; room #7
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $84              ; x start: 132
        db      $6D              ; y start: 109
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L95C7            ; pointer to anim struct
        dw      L9BF5            ; pointer to movement struct

        db      $E0              ; x start: 224
        db      $62              ; y start: 98
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L93CC            ; pointer to anim struct
        dw      L9C81            ; pointer to movement struct

        db      $14              ; x start: 20
        db      $50              ; y start: 80
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L95B2            ; pointer to anim struct
        dw      L9BBE            ; pointer to movement struct

; room #8
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $0F              ; x start: 15
        db      $74              ; y start: 116
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9BAA            ; pointer to movement struct

        db      $D0              ; x start: 208
        db      $70              ; y start: 112
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L949E            ; pointer to anim struct
        dw      L9C90            ; pointer to movement struct

        db      $3F              ; x start: 63
        db      $63              ; y start: 99
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L95C7            ; pointer to anim struct
        dw      L9BF5            ; pointer to movement struct

; room #9
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $E2              ; x start: 226
        db      $50              ; y start: 80
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L93CC            ; pointer to anim struct
        dw      L9C81            ; pointer to movement struct

        db      $10              ; x start: 16
        db      $62              ; y start: 98
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9C9F            ; pointer to movement struct

        db      $2E              ; x start: 46
        db      $64              ; y start: 100
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9CAE            ; pointer to movement struct

        db      $7D              ; x start: 125
        db      $64              ; y start: 100
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9BAA            ; pointer to movement struct

; room #10
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $2F              ; x start: 47
        db      $48              ; y start: 72
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L93ED            ; pointer to anim struct
        dw      L9CBD            ; pointer to movement struct

        db      $40              ; x start: 64
        db      $70              ; y start: 112
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9BAA            ; pointer to movement struct

        db      $AA              ; x start: 170
        db      $78              ; y start: 120
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L93A8            ; pointer to anim struct
        dw      L9CD6            ; pointer to movement struct

; room #11
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $B4              ; x start: 180
        db      $78              ; y start: 120
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9BAA            ; pointer to movement struct

        db      $0E              ; x start: 14
        db      $88              ; y start: 136
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L95B2            ; pointer to anim struct
        dw      L9BBE            ; pointer to movement struct

        db      $BE              ; x start: 190
        db      $48              ; y start: 72
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L93ED            ; pointer to anim struct
        dw      L9CBD            ; pointer to movement struct

        db      $27              ; x start: 39
        db      $48              ; y start: 72
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L93ED            ; pointer to anim struct
        dw      L9CBD            ; pointer to movement struct

; room #12
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $28              ; x start: 40
        db      $50              ; y start: 80
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9465            ; pointer to anim struct
        dw      L9CE5            ; pointer to movement struct

        db      $A8              ; x start: 168
        db      $72              ; y start: 114
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9C9F            ; pointer to movement struct

        db      $10              ; x start: 16
        db      $8C              ; y start: 140
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L93A8            ; pointer to anim struct
        dw      L9B78            ; pointer to movement struct

; room #13
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $D4              ; x start: 212
        db      $4E              ; y start: 78
        db      $01              ; width: 1 char
        db      $08              ; height: 8 pixel
        dw      L946E            ; pointer to anim struct
        dw      L9D03            ; pointer to movement struct

        db      $46              ; x start: 70
        db      $41              ; y start: 65
        db      $01              ; width: 1 char
        db      $08              ; height: 8 pixel
        dw      L946E            ; pointer to anim struct
        dw      L9D12            ; pointer to movement struct

        db      $42              ; x start: 66
        db      $80              ; y start: 128
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9BAA            ; pointer to movement struct

        db      $6F              ; x start: 111
        db      $87              ; y start: 135
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L94E0            ; pointer to anim struct
        dw      L9D21            ; pointer to movement struct

; room #14
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $40              ; x start: 64
        db      $46              ; y start: 70
        db      $01              ; width: 1 char
        db      $08              ; height: 8 pixel
        dw      L946E            ; pointer to anim struct
        dw      L9D03            ; pointer to movement struct

        db      $58              ; x start: 88
        db      $99              ; y start: 153
        db      $01              ; width: 1 char
        db      $08              ; height: 8 pixel
        dw      L947A            ; pointer to anim struct
        dw      L9D30            ; pointer to movement struct

        db      $28              ; x start: 40
        db      $A7              ; y start: 167
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L95DC            ; pointer to anim struct
        dw      L9D3F            ; pointer to movement struct

        db      $38              ; x start: 56
        db      $A4              ; y start: 164
        db      $01              ; width: 1 char
        db      $08              ; height: 8 pixel
        dw      L9480            ; pointer to anim struct
        dw      L9D53            ; pointer to movement struct

; room #15
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $12              ; x start: 18
        db      $47              ; y start: 71
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9486            ; pointer to anim struct
        dw      L9D6C            ; pointer to movement struct

        db      $28              ; x start: 40
        db      $9F              ; y start: 159
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9C9F            ; pointer to movement struct

; room #16
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $0C              ; x start: 12
        db      $47              ; y start: 71
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9BAA            ; pointer to movement struct

        db      $A4              ; x start: 164
        db      $47              ; y start: 71
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L949E            ; pointer to anim struct
        dw      L9D9E            ; pointer to movement struct

        db      $84              ; x start: 132
        db      $A0              ; y start: 160
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L93A8            ; pointer to anim struct
        dw      L9CD6            ; pointer to movement struct

; room #17
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $21              ; x start: 33
        db      $A7              ; y start: 167
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L93A8            ; pointer to anim struct
        dw      L9CD6            ; pointer to movement struct

        db      $7A              ; x start: 122
        db      $7F              ; y start: 127
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9BAA            ; pointer to movement struct

; room #18
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $18              ; x start: 24
        db      $47              ; y start: 71
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L94DA            ; pointer to anim struct
        dw      L9D8F            ; pointer to movement struct

        db      $CF              ; x start: 207
        db      $57              ; y start: 87
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L949E            ; pointer to anim struct
        dw      L9D9E            ; pointer to movement struct

        db      $18              ; x start: 24
        db      $7F              ; y start: 127
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9465            ; pointer to anim struct
        dw      L9DAD            ; pointer to movement struct

        db      $20              ; x start: 32
        db      $A7              ; y start: 167
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9C9F            ; pointer to movement struct

; room #19
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $38              ; x start: 56
        db      $4F              ; y start: 79
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9486            ; pointer to anim struct
        dw      L9DBC            ; pointer to movement struct

        db      $48              ; x start: 72
        db      $7F              ; y start: 127
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L94D4            ; pointer to anim struct
        dw      L9DDF            ; pointer to movement struct

        db      $B8              ; x start: 184
        db      $8F              ; y start: 143
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L95EE            ; pointer to anim struct
        dw      L9DCB            ; pointer to movement struct

        db      $78              ; x start: 120
        db      $67              ; y start: 103
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9C9F            ; pointer to movement struct

; room #20
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $64              ; x start: 100
        db      $5F              ; y start: 95
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L94D4            ; pointer to anim struct
        dw      L9DDF            ; pointer to movement struct

        db      $C6              ; x start: 198
        db      $80              ; y start: 128
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L949E            ; pointer to anim struct
        dw      L9D9E            ; pointer to movement struct

        db      $4C              ; x start: 76
        db      $69              ; y start: 105
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9CAE            ; pointer to movement struct

; room #21
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $7A              ; x start: 122
        db      $47              ; y start: 71
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9414            ; pointer to anim struct
        dw      L9DEE            ; pointer to movement struct

        db      $5A              ; x start: 90
        db      $47              ; y start: 71
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L95F4            ; pointer to anim struct
        dw      L9DF8            ; pointer to movement struct

        db      $AA              ; x start: 170
        db      $5F              ; y start: 95
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L94CB            ; pointer to anim struct
        dw      L9E07            ; pointer to movement struct

; room #22
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $AC              ; x start: 172
        db      $5A              ; y start: 90
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L944D            ; pointer to anim struct
        dw      L9E16            ; pointer to movement struct

        db      $62              ; x start: 98
        db      $87              ; y start: 135
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L94B9            ; pointer to anim struct
        dw      L9E20            ; pointer to movement struct

        db      $32              ; x start: 50
        db      $57              ; y start: 87
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9414            ; pointer to anim struct
        dw      L9DEE            ; pointer to movement struct

        db      $8C              ; x start: 140
        db      $5F              ; y start: 95
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9CAE            ; pointer to movement struct

; room #23
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $86              ; x start: 134
        db      $7F              ; y start: 127
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9414            ; pointer to anim struct
        dw      L9DEE            ; pointer to movement struct

        db      $5A              ; x start: 90
        db      $57              ; y start: 87
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L94B9            ; pointer to anim struct
        dw      L9E20            ; pointer to movement struct

        db      $C8              ; x start: 200
        db      $50              ; y start: 80
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9CAE            ; pointer to movement struct

; room #24
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $B1              ; x start: 177
        db      $5C              ; y start: 92
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9C9F            ; pointer to movement struct

        db      $50              ; x start: 80
        db      $48              ; y start: 72
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9BAA            ; pointer to movement struct

        db      $32              ; x start: 50
        db      $40              ; y start: 64
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9495            ; pointer to anim struct
        dw      L9E39            ; pointer to movement struct

; room #25
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $CF              ; x start: 207
        db      $57              ; y start: 87
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L94B9            ; pointer to anim struct
        dw      L9E20            ; pointer to movement struct

        db      $B6              ; x start: 182
        db      $97              ; y start: 151
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L94A7            ; pointer to anim struct
        dw      L9E48            ; pointer to movement struct

        db      $2C              ; x start: 44
        db      $71              ; y start: 113
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L94CB            ; pointer to anim struct
        dw      L9E07            ; pointer to movement struct

; room #26
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $2D              ; x start: 45
        db      $A7              ; y start: 167
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L93A8            ; pointer to anim struct
        dw      L9CD6            ; pointer to movement struct

        db      $47              ; x start: 71
        db      $7F              ; y start: 127
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9C9F            ; pointer to movement struct

        db      $CD              ; x start: 205
        db      $7E              ; y start: 126
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9BAA            ; pointer to movement struct

; room #27
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $22              ; x start: 34
        db      $4F              ; y start: 79
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L944D            ; pointer to anim struct
        dw      L9E61            ; pointer to movement struct

        db      $B4              ; x start: 180
        db      $4F              ; y start: 79
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L944D            ; pointer to anim struct
        dw      L9E61            ; pointer to movement struct

        db      $36              ; x start: 54
        db      $53              ; y start: 83
        db      $03              ; width: 3 chars
        db      $08              ; height: 8 pixels
        dw      L942F            ; pointer to anim struct
        dw      L9C40            ; pointer to movement struct

; room #28
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $08              ; x start: 8
        db      $A7              ; y start: 167
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L93A8            ; pointer to anim struct
        dw      L9B78            ; pointer to movement struct

        db      $94              ; x start: 148
        db      $57              ; y start: 87
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9CAE            ; pointer to movement struct

        db      $2D              ; x start: 45
        db      $4A              ; y start: 74
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9BAA            ; pointer to movement struct

; room #29
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $64              ; x start: 100
        db      $64              ; y start: 100
        db      $01              ; width: 1 char
        db      $01              ; height: 1 pixel
        dw      L93A8            ; pointer to anim struct
        dw      L9B78            ; pointer to movement struct

; room #30
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $64              ; x start: 100
        db      $64              ; y start: 100
        db      $01              ; width: 1 char
        db      $01              ; height: 1 pixel
        dw      L93A8            ; pointer to anim struct
        dw      L9B78            ; pointer to movement struct

; room #31
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $6A              ; x start: 106
        db      $97              ; y start: 151
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L94E0            ; pointer to anim struct
        dw      L9E7A            ; pointer to movement struct

        db      $E1              ; x start: 225
        db      $4F              ; y start: 79
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9CAE            ; pointer to movement struct

        db      $18              ; x start: 24
        db      $A7              ; y start: 167
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L93A8            ; pointer to anim struct
        dw      L9B78            ; pointer to movement struct

        db      $43              ; x start: 67
        db      $82              ; y start: 130
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9E84            ; pointer to movement struct

; room #32
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $94              ; x start: 148
        db      $4B              ; y start: 75
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9CAE            ; pointer to movement struct

        db      $B4              ; x start: 180
        db      $9A              ; y start: 154
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L93A8            ; pointer to anim struct
        dw      L9CD6            ; pointer to movement struct

        db      $3B              ; x start: 59
        db      $5F              ; y start: 95
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L949E            ; pointer to anim struct
        dw      L9B9B            ; pointer to movement struct

; room #33
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $64              ; x start: 100
        db      $6E              ; y start: 110
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L94E0            ; pointer to anim struct
        dw      L9E7A            ; pointer to movement struct

; room #34
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $64              ; x start: 100
        db      $64              ; y start: 100
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L94E0            ; pointer to anim struct
        dw      L9E7A            ; pointer to movement struct

; room #35
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $C2              ; x start: 194
        db      $5F              ; y start: 95
        db      $02              ; width: 2 chars
        db      $18              ; height: 24 pixels
        dw      L9600            ; pointer to anim struct
        dw      L9E93            ; pointer to movement struct

        db      $A9              ; x start: 169
        db      $78              ; y start: 120
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9C9F            ; pointer to movement struct

        db      $40              ; x start: 64
        db      $87              ; y start: 135
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9E84            ; pointer to movement struct

; room #36
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $40              ; x start: 64
        db      $7D              ; y start: 125
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9C9F            ; pointer to movement struct

        db      $CD              ; x start: 205
        db      $5F              ; y start: 95
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9BAA            ; pointer to movement struct

        db      $B4              ; x start: 180
        db      $90              ; y start: 144
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9E84            ; pointer to movement struct

; room #37
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $B0              ; x start: 176
        db      $47              ; y start: 71
        db      $01              ; width: 1 char
        db      $08              ; height: 8 pixel
        dw      L947A            ; pointer to anim struct
        dw      L9EAC            ; pointer to movement struct

        db      $82              ; x start: 130
        db      $98              ; y start: 152
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L93A8            ; pointer to anim struct
        dw      L9CD6            ; pointer to movement struct

        db      $6E              ; x start: 110
        db      $4F              ; y start: 79
        db      $02              ; width: 2 chars
        db      $18              ; height: 24 pixels
        dw      L9600            ; pointer to anim struct
        dw      L9E93            ; pointer to movement struct

        db      $4A              ; x start: 74
        db      $65              ; y start: 101
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9C9F            ; pointer to movement struct

; room #38
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $5A              ; x start: 90
        db      $92              ; y start: 146
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9C9F            ; pointer to movement struct

        db      $E1              ; x start: 225
        db      $77              ; y start: 119
        db      $02              ; width: 2 chars
        db      $18              ; height: 24 pixels
        dw      L9600            ; pointer to anim struct
        dw      L9EBB            ; pointer to movement struct

        db      $46              ; x start: 70
        db      $45              ; y start: 69
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9C9F            ; pointer to movement struct

        db      $48              ; x start: 72
        db      $6F              ; y start: 111
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L94D4            ; pointer to anim struct
        dw      L9DDF            ; pointer to movement struct

; room #39
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $0A              ; x start: 10
        db      $47              ; y start: 71
        db      $01              ; width: 1 char
        db      $10              ; height: 16 pixel
        dw      L94FE            ; pointer to anim struct
        dw      L9ECF            ; pointer to movement struct

        db      $DC              ; x start: 220
        db      $3F              ; y start: 63
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L94D4            ; pointer to anim struct
        dw      L9DDF            ; pointer to movement struct

        db      $8A              ; x start: 138
        db      $62              ; y start: 98
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9C9F            ; pointer to movement struct

        db      $A6              ; x start: 166
        db      $7A              ; y start: 122
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9C9F            ; pointer to movement struct

; room #40
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $68              ; x start: 104
        db      $96              ; y start: 150
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9C9F            ; pointer to movement struct

        db      $3C              ; x start: 60
        db      $5A              ; y start: 90
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9BAA            ; pointer to movement struct

        db      $C8              ; x start: 200
        db      $47              ; y start: 71
        db      $01              ; width: 1 char
        db      $10              ; height: 16 pixel
        dw      L94FE            ; pointer to anim struct
        dw      L9ECF            ; pointer to movement struct

; room #41
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $C8              ; x start: 200
        db      $4F              ; y start: 79
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L944D            ; pointer to anim struct
        dw      L9E61            ; pointer to movement struct

        db      $14              ; x start: 20
        db      $82              ; y start: 130
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9C9F            ; pointer to movement struct

        db      $6E              ; x start: 110
        db      $87              ; y start: 135
        db      $01              ; width: 1 char
        db      $10              ; height: 16 pixel
        dw      L94FE            ; pointer to anim struct
        dw      L9ECF            ; pointer to movement struct

; room #42
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $5A              ; x start: 90
        db      $78              ; y start: 120
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9BAA            ; pointer to movement struct

        db      $28              ; x start: 40
        db      $47              ; y start: 71
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L94DA            ; pointer to anim struct
        dw      L9D8F            ; pointer to movement struct

        db      $11              ; x start: 17
        db      $7F              ; y start: 127
        db      $01              ; width: 1 char
        db      $10              ; height: 16 pixel
        dw      L94FE            ; pointer to anim struct
        dw      L9ECF            ; pointer to movement struct

; room #43
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $A5              ; x start: 165
        db      $47              ; y start: 71
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L94DA            ; pointer to anim struct
        dw      L9DDF            ; pointer to movement struct

        db      $E0              ; x start: 224
        db      $7F              ; y start: 127
        db      $01              ; width: 1 char
        db      $10              ; height: 16 pixel
        dw      L94FE            ; pointer to anim struct
        dw      L9ECF            ; pointer to movement struct

        db      $34              ; x start: 52
        db      $62              ; y start: 98
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9C9F            ; pointer to movement struct

; room #44
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $87              ; x start: 135
        db      $87              ; y start: 135
        db      $01              ; width: 1 char
        db      $08              ; height: 8 pixel
        dw      L947A            ; pointer to anim struct
        dw      L9EE8            ; pointer to movement struct

        db      $08              ; x start: 8
        db      $61              ; y start: 97
        db      $03              ; width: 3 chars
        db      $08              ; height: 8 pixels
        dw      L942F            ; pointer to anim struct
        dw      L9C40            ; pointer to movement struct

        db      $3C              ; x start: 60
        db      $98              ; y start: 152
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9C9F            ; pointer to movement struct

        db      $B8              ; x start: 184
        db      $87              ; y start: 135
        db      $01              ; width: 1 char
        db      $10              ; height: 16 pixel
        dw      L94EF            ; pointer to anim struct
        dw      L9EDE            ; pointer to movement struct

; room #45
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $47              ; x start: 71
        db      $A0              ; y start: 160
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9537            ; pointer to anim struct
        dw      L9EF7            ; pointer to movement struct

        db      $82              ; x start: 130
        db      $50              ; y start: 80
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9537            ; pointer to anim struct
        dw      L9F06            ; pointer to movement struct

        db      $48              ; x start: 72
        db      $3F              ; y start: 63
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L951C            ; pointer to anim struct
        dw      L9F15            ; pointer to movement struct

; room #46
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $12              ; x start: 18
        db      $A0              ; y start: 160
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L93A8            ; pointer to anim struct
        dw      L9CD6            ; pointer to movement struct

        db      $BE              ; x start: 190
        db      $57              ; y start: 87
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9537            ; pointer to anim struct
        dw      L9F06            ; pointer to movement struct

        db      $9C              ; x start: 156
        db      $57              ; y start: 87
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9537            ; pointer to anim struct
        dw      L9EF7            ; pointer to movement struct

; room #47
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $7E              ; x start: 126
        db      $90              ; y start: 144
        db      $01              ; width: 1 char
        db      $10              ; height: 16 pixel
        dw      L94EF            ; pointer to anim struct
        dw      L9EDE            ; pointer to movement struct

        db      $55              ; x start: 85
        db      $64              ; y start: 100
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9BAA            ; pointer to movement struct

        db      $5C              ; x start: 92
        db      $A7              ; y start: 167
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9E84            ; pointer to movement struct

        db      $2E              ; x start: 46
        db      $5A              ; y start: 90
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9C9F            ; pointer to movement struct

        db      $B4              ; x start: 180
        db      $64              ; y start: 100
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9CAE            ; pointer to movement struct

; room #48
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $28              ; x start: 40
        db      $47              ; y start: 71
        db      $03              ; width: 3 chars
        db      $10              ; height: 16 pixels
        dw      L958E            ; pointer to anim struct
        dw      L9F2E            ; pointer to movement struct

        db      $09              ; x start: 9
        db      $60              ; y start: 96
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9C9F            ; pointer to movement struct

        db      $0F              ; x start: 15
        db      $75              ; y start: 117
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9BAA            ; pointer to movement struct

; room #49
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $28              ; x start: 40
        db      $67              ; y start: 103
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9546            ; pointer to anim struct
        dw      L9F3D            ; pointer to movement struct

        db      $7D              ; x start: 125
        db      $67              ; y start: 103
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9546            ; pointer to anim struct
        dw      L9F3D            ; pointer to movement struct

        db      $78              ; x start: 120
        db      $A5              ; y start: 165
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9C9F            ; pointer to movement struct

; room #50
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $5A              ; x start: 90
        db      $87              ; y start: 135
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9546            ; pointer to anim struct
        dw      L9F3D            ; pointer to movement struct

        db      $5F              ; x start: 95
        db      $A7              ; y start: 167
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9555            ; pointer to anim struct
        dw      L9F4C            ; pointer to movement struct

        db      $12              ; x start: 18
        db      $4F              ; y start: 79
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L954F            ; pointer to anim struct
        dw      L9F5B            ; pointer to movement struct

; room #51
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $88              ; x start: 136
        db      $4F              ; y start: 79
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9546            ; pointer to anim struct
        dw      L9F3D            ; pointer to movement struct

        db      $09              ; x start: 9
        db      $60              ; y start: 96
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9CAE            ; pointer to movement struct

        db      $C0              ; x start: 192
        db      $78              ; y start: 120
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9BAA            ; pointer to movement struct

; room #52
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $BE              ; x start: 190
        db      $58              ; y start: 88
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9CAE            ; pointer to movement struct

        db      $6E              ; x start: 110
        db      $64              ; y start: 100
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9BAA            ; pointer to movement struct

        db      $5F              ; x start: 95
        db      $A7              ; y start: 167
        db      $02              ; width: 2 chars
        db      $08              ; height: 8 pixels
        dw      L9426            ; pointer to anim struct
        dw      L9E84            ; pointer to movement struct

; room #53
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $13              ; x start: 19
        db      $88              ; y start: 136
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9564            ; pointer to anim struct
        dw      L9F92            ; pointer to movement struct

        db      $50              ; x start: 80
        db      $67              ; y start: 103
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9564            ; pointer to anim struct
        dw      L9F92            ; pointer to movement struct

        db      $94              ; x start: 148
        db      $57              ; y start: 87
        db      $01              ; width: 1 char
        db      $20              ; height: 32 pixel
        dw      L9612            ; pointer to anim struct
        dw      L9F9C            ; pointer to movement struct

; room #54
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $78              ; x start: 120
        db      $5A              ; y start: 90
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9564            ; pointer to anim struct
        dw      L9F92            ; pointer to movement struct

        db      $60              ; x start: 96
        db      $58              ; y start: 88
        db      $01              ; width: 1 char
        db      $20              ; height: 32 pixel
        dw      L9612            ; pointer to anim struct
        dw      L9FB5            ; pointer to movement struct

        db      $E9              ; x start: 233
        db      $57              ; y start: 87
        db      $01              ; width: 1 char
        db      $20              ; height: 32 pixel
        dw      L9612            ; pointer to anim struct
        dw      L9F9C            ; pointer to movement struct

; room #55
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $B6              ; x start: 182
        db      $9F              ; y start: 159
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L961E            ; pointer to anim struct
        dw      L9FC9            ; pointer to movement struct

        db      $B4              ; x start: 180
        db      $47              ; y start: 71
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9573            ; pointer to anim struct
        dw      L9FD8            ; pointer to movement struct

        db      $32              ; x start: 50
        db      $47              ; y start: 71
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9573            ; pointer to anim struct
        dw      L9FE7            ; pointer to movement struct

; room #56
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $9A              ; x start: 154
        db      $47              ; y start: 71
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9573            ; pointer to anim struct
        dw      L9FD8            ; pointer to movement struct

        db      $DC              ; x start: 220
        db      $78              ; y start: 120
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9573            ; pointer to anim struct
        dw      LA000            ; pointer to movement struct

        db      $7D              ; x start: 125
        db      $50              ; y start: 80
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9573            ; pointer to anim struct
        dw      LA00F            ; pointer to movement struct

; room #57
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $6E              ; x start: 110
        db      $4F              ; y start: 79
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9564            ; pointer to anim struct
        dw      L9F92            ; pointer to movement struct

        db      $46              ; x start: 70
        db      $66              ; y start: 102
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9564            ; pointer to anim struct
        dw      LA01E            ; pointer to movement struct

        db      $65              ; x start: 101
        db      $64              ; y start: 100
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9564            ; pointer to anim struct
        dw      L9F92            ; pointer to movement struct

; room #58
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $69              ; x start: 105
        db      $64              ; y start: 100
        db      $01              ; width: 1 char
        db      $20              ; height: 32 pixel
        dw      L9612            ; pointer to anim struct
        dw      L9F9C            ; pointer to movement struct

        db      $B0              ; x start: 176
        db      $88              ; y start: 136
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9573            ; pointer to anim struct
        dw      LA000            ; pointer to movement struct

        db      $DE              ; x start: 222
        db      $A7              ; y start: 167
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9579            ; pointer to anim struct
        dw      LA037            ; pointer to movement struct

; room #59
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $2E              ; x start: 46
        db      $57              ; y start: 87
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L957F            ; pointer to anim struct
        dw      LA055            ; pointer to movement struct

        db      $81              ; x start: 129
        db      $7C              ; y start: 124
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9564            ; pointer to anim struct
        dw      LA01E            ; pointer to movement struct

        db      $99              ; x start: 153
        db      $50              ; y start: 80
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9573            ; pointer to anim struct
        dw      L9FD8            ; pointer to movement struct

; room #60
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $3C              ; x start: 60
        db      $70              ; y start: 112
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9573            ; pointer to anim struct
        dw      L9FD8            ; pointer to movement struct

        db      $AA              ; x start: 170
        db      $71              ; y start: 113
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9573            ; pointer to anim struct
        dw      LA00F            ; pointer to movement struct

        db      $CE              ; x start: 206
        db      $47              ; y start: 71
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9564            ; pointer to anim struct
        dw      LA01E            ; pointer to movement struct

; room #61
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $DC              ; x start: 220
        db      $6E              ; y start: 110
        db      $01              ; width: 1 char
        db      $20              ; height: 32 pixel
        dw      L9612            ; pointer to anim struct
        dw      L9F9C            ; pointer to movement struct

        db      $1E              ; x start: 30
        db      $49              ; y start: 73
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9618            ; pointer to anim struct
        dw      LA05F            ; pointer to movement struct

        db      $B0              ; x start: 176
        db      $6B              ; y start: 107
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9564            ; pointer to anim struct
        dw      LA01E            ; pointer to movement struct

; room #62
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $9A              ; x start: 154
        db      $87              ; y start: 135
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9573            ; pointer to anim struct
        dw      L9FD8            ; pointer to movement struct

        db      $57              ; x start: 87
        db      $82              ; y start: 130
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9573            ; pointer to anim struct
        dw      L9FD8            ; pointer to movement struct

        db      $67              ; x start: 103
        db      $64              ; y start: 100
        db      $01              ; width: 1 char
        db      $20              ; height: 32 pixel
        dw      L9612            ; pointer to anim struct
        dw      L9FB5            ; pointer to movement struct

; room #63
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $DE              ; x start: 222
        db      $A7              ; y start: 167
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9579            ; pointer to anim struct
        dw      LA037            ; pointer to movement struct

        db      $28              ; x start: 40
        db      $50              ; y start: 80
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9564            ; pointer to anim struct
        dw      LA01E            ; pointer to movement struct

        db      $B1              ; x start: 177
        db      $50              ; y start: 80
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9573            ; pointer to anim struct
        dw      L9FD8            ; pointer to movement struct

; room #64
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $D2              ; x start: 210
        db      $7D              ; y start: 125
        db      $01              ; width: 1 char
        db      $20              ; height: 32 pixel
        dw      L9612            ; pointer to anim struct
        dw      L9F9C            ; pointer to movement struct

        db      $68              ; x start: 104
        db      $78              ; y start: 120
        db      $01              ; width: 1 char
        db      $20              ; height: 32 pixel
        dw      L9612            ; pointer to anim struct
        dw      L9FB5            ; pointer to movement struct

        db      $11              ; x start: 17
        db      $4F              ; y start: 79
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9618            ; pointer to anim struct
        dw      LA05F            ; pointer to movement struct

; room #65
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $D0              ; x start: 208
        db      $9F              ; y start: 159
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9564            ; pointer to anim struct
        dw      L9F92            ; pointer to movement struct

        db      $30              ; x start: 48
        db      $91              ; y start: 145
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9573            ; pointer to anim struct
        dw      L9FD8            ; pointer to movement struct

        db      $8B              ; x start: 139
        db      $96              ; y start: 150
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9573            ; pointer to anim struct
        dw      LA00F            ; pointer to movement struct

; room #66
        db      $FF, $FF         ; trailing bytes for previous structure

        db      $08              ; x start: 8
        db      $7E              ; y start: 126
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9573            ; pointer to anim struct
        dw      LA046            ; pointer to movement struct

        db      $2D              ; x start: 45
        db      $7F              ; y start: 127
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9618            ; pointer to anim struct
        dw      LA05F            ; pointer to movement struct

        db      $D4              ; x start: 212
        db      $72              ; y start: 114
        db      $02              ; width: 2 chars
        db      $10              ; height: 16 pixels
        dw      L9564            ; pointer to anim struct
        dw      LA01E            ; pointer to movement struct

        db      $FF, $FF         ; trailing bytes for previous structure

