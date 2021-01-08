L93A8:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0000      ; cloud graphics
        db      $64              ; anim phase time

L93AE:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0020      ; dino's head phase #1
        db      $03              ; anim phase time
        dw      L7D00+$0040      ; dino's head phase #2
        db      $02              ; anim phase time
        dw      L7D00+$0060      ; dino's head phase #3
        db      $02              ; anim phase time
        dw      L7D00+$0040      ; dino's head phase #2
        db      $03              ; anim phase time

L93BD:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0080      ; dino's tail phase #1
        db      $01              ; anim phase time
        dw      L7D00+$00A0      ; dino's tail phase #2
        db      $01              ; anim phase time
        dw      L7D00+$00C0      ; dino's tail phase #3
        db      $01              ; anim phase time
        dw      L7D00+$00A0      ; dino's tail phase #2
        db      $01              ; anim phase time

L93CC:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$00E0      ; pterodactyl phase #1
        db      $01              ; anim phase time
        dw      L7D00+$0100      ; pterodactyl phase #2
        db      $01              ; anim phase time
        dw      L7D00+$0140      ; pterodactyl phase #3
        db      $01              ; anim phase time
        dw      L7D00+$0100      ; pterodactyl phase #2
        db      $01              ; anim phase time

L93DB:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0160      ; small dino right phase #1
        db      $01              ; anim phase time
        dw      L7D00+$0170      ; small dino right phase #2
        db      $01              ; anim phase time

L93E4:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0180      ; small dino turns left phase #1
        db      $01              ; anim phase time
        dw      L7D00+$0190      ; small dino turns left phase #2
        db      $01              ; anim phase time

L93ED:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$01A0      ; small dino left phase #1
        db      $01              ; anim phase time
        dw      L7D00+$01B0      ; small dino left phase #2
        db      $01              ; anim phase time

L93F6:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$01C0      ; small dino turns right phase #1
        db      $0A              ; anim phase time
        dw      L7D00+$01D0      ; small dino turns right phase #2
        db      $0A              ; anim phase time

L93FF:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$01E0      ; bat phase #1
        db      $01              ; anim phase time
        dw      L7D00+$0210      ; bat phase #2
        db      $01              ; anim phase time
        dw      L7D00+$0230      ; bat phase #3
        db      $01              ; anim phase time
        dw      L7D00+$0210      ; bat phase #2
        db      $01              ; anim phase time

L940E:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0200      ; bat
        db      $0A              ; anim phase time

L9414:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0250      ; fire phase #1
        db      $01              ; anim phase time
        dw      L7D00+$0270      ; fire phase #2
        db      $01              ; anim phase time

L941D:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0290      ; carnivorous plant phase #1
        db      $14              ; anim phase time
        dw      L7D00+$02B0      ; carnivorous plant phase #2
        db      $0A              ; anim phase time

L9426:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$02D0      ; bird phase #1
        db      $01              ; anim phase time
        dw      L7D00+$02E0      ; bird phase #2
        db      $01              ; anim phase time

L942F:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$02F0      ; shark right
        db      $0A              ; anim phase time

L9435:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0308      ; shark turns left phase #1
        db      $01              ; anim phase time
        dw      L7D00+$0320      ; shark turns left phase #1
        db      $01              ; anim phase time

L943E:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0338      ; shark left
        db      $0A              ; anim phase time

L9444:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0350      ; shark turns right phase #1
        db      $01              ; anim phase time
        dw      L7D00+$0368      ; shark turns right phase #2
        db      $01              ; anim phase time

L944D:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0380      ; octopus phase #1
        db      $01              ; anim phase time
        dw      L7D00+$03A0      ; octopus phase #1
        db      $01              ; anim phase time

L9456:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$03C0      ; tyrannosaurus left phase #1
        db      $0A              ; anim phase time
        dw      L7D00+$03E0      ; tyrannosaurus left phase #2
        db      $0A              ; anim phase time
        dw      L7D00+$0400      ; tyrannosaurus left phase #3
        db      $0A              ; anim phase time
        dw      L7D00+$03E0      ; tyrannosaurus left phase #2
        db      $0A              ; anim phase time

L9465:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0420      ; wheel phase #1
        db      $01              ; anim phase time
        dw      L7D00+$0440      ; wheel phase #2
        db      $01              ; anim phase time

L946E:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0460
        db      $0A              ; anim phase time

L9474:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0468
        db      $0A              ; anim phase time

L947A:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0470
        db      $0A              ; anim phase time

L9480:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$04B8
        db      $0A              ; anim phase time

L9486:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$04C8      ; woodsman phase #1
        db      $01              ; anim phase time
        dw      L7D00+$04E8      ; woodsman phase #2
        db      $01              ; anim phase time
        dw      L7D00+$0508      ; woodsman phase #3
        db      $01              ; anim phase time
        dw      L7D00+$04E8      ; woodsman phase #2
        db      $01              ; anim phase time

L9495:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0528      ; snake left phase #1
        db      $01              ; anim phase time
        dw      L7D00+$0538      ; snake left phase #2
        db      $01              ; anim phase time

L949E:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0548      ; snake right phase #1
        db      $01              ; anim phase time
        dw      L7D00+$0558      ; snake right phase #2
        db      $01              ; anim phase time

L94A7:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0568      ; monk right
        db      $FF              ; anim phase time

L94AD:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0588      ; monk turns left phase #1
        db      $01              ; anim phase time
        dw      L7D00+$05A8      ; monk turns left phase #2
        db      $01              ; anim phase time
        dw      L7D00+$05E8      ; monk turns left phase #3
        db      $01              ; anim phase time

L94B9:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$05C8      ; monk left
        db      $FF              ; anim phase time

L94BF:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$05E8      ; monk turns right phase #1
        db      $01              ; anim phase time
        dw      L7D00+$05A8      ; monk turns right phase #2
        db      $01              ; anim phase time
        dw      L7D00+$0588      ; monk turns right phase #3
        db      $01              ; anim phase time

L94CB:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0608      ; book phase #1
        db      $01              ; anim phase time
        dw      L7D00+$0628      ; book phase #2
        db      $01              ; anim phase time

L94D4:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0668      ; mice left
        db      $0A              ; anim phase time

L94DA:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0678      ; mice right
        db      $0A              ; anim phase time

L94E0:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0698      ; flag phase #1
        db      $01              ; anim phase time
        dw      L7D00+$06B8      ; flag phase #2
        db      $01              ; anim phase time
        dw      L7D00+$06D8      ; flag phase #3
        db      $01              ; anim phase time
        dw      L7D00+$06B8      ; flag phase #2
        db      $01              ; anim phase time

L94EF:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0788      ; statue phase #1
        db      $03              ; anim phase time
        dw      L7D00+$0798      ; statue phase #2
        db      $03              ; anim phase time
        dw      L7D00+$07A8      ; statue phase #3
        db      $03              ; anim phase time
        dw      L7D00+$0798      ; statue phase #2
        db      $03              ; anim phase time

L94FE:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$07B8
        db      $02              ; anim phase time
        dw      L7D00+$07C8
        db      $02              ; anim phase time
        dw      L7D00+$07D8
        db      $02              ; anim phase time
        dw      L7D00+$07C8
        db      $02              ; anim phase time

L950D:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$07E8
        db      $02              ; anim phase time
        dw      L7D00+$07F8
        db      $02              ; anim phase time
        dw      L7D00+$0808
        db      $02              ; anim phase time
        dw      L7D00+$07F8
        db      $02              ; anim phase time

L951C:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0818      ; airplane right
        db      $05              ; anim phase time

L9522:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0828      ; airplane left
        db      $05              ; anim phase time

L9528:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0838      ; helicopter right phase #1
        db      $01              ; anim phase time
        dw      L7D00+$0858      ; helicopter right phase #2
        db      $01              ; anim phase time
        dw      L7D00+$0878      ; helicopter right phase #3
        db      $01              ; anim phase time
        dw      L7D00+$0858      ; helicopter right phase #2
        db      $01              ; anim phase time

L9537:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0898      ; helicopter left phase #1
        db      $01              ; anim phase time
        dw      L7D00+$08B8      ; helicopter left phase #2
        db      $01              ; anim phase time
        dw      L7D00+$08D8      ; helicopter left phase #3
        db      $01              ; anim phase time
        dw      L7D00+$08B8      ; helicopter left phase #2
        db      $01              ; anim phase time

L9546:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$08F8      ; willy right phase #1
        db      $01              ; anim phase time
        dw      L7D00+$0918      ; willy right phase #2
        db      $01              ; anim phase time
L954F:  dw      L7D00+$0938      ; willy right phase #3
        db      $01              ; anim phase time
        dw      L7D00+$0918      ; willy right phase #2
        db      $01              ; anim phase time

L9555:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0958      ; willy left phase #1
        db      $01              ; anim phase time
        dw      L7D00+$0978      ; willy left phase #2
        db      $01              ; anim phase time
        dw      L7D00+$0998      ; willy left phase #3
        db      $01              ; anim phase time
        dw      L7D00+$0978      ; willy left phase #2
        db      $01              ; anim phase time

L9564:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$09B8      ; rhombus phase #1
        db      $01              ; anim phase time
        dw      L7D00+$09D8      ; rhombus phase #2
        db      $01              ; anim phase time
        dw      L7D00+$09F8      ; rhombus phase #3
        db      $01              ; anim phase time
        dw      L7D00+$09D8      ; rhombus phase #2
        db      $01              ; anim phase time

L9573:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0A78      ; spaceship right
        db      $05              ; anim phase time

L9579:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0A98      ; hover bike left
        db      $05              ; anim phase time

L957F:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0AB8      ; radar phase #1
        db      $01              ; anim phase time
        dw      L7D00+$0B18      ; radar phase #2
        db      $01              ; anim phase time
        dw      L7D00+$0AD8      ; radar phase #3
        db      $01              ; anim phase time
        dw      L7D00+$0AF8      ; radar phase #4
        db      $01              ; anim phase time

L958E:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0B38
        db      $01              ; anim phase time
        dw      L7D00+$0B68
        db      $01              ; anim phase time
        dw      L7D00+$0B38
        db      $01              ; anim phase time
        dw      L7D00+$0B98
        db      $01              ; anim phase time

L959D:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0BC8
        db      $03              ; anim phase time
        dw      L7D00+$0BE8
        db      $03              ; anim phase time
        dw      L7D00+$0C08
        db      $03              ; anim phase time
        dw      L7D00+$0C28
        db      $03              ; anim phase time

L95AC:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$02D0
        db      $02              ; anim phase time

L95B2:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0290      ; carnivorous plant phase #1
        db      $0C              ; anim phase time
        dw      L7D00+$02B0      ; carnivorous plant phase #2
        db      $04              ; anim phase time

L95BB:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$02B0      ; carnivorous plant phase #1
        db      $8C              ; anim phase time

L95C1:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0DC8
        db      $64              ; anim phase time

L95C7:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0230      ; bat phase #3
        db      $64              ; anim phase time

L95CD:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0290
        db      $8C              ; anim phase time

L95D3:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$00E0
        db      $64              ; anim phase time

L95D9:  db      $00, $00, $00    ; trailing zeros for previous structure

L95DC:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0478      ; archer phase #1
        db      $FF              ; anim phase time

L95E2:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0498      ; archer phase #2
        db      $FF              ; anim phase time

L95E8:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$04C0
        db      $01              ; anim phase time

L95EE:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$04C8
        db      $01              ; anim phase time

L95F4:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0648
        db      $FF              ; anim phase time

L95FA:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0380
        db      $02              ; anim phase time

L9600:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$06F6      ; sailor phase #1
        db      $01              ; anim phase time
        dw      L7D00+$0726      ; sailor phase #2
        db      $01              ; anim phase time
        dw      L7D00+$0756      ; sailor phase #3
        db      $01              ; anim phase time

L960C:  db      $00, $00, $00    ; trailing zeros for previous structure
        dw      L7D00+$0758
        db      $C8              ; anim phase time
L9612:  dw      L7D00+$0000
        db      $00              ; anim phase time
        dw      L7D00+$0A18
        db      $C8              ; anim phase time
L9618:  dw      L7D00+$0000
        db      $00              ; anim phase time
        dw      L7D00+$0A38      ; ufo
        db      $C8              ; anim phase time
L961E:  dw      L7D00+$0000
        db      $00              ; anim phase time
        dw      L7D00+$0A58      ; spaceship left
        db      $C8              ; anim phase time
