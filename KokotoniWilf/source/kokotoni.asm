        DEVICE ZXSPECTRUM48
		
        ORG $5E25

; The very first bytes... 439 bytes garbage
L5E25:  ds 439, 0
    
; Routine $5FDC: Put room on screen
; Input $6183 = Room number
; Room data format (stored in reverse order)
;   room data length - 2 bytes (length = [n]+[n-1]*256, len bytes excluded)
;   room data * n:
;     attr byte   - 1 byte (msb=1 -> tile+512)
;     copy count  - 1 byte (msb=1 -> tile+256)
;     tile id     - 1 byte

; erase screen: sets first 2/3 screen (512 bytes) to black paper + black ink
L5FDC:  LD      HL,$5800         ; attributes area
        LD      DE,$0000
L5FE2:  LD      (HL),$00         ; black paper & black ink
        INC     DE
        BIT     1,D              ; counts 512 bytes (16x32 area)
        JP      NZ,L5FEE
        INC     HL
        JP      L5FE2

; draw room routine start
L5FEE:  LD      HL,$0000
        LD      (L619B),HL       ; reset total chr count
        LD      (L619F),HL       ; reset X/Y chr position
        LD      HL,LE7FE-$01     ; rooms data start
        LD      (L6180),HL
        LD      A,(L6183)        ; room number wanted
        CP      $01              ; skip next section if
        JP      Z,L6033          ; room #1 wanted

; find room data        
        LD      A,$01
        LD      (L6187),A        ; room counter
L600A:  LD      HL,(L6180)
        LD      A,(HL)           ; read room data length
        LD      C,A
        DEC     HL
        LD      A,(HL)
        LD      B,A
        LD      (L6185),BC
        LD      DE,(L6185)       ; de = room data length
        LD      HL,(L6180)       ; hl = room data pointer
        SBC     HL,DE            ; advance hl to next room
        DEC     HL
        DEC     HL
        LD      (L6180),HL
        LD      A,(L6187)        ; increment room counter
        INC     A
        LD      (L6187),A
        LD      B,A
        LD      A,(L6183)
        CP      B                ; repeat until the required
        JP      NZ,L600A         ; room reached
        
L6033:  LD      HL,(L6180)       ; room data ptr
        LD      A,(HL)
        LD      C,A
        DEC     HL
        LD      A,(HL)
        LD      B,A
        LD      (L6185),BC       ; store room data length (but not used later)
        LD      HL,$0001
        LD      (L6187),HL       ; reset room data position

L6045:  LD      HL,(L6180)
        DEC     HL
        LD      DE,(L6187)       ; room data position
        SBC     HL,DE
        LD      A,(HL)           ; get attr byte
        LD      (L6189),A        ; to check msb
        LD      HL,0
        LD      (L618B),HL       ; reset tile no. value
        LD      A,(L6189)
        BIT     7,A              ; msb set?
        JP      Z,L606C

        RES     7,A              ; remove msb
        LD      (L6189),A
        LD      HL,512           ; +512 tile no. if msb=1
        LD      (L618B),HL

L606C:  LD      A,(L6189)
        LD      HL,(L6180)
        DEC     HL
        DEC     HL
        LD      DE,(L6187)       ; room data position
        SBC     HL,DE
        LD      A,(HL)           ; tile copy count
        LD      (L6193),A
        BIT     7,A              ; msb set?
        JP      Z,L6092
        
        RES     7,A              ; remove msb
        LD      (L6193),A
        LD      HL,(L618B)
        LD      DE,256           ; +256 tile no. if msb=1
        ADD     HL,DE
        LD      (L618B),HL

; find tile no.
L6092:  LD      HL,(L6180)
        DEC     HL
        DEC     HL
        DEC     HL
        LD      DE,(L6187)       ; room data position
        SBC     HL,DE
        LD      A,(HL)           ; tile no.
        LD      E,A
        LD      D,$00
        LD      HL,(L618B)
        ADD     HL,DE
        LD      (L618B),HL       ; store tile no.
        LD      HL,$0000
        LD      (L6191),HL

; find screen address
L60AF:  LD      A,(L619F)        ; y position
        CALL    $0E9E            ; ROM CL-ADDR+3   Input: A=line number, Output: HL=screen addr of line number
        LD      A,(L61A0)        ; x position
        LD      C,A
        LD      B,$00
        ADD     HL,BC
        LD      D,H              ; de=screen addr by tile x/y position
        LD      E,L

; find tile
        LD      BC,(L618B)       ; tile no.
        LD      HL,LE7FE         ; start of tiles
        LD      A,$00
L60C7:  ADD     HL,BC
        INC     A
        CP      $08
        JP      NZ,L60C7         ; hl=hl+8*bc  (tile 8 bytes long)

; draw bitmap to screen
        LD      B,$00
L60D0:  LD      A,(HL)
        LD      (DE),A
        INC     HL               ; next tile data
        INC     D                ; next screen row
        INC     B                ; count 8 bytes
        LD      A,$08
        CP      B
        JP      NZ,L60D0

        LD      HL,L619F
        INC     HL               ; HL points to X position
        LD      BC,(L619F)
        INC     B                ; increment X chr position
        LD      A,$20            ; check rightmost position (32)
        CP      B
        JP      NZ,L60ED         ; reset x to 0
        LD      B,$00            ; if right border reached
        INC     C                ; and increment y chr position
L60ED:  LD      (HL),B           ; store new X
        DEC     HL
        LD      (HL),C           ; store new Y
        LD      HL,(L619B)
        INC     HL               ; increment
        LD      (L619B),HL       ; total chr count
        LD      HL,(L6191)
        INC     HL
        LD      (L6191),HL
        LD      A,(L6193)        ; tile copy count
        LD      B,A
        LD      A,(L6191)        ; tile copy counter
        CP      B
        JP      NZ,L60AF         ; continue draw tiles

        LD      HL,(L619B)       ; total chr count
        BIT     1,H              ; if equal to 512
        JP      NZ,L611D         ; then finished

        LD      HL,(L6187)       ; else
        INC     HL               ; skip
        INC     HL               ; to
        INC     HL               ; next
        LD      (L6187),HL       ; room data position
        JP      L6045

; fill attributes
L611D:  LD      HL,$0000
        LD      (L619D),HL       ; reset total attr counter
        LD      HL,$5800         ; attributes area
        LD      (L6199),HL
        LD      HL,$0001
        LD      (L6195),HL       ; reset room data position
L612F:  LD      HL,$0001
        LD      (L6197),HL       ; reset attr copy count
L6135:  LD      HL,(L6180)
        DEC     HL
        LD      DE,(L6195)
        SBC     HL,DE
        LD      A,(HL)           ; get attr byte
        RES     7,A              ; remove msb
        LD      HL,(L6199)
        LD      (HL),A           ; put attr byte to screen
        INC     HL               ; next scr-attr position
        LD      (L6199),HL
        LD      HL,(L619D)
        INC     HL
        LD      (L619D),HL       ; total attr counter
        LD      HL,(L6197)
        INC     HL
        LD      (L6197),HL       ; attr copy counter
        LD      HL,(L6180)
        DEC     HL
        DEC     HL
        LD      DE,(L6195)
        SBC     HL,DE
        LD      A,(HL)           ; get tile copy count
        RES     7,A              ; remove msb
        LD      HL,(L6197)
        DEC     HL
        CP      L                ; copy attrs
        JP      NZ,L6135         ; until finished
		
        LD      HL,(L6195)
        INC     HL               ; skip
        INC     HL               ; to
        INC     HL               ; next
        LD      (L6195),HL       ; room data position
        LD      HL,(L619D)
        BIT     1,H              ; exit if 512 attrs processed
        RET     NZ

        JP      L612F

L6180:  dw      0                ; actual room data start address
        db      0                ; unused
L6183:  dw      0                ; actual room number
L6185:  dw      0                ; room data length (useless variable)
L6187:  dw      0                ; first it's room counter, and later room data position for tile
L6189:  dw      0                ; used to store attr byte but unnecessary
L618B:  dw      0                ; actual 8x8 graphic element number (graphics stored from E7FE)
        dw      0                ; unused
        dw      0                ; unused
L6191:  dw      0                ; tile copy counter
L6193:  dw      0                ; tile copy count
L6195:  dw      0                ; room data position for attributes
L6197:  dw      0                ; attr copy counter
L6199:  dw      0                ; screen attribute address
L619B:  dw      0                ; tile total chr counter
L619D:  dw      0                ; attr total chr counter
L619F:  db      0                ; Y position
L61A0:  db      0                ; X position

; Unused 103 bytes
L61A1:  ds      103, 0

;L6208 Amulet data
;L6208:  INCBIN "kokotoni_amuletdata.bin"
L6208:  INCLUDE "kokotoni_amuletdata.asm"

; Unused 2560 bytes
L6310:  ds      2560, 0       

; Sound FX - wing noise
; by quasi-random byte sequence from ROM
L6D10:  LD      HL,$0080         ; read from ROM $007F - $0000 backwards
L6D13:  DEC     HL
        LD      A,($5C48)        ; BORDCR (00bbbxxx where b=border color)
        RR      A                ; a becomes 00000bbb
        RES     7,A              ; this way border color won't change
        RR      A                ; why not srl instead of rr+res?
        RES     7,A
        RR      A
        RES     7,A
        LD      C,A
        LD      A,(HL)
        BIT     7,A              ; speaker on if topmost bit zero
        JP      Z,L6D30
        LD      A,C
        OUT     ($FE),A          ; turn off speaker
        JP      L6D35
L6D30:  LD      A,C
        SET     4,A              ; turn on speaker
        OUT     ($FE),A
L6D35:  RES     7,A              ; bit 7 is already zero
        OUT     ($FE),A          ; it's pointless
        LD      A,L
        OR      H
        RET     Z                ; loop until hl = $0000
        JP      L6D13

; Unused 33 bytes        
L6D3F:  ds      33, 0
                
; copy sprite record to sprite buffer, call sprite drawing routine then update back sprite record
; copy $7918-$7930 -> $7530-$7548 and call $6d92 ...
; copy $7931-$7949 -> $7530-$7548 and call $6d92 ...
; copy $794A-$7962 -> $7530-$7548 and call $6d92 ...

L6D60:  EI                       ; enable interrupts to use the halt instruction to vsync (later)
        LD      A,(L752F)        ; sprite count
        LD      B,A
        LD      C,$00
        LD      HL,L7918         ; sprites workspace start
        LD      DE,L7530
        LD      A,$01            ; flag: this is the first sprite
        LD      (L752E),A        ; which is always Wilf
L6D72:  PUSH    BC
        PUSH    DE
        PUSH    HL
        LD      BC,$0019         ; copy 25 bytes to working area
        LDIR    
        CALL    L6D92
        LD      BC,$0019
        POP     DE
        POP     HL
        LDIR                     ; copy back sprite data (update)
        LD      H,D
        LD      L,E
        LD      DE,L7530         ; HL<->DE swap again
        LD      A,$00            ; set flag: this is not the first sprite
        LD      (L752E),A
        POP     BC
        DJNZ    L6D72            ; repeat copy
        RET

L6D92:  LD      A,$00
        LD      (L754B),A        ; unused
        LD      (L7559),A        ; normally draw the sprite twice: remove then put

        LD      A,(L752E)        ; check whether it's the first sprite or not
        CP      $00
        JP      NZ,L6F67         ; skip if it's the first, Wilf's sprite
        
        LD      A,(L7530+$13)    ; check sprite state
        CP      $00              ; disabled sprite (state 0)
        RET     Z

        CP      $03              ; remove the sprite?
        JP      NZ,L6DCA

; remove the sprite and disable it (state 3)
        LD      A,$01
        LD      (L754B),A        ; unused
        LD      (L7559),A        ; set draw only once flag (by xor its either remove or put)
        LD      A,$00            ; set state to disabled
        LD      (L7530+$13),A    ; save state
        LD      HL,(L7530+$14)
        LD      (L7551),HL
        LD      HL,(L7530+$0F)   ; save ...
        LD      (L7530+$11),HL   ; into x/y coords
        CALL    L6E4B
        RET     

L6DCA:  CP      $02              ; turn on the sprite?
        JP      NZ,L6DF2

; turn on the sprite (state 2)
        LD      A,$01            ; set state to enabled
        LD      (L7530+$13),A
        LD      HL,(L7530+$0D)   ; sprite bitmap ptr
        LD      (L7551),HL
        LD      (L7530+$05),HL
        LD      A,$01
        LD      (L7559),A        ; set draw only once flag (by xor its either remove or put)
        CALL    L6E4B
        LD      HL,(L7530+$11)
        LD      (L7530+$0F),HL
        LD      HL,(L7530+$0D)
        LD      (L7530+$14),HL
        RET     

; enabled sprite (state 1)
; handle sprite ink color in new position, and restore ink color in old position
; then erase sprite in old position and draw sprite in the new position
L6DF2:  LD      BC,(L7530+$0F)   ; get old x/y position
        CALL    L71ED            ; get attribute addr
        LD      A,(L7530+$16)
        LD      (L7530+$18),A    ; save sprite ink color
        LD      A,(L7530+$17)
        LD      (L7530+$16),A    ; and replace with "erased" ink 
        LD      DE,(L7530+$0F)
        PUSH    HL
        PUSH    DE
        LD      BC,(L7530+$11)   ; get new x/y position
        CALL    L71ED            ; get attribute addr
        POP     DE
        POP     BC               ; it was hl = old position's attr pointer
        PUSH    HL
        LD      H,B
        LD      L,C
        CALL    L720F            ; color the old (erased) position
        POP     HL
        LD      A,(L7530+$18)    ; get saved ink color
        LD      (L7530+$16),A
        LD      DE,(L7530+$11)
        CALL    L720F            ; color the new position
        EI
        LD      HL,(L7530+$11)   ; get new position
        LD      (L7530+$0B),HL   ; and store in tmp position for drawing
        LD      HL,(L7530+$14)   ; get sprite's old bitmap address
        LD      (L754F),HL
        LD      HL,(L7530+$0D)   ; get sprite's new bitmap address
        LD      (L7551),HL
        CALL    L6E4B            ; erase then put sprite
        LD      HL,(L7530+$11)   ; new position
        LD      (L7530+$0F),HL   ; becomes old position
        LD      HL,(L7530+$0D)   ; new sprite bitmap address
        LD      (L7530+$14),HL   ; becomes old sprite bitmap address
        RET     

L6E4B:  LD      HL,(L7530+$09)   ; copy sprite width/height into
        LD      (L7530+$07),HL   ; sprite width/height counter
        LD      BC,(L7530+$0F)
        CALL    $22AA            ; rom pixel-add, bc=yx coord, hl=screen byte addr, a=pixel bit position
        LD      (L7530),HL
        LD      (L7530+$02),A
        LD      BC,(L7530+$11)
        CALL    $22AA            ; rom pixel-add, bc=yx coord, hl=screen byte addr, a=pixel bit position
        LD      (L7553),HL
        LD      (L7557),A
        JP      L6E85
        
L6E6E:  LD      A,(L7530+$02)
        LD      B,A
        LD      A,$00
        CP      B
        JP      Z,L6E7D
L6E78:  SCF     
        RR      A
        DJNZ    L6E78
L6E7D:  LD      (L7530+$03),A    ; left mask
        CPL
        LD      (L7530+$04),A    ; right mask
        RET     

; draw the sprite on screen (except Willy)
L6E85:  LD      A,(L7559)        ; check "draw only once" flag
        CP      $01              ; if set, skip this drawing part
        JP      Z,L6EA9
        LD      HL,(L754F)
        LD      (L7530+$05),HL
        LD      A,(L7530+$02)    ; screen byte bit position
        LD      (L7558),A
        CALL    L71CF            ; get sprite byte in DE
        LD      HL,(L7530)       ; read screen byte under sprite
        LD      A,(HL)
        XOR     E                ; xor sprite byte with screen byte
        LD      (HL),A           ; put sprite byte first half on screen
        INC     HL
        LD      A,(HL)
        XOR     D                ; put sprite byte another half on screen
        LD      (HL),A
        LD      (L7530),HL       ; store next screen address
        
L6EA9:  LD      HL,(L7551)       ; read sprite byte pointer
        LD      (L7530+$05),HL
        LD      A,(L7557)        ; read screen bit position
        LD      (L7558),A
        CALL    L71CF            ; get sprite byte in DE (byte shifted between D-E)
        LD      HL,(L7553)       ; read screen byte under sprite
        LD      A,(HL)
        XOR     E                ; xor sprite byte with screen byte
        LD      (HL),A           ; put sprite byte first half on screen
        INC     HL
        LD      A,(HL)
        XOR     D
        LD      (HL),A           ; put sprite byte another half on screen
        LD      (L7553),HL       ; store updated screen address
        LD      HL,(L754F)
        INC     HL
        LD      (L754F),HL
        LD      HL,(L7551)
        INC     HL
        LD      (L7551),HL       ; advance sprite byte pointer
        LD      A,(L7530+$07)    ; decrement sprite width counter
        DEC     A
        LD      (L7530+$07),A
        CP      $00
        JP      Z,L6EE2          ; exit loop if finished
        JP      L6E85
L6EE2:  LD      A,(L7530+$09)    ; get sprite width
        LD      (L7530+$07),A
        LD      A,(L7530+$08)    ; decrement sprite height counter
        DEC     A
        LD      (L7530+$08),A
        CP      $00
        RET     Z                ; exit routine if finished

        LD      HL,(L7530)       ; read screen byte address
        LD      DE,(L7530+$07)   ; read sprite width in bytes
        LD      D,$00
        SBC     HL,DE            ; move back
        LD      (L7530),HL
        LD      HL,(L7553)
        SBC     HL,DE
        LD      (L7553),HL
        LD      HL,(L7530)
        LD      (L7555),HL
        CALL    L6F29            ; calculate next screen row
        LD      HL,(L7555)
        LD      (L7530),HL
        LD      HL,(L7553)
        LD      (L7555),HL
        CALL    L6F29            ; calculate next screen row
        LD      HL,(L7555)
        LD      (L7553),HL
        JP      L6E85

; Calculate next screen row routine
; The Sinclair Spectrum screen memory addressing is a bit odd.
; The screen consists of 192 pixel row and 32 character columns,
;   which is 6144 memory byte locations.
; The linear address would be 000r rrrr yyyx xxxx,
;   where x = character column position, r = character row position
;   and y = pixel row inside a character cell (rrrrryyy = 192 vertical pixels)
; Sinclair swapped three r and three y bits: 000r ryyy rrrx xxxx

; this part handles the lower three bit of vertical position
L6F29:  LD      A,(L7555+1)      ; get upper byte (H from HL)
        AND     $07              ; is it the last pixel row
        CP      $07              ; inside a character cell?
        JP      Z,L6F3B
        LD      A,(L7555+1)      ; if not then simply increase
        INC     A                ; the pixel row
        LD      (L7555+1),A
        RET     

; this part handles the next three bits of vertical position
L6F3B:  LD      A,(L7555+1)      ; get upper byte
        AND     $F8              ; clear pixel row value
        LD      (L7555+1),A      ; inside a character cell
        LD      A,(L7555)        ; get lower byte
        AND     $E0              ; get lower three bits of
        CP      $E0              ; character row position
        JP      Z,L6F56          ; and jump if it would overflow
        LD      A,(L7555)        ; or else simply
        ADD     A,$20            ; increase to the next row
        LD      (L7555),A
        RET     

; this part handles the upper two bits of vertical position
L6F56:  LD      A,(L7555)        ; get lower byte
        AND     $1F              ; clear the lower three bits
        LD      (L7555),A        ; of character row position
        LD      A,(L7555+1)      ; and increase the
        ADD     A,$08            ; upper two bits of character row
        LD      (L7555+1),A
        RET     

; handle Wilf's sprite
L6F67:  LD      A,(L7530+$13)    ; check state
        CP      $00              ; 0-disabled
        RET     Z

        CP      $03              ; 3-turn off
        JP      NZ,L6FA3
        LD      A,$00
        LD      (L7530+$13),A    ; disable the sprite
        LD      BC,(L7530+$0F)
        CALL    $22AA            ; rom pixel-add, hl=screen byte addr, a=pixel bit position
        LD      (L7530+$02),A
        LD      (L7530),HL
        LD      HL,(L7530+$14)
        LD      (L7530+$05),HL
        LD      HL,(L7530+$09)   ; copy sprite width/height into
        LD      (L7530+$07),HL   ; sprite width/height counter
        LD      HL,L755C
        LD      (L755A),HL
        CALL    L7194
        LD      HL,L755C
        LD      (L755A),HL
        CALL    L7147            ; draw the sprite
        RET     

L6FA3:  CP      $02              ; 2-turn on
        JP      NZ,L6FE0
        LD      A,$01            ; enable the sprite
        LD      (L7530+$13),A
        LD      HL,(L7530+$0D)
        LD      (L7530+$05),HL
        LD      (L7530+$14),HL
        LD      BC,(L7530+$11)
        LD      (L7530+$0F),BC
        CALL    $22AA	         ; rom pixel-add, hl=screen byte addr, a=pixel bit position
        LD      (L7530+$02),A
        LD      (L7530),HL
        LD      HL,(L7530+$09)   ; copy sprite width/height into
        LD      (L7530+$07),HL   ; sprite width/height counter
        LD      HL,L755C
        LD      (L755A),HL
        CALL    L7194
        LD      HL,L755C
        LD      (L755A),HL
        CALL    L7147            ; draw the sprite
        RET     

; update Wilf's sprite
; this is state 1-enabled
L6FE0:  LD      HL,(L7530+$14)
        halt                     ; wait for start of next frame (vertical sync)
        LD      (L7530+$05),HL
        LD      HL,L755C
        LD      (L755A),HL
        LD      BC,(L7530+$0F)   ; b=y, c=x
        CALL    $22AA            ; rom pixel-add, hl=screen byte addr, a=pixel bit position
        LD      (L7530+$02),A
        CALL    L7194
        LD      HL,(L7530+$0D)
        LD      (L7530+$05),HL
        LD      BC,(L7530+$11)
        CALL    $22AA            ; rom pixel-add, hl=screen byte addr, a=pixel bit position
        LD      (L7530+$02),A
        CALL    L7194
        LD      HL,(L7530+$09)   ; copy sprite width/height into
        LD      (L7530+$07),HL   ; sprite width/height counter
        LD      HL,(L7530+$14)
        LD      (L7530+$05),HL
        LD      BC,(L7530+$0F)
        CALL    $22AA            ; rom pixel-add, hl=screen byte addr, a=pixel bit position
        LD      (L7530+$02),A
        LD      (L7530),HL
        LD      HL,L755C
        LD      (L755A),HL
        CALL    L7147            ; draw the sprite
        LD      HL,(L7530+$0D)
        LD      (L7530+$05),HL
        LD      (L7530+$14),HL
        LD      BC,(L7530+$11)
        LD      (L7530+$0F),BC
        LD      (L7530+$0B),BC
        CALL    $22AA            ; rom pixel-add, hl=screen byte addr, a=pixel bit position
        LD      (L7530+$02),A
        LD      (L7530),HL
        CALL    L6E6E
        LD      HL,(L7530+$09)   ; copy sprite width/height into
        LD      (L7530+$07),HL   ; sprite width/height counter
        CALL    L705A
        RET     

; draw Wilf's sprite and check collision
L705A:  LD      HL,(L755A)
        LD      E,(HL)           ; Wilf's first rotated byte
        INC     HL
        LD      D,(HL)           ; Wilf's second rotated byte
        INC     HL
        LD      (L755A),HL       ; update rotated row pointer
        LD      HL,(L7530)       ; Wilf screen address
        LD      BC,(L7530+$03)
        LD      A,(HL)           ; get byte under Wilf
        AND     B                ; rotate mask
        AND     E                ; Wilf's byte
        CP      $00              ; check whether Wilf's pixels collide with pixels on screen
        CALL    NZ,L70E5         ; if so check color
        LD      A,(HL)
        XOR     E                ; put Wilf's byte on screen
        LD      (HL),A
        INC     HL               ; next screen byte (rotated byte may be overlap)
        LD      A,(L7530+$0B)
        ADD     A,$08            ; x = x + 8
        LD      (L7530+$0B),A
        LD      A,(HL)           ; get next byte under Wilf
        AND     C
        AND     D
        CP      $00              ; check whether Wilf's pixels collide
        CALL    NZ,L70E5         ; and check color
        LD      A,(HL)
        XOR     D                ; put Wilf's second byte on screen
        LD      (HL),A
        LD      A,(L7530+$07)    ; sprite width counter
        DEC     A                ;   decremented
        LD      (L7530+$07),A
        CP      $00              ; finished processing sprite line?
        JP      Z,L709C
        LD      (L7530),HL
        JP      L705A
        
L709C:  LD      A,(L7530+$09)    ; update back sprite width
        LD      (L7530+$07),A    ;   into width counter
        LD      A,(L7530+$08)    ; sprite height counter
        DEC     A                ;   decremented
        LD      (L7530+$08),A
        CP      $00
        RET     Z

        LD      HL,(L7530)       ; screen address decremented
        LD      DE,(L7530+$07)   ;   by width-1
        LD      D,$00
        DEC     DE
        SBC     HL,DE
        LD      (L7530),HL
        LD      A,(L7530+$07)
        SLA     A
        SLA     A
        SLA     A
        LD      B,A              ; b=width*8 (pixel width)
        LD      A,(L7530+$0B)
        SUB     B                ; x = x - (width * 8)
        LD      (L7530+$0B),A
        LD      A,(L7530+$0C)
        DEC     A                ; y = y - 1
        LD      (L7530+$0C),A
        LD      HL,(L7530)
        LD      (L7555),HL
        CALL    L6F29            ; calculate next screen row
        LD      HL,(L7555)
        LD      (L7530),HL
        JP      L705A

; check Wilf collided by which color
; harmful colors: magenta, yellow, cyan
L70E5:  PUSH    HL
        PUSH    DE
        PUSH    BC
        PUSH    AF
        LD      BC,(L7530+$0B)   ; get x,y coordinate
        CALL    L71ED            ; get attribute address
        LD      A,(HL)           ; read attribute
        BIT     6,A              ; bright bit?
        JP      Z,L70FE
        LD      A,$02            ; it must be an amulet
        LD      (L754E),A        ; update collision material flag
        JP      L7131
L70FE:  AND     $07              ; ink color only
        CP      $03              ; magenta?
        JP      Z,L7136
        CP      $06              ; yellow?
        JP      Z,L7136
        CP      $05              ; cyan?
        JP      Z,L7136
        CP      $07              ; white?
        JP      Z,L7131
        POP     AF
        PUSH    AF
        LD      HL,(L7530+$0B)   ; get x/y coordinate
        LD      B,$08
L711B:  SLA     A
        CP      $00
        JP      Z,L7124
        DJNZ    L711B
L7124:  LD      A,(L7530+$02)    ; Wilf bit position to the left
        LD      C,A
        LD      A,$08
        SUB     C                ; bit position to the right
        ADD     A,L
        SUB     B
        LD      L,A
        LD      (L754C),HL       ; obstacle x/y position
L7131:  POP     AF
        POP     BC
        POP     DE
        POP     HL
        RET     

L7136:  LD      A,$01            ; deadly color touched
        LD      (L754E),A        ; update collision material flag
        JP      L7131
		
L713E:  LD      HL,L755C         ; this piece of code never gets called
        LD      (L755A),HL
        CALL    L7194

L7147:  LD      HL,(L755A)       ; get rotated sprite data
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        INC     HL
        LD      (L755A),HL       ; update pointer
        LD      HL,(L7530)       ; get screen address under sprite
        LD      A,(HL)
        XOR     E                ; put rotated sprite byte first half
        LD      (HL),A
        INC     HL
        LD      A,(HL)
        XOR     D                ; put rotated sprite byte second half
        LD      (HL),A
        LD      (L7530),HL       ; update screen adress
        LD      A,(L7530+$07)    ; width counter
        DEC     A                ;   decreased
        LD      (L7530+$07),A
        CP      $00
        JP      NZ,L7147         ; jump back to draw full width
        LD      A,(L7530+$09)    ; get sprite width in bytes
        LD      (L7530+$07),A    ; store in sprite width counter
        LD      HL,(L7530)
        LD      DE,(L7530+$07)
        LD      D,$00            ; decrease screen address by
        SBC     HL,DE            ;   sprite width
        LD      (L7555),HL
        CALL    L6F29            ; calculate next screen row
        LD      HL,(L7555)
        LD      (L7530),HL
        LD      A,(L7530+$08)    ; decrement sprite height counter
        DEC     A
        LD      (L7530+$08),A
        CP      $00
        RET     Z                ; return when whole sprite drawn
        JP      L7147

L7194:  LD      A,(L7530+$09)    ; sprite width in bytes
        LD      D,$00
        LD      E,A
        LD      A,(L7530+$0A)    ; sprite height in pixels
        LD      H,$00
        LD      L,A
        CALL    $30A9            ; HL = HL*DE
        LD      B,L
        LD      C,$00
L71A6:  PUSH    BC
        LD      A,(L7530+$02)    ; bit position to the left
        LD      (L7558),A
        CALL    L71CF
        LD      A,(L7530+$02)
        LD      B,A
        LD      A,$08
        SUB     B
        LD      B,A
L71B8:  DJNZ    L71B8            ; it seems unnecessary
        LD      HL,(L755A)
        LD      (HL),E
        INC     HL
        LD      (HL),D
        INC     HL
        LD      (L755A),HL
        LD      HL,(L7530+$05)
        INC     HL
        LD      (L7530+$05),HL
        POP     BC
        DJNZ    L71A6
        RET     

; read sprite byte and return it in DE register pairs
; DE holds the rotated byte aligned to bit position
L71CF:  LD      HL,(L7530+$05)   ; sprite bitmap pointer
        LD      A,(HL)
        LD      E,A
        LD      D,$00
        LD      A,(L7558)        ; bit position
        LD      B,A
        CP      $00              ; exit if no rotation
        RET     Z

; rotates from LSB(E) into MSB(D)
L71DD:  SRL     D
        LD      A,E
        AND     $01
        ADD     A,$7F
        AND     $80
        OR      D
        LD      D,A
        SRL     E
        DJNZ    L71DD
        RET     

; get attribute addr under x,y coordinates
L71ED:  SRL     C                ; x=x/8
        SRL     C
        SRL     C
        SRL     B                ; y=y/8
        SRL     B
        SRL     B
        LD      A,$15
        SUB     B
        LD      B,A
        LD      E,B
        LD      D,$00
        LD      HL,$0020
        CALL    $30A9            ; HL=Y*32
        LD      DE,$5800
        ADD     HL,DE
        LD      D,$00
        LD      E,C
        ADD     HL,DE            ; HL=$5800+Y*32+X
        RET     

; color a sprite (or a given position, ie. erased sprite)
L720F:  LD      A,(L7530+$0A)    ; get sprite pixel height in pixels
        SRL     A                ; div by 8
        SRL     A                ; to get attribute height
        SRL     A
        LD      B,A
        LD      A,D              ; get sprite y position
        AND     $07
        CP      $07              ; is it on a byte boundary?
        JP      Z,L7222          ; if not then increment the height counter
        INC     B                ; to color the overlapping part
L7222:  PUSH    BC
        LD      A,(L7530+$09)    ; get sprite width in bytes
        LD      B,A
        LD      A,E              ; get sprite x position
        AND     $07
        CP      $00              ; is it on a byte boundary?
        JP      Z,L7230          ; if not then increment the width counter
        INC     B                ; to color the overlapping part
L7230:  PUSH    BC
        LD      A,(L7530+$16)    ; get sprite color
        LD      C,A
        LD      A,(HL)           ; get attribute
        AND     $F8              ; keep paper
        OR      C                ; update ink
        LD      (HL),A           ; store attribute
        INC     HL
        POP     BC
        DJNZ    L7230
        LD      BC,$0020         ; calculate next attribute row
        ADD     HL,BC
        LD      A,(L7530+$09)    ; sprite width in bytes
        LD      C,A
        LD      B,$00
        LD      A,E              ; get sprite x position
        AND     $07
        CP      $00              ; is it on a byte boundary?
        JP      Z,L7251          ; if not then increment bc holds sprite width in bytes
        INC     BC
L7251:  SBC     HL,BC            ; trace back by width bytes to find the first byte
        POP     BC               ; in the next attribute row
        DJNZ    L7222
        RET     

; Unused 29 bytes       
L7257:  ds      29, 0

; Kokotoni welcome text graphics
;L7274:  INCBIN "kokotoni_welcome1.bin"
L7274:  INCLUDE "kokotoni_welcome1.asm"

; Wilf welcome text graphics
;L72B5:  INCBIN "kokotoni_welcome2.bin"
L72B5:  INCLUDE "kokotoni_welcome2.asm"

; Unused 103 bytes
L72D5:  ds      103, 0

; Info panel graphics
;L733C:  INCBIN "kokotoni_infobitmaps.bin"
L733C:  INCLUDE "kokotoni_infobitmaps.asm"

; Unused 58 bytes        
L74F4:  ds      58, 0

; Variables		
L752E:  db      0                ; boolean 1=first sprite (which is Wilf), 0=not first sprite
L752F:  db      0                ; sprite count for L6D60 routine

; currently processed sprite data (copied from L7918...)
; data length: $19 (25) bytes
; 7530 7918 $00 screen address
; 7532 791A $02 bit position to the left (shift sprite bits)
; 7533 791B $03 left mask byte
; 7534 791C $04 right mask byte
; 7535 791D $05 input for 71CF sprite bitmap pointer
; 7537 791F $07 width counter
; 7538 7920 $08 height counter
; 7539 7921 $09 width in bytes
; 753A 7922 $0A height in pixels
; 753B 7923 $0B x coord for drawing
; 753C 7924 $0C y coord for drawing
; 753D 7925 $0D new bitmap ptr
; 753F 7927 $0F old x coord
; 7540 7928 $10 old y coord
; 7541 7929 $11 new x coord
; 7542 792A $12 new y coord
; 7543 792B $13 state (0-disabled, 1-enabled, 2-insert, 3-remove)
; 7544 792C $14 old bitmap ptr
; 7546 792E $16 ink color input for 720F
; 7547 792F $17 ink color after removing the sprite (usually $07 = Wilf's color)
; 7548 7930 $18 saved ink color
L7530:  ds      25, 0

; 2 bytes unused
        ds      2, 0

L754B:  db      0                ; unused, only written at 2 places
L754C:  db      0
L754D:  db      0
L754E:  db      0                ; collision material: 0-nothing, 1-deadly, 2-amulet
L754F:  dw      0
L7551:  dw      0                ; currently processed sprite's bitmap pointer
L7553:  dw      0                ; screen address
L7555:  dw      0                ; used by L6F29 routine (calculate next screen row)
L7557:  db      0                ; screen bit position
L7558:  db      0                ; screen bit position input parameter for L71CF routine
L7559:  db      0                ; draw sprite only once flag (by xor its either remove or put)
L755A:  dw      L755C            ; points from $755C to $75DB (two by two)

; rotated sprite buffer, 128 bytes (can be safely initialized with zeros)
L755C:  ds      128, 0

; 78 bytes unused
L75DC:  ds      78, 0

; Congratulation text, 356 bytes
L762A:  DEFM    "     Kokotoni Wilf by ELITE     "
        DEFM    "     -------- ---- -- -----     "
        DEFM    "                                "
        DEFM    "  Congratulations on retrieving "
        DEFM    "all the fragments of the Amulet "
        DEFM    "                                "
        DEFM    "  Ulrich reveals that with the  "
        DEFM    "return of the stolen Amulet the "
        DEFM    "sleep spell on the lair of      "
        DEFM    "dangerous dragons will be       "
        DEFM    "reinforced for many years to    "
	DEFM    "come"

; 19 bytes unused
L778E:  ds      19, 0

; KOKOTONI welcome text animation movement control data, 20 bytes
L77A1:  db      $00, $00, $00, $00, $00
        db      $33                     ; movement in this direction: 51
        db      $02                     ; x increment: -1
        db      $80                     ; y increment: 0
        dw      $0000                   ; not used
        db      $FE                     ; movement in this direction: 254
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      $0000                   ; not used
        db      $33                     ; movement in this direction: 51
        db      $fd                     ; x increment: +1
        db      $80                     ; y increment: 0
        dw      $0000                   ; not used
        
; WILF welcome text animation movement control data, 20 bytes
L77B5:  db      $00, $00, $00, $00, $00
        db      $33                     ; movement in this direction: 51
        db      $FD                     ; x increment: +1
        db      $80                     ; y increment: 0
        dw      $0000                   ; not used
        db      $FE                     ; movement in this direction: 254
        db      $80                     ; x increment: 0
        db      $80                     ; y increment: 0
        dw      $0000                   ; not used
        db      $33                     ; movement in this direction: 51
        db      $02                     ; x increment: -1
        db      $80                     ; y increment: 0
        dw      $0000                   ; not used
  
; 335 bytes unused  
L77C9:  ds      335, 0

; start of sprite workspace#1 for 7 sprites (record length 25 bytes => 7 * 25 = 175 bytes)
; first sprite is always Wilf (L7918)
; for fields see L7530
; sprite 2-6 must have 24th byte set to $07 since it is not initialized elsewhere
L7918:  ds      25, 0
L7931:  ds      23, 0
        db      $07,$00
L794A:  ds      23, 0
        db      $07,$00
L7963:  ds      23, 0
        db      $07,$00
L797C:  ds      23, 0
        db      $07,$00
L7995:  ds      23, 0
        db      $07,$00
L79AE:  ds      25, 0
; end of sprite workspace

; 825 bytes unused
L79C7:  ds      825, 0

; Sprite graphics
;L7D00:  INCBIN "kokotoni_sprites.bin"
L7D00:  INCLUDE "kokotoni_sprites.asm"

; 72 bytes unused
L8AC8:  ds      72, 0

; start of sprite workspace#2 for 7 sprites (record length 20 bytes => 7 * 20 = 140 bytes)
; this workspace does not include Wilf, this is for sprite movement
; $00 - delta x
; $01 - delta y
; $02-$05 unused
; $06 - anim phase time counter (from sprite anim data)
; $07 - movement counter (from sprite movement data)
; $08-$0B unused
; $0C - movement data ptr incremented (from room sprite data)
; $0E - anim data ptr incremented (from room sprite data)
; $10 - movement data ptr const (from room sprite data)
; $12 - anim data ptr const (from room sprite data)
L8B10:  ds      20, 0
L8B24:  ds      20, 0
L8B38:  ds      20, 0
L8B4C:  ds      20, 0
L8B60:  ds      20, 0
L8B74:  ds      20, 0
L8B88:  ds      20, 0
; end of sprite workspace

; 60 bytes unused        
L8B9C:  ds      60, 0

; Room sprite declarations
;L8BD8:  INCBIN "kokotoni_sprdat.bin"
L8BD8:  INCLUDE "kokotoni_roomsprites.asm"

; 266 bytes unused
L929E:  ds      266, 0
        
; Sprite animation data
        INCLUDE "kokotoni_spriteanim.asm"

; 1364 bytes unused
L9624:  ds      1364, 0

; Sprite movement
        INCLUDE "kokotoni_spritemove.asm"

; 125 bytes unused        
LA073:  ds      125, 0

LA0F0:	JP      LA2F0            ; program start (randomize usr 41200)

; copy actual room's sprite structures to sprite workspace area
LA0F3:  LD      HL,L8BD8         ; points to first room sprite data
        LD      B,$00            ; record counter
        DEC     HL
LA0F9:  INC     HL
        LD      A,(HL)
        CP      $FF
        JR      NZ,LA0F9         ; find first $FF
        INC     HL
        LD      A,(HL)
        CP      $FF
        JR      NZ,LA0F9         ; find second $FF
        INC     B
        LD      A,(L6183)        ; actual room number
        CP      B
        JR      NZ,LA0F9         ; loop until we found the current room

        LD      A,$01            ; sprite counter
LA10E:  INC     HL               ; HL=actual room's sprite data begin
        PUSH    AF
        PUSH    HL
        LD      E,A
        LD      D,$00
        DEC     DE
        LD      HL,$0014
        CALL    $30A9            ; HL=20*SpriteNo.
        LD      DE,L8B10         ; sprite workspace#2 1st sprite address
        ADD     HL,DE
        LD      (LAEE3),HL       ; save actual sprite workspace pointer
        LD      DE,$0006
        ADD     HL,DE            ; work#2+$06
        LD      (HL),$00         ; reset anim phase time
        INC     HL
        LD      (HL),$00         ; reset ? todo
        POP     HL               ; actual room's sprite data begin
        POP     AF
        PUSH    AF
        LD      D,A              ; save a
        LD      A,(HL)           ; check structure end
        CP      $FF              ; by two $FF's
        call    z,LA1A5          ; finish copy if it's the end
        LD      A,D              ; restore a
        PUSH    HL
        LD      E,A              ; sprite counter
        LD      D,$00
        LD      HL,$0019         ; one sprite workspace size
        CALL    $30A9            ; ROM HL=HL*DE
        LD      DE,L7918+$11     ; sprite workspace#1 1st sprite address (points to xy position data)
        ADD     HL,DE            ; HL=Nth sprite (counts from 2nd sprite, 1st is Wilf)
        LD      D,H              ; save workspace ptr in DE
        LD      E,L
        POP     HL               ; actual room's sprite data begin
        PUSH    HL
        LD      C,(HL)           ; read x position
        LD      H,D              ; HL = workspace#1 ptr
        LD      L,E
        LD      (HL),C           ; store x position in workspace (work#1+$11)
        POP     HL
        INC     HL
        PUSH    HL
        LD      B,(HL)           ; read y position
        LD      H,D              ; HL = workspace#1 ptr
        LD      L,E
        INC     HL
        LD      (HL),B           ; store y position in workspace (work#1+$12)
        POP     HL               ; actual room's sprite data begin+1
        INC     HL
        INC     HL
        PUSH    HL
        DEC     HL
        LD      C,(HL)           ; read width
        INC     HL
        LD      B,(HL)           ; read height
        LD      HL,$FFF8
        ADD     HL,DE            ; hl=de-8 => HL=work#1+$09
        LD      (HL),C           ; store width (in bytes) in workspace#1 (work#1+$09)
        INC     HL
        LD      (HL),B           ; store height (in pixels) in workspace#1 (work#1+$0A)
        POP     HL               ; actual room's sprite data begin+3
        INC     HL
        PUSH    HL
        LD      C,(HL)           ; read sprite anim struct ptr
        INC     HL
        LD      B,(HL)           ; sprite anim struct ptr in BC
        POP     HL               ; actual room's sprite data begin+4
        POP     AF
        PUSH    AF
        PUSH    HL
        PUSH    BC
        INC     HL
        INC     HL
        LD      C,(HL)           ; read sprite movement struct pointer
        INC     HL
        LD      B,(HL)           ; sprite movement struct ptr in BC
        LD      HL,(LAEE3)       ; actual sprite workspace#2 pointer
        LD      DE,$000C
        ADD     HL,DE            ; points to anim struct ptr in workspace
        LD      (HL),C           ; work#2+$0C <- sprite movement struct ptr
        INC     HL
        INC     HL
        INC     HL
        INC     HL
        LD      (HL),C           ; work#2+$10 <- sprite movement struct ptr
        DEC     HL
        DEC     HL
        DEC     HL
        LD      (HL),B           ; work#2+$0D <- sprite movement struct ptr
        INC     HL
        INC     HL
        INC     HL
        INC     HL
        LD      (HL),B           ; work#2+$11 <- sprite movement struct ptr
        POP     BC               ; restore sprite anim struct ptr
        DEC     HL
        DEC     HL
        DEC     HL
        LD      (HL),C           ; work#2+$0E <- sprite anim struct ptr
        INC     HL
        INC     HL
        INC     HL
        INC     HL
        LD      (HL),C           ; work#2+$12 <- sprite anim struct ptr
        DEC     HL
        DEC     HL
        DEC     HL
        LD      (HL),B           ; work#2+$0F <- sprite anim struct ptr
        INC     HL
        INC     HL
        INC     HL
        INC     HL
        LD      (HL),B           ; work#2+$13 <- sprite anim struct ptr
        POP     HL
        POP     AF
        INC     A
        INC     HL
        INC     HL
        INC     HL
        JP      LA10E

LA1A5:  INC     HL               ; came here if first byte is $FF
        LD      A,(HL)           ; check second byte
        DEC     HL
        CP      $FF              ; check whether it's $FF
        RET     NZ               ; return if no
                                 ; else room is finished, exit

        POP     DE
        POP     AF
        DEC     A
        LD      (LAEE1),A        ; store sprite count
        RET     

; init animation phase data
LA1B2:  LD      A,$02
        LD      (LAEE2),A
LA1B7:  LD      HL,$0014
        LD      D,$00
        LD      A,(LAEE2)
        DEC     A
        DEC     A
        LD      E,A
        CALL    $30A9            ; ROM HL=HL*DE
        LD      DE,L8B10
        ADD     HL,DE            ; HL=L8B10+A*20 -> actual sprite workspace#2
        LD      (LAEE3),HL
        LD      DE,$0006         ; work#2+$06
        ADD     HL,DE            ; is initialized to 0
        LD      A,(HL)           ; by LA0F3 for first
        DEC     A                ; so it will be $FF
        LD      (HL),A           ; for first time
        CP      $FF
        JR      NZ,LA214

; init sprite data for first sprite shape
LA1D7:  LD      HL,(LAEE3)
        LD      DE,$000E         ; $8b10+spr*20+$0E -> sprite anim data
        ADD     HL,DE
        LD      C,(HL)
        INC     HL
        LD      B,(HL)
        INC     BC               ; get next data row
        INC     BC               ; by incrementing anim data ptr
        INC     BC               ;
        LD      (HL),B           ; store anim data ptr
        DEC     HL
        LD      (HL),C
        PUSH    BC
        POP     HL
        LD      E,(HL)           ; get
        INC     HL               ; sprite gfx
        LD      D,(HL)           ; pointer
        LD      A,E
        OR      D                ; check end of structure
        CP      $00
        JR      Z,LA225

        PUSH    HL
        PUSH    DE
        LD      A,(LAEE2)        ; sprite counter
        LD      E,A
        LD      D,$00
        DEC     DE
        LD      HL,$0019
        CALL    $30A9            ; ROM HL=HL*DE
        LD      DE,L7918+$0D     ; First sprite's bitmap ptr
        ADD     HL,DE            ; HL = Nth sprite's bitmap ptr
        POP     DE
        LD      (HL),E           ; store sprite gfx ptr
        INC     HL
        LD      (HL),D
        POP     HL
        INC     HL
        LD      A,(HL)
        LD      HL,(LAEE3)
        LD      DE,$0006         ; store byte 5. from anim data at byte 6. in workspace#2
        ADD     HL,DE
        LD      (HL),A

LA214:  LD      A,(LAEE2)
        INC     A
        LD      (LAEE2),A
        LD      B,A
        DEC     B
        DEC     B
        LD      A,(LAEE1)        ; check sprite count
        CP      B
        RET     Z
        JR      LA1B7

LA225:  LD      HL,(LAEE3)       ; handle end of anim struct
        LD      DE,$0012         ; by copying back the first
        ADD     HL,DE            ; element's address
        LD      E,(HL)           ; work#2+$12 -> work#2+$0E
        INC     HL
        LD      D,(HL)
        DEC     HL
        DEC     HL
        DEC     HL
        DEC     HL
        LD      (HL),D
        DEC     HL
        LD      (HL),E
        JR      LA1D7

; init animation movement data
LA238:  LD      A,$02
        LD      (LAEE2),A
LA23D:  LD      HL,$0014
        LD      D,$00
        LD      A,(LAEE2)
        DEC     A
        DEC     A
        LD      E,A
        CALL    $30A9            ; HL=HL*DE
        LD      DE,L8B10
        ADD     HL,DE
        LD      (LAEE3),HL
        LD      DE,$0007         ; workspace#2+$07
        ADD     HL,DE            ; is initialized to 0
        LD      A,(HL)           ; by LA0F3 for first
        DEC     A                ; so it will be $FF
        LD      (HL),A           ; for first time
        CP      $FF
        JR      NZ,LA2C9
		
LA25D:  LD      HL,(LAEE3)
        LD      DE,$000C         ; $8b10+spr*20+$0C -> work#2+$0C = movement data ptr
        ADD     HL,DE
        LD      C,(HL)
        INC     HL
        LD      B,(HL)
        PUSH    HL
        LD      HL,$0005         ; increment ptr by 5
        ADD     HL,BC            ; to get next row from movement data structure
        PUSH    HL
        POP     DE
        POP     HL
        LD      (HL),D           ; store next row ptr
        DEC     HL
        LD      (HL),E
        LD      H,D
        LD      L,E
        LD      C,(HL)
        LD      A,$00            ; check end of structure
        CP      C
        JR      Z,LA2DB

        PUSH    HL
        LD      HL,(LAEE3)
        LD      DE,$0007
        ADD     HL,DE
        LD      (HL),C           ; store byte 5. from movement struct into byte 7. of workspace#2
        POP     DE
        PUSH    DE
        LD      BC,$0005
        ADD     HL,BC
        LD      (HL),E           ; store next row ptr again? redundant
        INC     HL
        LD      (HL),D
        PUSH    HL
        LD      H,D
        LD      L,E
        INC     HL
        LD      E,(HL)           ; get delta x
        INC     HL
        LD      D,(HL)           ; get delta y
        POP     HL
        LD      BC,$000D
        SBC     HL,BC
        LD      (HL),E           ; store delta x into work#2+$00
        INC     HL
        LD      (HL),D           ; store delta y into work#2+$01
        POP     HL
        LD      DE,$0003         ; get ptr to anim struct
        ADD     HL,DE
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        LD      A,E
        OR      D
        CP      $00              ; check end of struct
        JR      Z,LA2C9

        LD      HL,(LAEE3)
        LD      BC,$000E         ; work#2+$0E = anim data ptr
        ADD     HL,BC
        LD      (HL),E           ; update anim struct ptr in workspace#2
        INC     HL
        INC     HL
        INC     HL
        INC     HL
        LD      (HL),E
        DEC     HL
        DEC     HL
        DEC     HL
        LD      (HL),D
        INC     HL
        INC     HL
        INC     HL
        INC     HL
        LD      (HL),D
        LD      HL,(LAEE3)
        LD      DE,$0006
        ADD     HL,DE
        LD      (HL),$00         ; reset anim time counter
        
LA2C9:  LD      A,(LAEE2)        ; get current sprite counter
        INC     A                ; and increment
        LD      (LAEE2),A
        LD      B,A
        DEC     B
        DEC     B
        LD      A,(LAEE1)        ; check sprite count
        CP      B                ; counter == count?
        RET     Z                ; exit if finished
        JP      LA23D

LA2DB:  LD      HL,(LAEE3)       ; reset to begin of movement structure
        LD      DE,$0010         ; work#2+$10 -> work#2+$0C
        ADD     HL,DE
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        LD      BC,$0005
        SBC     HL,BC
        LD      (HL),E
        INC     HL
        LD      (HL),D
        JP      LA25D

LA2F0:  DI
        LD      A,$17
        LD      ($5C8D),A        ; ATTR_P = green paper, white ink
        CALL    $0DAF            ; ROM CL-ALL (clears display)

        LD      HL,$5AC0         ; last two rows (in attributes area)
        LD      B,$40            ; become black
LA2FE:  LD      (HL),$00
        INC     HL
        DJNZ    LA2FE

        LD      HL,L733C-$100    ; ELITE logo
        LD      ($5C36),HL       ; Set CHARS
        LD      A,$01
        LD      DE,LAEFB
        LD      BC,$0064
        CALL    $0C0A            ; ROM PO-MSG 

        LD      A,$02            ; paper black, ink red
        LD      ($5C8F),A        ; ATTR_T

        LD      A,$16            ; PRINT AT 21,31;
        RST     $10
        LD      A,$15
        RST     $10
        LD      A,$1F
        RST     $10
        LD      A,$2B            ; draws bottom-right corner separately
        RST     $10
        LD      A,$02            ; draw other 3 corners
        LD      DE,LAEFB
        CALL    $0C0A            ; ROM PO-MSG
		
        LD      A,$16            ; paper red, ink yellow
        LD      ($5C8F),A        ; ATTR_T
		
        LD      A,$16            ; PRINT AT 21,1;
        RST     $10
        LD      A,$15
        RST     $10
        LD      A,$01
        RST     $10
        LD      A,$56            ; empty character
        RST     $10

        LD      A,$17            ; paper red, ink white
        LD      ($5C8F),A        ; ATTR_T
		
LA343:  LD      A,$00
        LD      ($5C48),A        ; BORDCR = black border
        LD      A,$00
        LD      (LFCBC),A        ; line #1 coord not initialized
        LD      (LFCC2),A        ; set increasing state
        LD      (L7918+$13),A    ; disable the first sprite
        LD      A,$35
        LD      (LFCC3),A
        LD      A,$01
        LD      (LFCC7),A        ; set horizontal moving lines
        LD      B,$7F
        LD      C,$32
        LD      (LFCBE),BC       ; set line #1 X/Y coordinates
        LD      C,$D6
        LD      B,$75
        LD      (LFCC4),BC       ; set line #2 X/Y coordinates
        LD      A,$02
        LD      (L6183),A        ; actual room number
        LD      A,$0E
        LD      (LFFF2),A        ; set moving lines attribute to paper blue, ink yellow
        CALL    L5FDC            ; draw room
        LD      A,$02            ; two sprites
        LD      (LAEE1),A
		
; set up welcome screen KOKOTONI WILF text sprite records
        LD      L,$08            ; KOKOTONI text is 8 byte wide
        LD      H,$08            ; and 8 pixel tall
        LD      (L7931+$09),HL   ; store it in 2nd sprite
        LD      L,$04            ; WILF text is 4 byte wide
        LD      H,$08            ; and 8 pixel tall
        LD      (L794A+$09),HL   ; 3rd sprite
        LD      C,$3A            ; KOKOTONI text start x position is 58
        LD      B,$82            ; start y position is 130 (0 is bottom of screen!)
        LD      (L7931+$11),BC   ; 2nd sprite
        LD      C,$B2            ; WILF text start x position is 178 
        LD      B,$78            ; start y position is 120 (0 is bottom of screen!)
        LD      (L794A+$11),BC   ; 3rd sprite
        LD      A,$00
        LD      (L7918+$13),A    ; disable the first sprite (Wilf)
        LD      A,$04            ; KOKOTONI text start color green
        LD      (L7931+$16),A    ; 2nd sprite
        LD      A,$04            ; WILF text start color green
        LD      (L794A+$16),A    ; 3rd sprite
        LD      A,$02
        LD      (L7931+$13),A    ; turn on 2nd + 3rd sprites
        LD      (L794A+$13),A    ;
        LD      HL,L7274         ; KOKOTONI welcome text address
        LD      (L7931+$0D),HL   ; 2nd sprite
        LD      HL,L72B5         ; WILF welcome text address
        LD      (L794A+$0D),HL   ; 3rd sprite
        LD      HL,L77B5         ; WILF text movement control data
        LD      (L8B10+$0C),HL   ; copied into sprite #1 workspace
        LD      HL,L77B5
        LD      (L8B10+$10),HL
        LD      HL,L77A1         ; KOKOTONI text movement control data
        LD      (L8B24+$0C),HL   ; copied into sprite #2 workspace
        LD      HL,L77A1
        LD      (L8B24+$10),HL
        LD      A,$03            ; 3 sprites
        LD      (L752F),A        ; 
        LD      A,$00            ; reset movement counter
        LD      (L8B10+$07),A    ;
        LD      (L8B24+$07),A    ;
        LD      HL,$6338         ; used as sound fx table
        LD      (LAEF9),HL       ; but actually isn't used
		
LA3EB:  LD      BC,$0064         ; only one working parameter to sound fx
        LD      A,(L8B10)
        CP      $80              ; skip, no movement = no sound
        JR      Z,LA405
        LD      HL,(LAEF9)       ; should be welcome animation sound fx
        LD      A,(HL)           ; but actually is not used
        CP      $FF              ; unused verification
        INC     HL               ; counts to "infinity"
        LD      (LAEF9),HL
        LD      L,A              ; sound routine doesn't use HL
        LD      H,$00
        CALL    LAC70            ; generate sound fx by value in BC
LA405:  LD      A,(L7931+$16)    ; 2nd sprite
        INC     A                ; cycle KOKOTONI sprite color
        AND     $07
        LD      (L7931+$16),A
        LD      A,(L794A+$16)    ; 3rd sprite
        INC     A                ; cycle WILF sprite color
        AND     $07
        LD      (L794A+$16),A
        CALL    LA238            ; update sprite animation movement data
        CALL    LA6EA            ; update KOKOTONI WILF text sprite position
        CALL    L6D60            ; update KOKOTONI WILF text sprite on screen
        LD      A,(L8B10)
        CP      $80
        JR      Z,LA42A
        CALL    LFA64            ; update welcome screen animation (increasing-decreasing lines)
		
LA42A:  LD      A,$00
        LD      ($5C48),A        ; BORDCR = black border
        LD      (LAF48),A        ; kempston joystick will not be used (why?)

        IN      A,($FE)
        AND     $1F
        CP      $1F              ; is any key pressed?
        JR      NZ,LA452

; why check these keys separately? nonsense
        LD      BC,$EFFE         ; key group 6,7,8,9,0
        IN      A,(C)
        AND     $1F
        CP      $1F
        JR      NZ,LA452
		
        LD      A,$01            ; kempston joystick will be used
        LD      (LAF48),A
        IN      A,($1F)          ; read kempston joystick
        CP      $10              ; is fire pressed?
        JR      Z,LA452
        JR      LA3EB            ; continue welcome animation

LA452:  LD      A,$01
        LD      (L6183),A        ; room 1.
        LD      (LAF49),A        ; no cheating flag (1=no cheat)
        LD      (LAEEB),A        ; set BC 1000000 flag to true
        LD      HL,$03E8
        LD      (LAEE8),HL       ; time 1000 (= BC 1000000)
        LD      A,$00
        LD      (LAEE7),A        ; items 0
        LD      BC,$F7FE         ; key group: 5,4,3,2,1
        IN      A,(C)            ; read port
        BIT     1,A
        JR      Z,LA477          ; if pressing '2'
        BIT     2,A
        JR      Z,LA491          ; if pressing '3'
        JR      LA4A9            ; else

; routine skips to zone 2
LA477:  LD      A,$0C
        LD      (LAEE7),A        ; items 12
        LD      A,$0D
        LD      (L6183),A        ; room 13.
        LD      HL,$042A
        LD      (LAEE8),HL       ; time = 1066
        LD      A,$00
        LD      (LAEEB),A        ; time is not BC 1000000
        LD      (LAF49),A        ; cheating flag (0=cheat)
        JR      LA4A9

; routine skips to zone 3
LA491:  LD      A,$14
        LD      (LAEE7),A        ; items 20
        LD      A,$15
        LD      (L6183),A        ; room 21.
        LD      HL,$05BB
        LD      (LAEE8),HL       ; time = 1467
        LD      A,$00
        LD      (LAEEB),A        ; time is not BC 1000000
        LD      (LAF49),A        ; cheating flag (0=cheat)

LA4A9:  LD      A,$00
        LD      (LAEE5),A
        LD      (LAEE6),A        ; reset game finished flag
        LD      (L754C),A
        LD      (L754D),A
        LD      (L754E),A        ; reset collision material flag
        LD      ($5C48),A        ; BORDCR = black border
        LD      ($5C48),A
        LD      A,$06            ; yellow
        LD      (L7963+$16),A    ; 3rd sprite's color
        LD      (L794A+$16),A    ; 2nd sprite's color
        LD      (L7995+$16),A    ; 5th sprite's color
        LD      A,$03            ; magenta
        LD      (L797C+$16),A    ; 4th sprite's color
        LD      (L79AE+$16),A    ; 6th sprite's color
        LD      A,$05            ; cyan
        LD      (L7931+$16),A    ; 1st sprite's color
		
        LD      HL,L6208+$02
        LD      B,$43
LA4DD:  LD      (HL),$00         ; clear IsCollected bytes in amulet table
        INC     HL
        INC     HL
        INC     HL
        INC     HL
        DJNZ    LA4DD
		
        LD      A,$06            ; start with 6 lives ($A4E6)
        LD      (LAEEA),A
        LD      A,$00
        LD      (LAEDA),A        ; no drawing moving lines
        LD      A,$00
        LD      (LFCBC),A        ; moving lines: line #1 coords not initialized
        LD      (LFCC2),A        ; moving lines: set increasing state
        LD      A,$00
        LD      B,$28
        LD      A,$02            ; put sprite on screen (set state)
        LD      (L7918+$13),A    ; Wilf's sprite
        LD      (L7931+$13),A    ; 1st sprite
        LD      (L794A+$13),A    ; 2nd sprite
        LD      (L7963+$13),A    ; 3rd sprite
        LD      (L797C+$13),A    ; 4th sprite
        LD      (L7995+$13),A    ; 5th sprite
        LD      (L79AE+$13),A    ; 6th sprite
        LD      (L79C7+$13),A    ; 7th sprite (but never used)
        LD      HL,L7D00+$CA8    ; Wilf sprite bitmap (Wilf heading left)
        LD      (L7918+$0D),HL
        LD      H,$A0
        LD      L,$C8
        LD      (L7918+$11),HL   ; Wilf's X/Y position
        LD      C,$80
        LD      B,$80
        LD      (LAEEC),BC       ; not used elsewhere
        LD      B,$10
        LD      C,$02
        LD      (L7918+$09),BC   ; Wilf sprite Width and Height
        LD      A,$08
        LD      (LAEDE),A
        LD      A,$01            ; update Items
        LD      (LAEF4),A
        CALL    LAD35            ; call update info panel
        LD      A,$02            ; update Time
        LD      (LAEF4),A
        CALL    LAD35            ; call update info panel
        LD      A,$03            ; update Wilfs (lives)
        LD      (LAEF4),A
        CALL    LAD35            ; call update info panel
        LD      A,$00
        LD      (LAEDB),A
        LD      HL,(L7918+$11)
        LD      (LAEDC),HL
LA55A:  LD      A,$00
        LD      (LAEE5),A
LA55F:  LD      A,$05            ; cyan
        LD      (L7931+$16),A    ; 1st sprite' color
        LD      A,$06            ; yellow
        LD      (L794A+$16),A    ; 2nd sprite's color
        LD      A,(L6183)        ; get actual room number
        CP      $06
        JR      Z,LA583
        CP      $0D
        JR      Z,LA583
        CP      $1B
        JR      Z,LA57E
        CP      $16
        JR      Z,LA583
        JR      LA588
LA57E:  LD      A,$03            ; magenta
        LD      (L794A+$16),A    ; 2nd sprite's color
LA583:  LD      A,$03            ; magenta
        LD      (L7931+$16),A    ; 1st sprite's color
LA588:  LD      A,$00
        LD      (LAEDB),A
        LD      HL,(L7918+$11)
        LD      (LAEDC),HL
LA593:  LD      A,$03            ; turn off sprites
        LD      (L7931+$13),A    ; 2nd sprite
        LD      (L794A+$13),A    ; 3rd sprite
        LD      (L7963+$13),A    ; 4th sprite
        LD      (L797C+$13),A    ; 5th sprite
        LD      (L7995+$13),A    ; 6th sprite
        LD      (L79AE+$13),A    ; 7th sprite
        CALL    L6D60            ; draw sprites
        LD      A,$02            ; turn on sprites
        LD      (L794A+$13),A    ; 2nd sprite
        LD      (L7931+$13),A    ; 3rd sprite
        LD      (L7963+$13),A    ; 4th sprite
        LD      (L797C+$13),A    ; 5th sprite
        LD      (L7995+$13),A    ; 6th sprite
        LD      (L79AE+$13),A    ; 7th sprite
        LD      A,$00
        LD      (LAEDA),A        ; no drawing moving lines in the room
        LD      A,$02            ; turn on
        LD      (L7918+$13),A    ; Wilf's sprite
        CALL    LA0F3            ; read actual room's sprites into sprite workspace
        LD      A,(LAEE1)        ; get sprite count for actual room
        INC     A                ; + Wilf's sprite
        LD      (L752F),A
        LD      A,$00
        LD      (L754E),A        ; reset collision material flag
        LD      A,(L6183)        ; get actual room number
        CP      $02
        JR      Z,LA5E4          ; jump if it's ROOM #2 (horizontal increasing-decreasing lines)
        CP      $05
        JR      Z,LA612          ; jump if it's ROOM #5 (vertical increasing-decreasing lines)
        JR      LA63E

LA5E4:  LD      C,$32
        LD      B,$7E
        LD      (LFCBE),BC       ; line #1 x/y start position
        LD      C,$D6
        LD      B,$75
        LD      (LFCC4),BC       ; line #2 x/y start position
        LD      A,$01
        LD      (LFCC7),A        ; set horizontal lines
        LD      A,$4B
        LD      (LFCC3),A        ; set line limit
        LD      A,$0E
        LD      (LFFF2),A        ; set moving lines attribute to paper blue, ink yellow
        LD      A,$00
        LD      (LFCBC),A        ; line #1 is not initialized
        LD      (LFCC2),A        ; set increasing state
        LD      A,$01
        LD      (LAEDA),A        ; set to draw moving lines in the room
        JR      LA63E

LA612:  LD      C,$1E
        LD      B,$41
        LD      (LFCBE),BC       ; line #1 x/y start position
        LD      C,$AA
        LD      B,$41
        LD      (LFCC4),BC       ; line #2 x/y start position
        LD      A,$03
        LD      (LFCC7),A        ; set vertical lines
        LD      A,$48
        LD      (LFCC3),A        ; set line limit
        LD      A,$0E
        LD      (LFFF2),A        ; set moving lines attribute to paper blue, ink yellow
        LD      A,$00
        LD      (LFCBC),A        ; line #1 is not initialized
        LD      (LFCC2),A        ; set increasing state
        LD      A,$01
        LD      (LAEDA),A        ; set to draw moving lines in the room

LA63E:  CALL    L5FDC            ; draw room on screen

; Sound FX when Wilf appears in a room (e.g. after death)
        LD      HL,$0064         ; HL is not used by SFX routine
        LD      BC,$0064
        CALL    LAC70            ; generate sound fx
        LD      HL,$0032         ; HL is not used by SFX routine
        LD      BC,$001E
        CALL    LAC70            ; generate sound fx
        LD      HL,$0064         ; HL is not used by SFX routine
        LD      BC,$004B
        CALL    LAC70            ; generate sound fx
		
        LD      A,(L6183)        ; room number
        DEC     A
        LD      E,A
        LD      D,$00
        LD      HL,$0004
        CALL    $30A9            ; HL=4*room
        LD      DE,L6208         ; room amulet positions
        ADD     HL,DE            ; HL=4*room+$6208
        LD      A,(HL)
        LD      B,A
        INC     HL
        LD      A,(HL)
        LD      C,A
        INC     HL
        LD      A,(HL)           ; amulet is already collected?
        CP      $00
        JP      Z,LA684          ; draw if not
        INC     HL
        LD      A,(HL)           ; portal amulet?
        LD      D,A
        LD      A,(LAEE5)        ; all amulets are collected?
        AND     D
        CP      $01              ; draw if this is the last and a portal amulet
        JR      NZ,LA6D1
		
; draw amulet
LA684:  PUSH    BC
        LD      E,B
        LD      D,$00
        LD      HL,$0020
        CALL    $30A9            ; HL=32*Ypos
        LD      E,C
        LD      D,$00
        ADD     HL,DE            ; HL=32*Ypos+Xpos
        LD      DE,$5800         ; attributes area
        ADD     HL,DE            ; HL=attr position of amulet
        LD      A,(HL)           ; get current attr
        SET     6,A              ; set bright bit
        LD      B,A
        LD      A,(LAEE5)        ; all amulets are collected?
        CP      $01
        JR      NZ,LA6A3         ; do not flash normal amulets
        SET     7,B              ; set flash bit for portal amulets
LA6A3:  LD      A,B
        POP     BC
        LD      (HL),A           ; update attr byte

        LD      A,$16
        SUB     B
        LD      B,A              ; b=22-Ypos
        SLA     B
        SLA     B
        SLA     B
        SLA     C
        SLA     C
        SLA     C
        DEC     B                ; b=(22-Ypos)*8-1, c=Xpos*8
        CALL    $22AA            ; ROM PIXEL-ADD, Input: BC=YX position, Output: HL=screen byte addr, A=pixel bit position

; print amulet graphic
        LD      (HL),$18         ; 00011000
        INC     H
        LD      (HL),$FF         ; 11111111
        INC     H
        LD      (HL),$66         ; 01100110
        INC     H
        LD      (HL),$24         ; 00100100
        INC     H
        LD      (HL),$24         ; 00100100
        INC     H
        LD      (HL),$66         ; 01100110
        INC     H
        LD      (HL),$FF         ; 11111111
        INC     H
        LD      (HL),$18         ; 00011000

LA6D1:  LD      A,$02
        LD      (LAEDB),A
LA6D6:  LD      HL,$FFFF
        LD      (L754C),HL
        CALL    LA1B2            ; update sprite anim phase
        CALL    LA238            ; update sprite anim movement
        CALL    LA6EA            ; update sprite position
        CALL    LA8CB            ; control Wilf
        JR      LA75F
        
; sprite move routine
LA6EA:  LD      A,(LAEE1)        ; sprite count
        LD      B,A
        INC     B                ; bug, this increment is not required
                                 ; will move one more sprite which is not shown
LA6EF:  PUSH    BC
        LD      HL,$0014
        LD      E,B
        LD      D,$00
        DEC     DE
        CALL    $30A9            ; HL=20*B        (L30A9 - ROM routine HL=HL*DE)
        LD      DE,L8B10         ; sprite workspace#2 ptr
        ADD     HL,DE            ; HL=20*B+$8B10 (point to Nth sprite data)
        LD      (LAEF5),HL
        POP     BC
        PUSH    BC
        LD      E,B
        LD      D,$00
        DEC     DE
        LD      HL,$0019
        CALL    $30A9            ; HL=25*B
        LD      DE,L7931+$11     ; sprite x position (counts from 2nd sprite)
        ADD     HL,DE            ; HL=25*B+$7942 (x position of Nth sprite)
        LD      (LAEF7),HL       ; ptr to Nth sprite's x position
        LD      HL,(LAEF5)       ; get workspace#2 ptr
        LD      A,(HL)           ; get x delta
        CP      $80              ; do nothing flag
        JR      Z,LA736
        BIT     7,A
        JR      NZ,LA72D         ; jump if negative
        LD      C,A
        LD      A,$03
        SUB     C                ; n = 3 - n (if n is positive)
        LD      C,A
        LD      HL,(LAEF7)
        LD      A,(HL)           ; get x pos
        SUB     C
        LD      (HL),A           ; x = x - (3 - n)
        JR      LA736
LA72D:  ADD     A,$04            ; n = n + 4 (if n is negative)
        LD      C,A
        LD      HL,(LAEF7)
        LD      A,(HL)           ; get x pos
        ADD     A,C
        LD      (HL),A           ; x = x + (4 + n)
LA736:  LD      HL,(LAEF5)
        INC     HL
        LD      A,(HL)           ; get y delta
        CP      $80              ; do nothing flag
        JR      Z,LA75B
        BIT     7,A
        JR      NZ,LA751         ; jump if negative
        LD      C,A
        LD      A,$03
        SUB     C                ; n = 3 - n (if n is positive)
        LD      C,A
        LD      HL,(LAEF7)
        INC     HL
        LD      A,(HL)           ; get y pos
        ADD     A,C
        LD      (HL),A           ; y = y + (3 - n)
        JR      LA75B
LA751:  ADD     A,$04            ; n = n + 4 (if n is negative)
        LD      C,A
        LD      HL,(LAEF7)
        INC     HL
        LD      A,(HL)           ; get y pos
        SUB     C
        LD      (HL),A           ; y = y - (4 + n)
LA75B:  POP     BC
        DJNZ    LA6EF
        RET     

LA75F:  CALL    L6D60            ; draw sprites
        LD      HL,(L754C)
        LD      A,H
        AND     L
        CP      $FF
        CALL    NZ,LAAFA
        CALL    LA8CB            ; control wilf
        LD      HL,$FFFF
        LD      (L754C),HL
        LD      A,(L752F)        ; sprite count
        PUSH    AF
        LD      A,$01            ; draw only Wilf's sprite
        LD      (L752F),A
        CALL    L6D60            ; draw sprite
        POP     AF
        LD      (L752F),A        ; restore original sprite count
        LD      HL,(L754C)
        LD      A,H
        AND     L
        CP      $FF
        CALL    NZ,LAAFA
        LD      HL,(L754C)
        
        LD      A,(LAEDA)
        CP      $01              ; drawing moving lines required?
        JR      NZ,LA7D5         ; skip if not
        
        LD      A,(LFCC7)
        CP      $01              ; horizontal or vertical?
        JR      Z,LA7BE          ; skip to horizontal
        
        LD      BC,(LFCC0)
        CALL    LAEAC            ; get attribute addr (in HL) by pixel addr (in BC)
        LD      DE,$0020
        SBC     HL,DE
        LD      (HL),$0F
        LD      BC,(LFCC4)
        CALL    LAEAC
        LD      DE,$0020
        SBC     HL,DE
        LD      (HL),$0F
        JR      LA7D2
        
LA7BE:  LD      BC,(LFCC0)
        CALL    LAEAC
        INC     HL
        LD      (HL),$0F
        LD      BC,(LFCC4)
        CALL    LAEAC
        DEC     HL
        LD      (HL),$0F
        
LA7D2:  CALL    LFA64            ; update horizontal/vertical increasing-decreasing lines

; collision detection
LA7D5:  LD      A,(L7918+$11)
        ADD     A,$0D            ; Wilf's X + 13 pixels (right side)
        LD      C,A
        LD      A,(L7918+$12)
        SUB     $08              ; Wilf's Y - 8 pixels
        LD      B,A              ; this is Wilf's chest or wing
        CALL    LAECE            ; check pixel at X+13,Y-8 (right side, chest/wing)
        AND     $01
        CP      $01              ; is the pixel set?
        JP      Z,LA7F0
        LD      A,$00            ; set no collision to the right
        LD      (LAEEE),A
LA7F0:  LD      A,(L7918+$11)
        LD      C,A
        INC     C
        INC     C                ; X+2 (left side), Y remains Y-8
        CALL    LAECE            ; check pixel at X+2,Y-8 (left side, chest/wing)
        AND     $01
        CP      $01              ; is the pixel set?
        JR      Z,LA804
        LD      A,$00            ; set no collision to the left
        LD      (LAEEF),A
LA804:  LD      A,(L7918+$11)
        ADD     A,$08
        LD      C,A
        LD      A,(L7918+$12)
        INC     A
        LD      B,A
        CALL    LAECE            ; check pixel at X+8,Y+1 (above Wilf, center)
        CP      $00
        JR      NZ,LA81B
        LD      A,$00            ; set no collision above
        LD      (LAEF1),A
LA81B:  LD      A,(L7918+$12)
        SUB     $11
        LD      B,A
        CALL    LAECE            ; check pixel at X+8,Y-17 (under Wilf, center)
        CP      $00
        JR      NZ,LA82D
        LD      A,$00            ; set no collision below
        LD      (LAEF0),A
LA82D:  LD      A,(LAEE6)        ; check game finished flag
        CP      $01
        JP      Z,LAE46          ; go to game finish
        LD      A,(LAEDB)
        CP      $01
        JP      Z,LA55F
        LD      A,(LAEF0)        ; check collision below flag
        CP      $01
        JP      Z,LAA81
;A845
        LD      A,(LAEDE)
        DEC     A                ; Wilf anim phase?
        LD      (LAEDE),A
        CP      $00
        JR      NZ,LA89C

        LD      A,$01
        LD      (LAEDE),A
        LD      A,(L7918+$0E)    ; if Wilf's sprite already
        CP      $89              ; the flying shape
        JR      Z,LA874          ; do nothing
        LD      A,$89            ; else restore Wilf's
        LD      (L7918+$0E),A    ; flying shape (from walking shape)
        LD      A,(L7918+$0D)
        CP      $49              ; 8a08,8a28,8a48: walks right, 8a68,8a88,8aa8: walks left
        JR      C,LA86F
        LD      A,$A8            ; right facing shape
        LD      (L7918+$0D),A
        JR      LA874
LA86F:  LD      A,$48            ; left facing shape
        LD      (L7918+$0D),A
LA874:  LD      A,(L7918+$0D)
        CP      $88              ; 8948,8968,8988: flies right, 89a8,89c8,89e8: flies left
        JP      Z,LA889          ; skip if last right facing phase
        CP      $E8
        JP      Z,LA894          ; skip if last left facing phase
        ADD     A,$20            ; else set next shape
        LD      (L7918+$0D),A
        JP      LA89C
LA889:  LD      A,$48            ; reset to first right facing shape
        LD      (L7918+$0D),A
        CALL    L6D10            ; wing noise
        JP      LA89C
LA894:  LD      A,$A8            ; reset to first left facing shape
        LD      (L7918+$0D),A
        CALL    L6D10            ; wing noise
LA89C:  CALL    LA1B2            ; update sprites anim phases
        CALL    LA238            ; update sprites anim movement
        CALL    LA6EA            ; update sprite position
        CALL    LA8CB            ; control Wilf
        LD      HL,$FFFF
        LD      (L754C),HL
        LD      A,(L752F)
        PUSH    AF
        LD      A,$01            ; only draw Wilf's sprite
        LD      (L752F),A
        CALL    L6D60            ; draw sprite
        POP     AF
        LD      (L752F),A        ; restore real sprite count
        LD      HL,(L754C)
        LD      A,H
        AND     L
        CP      $FF
        CALL    NZ,LAAFA
        JP      LA978
		
LA8CB:  LD      BC,$FEFE         ; key group CS,Z,X,C,V
        IN      A,(C)
        BIT     1,A              ; key Z - go left
        JP      Z,LA988
        BIT     2,A              ; key X - go right
        JP      Z,LA9EE
		
        LD      BC,$7FFE         ; key group B,N,M,SS,SPC
        IN      A,(C)
        BIT     2,A              ; key M - go left
        JP      Z,LA988
        BIT     1,A              ; key SS - go right
        JP      Z,LA9EE
		
        LD      BC,$F7FE         ; key group 1,2,3,4,5
        IN      A,(C)
        BIT     4,A              ; key 5 - go left
        JP      Z,LA988
		
        LD      BC,$FBFE         ; key group Q,W,E,R,T
        IN      A,(C)
        BIT     0,A              ; key Q - go left
        JP      Z,LA988
        BIT     1,A              ; key W - go right
        JP      Z,LA9EE
		
        LD      BC,$EFFE         ; key group 6,7,8,9,0
        IN      A,(C)
        BIT     2,A              ; key 8 - go right
        JP      Z,LA9EE
        BIT     4,A              ; key 6 - go left
        JP      Z,LA988
        BIT     3,A              ; key 7 - go right
        JP      Z,LA9EE

        LD      A,(LAF48)        ; is kempston joystick present?
        CP      $00
        JP      Z,LA92A

        IN      A,($1F)
        BIT     0,A              ; joystick right position?
        JP      NZ,LA9EE
        BIT     1,A              ; joystick left position?
        JP      NZ,LA988

LA92A:  LD      BC,$EFFE         ; key group 6,7,8,9,0
        IN      A,(C)
        BIT     0,A              ; key 0 - fly
        JP      Z,LAA54
		
        LD      BC,$F7FE         ; key group 1,2,3,4,5
        IN      A,(C)
        BIT     0,A              ; key 1 - fly
        JP      Z,LAA54

        LD      A,(LAF48)        ; is kempston joystick present?
        CP      $00
        JP      Z,LA94D
		
	IN      A,($1F)
        BIT     4,A              ; fire button - fly
        JP      NZ,LAA54		

; no key pressed
LA94D:  LD      A,$00
        LD      (LAEF1),A        ; clear collision above Wilf
        LD      A,(LAEF0)        ; check collision below Wilf
        CP      $01
        JP      Z,LA977          ; cannot descend further if something is below Wilf
        LD      A,(L7918+$12)    ; decrement Wilf's
        DEC     A                ; y position
        CP      $40              ; check y equal to lowest position
        JP      NC,LA974
        LD      A,(L6183)        ; Wilf descends into a room underneath
        ADD     A,$04            ; increment room number by 4
        LD      (L6183),A
        LD      A,$AC            ; and Wilf's y position will at
        LD      (L7918+$12),A    ; top of the room (20 pixels from top of the screen)
        POP     DE
        JP      LA55F

LA974:  LD      (L7918+$12),A    ; update y position
LA977:  RET

LA978:  LD      A,(L754E)        ; check collided material
        CP      $01              ; is it deadly?
        JP      Z,LAAA6          ; jump to kill one life
        CP      $02              ; is it an amulet?
        call    z,LABB3          ; jump to pick up the amulet
        JP      LA6D6

; Wilf go left routine
; 8a08,8a28,8a48: walks right, 8a68,8a88,8aa8: walks left
; 8948,8968,8988: flies right, 89a8,89c8,89e8: flies left
LA988:  LD      A,(L7918+$0E)
        CP      $8A              ; Wilf walking shapes?
        JP      Z,LA9A0          ; skip if yes
        LD      A,(L7918+$0D)    ; or else flying shapes
        CP      $A7              ; left or right facing?
        JP      NC,LA9C2         ; skip if left
        LD      A,$A8            ; set first left facing flying shape
        LD      (L7918+$0D),A    ; to turn Wilf left
        JP      LA9C2
LA9A0:  LD      A,(L7918+$0D)    ; walking shapes...
        CP      $47              ; left or right facing?
        JP      NC,LA9AD         ; skip if left
        LD      A,$68            ; set first left facing walking shape
        LD      (L7918+$0D),A    ; to turn Wilf left
LA9AD:  LD      A,(L7918+$0D)
        CP      $A8              ; last shape?
        JP      Z,LA9BD          ; skip if last left facing shape
        ADD     A,$20            ; else set next shape 
        LD      (L7918+$0D),A
        JP      LA9C2
LA9BD:  LD      A,$68            ; reset to first left facing walking shape
        LD      (L7918+$0D),A
LA9C2:  LD      A,$00
        LD      (LAEEE),A        ; clear Wilf's right side collision
        LD      A,(LAEEF)        ; check left side collision
        CP      $01
        JP      Z,LA92A          ; skip if there's an obstacle to the left
        LD      A,(L7918+$11)
        DEC     A                ; decrement Wilf's X position
        CP      $01              ; if X < 1 then switch room
        JP      NC,LA9E8         ; or else skip
        LD      A,(L6183)
        INC     A                ; increment room number
        LD      (L6183),A
        LD      A,$EC            ; Wilf's X position = 236
        LD      (L7918+$11),A
        POP     DE
        JP      LA55F
LA9E8:  LD      (L7918+$11),A    ; update Wilf's X position
        JP      LA92A

; Wilf go right routine
LA9EE:  LD      A,(L7918+$0E)
        CP      $8A              ; Wilf walking shapes?
        JP      Z,LAA06          ; skip if yes
        LD      A,(L7918+$0D)
        CP      $A7              ; left or right facing?
        JP      C,LAA28          ; skip if right
        LD      A,$48            ; set first right facing flying shape
        LD      (L7918+$0D),A    ; to turn Wilf right
        JP      LAA28
LAA06:  LD      A,(L7918+$0D)    ; walking shapes...
        CP      $49              ; left or right facing?
        JP      C,LAA13          ; skip if right
	LD      A,$08            ; set first right facing walking shape
        LD      (L7918+$0D),A    ; to turn Wilf right
LAA13:  LD      A,(L7918+$0D)
        CP      $48              ; last shape?
        JP      Z,LAA23          ; skip if last right facing shape
        ADD     A,$20            ; else set next shape
        LD      (L7918+$0D),A
        JP      LAA28
LAA23:  LD      A,$08            ; reset to first right facing shape
        LD      (L7918+$0D),A
LAA28:  LD      A,$00            ; clear Wilf's left side collision
        LD      (LAEEF),A
        LD      A,(LAEEE)        ; check right side collision
        CP      $01
        JP      Z,LA92A          ; skip if there's an obstacle to the right
        LD      A,(L7918+$11)
        INC     A                ; increment Wilf's X position
        CP      $F0              ; if X >= 240 then switch room
        JP      C,LAA4E          ; or else skip
        LD      A,(L6183)
        DEC     A                ; decrement room number
        LD      (L6183),A
        LD      A,$08            ; Wilf's X position = 8
        LD      (L7918+$11),A
        POP     DE
        JP      LA55F
LAA4E:  LD      (L7918+$11),A
        JP      LA92A

; Wilf fly routine
LAA54:  LD      A,$00
        LD      (LAEF0),A        ; clear Wilf's collision below
        LD      A,(LAEF1)
        CP      $01              ; check collision above
        JP      Z,LA977          ; skip if there's an obstacle above
        LD      A,(L7918+$12)
        INC     A                ; increment Wilf's Y position
        CP      $AE              ; if Y >= 174 then switch room
        JP      C,LAA7B          ; or else skip
        LD      A,(L6183)
        SUB     $04              ; decrement room number by 4
        LD      (L6183),A
        LD      A,$47            ; Wilf's Y position = 71
        LD      (L7918+$12),A
        POP     DE
        JP      LA55F
LAA7B:  LD      (L7918+$12),A
        JP      LA977

LAA81:  LD      A,(L7918+$0E)
        CP      $8A              ; Wilf flying or walking shapes?
        JP      Z,LA89C          ; skip if walking already
        LD      A,$8A            ; set walking shapes
        LD      (L7918+$0E),A
        LD      A,(L7918+$0D)
        CP      $A9              ; left or right facing?
        JP      C,LAA9E          ; skip if right
        LD      A,$68            ; set first left facing walking shape
        LD      (L7918+$0D),A
        JP      LA89C
LAA9E:  LD      A,$08            ; set first right facing walking shape
        LD      (L7918+$0D),A
        JP      LA89C

; Wilf lost a life routine
LAAA6:  LD      A,$02            ; turn on all sprites (seems useless)
        LD      (L7918+$13),A    ; Wilf's sprite
        LD      (L7931+$13),A    ; 2nd sprite
        LD      (L7963+$15),A    ; 3rd sprite, bug: should be 795D (L794A+$13)
        LD      (L7963+$13),A    ; 4th sprite
        LD      (L797C+$13),A    ; 5th sprite
        LD      (L7995+$13),A    ; 6th sprite
        LD      HL,(LAEDC)       ; restore Wilf's last good position
        LD      (L7918+$11),HL   ; to prevent another instant death
		
; Death Sound FX
        LD      B,$01
LAAC2:  LD      HL,$0014
LAAC5:  DEC     HL
        PUSH    HL
        PUSH    BC
        LD      H,$00
        LD      BC,$0064
        CALL    LAC70            ; generate sound fx
        POP     BC
        POP     HL
        LD      A,H
        OR      L
        CP      $00
        JP      NZ,LAAC5
        DJNZ    LAAC2
		
        LD      A,(LAEEA)
        DEC     A		 ; decrement lives ?  ($AADE)
        LD      (LAEEA),A
		
        LD      A,$03            ; update Wilfs (lives)
        LD      (LAEF4),A
        CALL    LAD35            ; call update info panel
		
        LD      A,(LAEEA)        ; no more lives?
        CP      $00
        JP      Z,LA343          ; jump to welcome screen
		
        LD      A,$00
        LD      (L754E),A        ; reset collision material flag
        JP      LA593

; Wilf hits an obstacle, correct X/Y position
LAAFA:  LD      BC,$0028
        LD      HL,$0005
        CALL    LAC70            ; Sound FX
        LD      A,(L7918+$11)
        ADD     A,$08            ; Wilf's X+8
        LD      (LAEF2),A
        LD      A,(L7918+$12)
        SUB     $08              ; Wilf's Y-8
        LD      (LAEF3),A
        LD      A,(L754C)
        LD      B,A
        LD      A,(LAEF2)
        CP      B
        JP      C,LAB42
        LD      A,$01
        LD      (LAEEF),A        ; collision left to Wilf
        LD      A,(L7918+$11)
        INC     A                ; increment Wilf's X position
        LD      (L7918+$11),A
        CP      $F0              ; if Wilf's X >= 240 then switch room
        JP      C,LAB63          ; or else skip
		
        LD      A,(L6183)
        DEC     A                ; decrement room number
        LD      (L6183),A
        LD      A,$08            ; Wilf's X position = 8
        LD      (L7918+$11),A
        POP     DE
        JP      LA55F
		
	JP      LAB63		
		
LAB42:  LD      A,$01
        LD      (LAEEE),A        ; collision right to Wilf
        LD      A,(L7918+$11)
        DEC     A                ; decrement Wilf's X position
        CP      $01              ; if Wilf's X < 1 then switch room
        JP      NC,LAB60
		
        LD      A,(L6183)
        INC     A                ; increment room number
        LD      (L6183),A
        LD      A,$EB            ; Wilf's X position = 235
        LD      (L7918+$11),A
        POP     DE
	JP      LA55F
		
LAB60:  LD      (L7918+$11),A
LAB63:  LD      A,(L754D)
        LD      B,A
        LD      A,(LAEF3)
        CP      B                ; collision position below Y-8?
        JP      C,LAB90
        LD      A,$01
        LD      (LAEF0),A        ; then collision below Wilf
        LD      A,(L7918+$12)
        INC     A                ; increment Wilf's Y position
        LD      (L7918+$12),A
        CP      $AE              ; if Wilf's Y = 174 then switch room
        JP      NZ,LABB2         ; or else skip

        LD      A,(L6183)
        SUB     $04              ; decrement room number by 4
        LD      (L6183),A
        LD      A,$47            ; Wilf's Y position = 71
        LD      (L7918+$12),A
        POP     DE
        JP      LA55F
		
LAB90:  LD      A,$01
        LD      (LAEF1),A        ; else collision above Wilf
        LD      A,(L7918+$12)
        DEC     A                ; decrement Wilf's Y position
        LD      (L7918+$12),A
        CP      $40              ; if Wilf's Y < 64 then switch room
        JP      NC,LABB2
		
        LD      A,(L6183)
        ADD     A,$04            ; increment room number by 4
        LD      (L6183),A
        LD      A,$AC            ; Wilf's Y position = 172
	LD      (L7918+$12),A
        POP     DE
	JP      LA55F

LABB2:  RET     

; Amulet is picked up
LABB3:  LD      A,$00            ; reset collision material flag
        LD      (L754E),A
        LD      A,(LAEE5)        ; all amulets are collected?
        CP      $01
        JP      Z,LACA7          ; set next era if so 
		
        LD      BC,$0032
        LD      HL,$0032
        CALL    LAC70            ; Sound FX
		
        LD      A,(L6183)        ; current room number
        DEC     A
        LD      E,A
        LD      D,$00
        LD      HL,$0004
        CALL    $30A9            ; HL=4*room
        LD      DE,L6208         ; room amulet table
        ADD     HL,DE
        LD      A,(HL)
        LD      B,A
        INC     HL
        LD      A,(HL)
        LD      C,A
        INC     HL
        LD      A,$01
        LD      (HL),A           ; set IsCollected to true
        PUSH    BC
        LD      E,B
        LD      D,$00
        LD      HL,$0020
        CALL    $30A9            ; HL=32*Y
        LD      E,C
        LD      D,$00
        ADD     HL,DE            ; HL=32*Y+X
        LD      DE,$5800
        ADD     HL,DE 
        LD      A,(HL)           ; Amulet's ATTR
        RES     6,A              ; unset bright and flash bits
        RES     7,A              ; to be sure portal amulets also removed
        LD      (HL),A           ; update Amulet's ATTR
        POP     BC
        LD      A,$16
        SUB     B
        LD      B,A
        SLA     B
        SLA     B
        SLA     B
        SLA     C
        SLA     C
        SLA     C
        DEC     B                ; BC = YX pixel position of the amulet
        CALL    $22AA            ; ROM PIXEL-ADD, Output: HL=screen byte addr, A=pixel bit position
        PUSH    HL
        LD      A,$03
        LD      (L7918+$13),A    ; turn off the first sprite
        CALL    L6D60
        POP     HL
		
; erase amulet's graphic
        LD      (HL),$00
        INC     H
        LD      (HL),$00
        INC     H
        LD      (HL),$00
        INC     H
        LD      (HL),$00
        INC     H
        LD      (HL),$00
        INC     H
        LD      (HL),$00
        INC     H
        LD      (HL),$00
        INC     H
        LD      (HL),$00
		
        LD      A,$02            ; turn on the first sprite
        LD      (L7918+$13),A
        CALL    L6D60
		
        LD      A,(LAEE7)
        INC     A                ; increment Wilf's item count
        LD      (LAEE7),A
        LD      A,$01            ; update Items
        LD      (LAEF4),A
        CALL    LAD35            ; call update info panel
		
        LD      A,(LAEE7)        ; check item count
        CP      $0C              ; whether it's a portal amulet
        JP      Z,LAC6A
        CP      $14
        JP      Z,LAC6A
        CP      $1C
        JP      Z,LAC6A
        CP      $28
        JP      Z,LAC6A
        CP      $30
        JP      Z,LAC6A
        CP      $3E
        JP      Z,LAC6A
        RET     

LAC6A:  LD      A,$01
        LD      (LAEE5),A        ; set all amulets are collected in one era
        RET     

; Sound FX - frequency ramp up (exponentially) to 14.3 kHz, BC=starting frequency 1/(BC*13.71+56.57us)
; note: param in HL is not used despite given everywhere
LAC70:  PUSH    HL
        PUSH    BC
LAC72:  LD      A,($5C48)        ; read BORDCR variable
        RR      A
        RES     7,A
        RR      A
        RES     7,A
        RR      A
        RES     7,A
        SET     4,A
        POP     HL
        PUSH    HL
        OUT     ($FE),A          ; set speaker and border color
        LD      B,A
LAC88:  DEC     HL
        LD      A,L
        OR      H
        JP      NZ,LAC88
        LD      A,B
        RES     4,A
        POP     HL
        PUSH    HL
        OUT     ($FE),A
        LD      B,A
LAC96:  DEC     HL
        LD      A,L
        OR      H
        JP      NZ,LAC96
        POP     BC
        DEC     BC
        PUSH    BC
        LD      A,C
        OR      B
        JP      NZ,LAC72
        POP     BC
        POP     HL
        RET     

; set next era
LACA7:  LD      A,(L6183)        ; room number
        LD      B,$0D            ; 2nd era's start screen is room #13
        LD      HL,$042A         ; 2nd era's year = 1066
        CP      $03              ; 1st era's flashing amulet in room #3
        JP      Z,LACE2
        LD      B,$15            ; 3rd era's start screen is room #21
        LD      HL,$05BB         ; 3rd era's year = 1467
        CP      $14              ; 2nd era's flashing amulet in room #20
        JP      Z,LACE2
        LD      B,$1F            ; 4th era's start screen is room #31
        LD      HL,$06F8         ; 4th era's year = 1784
        CP      $18              ; 3rd era's flashing amulet in room #24
        JP      Z,LACE2
        LD      B,$2D            ; 5th era's start screen is room #45
        LD      HL,$07C0         ; 5th era's year = 1984
        CP      $24              ; 4th era's flashing amulet in room #36
        JP      Z,LACE2
        LD      B,$35            ; 6th era's start screen is room #53
        LD      HL,$07D1         ; 6th era's year = 2001
        CP      $2F              ; 5th era's flashing amulet in room #47
        JP      Z,LACE2
        LD      A,$01
        LD      (LAEE6),A        ; set game finished to true
        RET     

LACE2:  PUSH    BC
        LD      A,$00
        LD      (LAEEB),A        ; time is not BC 1000000
        LD      (LAEE8),HL       ; store year
        LD      A,$02            ; update Time
        LD      (LAEF4),A
        CALL    LAD35            ; call update info panel
        LD      A,$01
        LD      (LAEDB),A
        POP     BC
        LD      A,B
        LD      (L6183),A        ; store room number
        LD      B,$A0
        LD      C,$C8
        LD      (L7918+$11),BC   ; first sprite's (Wilf) X/Y coord

; generate sound and border effect when teleporting to new era
        LD      B,$04
LAD07:  LD      HL,$0007
LAD0A:  DEC     HL
        PUSH    HL
        PUSH    BC
        LD      H,$00
        LD      BC,$0082
        CALL    LAC70            ; sound fx and set border color
        POP     BC
        POP     HL
        LD      A,H
        OR      L
        CP      $00
        JP      NZ,LAD0A
        LD      A,B
        AND     $07
        SLA     A
        SLA     A
        SLA     A
        LD      ($5C48),A        ; BORDCR (00bbbxxx where b=border color)
        DJNZ    LAD07
        LD      A,$00
        LD      ($5C48),A        ; set black border
        POP     DE
        JP      LA55A

; updating info on bottom panel (lives, time, items)
LAD35:  LD      A,($5C91)        ; P_FLAG
        RES     0,A              ; reset OVER 1 mode
        LD      ($5C91),A
        LD      A,$16            ; PRINT AT 18,3;
        RST     $10
        LD      A,$12
        RST     $10
        LD      A,$03
        RST     $10
        
        LD      A,($5C8D)        ; read ATTR_P
        LD      ($5C8F),A        ; and store in ATTR_T
        
        LD      A,(LAEF4)
        CP      $01
        JP      Z,LAD5F          ; update Items on info panel
        CP      $02
        JP      Z,LAD92          ; update Time on info panel
        CP      $03
        JP      Z,LADFE          ; update Wilfs (lives) on info panel
        RET

; Update Items (stars) collected
LAD5F:  LD      HL,L733C-$100    ; Set CHARS to 
        LD      ($5C36),HL       ; Info panel bitmap
        LD      A,$24            ; Put "Items" text
        RST     $10
        LD      A,$25
        RST     $10
        LD      A,$26
        RST     $10
        LD      A,$27
        RST     $10
        LD      A,$28
        RST     $10
        LD      A,$29
        RST     $10
        LD      A,$56            ; empty char
        RST     $10
        LD      A,(LAEE7)        ; get Items count
        LD      C,A
        LD      B,$00
        LD      HL,$3C00
        LD      ($5C36),HL       ; restore CHARS to ROM
        LD      A,$16            ; paper red, ink yellow
        LD      ($5C8F),A        ; ATTR_T
        CALL    $1A1B            ; ROM OUT-NUM-1
        LD      A,$20
        RST     $10
        RET     

; Update Time on info panel
LAD92:  LD      A,$16            ; PRINT AT 20,3;
        RST     $10
        LD      A,$14
        RST     $10
        LD      A,$03
        RST     $10
        LD      HL,L733C-$100    ; Info panel bitmap
        LD      ($5C36),HL       ; Set CHARS
        LD      A,$2C            ; "Time" text
        RST     $10
        LD      A,$2D
        RST     $10
        LD      A,$27
        RST     $10
        LD      A,$2E
        RST     $10
        LD      A,$2F
        RST     $10
        LD      A,$56            ; empty char
        RST     $10
        LD      A,$14            ; red paper, green ink
        LD      ($5C8F),A
        LD      A,(LAEEB)
        CP      $01
        JP      NZ,LADCC
        LD      A,$39            ; "BC" text
        RST     $10
        LD      A,$3A
        RST     $10
        LD      A,$3B
        RST     $10
        JP      LADD5

LADCC:  LD      A,$36            ; "AC" text
        RST     $10
        LD      A,$37
        RST     $10
        LD      A,$38
        RST     $10

LADD5:  LD      BC,(LAEE8)	 ; actual time zone's year
        LD      HL,$3C00
        LD      ($5C36),HL       ; restore CHARS to ROM
        CALL    $1A1B		 ; ROM OUT-NUM-1  (to print out the year)
        LD      A,(LAEEB)
        CP      $01
        JP      Z,LADF4

; erase zeros with spaces
; because BC 1000000 is 3 chars longer than any other year
        LD      A,$20
        RST     $10
        LD      A,$20
        RST     $10
        LD      A,$20
        RST     $10
        RET

; BC 1000000 stored as 1000
; this routine will fake the remaining three zeros
LADF4:  LD      A,$30
        RST     $10
        LD      A,$30
        RST     $10
        LD      A,$30
        RST     $10
        RET     

; Update Wilfs (lives) on info panel
LADFE:  LD      A,$16            ; PRINT AT 16,3;
        RST     $10
        LD      A,$10
        RST     $10
        LD      A,$03
        RST     $10
        LD      HL,L733C-$100    ; Info panel bitmap
        LD      ($5C36),HL       ; Set CHARS
        LD      A,$30            ; "Wilfs" text
        RST     $10
        LD      A,$31
        RST     $10
        LD      A,$32
        RST     $10
        LD      A,$33
        RST     $10
        LD      A,$34
        RST     $10
        LD      A,$35
        RST     $10
        LD      A,$56            ; empty char
        RST     $10
        LD      A,(LAEEA)        ; life counter
        CP      $00
        JP      Z,LAE38
        LD      B,A
        LD      A,$15            ; red paper, cyan ink
        LD      ($5C8F),A        ; ATTR_T
LAE30:  LD      A,$56            ; empty char
        RST     $10
        LD      A,$55            ; draw Wilf's life bitmaps
        RST     $10
        DJNZ    LAE30
LAE38:  LD      H,$3C
        LD      L,$00
        LD      ($5C36),HL       ; restore CHARS to ROM
        LD      A,$20
        RST     $10
        LD      A,$20
        RST     $10
        RET     

; game finished
LAE46:  LD      A,(LAF49)        ; test for cheating
        CP      $00
        JP      Z,LA343          ; jump to welcome screen immediately when cheating
                                 ; no congratulations!
        EI      
        LD      HL,$3C00
        LD      ($5C36),HL       ; CHARS = $3C00 (ROM's default)
        LD      A,$08
        LD      ($5C48),A        ; BORDCR = blue border
        LD      A,$07
        LD      ($5C8F),A        ; ATTR_T
        LD      ($5C8D),A        ; ATTR_P = black paper, white ink
        CALL    $0DAF            ; ROM CL-ALL (clears display)
		
        LD      HL,L762A         ; congratulations text start
        LD      DE,L778E         ; congratulations text end

        LD      A,$16		 ; PRINT AT 0,0;
        RST     $10
        LD      A,$00
        RST     $10
        LD      A,$00
        RST     $10

; writing out the congratulations text		
LAE74:  LD      A,(HL)
        INC     HL
        RST     $10              ; ROM PRINT-A (print character)
        PUSH    BC
        LD      B,$FF
LAE7A:  DJNZ    LAE7A            ; small delay
        POP     BC
        LD      A,H
        CP      D
        JP      NZ,LAE74
        LD      A,L
        CP      E
        JP      NZ,LAE74
		
        LD      A,$00
        LD      DE,LAEFB         ; print PRESS ANY KEY message
        LD      BC,$0064
        CALL    $0C0A            ; ROM PO-MSG
		
LAE92:  IN      A,($FE)          ; waits for any key
        AND     $1F
        CP      $1F
        JP      NZ,LAE92
		
LAE9B:  LD      A,$08
        LD      ($5C48),A        ; BORDCR = blue border
        IN      A,($FE)          ; waits for key release
        AND     $0F
        CP      $0F
        JP      Z,LAE9B
        JP      LA2F0            ; jump back to the very start

; get attribute position in HL
; input pixel position b=y, c=x
LAEAC:  SRL     C                ; c=c/8
        SRL     C
        SRL     C
        SRL     B                ; b=b/8
        SRL     B
        SRL     B
        LD      A,$15
        SUB     B
        LD      B,A              ; b=21-b
        LD      E,B
        LD      D,$00
        LD      HL,$0020
        CALL    $30A9            ; HL=HL*DE  HL=32*B
        LD      DE,$5800         ; DE=attributes area
        ADD     HL,DE
        LD      D,$00
        LD      E,C
        ADD     HL,DE            ; HL=attr position
        RET     

; check given pixel by BC, and return in A bit 0.
LAECE:  PUSH    BC               ; input: b=y, c=x position
        CALL    $22AA            ; rom PIXEL-ADD, out: hl=screen byte addr, a=pixel bit position
        LD      B,A
        INC     B
        LD      A,(HL)           ; read screen byte
LAED5:  RLCA                     ; and rotate the given pixel left
        DJNZ    LAED5            ; into bit 0. in A reg.
        POP     BC
        RET     

LAEDA:  db      $00              ; flag whether to draw moving lines
LAEDB:  db      $00
LAEDC:  dw      $00
LAEDE:  db      $00
        db      $00              ; unused
        db      $00              ; unused
LAEE1:  db      $00              ; sprite count
LAEE2:  db      $00              ; temp
LAEE3:  dw      $00              ; sprite workspace pointer
LAEE5:  db      $00              ; all amulets collected in one era? (0-no, 1-yes)
LAEE6:  db      $00              ; game finished? (0-no, 1-yes)
LAEE7:  db      $00              ; collected items count
LAEE8:  dw      $0000            ; year
LAEEA:  db      $00              ; number of lives
LAEEB:  db      $00              ; era is BC 1000000 (0-no, 1-yes)
LAEEC:  dw      $0000            ; set but unused
LAEEE:  db      $00              ; collision right to Wilf
LAEEF:  db      $00              ; collision left to Wilf
LAEF0:  db      $00              ; collision below Wilf
LAEF1:  db      $00              ; collision above Wilf
LAEF2:  db      $00              ; temp
LAEF3:  db      $00              ; temp
LAEF4:  db      $00              ; input param for LAD35 (update info panel)
LAEF5:  dw      $00              ; temp ptr for sprite workspace#2 used by LA6EA
LAEF7:  dw      $00              ; temp ptr for sprite X position data used by LA6EA
LAEF9:  dw      $00              ; welcome sound fx table pointer (but flawed)

; PRESS ANY KEY message text, 19 bytes
LAEFB   DEFB    $80
        DEFB    $16, $10, $0A    ; PRINT AT 16,10;
LAEFF:	DEFM    "PRESS ANY KEY"
	DEFB    ' '+$80

; ELITE logo, 56 bytes
LAF0E:  DEFB    $11,$02          ; paper red
        DEFB    $10,$06          ; ink yellow
        DEFB    $16,$12,$14      ; at 18,20
        DEFB    $3c,$3d,$3e,$3f,$40,$41,$42,$3c,$3d,$43
        DEFB    $16,$13,$14      ; at 19,20
        DEFB    $45,$46,$47,$48,$49,$4a,$4b,$45,$46,$43
        DEFB    $16,$14,$14      ; at 20,20
        DEFB    $4e,$4f,$50,$51,$52,$53,$54,$4e,$4f,$43
	DEFB    ' '+$80
		
        DEFB    $16,$10,$00      ; at 16,0
        DEFB    $22
        DEFB    $16,$10,$1F      ; at 16,31
        DEFB    $23
        DEFB    $16,$15,$00      ; at 21,0
        DEFB    $2A
        DEFB    ' '+$80

; 2 bytes unused
LAF46:  ds      2,0
        
LAF48:  db      $00              ; kempston joystick present (0=not present, 1=present)
LAF49:  db      $00              ; no cheat? (0=cheat, 1=no cheat)

; 74 bytes unused
LAF4A:  ds      74, 0

; Room data, 14442 bytes
;LAF94:  INCBIN "kokotoni_room.bin"
LAF94:  INCLUDE "kokotoni_rooms.asm"

; Graphics blocks, 4704 bytes
;LE7FE:  INCBIN "kokotoni_bitmaps.bin"
LE7FE:  INCLUDE "kokotoni_bitmaps.asm"

; 5 bytes unused	
LFA5E:  ds      5, 0
		
LFA63:  db      $00  ; not loaded from tape
		
; welcome screen animation
; drawing increasing-decreasing lines
LFA64:  LD      A,(LFCC7)
        CP      $01
        JP      Z,LFBCF          ; code version #1 (default code)
        CP      $02
        JP      Z,LFB41          ; code version #2
        CP      $03
        JP      Z,LFBAE          ; code version #3
		
LFA76:  LD      A,(LFCBC)        ; line #1 initialized? (0-no, 1-yes)
        CP      $01
        JP      Z,LFA8C          ; skip if lines are initialized
        LD      A,$01
        LD      (LFCBD),A        ; pixel counter set to 1
        LD      (LFCBC),A        ; set line #1 to initialized
        LD      HL,(LFCBE)       ; copy line #1 start X/Y coords
        LD      (LFCC0),HL
		
LFA8C:  LD      BC,(LFCC0)
        CALL    LFB20            ; draw line #1 first pixel
        LD      BC,(LFCC0)
LFA97:  INC     B                ; or   inc c -- self modifying code  $FA97 $04 = INC B, $0C = INC C
        CALL    LFB20            ; draw line #1 second pixel
        LD      BC,(LFCC4)
        CALL    LFB20            ; draw line #2 first pixel
        LD      BC,(LFCC4)
LFAA6:  INC     B                ; or   inc c -- self modifying code  $FAA6 $04 = INC B, $0C = INC C
        CALL    LFB20            ; draw line #2 second pixel
        LD      A,(LFCC2)        ; increasing (0) or decreasing (1)
        CP      $01
        JP      Z,LFAC3
LFAB2:  LD      A,(LFCC0)        ; or   fcc1h -- self modifying code
        INC     A
LFAB6:  LD      (LFCC0),A        ; or   fcc1h -- self modifying code
LFAB9:  LD      A,(LFCC4)        ; or   fcc5h -- self modifying code
LFABC:  DEC     A                ; or   inc a -- self modifying code  $FABC $3D = DEC A, $3C = INC A
LFABD:  LD      (LFCC4),A        ; or   fcc5h -- self modifying code
        JP      LFAD1
LFAC3:  LD      A,(LFCC0)        ; or   fcc1h -- self modifying code
        DEC     A
LFAC7:  LD      (LFCC0),A        ; or   fcc1h -- self modifying code
LFACA:  LD      A,(LFCC4)        ; or   fcc5h -- self modifying code
LFACD:  INC     A                ; or   dec a -- self modifying code  $FACD $3D = DEC A, $3C = INC A
LFACE:  LD      (LFCC4),A        ; or   fcc5h -- self modifying code
LFAD1:  LD      A,(LFCBD)        ; line pixel counter
        INC     A
        LD      (LFCBD),A
        LD      B,A
        LD      A,(LFCC3)        ; reaching the limit?
        CP      B
        JP      Z,LFAE4          ; yes, skip
        LD      BC,$0000
        RET     

LFAE4:  LD      A,(LFCC2)        ; increasing (0) or decreasing (1)
        CP      $01
        JP      Z,LFAF4          ; skip if decreasing
        LD      A,$01
        LD      (LFCC2),A        ; switch to decreasing
        JP      LFAF9

LFAF4:  LD      A,$00            ; switch to increasing
        LD      (LFCC2),A

LFAF9:  LD      A,$01            ; reset pixel counter
        LD      (LFCBD),A
        LD      BC,(LFCC0)
        CALL    LFB20            ; draw line #1 first pixel
        LD      BC,(LFCC0)
LFB09:  INC     B                ; or   inc c -- self modifying code  $FB09 $04 = INC B, $0C = INC C
        CALL    LFB20            ; draw line #1 second pixel
        LD      BC,(LFCC4)
        CALL    LFB20            ; draw line #2 first pixel
        LD      BC,(LFCC4)
LFB18:  INC     B                ; or   inc c -- self modifying code  $FB18 $04 = INC B, $0C = INC C
        CALL    LFB20            ; draw line #2 second pixel
        LD      BC,$0000
        RET     

LFB20:  nop     
        LD      A,(LFCC6)        ; swap X/Y (0-no, 1-yes)?
        CP      $01
        JP      NZ,LFB2C
        LD      D,b              ; swap b/c
        LD      B,c
        LD      C,d
LFB2C:  LD      A,(LFFF2)        ; get moving lines attribute
        LD      ($5C8F),A        ; put it into ATTR_T
        LD      A,($5C91)        ; P_FLAG
        SET     0,A              ; set OVER 1 mode means toggle pixels
        LD      ($5C91),A
        CALL    $22E5            ; ROM PLOT-SUB
        LD      BC,$0000
        RET     

; code modified to version #2
LFB41:  LD      HL,LFA97
        LD      (HL),$0C         ; inc c
        LD      HL,LFAA6
        LD      (HL),$0C         ; inc c
        LD      HL,LFB09
        LD      (HL),$0C         ; inc c
        LD      HL,LFB18
        LD      (HL),$0C         ; inc c
        LD      HL,LFABC
        LD      (HL),$3D         ; dec a
        LD      HL,LFACD
        LD      (HL),$3C         ; inc a
	
; operands modified to FCC1 (line #1 Y coord)
LFB5F:  LD      DE,LFCC1

; operands modified to FCC0 (line #1 X coord)
LFB62:  LD      HL,LFAB2
        INC     HL
        LD      (HL),E
        INC     HL
        LD      (HL),D
        LD      HL,LFAB6
        INC     HL
        LD      (HL),E
        INC     HL
        LD      (HL),D
        LD      HL,LFAC3
        INC     HL
        LD      (HL),E
        INC     HL
        LD      (HL),D
        LD      HL,LFAC7
        INC     HL
        LD      (HL),E
        INC     HL
        LD      (HL),D

        LD      A,(LFCC7)
        CP      $01              ; horizontal ($01) or vertical ($03)
        JP      NZ,LFB8C         ; skip if vertical

        LD      DE,LFCC4         ; line #2 X coord
        JP      LFB8F
		
; operands modified to FCC5
LFB8C:  LD      DE,LFCC5         ; line #2 Y coord

; operands modified to FCC4
LFB8F:  LD      HL,LFAB9
        INC     HL
        LD      (HL),E
        INC     HL
        LD      (HL),D
        LD      HL,LFABD
        INC     HL
        LD      (HL),E
        INC     HL
        LD      (HL),D
        LD      HL,LFACA
        INC     HL
        LD      (HL),E
        INC     HL
        LD      (HL),D
        LD      HL,LFACE
        INC     HL
        LD      (HL),E
        INC     HL
        LD      (HL),D
        JP      LFA76            ; code modification finished, resume ...
		
; code modified to version #3
LFBAE:  LD      HL,LFABC
        LD      (HL),$3C         ; inc a
        LD      HL,LFACD
        LD      (HL),$3D         ; dec a
        LD      HL,LFA97
        LD      (HL),$0C         ; inc c
        LD      HL,LFAA6
        LD      (HL),$0C         ; inc c
        LD      HL,LFB09
        LD      (HL),$0C         ; inc c
        LD      HL,LFB18
        LD      (HL),$0C         ; inc c
        JP      LFB5F
		
; code modified to version #1 (default)
LFBCF:  LD      HL,LFABC
        LD      (HL),$3D         ; dec a
        LD      HL,LFACD
        LD      (HL),$3C         ; inc a
        LD      HL,LFA97
        LD      (HL),$04         ; inc b
        LD      HL,LFAA6
        LD      (HL),$04         ; inc b
        LD      HL,LFB09
        LD      (HL),$04         ; inc b
        LD      HL,LFB18
        LD      (HL),$04         ; inc b
        LD      DE,LFCC0
        JP      LFB62
		
;     |  v1   |  v2   |  v3
;-----+-------+-------+------
;FA97 | inc b | inc c | inc c   ; line #1 X(c) or Y(b) doubling
;-----+-------+-------+------
;FAA6 | inc b | inc c | inc c   ; line #2 X(c) or Y(b) doubling
;-----+-------+-------+------
;FB09 | inc b | inc c | inc c   ; line #1 X(c) or Y(b) doubling
;-----+-------+-------+------
;FB18 | inc b | inc c | inc c   ; line #2 X(c) or Y(b) doubling
;-----+-------+-------+------
;FABC | dec a | dec a | inc a   ; line #2 increasing
;-----+-------+-------+------
;FACD | inc a | inc a | dec a   ; line #2 decreasing

                
; 201 unused bytes
LFBF3:  ds      201, 0

LFCBC:  db      $00              ; lines initialized? (0-no, 1-yes)
LFCBD:  db      $0D              ; pixel counter
LFCBE:  db      $32              ; line #1 X start
LFCBF:  db      $7F              ; line #1 Y start
LFCC0:  db      $3E              ; line #1 X coord
LFCC1:  db      $7F              ; line #1 Y coord
LFCC2:  db      $00              ; increasing (0) or decreasing (1)
LFCC3:  db      $35              ; line pixel limit
LFCC4:  db      $CA              ; line #2 X coord
LFCC5:  db      $75              ; line #2 Y coord
LFCC6:  db      $00              ; swap X/Y (0-no, 1-yes) but not used (always 0)
LFCC7:  db      $01              ; Vertical parallel ($03) or Horizontal facing ($01) or Vertical facing ($02) lines ($02 is not used)

; 810 bytes unused
LFCC8:  ds      810, 0

LFFF2:  db      $0E              ; moving lines attribute

; 12 unused bytes
LFFF3:  ds      12, 0

LFFFF:  db      $00              ; not loaded from tape

        END
; Save compiled binary as SNA snapshot file
; Use the modified sjasmplus.exe because of the third SP parameter
        SAVESNA "kokotoni.sna", LA0F0, $5E22
