; room amulet positions table 4*66=264 bytes
; 4 byte / room - Y pos, X pos, IsCollected, IsPortal
; Y=$FF and X=$FF --> no amulet

; BC 1000000
        db      $03,$1C,$00,$00
        db      $03,$06,$00,$00
        db      $0E,$14,$00,$01
        db      $0C,$0D,$00,$00
        db      $0D,$1C,$00,$00
        db      $09,$19,$00,$00
        db      $0A,$10,$00,$00
        db      $0C,$0D,$00,$00
        db      $0D,$1D,$00,$00
        db      $09,$18,$00,$00
        db      $01,$01,$00,$00
        db      $02,$01,$00,$00

; AD 1066		
        db      $0A,$1D,$00,$00
        db      $01,$04,$00,$00
        db      $07,$1B,$00,$00
        db      $0C,$10,$00,$00
        db      $0D,$1D,$00,$00
        db      $05,$03,$00,$00
        db      $0D,$07,$00,$00
        db      $0A,$05,$00,$01

; AD 1467
        db      $08,$1E,$00,$00
        db      $0E,$01,$00,$00
        db      $06,$15,$00,$00
        db      $0E,$0A,$00,$01
        db      $06,$1E,$00,$00
        db      $06,$09,$00,$00
        db      $0D,$04,$00,$00
        db      $0D,$0A,$00,$00

; AD 1784
        db      $FF,$FF,$00,$00
        db      $FF,$FF,$00,$00
        db      $06,$12,$00,$00
        db      $0A,$11,$00,$00
        db      $FF,$FF,$00,$00
        db      $FF,$FF,$00,$00
        db      $0C,$17,$00,$00
        db      $07,$0A,$00,$01
        db      $0C,$12,$00,$00
        db      $07,$11,$00,$00
        db      $0E,$03,$00,$00
        db      $0C,$1E,$00,$00
        db      $06,$11,$00,$00
        db      $05,$17,$00,$00
        db      $0C,$0A,$00,$00
        db      $09,$01,$00,$00

; AD 1984
        db      $0E,$1D,$00,$00
        db      $0E,$0F,$00,$00
        db      $0D,$0E,$00,$01
        db      $0B,$03,$00,$00
        db      $0A,$1C,$00,$00
        db      $02,$03,$00,$00
        db      $0A,$02,$00,$00
        db      $07,$02,$00,$00

; AD 2001
        db      $0E,$12,$00,$00		
        db      $0C,$0E,$00,$00
        db      $09,$0B,$00,$00
        db      $0A,$07,$00,$00
        db      $0E,$0D,$00,$01
        db      $0E,$16,$00,$00
        db      $0C,$11,$00,$00
        db      $0A,$09,$00,$00
        db      $0C,$1C,$00,$00
        db      $0E,$0E,$00,$00
        db      $0D,$16,$00,$00
        db      $0D,$02,$00,$00
        db      $01,$05,$00,$00
        db      $03,$01,$00,$00