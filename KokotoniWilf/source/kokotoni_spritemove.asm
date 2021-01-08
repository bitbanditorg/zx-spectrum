; x/y increment calculation:
; x increment = N>=0 -> x = x-(3-N), N<0 -> x = x+(4+N), N=$80 -> no change
; y increment = N>=0 -> y = y+(3-N), N<0 -> y = y-(4+N), N=$80 -> no change

L9B78:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $A5                     ; movement in this direction: 165
        db      $FD                     ; x increment: +1
        db      $80                     ; y increment: 0
        dw      L93A8                   ; pointer to anim struct
        db      $A5                     ; movement in this direction: 165
        db      $02                     ; x increment: -1
        db      $80                     ; y increment: 0
        dw      L93A8                   ; pointer to anim struct

L9B87:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $0C                     ; movement in this direction: 12
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L93AE                   ; pointer to anim struct

L9B91:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $06                     ; movement in this direction: 6
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L93BD                   ; pointer to anim struct

L9B9B:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $3C                     ; movement in this direction: 60
        db      $FD                     ; x increment: +1
        db      $80                     ; y increment: 0
        dw      L949E                   ; pointer to anim struct
        db      $3C                     ; movement in this direction: 60
        db      $02                     ; x increment: -1
        db      $80                     ; y increment: 0
        dw      L9495                   ; pointer to anim struct

L9BAA:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $13                     ; movement in this direction: 19
        db      $FD                     ; x increment: +1
        db      $02                     ; y increment: +1
        dw      L9426                   ; pointer to anim struct
        db      $13                     ; movement in this direction: 19
        db      $02                     ; x increment: -1
        db      $02                     ; y increment: +1
        dw      L9426                   ; pointer to anim struct
        db      $13                     ; movement in this direction: 19
        db      $80                     ; x increment: 0
        db      $FE                     ; y increment: -2
        dw      L95AC                   ; pointer to anim struct

L9BBE:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $05                     ; movement in this direction: 5
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L95B2                   ; pointer to anim struct
        db      $0A                     ; movement in this direction: 10
        db      $80                     ; x increment: 0
        db      $01                     ; y increment: +2
        dw      L95BB                   ; pointer to anim struct
        db      $15                     ; movement in this direction: 21
        db      $80                     ; x increment: 0
        db      $FD                     ; y increment: -1
        dw      L941D                   ; pointer to anim struct

L9BD2:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $1D                     ; movement in this direction: 29
        db      $02                     ; x increment: -1
        db      $80                     ; y increment: 0
        dw      L93CC                   ; pointer to anim struct
        db      $0E                     ; movement in this direction: 14
        db      $FE                     ; x increment: +2
        db      $80                     ; y increment: 0
        dw      L95C1                   ; pointer to anim struct

L9BE1:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $14                     ; movement in this direction: 20
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L95C7                   ; pointer to anim struct
        db      $14                     ; movement in this direction: 20
        db      $80                     ; x increment: 0
        db      $FE                     ; y increment: -2
        dw      L95C7                   ; pointer to anim struct
        db      $29                     ; movement in this direction: 41
        db      $80                     ; x increment: 0
        db      $02                     ; y increment: +1
        dw      L93FF                   ; pointer to anim struct

L9BF5:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $32                     ; movement in this direction: 50
        db      $80                     ; x increment: 0
        db      $02                     ; y increment: +1
        dw      L93FF                   ; pointer to anim struct
        db      $0A                     ; movement in this direction: 10
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L95C7                   ; pointer to anim struct
        db      $10                     ; movement in this direction: 16
        db      $80                     ; x increment: 0
        db      $FF                     ; y increment: -3
        dw      L95C7                   ; pointer to anim struct

L9C09:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $23                     ; movement in this direction: 35
        db      $80                     ; x increment: 0
        db      $01                     ; y increment: +2
        dw      L95BB                   ; pointer to anim struct
        db      $23                     ; movement in this direction: 35
        db      $80                     ; x increment: 0
        db      $FE                     ; y increment: -2
        dw      L95CD                   ; pointer to anim struct

L9C18:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $02                     ; movement in this direction: 2
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L9435                   ; pointer to anim struct
        db      $4F                     ; movement in this direction: 79
        db      $02                     ; x increment: -1
        db      $80                     ; y increment: 0
        dw      L943E                   ; pointer to anim struct
        db      $02                     ; movement in this direction: 2
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L9444                   ; pointer to anim struct

L9C2C:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $4F                     ; movement in this direction: 79
        db      $FD                     ; x increment: +1
        db      $80                     ; y increment: 0
        dw      L942F                   ; pointer to anim struct
        db      $08                     ; movement in this direction: 8
        db      $FD                     ; x increment: +1
        db      $02                     ; y increment: +1
        dw      L942F                   ; pointer to anim struct
        db      $1E                     ; movement in this direction: 30
        db      $FD                     ; x increment: +1
        db      $80                     ; y increment: 0
        dw      $422F                   ; pointer to anim struct (wrong address!)

; shark movement in room #6
L9C40:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $4E                     ; movement in this direction: 78
        db      $FD                     ; x increment: +1
        db      $80                     ; y increment: 0
        dw      L942F                   ; pointer to anim struct
        db      $02                     ; movement in this direction: 2
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L9435                   ; pointer to anim struct
        db      $4E                     ; movement in this direction: 78
        db      $02                     ; x increment: -1
        db      $80                     ; y increment: 0
        dw      L943E                   ; pointer to anim struct
        db      $02                     ; movement in this direction: 2
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L9444                   ; pointer to anim struct
        db      $4E                     ; movement in this direction: 78
        db      $FD                     ; x increment: +1
        db      $80                     ; y increment: 0
        dw      L942F                   ; pointer to anim struct
        db      $08                     ; movement in this direction: 8
        db      $FD                     ; x increment: +1
        db      $02                     ; y increment: +1
        dw      L942F                   ; pointer to anim struct
        db      $1E                     ; movement in this direction: 30
        db      $FD                     ; x increment: +1
        db      $80                     ; y increment: 0
        dw      L942F                   ; pointer to anim struct
        db      $02                     ; movement in this direction: 2
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L9435                   ; pointer to anim struct
        db      $1E                     ; movement in this direction: 30
        db      $02                     ; x increment: -1
        db      $80                     ; y increment: 0
        dw      L943E                   ; pointer to anim struct
        db      $08                     ; movement in this direction: 8
        db      $02                     ; x increment: -1
        db      $FD                     ; y increment: -1
        dw      L943E                   ; pointer to anim struct
        db      $4E                     ; movement in this direction: 78
        db      $02                     ; x increment: -1
        db      $80                     ; y increment: 0
        dw      L943E                   ; pointer to anim struct
        db      $02                     ; movement in this direction: 2
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L9444                   ; pointer to anim struct

L9C81:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $2C                     ; movement in this direction: 44
        db      $80                     ; x increment: 0
        db      $02                     ; y increment: +1
        dw      L93CC                   ; pointer to anim struct
        db      $0E                     ; movement in this direction: 14
        db      $80                     ; x increment: 0
        db      $FF                     ; y increment: -3
        dw      L95D3                   ; pointer to anim struct

L9C90:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $1E                     ; movement in this direction: 30
        db      $FD                     ; x increment: +1
        db      $80                     ; y increment: 0
        dw      L949E                   ; pointer to anim struct
        db      $1E                     ; movement in this direction: 30
        db      $02                     ; x increment: -1
        db      $80                     ; y increment: 0
        dw      L9495                   ; pointer to anim struct

L9C9F:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $1E                     ; movement in this direction: 30
        db      $FE                     ; x increment: +2
        db      $80                     ; y increment: 0
        dw      L9426                   ; pointer to anim struct
        db      $1E                     ; movement in this direction: 30
        db      $01                     ; x increment: -2
        db      $80                     ; y increment: 0
        dw      L9426                   ; pointer to anim struct

L9CAE:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $1E                     ; movement in this direction: 30
        db      $80                     ; x increment: 0
        db      $01                     ; y increment: +2
        dw      L9426                   ; pointer to anim struct
        db      $1E                     ; movement in this direction: 30
        db      $80                     ; x increment: 0
        db      $FE                     ; y increment: -2
        dw      L95AC                   ; pointer to anim struct

L9CBD:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $25                     ; movement in this direction: 37
        db      $02                     ; x increment: -1
        db      $80                     ; y increment: 0
        dw      L93ED                   ; pointer to anim struct
        db      $02                     ; movement in this direction: 2
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L93F6                   ; pointer to anim struct
        db      $25                     ; movement in this direction: 37
        db      $FD                     ; x increment: +1
        db      $80                     ; y increment: 0
        dw      L93DB                   ; pointer to anim struct
        db      $02                     ; movement in this direction: 2
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L93E4                   ; pointer to anim struct

L9CD6:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $32                     ; movement in this direction: 50
        db      $FD                     ; x increment: +1
        db      $80                     ; y increment: 0
        dw      L93A8                   ; pointer to anim struct
        db      $32                     ; movement in this direction: 50
        db      $02                     ; x increment: -1
        db      $80                     ; y increment: 0
        dw      L93A8                   ; pointer to anim struct

L9CE5:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $64                     ; movement in this direction: 100
        db      $FD                     ; x increment: +1
        db      $80                     ; y increment: 0
        dw      L9465                   ; pointer to anim struct
        db      $64                     ; movement in this direction: 100
        db      $02                     ; x increment: -1
        db      $80                     ; y increment: 0
        dw      L9465                   ; pointer to anim struct

L9CF4:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $2B                     ; movement in this direction: 43
        db      $2B                     ; x increment: invalid
        db      $2B                     ; y increment: invalid
        dw      $5BED                   ; pointer to anim struct (wrong)
        db      $EB                     ; movement in this direction: 235
        db      $9D                     ; x increment: invalid
        db      $ED                     ; y increment: invalid
        dw      $7E52                   ; pointer to anim struct (wrong)

L9D03:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $1A                     ; movement in this direction: 26
        db      $FD                     ; x increment: +1
        db      $80                     ; y increment: 0
        dw      L946E                   ; pointer to anim struct
        db      $1A                     ; movement in this direction: 26
        db      $02                     ; x increment: -1
        db      $80                     ; y increment: 0
        dw      L9474                   ; pointer to anim struct

L9D12:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $32                     ; movement in this direction: 50
        db      $FE                     ; x increment: +2
        db      $80                     ; y increment: 0
        dw      L946E                   ; pointer to anim struct
        db      $32                     ; movement in this direction: 50
        db      $01                     ; x increment: -2
        db      $80                     ; y increment: 0
        dw      L9474                   ; pointer to anim struct

L9D21:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $08                     ; movement in this direction: 8
        db      $80                     ; x increment: 0
        db      $FD                     ; y increment: -1
        dw      L94E0                   ; pointer to anim struct
        db      $08                     ; movement in this direction: 8
        db      $80                     ; x increment: 0
        db      $02                     ; y increment: +1
        dw      L94E0                   ; pointer to anim struct

L9D30:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $33                     ; movement in this direction: 51
        db      $FF                     ; x increment: +3
        db      $80                     ; y increment: 0
        dw      L947A                   ; pointer to anim struct
        db      $33                     ; movement in this direction: 51
        db      $00                     ; x increment: -3
        db      $80                     ; y increment: 0
        dw      L95C1                   ; pointer to anim struct

L9D3F:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $05                     ; movement in this direction: 5
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L95DC                   ; pointer to anim struct
        db      $F8                     ; movement in this direction: 248
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L95E2                   ; pointer to anim struct
        db      $01                     ; movement in this direction: 1
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L95E2                   ; pointer to anim struct

L9D53:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $3C                     ; movement in this direction: 60
        db      $FE                     ; x increment: +2
        db      $80                     ; y increment: 0
        dw      L9480                   ; pointer to anim struct
        db      $43                     ; movement in this direction: 67
        db      $FD                     ; x increment: +1
        db      $FD                     ; y increment: -1
        dw      L95E8                   ; pointer to anim struct
        db      $43                     ; movement in this direction: 67
        db      $02                     ; x increment: -1
        db      $02                     ; y increment: +1
        dw      L95C1                   ; pointer to anim struct
        db      $3C                     ; movement in this direction: 60
        db      $01                     ; x increment: -2
        db      $80                     ; y increment: 0
        dw      L95C1                   ; pointer to anim struct

L9D6C:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $15                     ; movement in this direction: 21
        db      $FE                     ; x increment: +2
        db      $80                     ; y increment: 0
        dw      L9486                   ; pointer to anim struct
        db      $05                     ; movement in this direction: 5
        db      $FE                     ; x increment: +2
        db      $02                     ; y increment: +1
        dw      L9486                   ; pointer to anim struct
        db      $03                     ; movement in this direction: 3
        db      $FE                     ; x increment: +2
        db      $80                     ; y increment: 0
        dw      L9486                   ; pointer to anim struct
        db      $05                     ; movement in this direction: 5
        db      $FE                     ; x increment: +2
        db      $FD                     ; y increment: -1
        dw      L9486                   ; pointer to anim struct
        db      $41                     ; movement in this direction: 65
        db      $FE                     ; x increment: +2
        db      $80                     ; y increment: 0
        dw      L9486                   ; pointer to anim struct
        db      $67                     ; movement in this direction: 103
        db      $01                     ; x increment: -2
        db      $80                     ; y increment: 0
        dw      L95C1                   ; pointer to anim struct

L9D8F:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $4E                     ; movement in this direction: 78
        db      $FE                     ; x increment: +2
        db      $80                     ; y increment: 0
        dw      L94DA                   ; pointer to anim struct
        db      $4E                     ; movement in this direction: 78
        db      $01                     ; x increment: -2
        db      $80                     ; y increment: 0
        dw      L94D4                   ; pointer to anim struct

L9D9E:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $21                     ; movement in this direction: 33
        db      $FD                     ; x increment: +1
        db      $80                     ; y increment: 0
        dw      L949E                   ; pointer to anim struct
        db      $21                     ; movement in this direction: 33
        db      $02                     ; x increment: -1
        db      $80                     ; y increment: 0
        dw      L9495                   ; pointer to anim struct

L9DAD:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $4A                     ; movement in this direction: 74
        db      $FD                     ; x increment: +1
        db      $80                     ; y increment: 0
        dw      L9465                   ; pointer to anim struct
        db      $4A                     ; movement in this direction: 74
        db      $02                     ; x increment: -1
        db      $80                     ; y increment: 0
        dw      L9465                   ; pointer to anim struct

L9DBC:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $5A                     ; movement in this direction: 90
        db      $FE                     ; x increment: +2
        db      $80                     ; y increment: 0
        dw      L9486                   ; pointer to anim struct
        db      $5A                     ; movement in this direction: 90
        db      $01                     ; x increment: -2
        db      $80                     ; y increment: 0
        dw      L95C1                   ; pointer to anim struct

L9DCB:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $0C                     ; movement in this direction: 12
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L95EE                   ; pointer to anim struct
        db      $0B                     ; movement in this direction: 11
        db      $80                     ; x increment: 0
        db      $01                     ; y increment: +2
        dw      L9486                   ; pointer to anim struct
        db      $17                     ; movement in this direction: 23
        db      $80                     ; x increment: 0
        db      $FD                     ; y increment: -1
        dw      L95EE                   ; pointer to anim struct

L9DDF:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $47                     ; movement in this direction: 71
        db      $02                     ; x increment: -1
        db      $80                     ; y increment: 0
        dw      L94D4                   ; pointer to anim struct
        db      $47                     ; movement in this direction: 71
        db      $FD                     ; x increment: +1
        db      $80                     ; y increment: 0
        dw      L94DA                   ; pointer to anim struct

L9DEE:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $02                     ; movement in this direction: 2
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L9414                   ; pointer to anim struct

L9DF8:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $55                     ; movement in this direction: 85
        db      $02                     ; x increment: -1
        db      $80                     ; y increment: 0
        dw      L95F4                   ; pointer to anim struct
        db      $55                     ; movement in this direction: 85
        db      $FD                     ; x increment: +1
        db      $80                     ; y increment: 0
        dw      L95F4                   ; pointer to anim struct

L9E07:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $19                     ; movement in this direction: 25
        db      $80                     ; x increment: 0
        db      $01                     ; y increment: +2
        dw      L94CB                   ; pointer to anim struct
        db      $19                     ; movement in this direction: 25
        db      $80                     ; x increment: 0
        db      $FE                     ; y increment: -2
        dw      L94CB                   ; pointer to anim struct

L9E16:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $02                     ; movement in this direction: 2
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L944D                   ; pointer to anim struct

L9E20:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $28                     ; movement in this direction: 40
        db      $01                     ; x increment: -2
        db      $80                     ; y increment: 0
        dw      L94B9                   ; pointer to anim struct
        db      $04                     ; movement in this direction: 4
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L94BF                   ; pointer to anim struct
        db      $28                     ; movement in this direction: 40
        db      $FE                     ; x increment: +2
        db      $80                     ; y increment: 0
        dw      L94A7                   ; pointer to anim struct
        db      $04                     ; movement in this direction: 4
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L94AD                   ; pointer to anim struct

L9E39:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $14                     ; movement in this direction: 20
        db      $FD                     ; x increment: +1
        db      $80                     ; y increment: 0
        dw      L949E                   ; pointer to anim struct
        db      $14                     ; movement in this direction: 20
        db      $02                     ; x increment: -1
        db      $80                     ; y increment: 0
        dw      L9495                   ; pointer to anim struct

L9E48:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $30                     ; movement in this direction: 48
        db      $FD                     ; x increment: +1
        db      $80                     ; y increment: 0
        dw      L94A7                   ; pointer to anim struct
        db      $04                     ; movement in this direction: 4
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L94AD                   ; pointer to anim struct
        db      $30                     ; movement in this direction: 48
        db      $02                     ; x increment: -1
        db      $80                     ; y increment: 0
        dw      L94B9                   ; pointer to anim struct
        db      $04                     ; movement in this direction: 4
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L94BF                   ; pointer to anim struct

L9E61:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $17                     ; movement in this direction: 23
        db      $80                     ; x increment: 0
        db      $01                     ; y increment: +2
        dw      L944D                   ; pointer to anim struct
        db      $08                     ; movement in this direction: 8
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L944D                   ; pointer to anim struct
        db      $2F                     ; movement in this direction: 47
        db      $80                     ; x increment: 0
        db      $FD                     ; y increment: -1
        dw      L95FA                   ; pointer to anim struct
        db      $05                     ; movement in this direction: 5
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L95FA                   ; pointer to anim struct

L9E7A:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $19                     ; movement in this direction: 25
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L94E0                   ; pointer to anim struct

L9E84:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $1E                     ; movement in this direction: 30
        db      $01                     ; x increment: -2
        db      $FE                     ; y increment: -2
        dw      L9426                   ; pointer to anim struct
        db      $3D                     ; movement in this direction: 61
        db      $FD                     ; x increment: +1
        db      $02                     ; y increment: +1
        dw      L9426                   ; pointer to anim struct

L9E93:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $08                     ; movement in this direction: 8
        db      $02                     ; x increment: -1
        db      $02                     ; y increment: +1
        dw      L9600                   ; pointer to anim struct
        db      $06                     ; movement in this direction: 6
        db      $02                     ; x increment: -1
        db      $80                     ; y increment: 0
        dw      L960C                   ; pointer to anim struct
        db      $08                     ; movement in this direction: 8
        db      $02                     ; x increment: -1
        db      $FD                     ; y increment: -1
        dw      L9600                   ; pointer to anim struct
        db      $18                     ; movement in this direction: 24
        db      $FD                     ; x increment: +1
        db      $80                     ; y increment: 0
        dw      L9600                   ; pointer to anim struct

L9EAC:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $1E                     ; movement in this direction: 30
        db      $FE                     ; x increment: +2
        db      $80                     ; y increment: 0
        dw      L947A                   ; pointer to anim struct
        db      $1E                     ; movement in this direction: 30
        db      $01                     ; x increment: -2
        db      $80                     ; y increment: 0
        dw      L95C1                   ; pointer to anim struct

L9EBB:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $0A                     ; movement in this direction: 10
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L960C                   ; pointer to anim struct
        db      $05                     ; movement in this direction: 5
        db      $80                     ; x increment: 0
        db      $01                     ; y increment: +2
        dw      L9600                   ; pointer to anim struct
        db      $05                     ; movement in this direction: 5
        db      $80                     ; x increment: 0
        db      $FE                     ; y increment: -2
        dw      L960C                   ; pointer to anim struct

L9ECF:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $16                     ; movement in this direction: 22
        db      $FD                     ; x increment: +1
        db      $80                     ; y increment: 0
        dw      L94FE                   ; pointer to anim struct
        db      $16                     ; movement in this direction: 22
        db      $02                     ; x increment: -1
        db      $80                     ; y increment: 0
        dw      L950D                   ; pointer to anim struct

L9EDE:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $0F                     ; movement in this direction: 15
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L94EF                   ; pointer to anim struct

L9EE8:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $19                     ; movement in this direction: 25
        db      $00                     ; x increment: -3
        db      $80                     ; y increment: 0
        dw      L947A                   ; pointer to anim struct
        db      $19                     ; movement in this direction: 25
        db      $FF                     ; x increment: +3
        db      $80                     ; y increment: 0
        dw      L95C1                   ; pointer to anim struct

L9EF7:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $1E                     ; movement in this direction: 30
        db      $01                     ; x increment: -2
        db      $80                     ; y increment: 0
        dw      L9537                   ; pointer to anim struct
        db      $1E                     ; movement in this direction: 30
        db      $FE                     ; x increment: +2
        db      $80                     ; y increment: 0
        dw      L9528                   ; pointer to anim struct

L9F06:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $27                     ; movement in this direction: 39
        db      $80                     ; x increment: 0
        db      $01                     ; y increment: +2
        dw      L9537                   ; pointer to anim struct
        db      $27                     ; movement in this direction: 39
        db      $80                     ; x increment: 0
        db      $FE                     ; y increment: -2
        dw      L9537                   ; pointer to anim struct

L9F15:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $4E                     ; movement in this direction: 78
        db      $FD                     ; x increment: +1
        db      $80                     ; y increment: 0
        dw      L951C                   ; pointer to anim struct
        db      $27                     ; movement in this direction: 39
        db      $FE                     ; x increment: +2
        db      $02                     ; y increment: +1
        dw      L951C                   ; pointer to anim struct
        db      $27                     ; movement in this direction: 39
        db      $01                     ; x increment: -2
        db      $FD                     ; y increment: -1
        dw      L95C1                   ; pointer to anim struct
        db      $4E                     ; movement in this direction: 78
        db      $02                     ; x increment: -1
        db      $80                     ; y increment: 0
        dw      L95C1                   ; pointer to anim struct

L9F2E:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $28                     ; movement in this direction: 40
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L958E                   ; pointer to anim struct

L9F38:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure

L9F3D:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $55                     ; movement in this direction: 85
        db      $FD                     ; x increment: +1
        db      $80                     ; y increment: 0
        dw      L9546                   ; pointer to anim struct
        db      $2A                     ; movement in this direction: 42
        db      $01                     ; x increment: -2
        db      $80                     ; y increment: 0
        dw      L9555                   ; pointer to anim struct

L9F4C:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $2B                     ; movement in this direction: 43
        db      $02                     ; x increment: -1
        db      $80                     ; y increment: 0
        dw      L9555                   ; pointer to anim struct
        db      $2B                     ; movement in this direction: 43
        db      $FD                     ; x increment: +1
        db      $80                     ; y increment: 0
        dw      L9546                   ; pointer to anim struct

L9F5B:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $0A                     ; movement in this direction: 10
        db      $FE                     ; x increment: +2
        db      $80                     ; y increment: 0
        dw      L9546                   ; pointer to anim struct
        db      $09                     ; movement in this direction: 9
        db      $FD                     ; x increment: +1
        db      $01                     ; y increment: +2
        dw      L9546                   ; pointer to anim struct
        db      $03                     ; movement in this direction: 3
        db      $FD                     ; x increment: +1
        db      $80                     ; y increment: 0
        dw      L9546                   ; pointer to anim struct
        db      $02                     ; movement in this direction: 2
        db      $FD                     ; x increment: +1
        db      $FD                     ; y increment: -1
        dw      L9546                   ; pointer to anim struct
        db      $32                     ; movement in this direction: 50
        db      $FE                     ; x increment: +2
        db      $80                     ; y increment: 0
        dw      L9546                   ; pointer to anim struct
        db      $32                     ; movement in this direction: 50
        db      $01                     ; x increment: -2
        db      $80                     ; y increment: 0
        dw      L9555                   ; pointer to anim struct
        db      $02                     ; movement in this direction: 2
        db      $02                     ; x increment: -1
        db      $02                     ; y increment: +1
        dw      L9555                   ; pointer to anim struct
        db      $03                     ; movement in this direction: 3
        db      $02                     ; x increment: -1
        db      $80                     ; y increment: 0
        dw      L9555                   ; pointer to anim struct
        db      $09                     ; movement in this direction: 9
        db      $02                     ; x increment: -1
        db      $FE                     ; y increment: -2
        dw      L9555                   ; pointer to anim struct
        db      $0A                     ; movement in this direction: 10
        db      $01                     ; x increment: -2
        db      $80                     ; y increment: 0
        dw      L9555                   ; pointer to anim struct

L9F92:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $06                     ; movement in this direction: 6
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L9564                   ; pointer to anim struct

L9F9C:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $28                     ; movement in this direction: 40
        db      $80                     ; x increment: 0
        db      $02                     ; y increment: +1
        dw      L9612                   ; pointer to anim struct
        db      $05                     ; movement in this direction: 5
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L9612                   ; pointer to anim struct
        db      $28                     ; movement in this direction: 40
        db      $80                     ; x increment: 0
        db      $FD                     ; y increment: -1
        dw      L9612                   ; pointer to anim struct
        db      $05                     ; movement in this direction: 5
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L9612                   ; pointer to anim struct

L9FB5:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $2A                     ; movement in this direction: 42
        db      $01                     ; x increment: -2
        db      $80                     ; y increment: 0
        dw      L9612                   ; pointer to anim struct
        db      $2A                     ; movement in this direction: 42
        db      $FE                     ; x increment: +2
        db      $80                     ; y increment: 0
        dw      L9612                   ; pointer to anim struct

L9FC4:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure

L9FC9:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $5A                     ; movement in this direction: 90
        db      $01                     ; x increment: -2
        db      $80                     ; y increment: 0
        dw      L961E                   ; pointer to anim struct
        db      $5A                     ; movement in this direction: 90
        db      $FE                     ; x increment: +2
        db      $80                     ; y increment: 0
        dw      L961E                   ; pointer to anim struct

L9FD8:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $0D                     ; movement in this direction: 13
        db      $80                     ; x increment: 0
        db      $01                     ; y increment: +2
        dw      L9573                   ; pointer to anim struct
        db      $0D                     ; movement in this direction: 13
        db      $80                     ; x increment: 0
        db      $FE                     ; y increment: -2
        dw      L9573                   ; pointer to anim struct

L9FE7:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $3C                     ; movement in this direction: 60
        db      $80                     ; x increment: 0
        db      $02                     ; y increment: +1
        dw      L9573                   ; pointer to anim struct
        db      $3C                     ; movement in this direction: 60
        db      $FD                     ; x increment: +1
        db      $80                     ; y increment: 0
        dw      L9573                   ; pointer to anim struct
        db      $3C                     ; movement in this direction: 60
        db      $02                     ; x increment: -1
        db      $80                     ; y increment: 0
        dw      L9573                   ; pointer to anim struct
        db      $3C                     ; movement in this direction: 60
        db      $80                     ; x increment: 0
        db      $FD                     ; y increment: -1
        dw      L9573                   ; pointer to anim struct

LA000:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $30                     ; movement in this direction: 48
        db      $80                     ; x increment: 0
        db      $FD                     ; y increment: -1
        dw      L9573                   ; pointer to anim struct
        db      $30                     ; movement in this direction: 48
        db      $80                     ; x increment: 0
        db      $02                     ; y increment: +1
        dw      L9573                   ; pointer to anim struct

LA00F:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $25                     ; movement in this direction: 37
        db      $01                     ; x increment: -2
        db      $80                     ; y increment: 0
        dw      L9573                   ; pointer to anim struct
        db      $25                     ; movement in this direction: 37
        db      $FE                     ; x increment: +2
        db      $80                     ; y increment: 0
        dw      L9573                   ; pointer to anim struct

LA01E:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $12                     ; movement in this direction: 18
        db      $02                     ; x increment: -1
        db      $02                     ; y increment: +1
        dw      L9564                   ; pointer to anim struct
        db      $12                     ; movement in this direction: 18
        db      $FD                     ; x increment: +1
        db      $02                     ; y increment: +1
        dw      L9564                   ; pointer to anim struct
        db      $12                     ; movement in this direction: 18
        db      $FD                     ; x increment: +1
        db      $FD                     ; y increment: -1
        dw      L9564                   ; pointer to anim struct
        db      $12                     ; movement in this direction: 18
        db      $02                     ; x increment: -1
        db      $FD                     ; y increment: -1
        dw      L9564                   ; pointer to anim struct

LA037:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $6E                     ; movement in this direction: 110
        db      $01                     ; x increment: -2
        db      $80                     ; y increment: 0
        dw      L9579                   ; pointer to anim struct
        db      $6E                     ; movement in this direction: 110
        db      $FE                     ; x increment: +2
        db      $80                     ; y increment: 0
        dw      L95C1                   ; pointer to anim struct

LA046:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $16                     ; movement in this direction: 22
        db      $80                     ; x increment: 0
        db      $02                     ; y increment: +1
        dw      L9573                   ; pointer to anim struct
        db      $16                     ; movement in this direction: 22
        db      $80                     ; x increment: 0
        db      $FD                     ; y increment: -1
        dw      L9573                   ; pointer to anim struct

LA055:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $06                     ; movement in this direction: 6
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      L957F                   ; pointer to anim struct

LA05F:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
        db      $3C                     ; movement in this direction: 60
        db      $FD                     ; x increment: +1
        db      $80                     ; y increment: 0
        dw      L9618                   ; pointer to anim struct
        db      $3C                     ; movement in this direction: 60
        db      $02                     ; x increment: -1
        db      $80                     ; y increment: 0
        dw      L9618                   ; pointer to anim struct

LA06E:  db      $00, $00, $00, $00, $00 ; trailing zeros for previous structure
