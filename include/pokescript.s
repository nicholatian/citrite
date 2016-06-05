@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@                                                                           @@
@@   ########## ####### ######### ##########  ####### ######### ##########   @@
@@   ###    ###   ###   #  ###  # ###     ###   ###   #  ###  # ###    ###   @@
@@   ###          ###      ###    ###     ###   ###      ###    ###          @@
@@   ###          ###      ###    #########     ###      ###    #######      @@
@@   ###          ###      ###    ###   ###     ###      ###    ###          @@
@@   ###    ###   ###      ###    ###    ###    ###      ###    ###    ###   @@
@@   ########## #######    ###    ###     ### #######    ###    ##########   @@
@@                                                                           @@
@@                          Pokémon Citrite Version                          @@
@@                              OFFICIAL Source                              @@
@@                                                                           @@
@@                  Copyright © 2014-2016 Alexander Nicholi                  @@
@@                            All rights reserved                            @@
@@                                                                           @@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.ifndef __pokescript_asm__
.equ __pokescript_asm__, 1

.macro s_nop
1:
    .byte 0x00
.endm

.macro s_nop_
1:
    .byte 0x01
.endm

.macro s_end
1:
    .byte 0x02
.endm

.macro s_return
1:
    .byte 0x03
.endm

.macro s_call pointer
1:
    .byte 0x04
    .word \pointer
.endm

.macro s_jump pointer
1:
    .byte 0x05
    .word \pointer
.endm

.macro s_if cond, action, sub
1:
    .ifeqs "\action", "jump"
    .byte 0x06
    .else
    .ifeqs "\action", "call"
    .byte 0x07
    .else
    .ifeqs "\action", "jumpstd"
    .byte 0x0A
    .else
    .ifeqs "\action", "callstd"
    .byte 0x0B
    .else
    .ifeqs "\action", "vjumpstd"
    .byte 0xBB
    .else
    .ifeqs "\action", "vcallstd"
    .byte 0xBC
    .endif
    .endif
    .endif
    .endif
    .endif
    .endif
    
    .byte \cond
    .ifeqs "\action", "jumpstd"
    .byte \sub
    .else
    .ifeqs "\action", "callstd"
    .byte \sub
    .else
    .ifeqs "\action", "vjumpstd"
    .byte \sub
    .else
    .ifeqs "\action", "vcallstd"
    .byte \sub
    .else
    .word \sub
    .endif
    .endif
    .endif
    .endif
.endm

.macro s_jumpstd func
1:
    .byte 0x08
    .byte \func
.endm

.macro s_callstd func
1:
    .byte 0x09
    .byte \func
.endm

.macro s_jumpram
1:
    .byte 0x0C
.endm

.macro s_killscript
1:
    .byte 0x0D
.endm

.macro s_setbyte val
1:
    .byte 0x0E
    .byte \val
.endm

.macro s_loadptr bank, pointer
1:
    .byte 0x0F
    .byte \bank
    .word \pointer
.endm

.macro s_setbytebank bank, val
1:
    .byte 0x10
    .byte \bank
    .byte \val
.endm

.macro s_writeptrbyte val, pointer
1:
    .byte 0x11
    .byte \val
    .word \pointer
.endm

.macro s_loadptrbyte bank, pointer
1:
    .byte 0x12
    .byte \bank
    .word \pointer
.endm

.macro s_writebankbyte bank, pointer
1:
    .byte 0x13
    .byte \bank
    .word \pointer
.endm

.macro s_copybank dest, src
1:
    .byte 0x14
    .byte \dest
    .byte \src
.endm

.macro s_copybyte dest, src
1:
    .byte 0x15
    .word \dest
    .word \src
.endm

.macro s_setvar var, value
1:
    .byte 0x16
    .hword \var
    .hword \value
.endm

.macro s_addvar var, value
1:
    .byte 0x17
    .hword \var
    .hword \value
.endm

.macro s_subvar var, value
1:
    .byte 0x18
    .hword \var
    .hword \value
.endm

.macro s_copyvar dest, src
1:
    .byte 0x19
    .hword \dest
    .hword \src
.endm

.macro s_setorcopyvar dest, srcval
1:
    .byte 0x1A
    .hword \dest
    .hword \srcval
.endm

.macro s_comparebanks bank_a, bank_b
1:
    .byte 0x1B
    .byte \bank_a
    .byte \bank_b
.endm

.macro s_comparebankbyte bank, val
1:
    .byte 0x1C
    .byte \bank
    .byte \val
.endm

.macro s_comparebankptrbyte bank, pointer
1:
    .byte 0x1D
    .byte \bank
    .word \pointer
.endm

.macro s_compareptrbytebank pointer, bank
1:
    .byte 0x1E
    .word \pointer
    .byte \bank
.endm

.macro s_compareptrbytebyte pointer, value
1:
    .byte 0x1F
    .word \pointer
    .byte \value
.endm

.macro s_compareptrbytes pointer_a, pointer_b
1:
    .byte 0x20
    .word \pointer_a
    .word \pointer_b
.endm

.macro s_comparevar var, value
1:
    .byte 0x21
    .hword \var
    .byte \value
.endm

.macro s_comparevars var_a, var_b
1:
    .byte 0x22
    .hword \var_a
    .hword \var_b
.endm

.macro s_callasm pointer
1:
    .byte 0x23
    .word \pointer
.endm

.macro s_jumpasm pointer
1:
    .byte 0x24
    .word \pointer
.endm

.macro s_special event
1:
    .byte 0x25
    .hword \event
.endm

.macro s_specialval event, var
1:
    .byte 0x26
    .hword \var
    .hword \event
.endm

.macro s_waitstate
1:
    .byte 0x27
.endm

.macro s_pause delay
1:
    .byte 0x28
    .hword \delay
.endm

.macro s_setflag flag
1:
    .byte 0x29
    .hword \flag
.endm

.macro s_clearflag flag
1:
    .byte 0x2A
    .hword \flag
.endm

.macro s_checkflag flag
1:
    .byte 0x2B
    .hword \flag
.endm

.macro s_compareflags flag_a, flag_b
1:
    .byte 0x2C
    .hword \flag_a
    .hword \flag_b
.endm

.macro s_checkdailyflags
1:
    .byte 0x2D
.endm

.macro s_resetvars
1:
    .byte 0x2E
.endm

.macro s_playsfx sound
1:
    .byte 0x2F
    .hword \sound
.endm

.macro s_waitsfx
1:
    .byte 0x30
.endm

.macro s_fanfare sound
1:
    .byte 0x31
    .hword \sound
.endm

.macro s_waitfanfare
1:
    .byte 0x32
.endm

.macro s_playsong song, continue_after_battle
1:
    .byte 0x33
    .hword \song
    .byte \continue_after_battle
.endm

.macro s_playsong_ song
1:
    .byte 0x34
    .hword \song
.endm

.macro s_fadedefault
1:
    .byte 0x35
.endm

.macro s_fadesong song
1:
    .byte 0x36
    .hword \song
.endm

.macro s_fadeout speed
1:
    .byte 0x37
    .byte \speed
.endm

.macro s_fadein speed
1:
    .byte 0x38
    .byte \speed
.endm

.macro s_warp banknum, mapnum, warpnum, x_pos, y_pos
1:
    .byte 0x39
    .byte \banknum
    .byte \mapnum
    .byte \warpnum
    .hword \x_pos
    .hword \y_pos
.endm

.macro s_warpmuted banknum, mapnum, warpnum, x_pos, y_pos
1:
    .byte 0x3A
    .byte \banknum
    .byte \mapnum
    .byte \warpnum
    .hword \x_pos
    .hword \y_pos
.endm

.macro s_warpwalk banknum, mapnum, warpnum, x_pos, y_pos
1:
    .byte 0x3B
    .byte \banknum
    .byte \mapnum
    .byte \warpnum
    .hword \x_pos
    .hword \y_pos
.endm

.macro s_warphole banknum, mapnum
1:
    .byte 0x3C
    .byte \banknum
    .byte \mapnum
.endm

.macro s_warpteleport banknum, mapnum, warpnum, x_pos, y_pos
1:
    .byte 0x3D
    .byte \banknum
    .byte \mapnum
    .byte \warpnum
    .hword \x_pos
    .hword \y_pos
.endm

.macro s_setwarpplace banknum, mapnum, warpnum, x_pos, y_pos
1:
    .byte 0x3F
    .byte \banknum
    .byte \mapnum
    .byte \warpnum
    .hword \x_pos
    .hword \y_pos
.endm

.macro s_getplayerxy var_x, var_y
1:
    .byte 0x42
    .hword \var_x
    .hword \var_y
.endm

.macro s_countpokemon
1:
    .byte 0x43
.endm

.macro s_additem itemnum, quantity
1:
    .byte 0x44
    .hword \itemnum
    .hword \quantity
.endm

.macro s_removeitem itemnum, quantity
1:
    .byte 0x45
    .hword \itemnum
    .hword \quantity
.endm

.macro s_checkitemroom itemnum, quantity
1:
    .byte 0x46
    .hword \itemnum
    .hword \quantity
.endm

.macro s_checkitem itemnum, quantity
1:
    .byte 0x47
    .hword \itemnum
    .hword \quantity
.endm

.macro s_checkitemtype itemnum
1:
    .byte 0x48
    .hword \itemnum
.endm

.macro s_addpcitem itemnum, quantity
1:
    .byte 0x49
    .hword itemnum
    .hword \quantity
.endm

.macro s_checkpcitem itemnum, quantity
1:
    .byte 0x4A
    .hword itemnum
    .hword \quantity
.endm

.macro s_adddecor decornum
1:
    .byte 0x4B
    .hword \decornum
.endm

.macro s_removedecor decornum
1:
    .byte 0x4C
    .hword \decornum
.endm

.macro s_checkdecorroom decornum
1:
    .byte 0x4D
    .hword \decornum
.endm

.macro s_checkdecor decornum
1:
    .byte 0x4E
    .hword \decornum
.endm

.macro s_move pid, movement
1:
    .byte 0x4F
    .hword \pid
    .word \movement
.endm

.macro s_movevar pidvar, movement
1:
    .byte 0x50
    .hword \pidvar
    .word \movement
.endm

.macro s_waitmove pid
1:
    .byte 0x51
    .hword \pid
.endm

.macro s_waitmovevar pidvar
1:
    .byte 0x52
    .hword \pidvar
.endm

.macro s_disappear pid
1:
    .byte 0x53
    .hword \pid
.endm

.macro s_disappearvar pidvar
1:
    .byte 0x54
    .hword \pidvar
.endm

.macro s_reappear pid
1:
    .byte 0x55
    .hword \pid
.endm

.macro s_reappearvar pidvar
1:
    .byte 0x56
    .hword \pidvar
.endm

.macro s_movesprite pid, x_pos, y_pos
1:
    .byte 0x57
    .hword \pid
    .hword \x_pos
    .hword \y_pos
.endm

.macro s_faceplayer
1:
    .byte 0x5A
.endm

.macro s_spriteface pid, direction
1:
    .byte 0x5B
    .hword \pid
    .byte \direction
.endm

.macro s_tbattle type, tid, filler, intro, defeat, extra_a, extra_b
1:
    .byte 0x5C
    .byte \type
    .hword \tid
    .hword \filler
    .word \intro
    .word \defeat
    .word \extra_a
    .word \extra_b
.endm

.macro s_checktflag flag
1:
    .byte 0x60
    .hword \flag
.endm

.macro s_settflag flag
1:
    .byte 0x61
    .hword \flag
.endm

.macro s_cleartflag flag
1:
    .byte 0x62
    .hword \flag
.endm

.macro s_movespriteperm pid, x_pos, y_pos
1:
    .byte 0x63
    .hword \pid
    .hword \x_pos
    .hword \y_pos
.endm

.macro s_moveoffscreen pid
1:
    .byte 0x64
    .hword \pid
.endm

.macro s_spritebehave pid, behaviour
1:
    .byte 0x65
    .hword \pid
    .hword \behaviour
.endm

.macro s_showmsg
1:
    .byte 0x66
.endm

.macro s_message pointer
1:
    .byte 0x67
    .word \pointer
.endm

.macro s_closebutton
1:
    .byte 0x68
.endm

.macro s_lockall
1:
    .byte 0x69
.endm

.macro s_lock
1:
    .byte 0x6A
.endm

.macro s_releaseall
1:
    .byte 0x6B
.endm

.macro s_release
1:
    .byte 0x6C
.endm

.macro s_waitbutton
1:
    .byte 0x6D
.endm

.macro s_yesnobox x_pos, y_pos
1:
    .byte 0x6E
    .byte \x_pos
    .byte \y_pos
.endm

.macro s_multichoice x_pos, y_pos, list, disallow_b
1:
    .byte 0x6F
    .byte \x_pos
    .byte \y_pos
    .byte \list
    .byte \disallow_b
.endm

.macro s_multichoicedef x_pos, y_pos, list, default, disallow_b
1:
    .byte 0x70
    .byte \x_pos
    .byte \y_pos
    .byte \list
    .byte \default
    .byte \disallow_b
.endm

.macro s_multichoicerow x_pos, y_pos, list, per_row, disallow_b
1:
    .byte 0x71
    .byte \x_pos
    .byte \y_pos
    .byte \list
    .byte \per_row
    .byte \disallow_b
.endm

.macro s_showbox x_pos, y_pos, width, height
1:
    .byte 0x72
    .byte \x_pos
    .byte \y_pos
    .byte \width
    .byte \height
.endm

.macro s_hidebox x_pos, y_pos, width, height
1:
    .byte 0x73
    .byte \x_pos
    .byte \y_pos
    .byte \width
    .byte \height
.endm

.macro s_clearbox x_pos, y_pos, width, height
1:
    .byte 0x74
    .byte \x_pos
    .byte \y_pos
    .byte \width
    .byte \height
.endm

.macro s_showpokepic pokemon, x_pos, y_pos
1:
    .byte 0x75
    .hword \pokemon
    .byte \x_pos
    .byte \y_pos
.endm

.macro s_hidepokepic
1:
    .byte 0x76
.endm

.macro s_showcontestwinner contest
1:
    .byte 0x77
    .byte \contest
.endm

.macro s_braille text
1:
    .byte 0x78
.endm

.macro s_givepoke species, level, item, unk, unk_, unk__
1:
    .byte 0x79
    .hword \species
    .byte \level
    .hword \item
    .word \unk
    .word \unk_
    .byte \unk__
.endm

.macro s_giveegg species
1:
    .byte 0x7A
    .hword \species
.endm

.macro s_setattack partyslot, attackslot, attackid
1:
    .byte 0x7B
    .byte \partyslot
    .byte \attackslot
    .hword \attackid
.endm

.macro s_checkattack attackid
1:
    .byte 0x7C
    .hword \attackid
.endm

.macro s_bufferpoke buffer, species
1:
    .byte 0x7D
    .byte \buffer
    .hword \species
.endm

.macro s_bufferfirstpoke buffer @ does not use nicknames
1:
    .byte 0x7E
    .byte \buffer
.endm

.macro s_bufferpartypoke buffer, slot @ uses nicknames
1:
    .byte 0x7F
    .byte \buffer
    .hword \slot
.endm

.macro s_bufferitem buffer, itemid
1:
    .byte 0x80
    .byte \buffer
    .hword \itemid
.endm

.macro s_bufferdecor buffer, decorid
1:
    .byte 0x81
    .byte \buffer
    .hword \decorid
.endm

.macro s_bufferattack buffer, attackid
1:
    .byte 0x82
    .byte \buffer
    .hword \attackid
.endm

.macro s_buffernumber buffer, var
1:
    .byte 0x83
    .byte \buffer
    .hword \var
.endm

.macro s_buffertext buffer, pointer
1:
    .byte 0x85
    .byte \buffer
    .word \pointer
.endm

.macro s_pokemart products
1:
    .byte 0x86
    .word \products
.endm

.macro s_pokemartdecor products
1:
    .byte 0x87
    .word \products
.endm

.macro s_pokemartbp products
1:
    .byte 0x88
    .word \products
.endm

.macro s_casino var
1:
    .byte 0x89
    .hword \var
.endm

.macro s_choosecontestpoke
1:
    .byte 0x8B
.endm

.macro s_startcontest
1:
    .byte 0x8C
.endm

.macro s_showcontestresults
1:
    .byte 0x8D
.endm

.macro s_contestlink
1:
    .byte 0x8E
.endm

.macro s_random range @ number created will always be < range
1:
    .byte 0x8F
    .hword \range
.endm

.macro s_givemoney amount, null
1:
    .byte 0x90
    .dword \amount
    .byte \null
.endm

.macro s_paymoney amount, null
1:
    .byte 0x91
    .dword \amount
    .byte \null
.endm

.macro s_checkmoney amount, null
1:
    .byte 0x92
    .dword \amount
    .byte \null
.endm

.macro s_showmoney x_pos, y_pos
1:
    .byte 0x93
    .byte \x_pos
    .byte \y_pos
.endm

.macro s_hidemoney x_pos, y_pos
1:
    .byte 0x94
    .byte \x_pos
    .byte \y_pos
.endm

.macro s_updatemoney x_pos, y_pos
1:
    .byte 0x95
    .byte \x_pos
    .byte \y_pos
.endm

.macro s_fadescreen effect
1:
    .byte 0x97
    .byte \effect
.endm

.macro s_darken intensity
1:
    .byte 0x99
    .byte \intensity
.endm

.macro s_lighten intensity
1:
    .byte 0x9A
    .byte \intensity
.endm

.macro s_doanimation anim
1:
    .byte 0x9C
    .hword \anim
.endm

.macro s_setanimation anim, slot
1:
    .byte 0x9D
    .hword \anim
    .hword \slot
.endm

.macro s_waitanimation anim
1:
    .byte 0x9E
    .hword \anim
.endm

.macro s_sethealplace id
1:
    .byte 0x9F
    .hword \id
.endm

.macro s_checkgender
1:
    .byte 0xA0
.endm

.macro s_cry species, effect
1:
    .byte 0xA1
    .hword \species
    .hword \effect
.endm

.macro s_setmaptile x_pos, y_pos, tilenum, attrib
1:
    .byte 0xA2
    .hword \x_pos
    .hword \y_pos
    .hword \tilenum
    .hword \attrib
.endm

.macro s_resetweather
1:
    .byte 0xA3
.endm

.macro s_setweather weather
1:
    .byte 0xA4
    .hword \weather
.endm

.macro s_doweather
1:
    .byte 0xA5
.endm

.macro s_incrementnpcheight pid, bank, map, unk
1:
    .byte 0xA8
    .hword \pid
    .byte \bank
    .byte \map
    .byte \unk
.endm

.macro s_restorenpcheight pid, bank, map
1:
    .byte 0xA9
    .hword \pid
    .byte \bank
    .byte \map
.endm

.macro s_createnpc sprite, vpid, x_pos, y_pos, behave, facing
1:
    .byte 0xAA
    .byte \sprite
    .byte \vpid
    .hword \x_pos
    .hword \y_pos
    .byte \behave
    .byte \facing
.endm

.macro s_vspriteface vpid, facing
1:
    .byte 0xAB
    .byte \vpid
    .byte \facing
.endm

.macro s_setdooropened x_pos, y_pos
1:
    .byte 0xAC
    .hword \x_pos
    .hword \y_pos
.endm

.macro s_setdoorclosed x_pos, y_pos
1:
    .byte 0xAD
    .hword \x_pos
    .hword \y_pos
.endm

.macro s_doorchange
1:
    .byte 0xAE
.endm

.macro s_setdooropened_ x_pos, y_pos
1:
    .byte 0xAF
    .hword \x_pos
    .hword \y_pos
.endm

.macro s_setdoorclosed_ x_pos, y_pos
1:
    .byte 0xB0
    .hword \x_pos
    .hword \y_pos
.endm

.macro s_checkcoins var
1:
    .byte 0xB3
    .hword \var
.endm

.macro s_givecoins amount
1:
    .byte 0xB4
    .hword \amount
.endm

.macro s_paycoins amount
1:
    .byte 0xB5
    .hword \amount
.endm

.macro s_setwbattle species, level, item
1:
    .byte 0xB6
    .hword \species
    .byte \level
    .hword \item
.endm

.macro s_dowbattle
1:
    .byte 0xB7
.endm

.macro s_vsetaddr pointer
1:
    .byte 0xB8
    .word \pointer
.endm

.macro s_vjump pointer
1:
    .byte 0xB9
    .word \pointer
.endm

.macro s_vcall pointer
1:
    .byte 0xBA
.endm

.macro s_vloadptr pointer
1:
    .byte 0xBD
    .word \pointer
.endm

.macro s_vloadptr_ pointer
1:
    .byte 0xBE
    .word \pointer
.endm

.macro s_vbuffertext buffer, pointer
1:
    .byte 0xBF
    .byte \buffer
    .word \pointer
.endm

.macro s_showcoins x_pos, y_pos
1:
    .byte 0xC0
    .byte \x_pos
    .byte \y_pos
.endm

.macro s_hidecoins x_pos, y_pos
1:
    .byte 0xC1
    .byte \x_pos
    .byte \y_pos
.endm

.macro s_updatecoins x_pos, y_pos
1:
    .byte 0xC2
    .byte \x_pos
    .byte \y_pos
.endm

.macro s_incrementhvar hvar
1:
    .byte 0xC3
    .byte \hvar
.endm

.macro s_waitcry
1:
    .byte 0xC5
.endm

.macro s_bufferboxname buffer, boxid
1:
    .byte 0xC6
    .byte \buffer
    .hword \boxid
.endm

.macro s_signmsg
1:
    .byte 0xCA
.endm

.macro s_normalmsg
1:
    .byte 0xCB
.endm

.macro s_comparehvar hvar, value
1:
    .byte 0xCC
    .byte \hvar
    .word \value
.endm

.macro s_makeobedient slot
1:
    .byte 0xCD
    .hword \slot
.endm

.macro s_setworldmapflag flag
1:
    .byte 0xD0
    .hword \flag
.endm

.macro s_setcatchlocation slot, nameid
1:
    .byte 0xD2
    .hword \slot
    .byte \nameid
.endm

.macro s_braillecursor text
1:
    .byte 0xD3
    .word \text
.endm

.macro s_bufferitemsfr buffer, item, quantity
1:
    .byte 0xD4
    .byte \buffer
    .hword \item
    .hword \quantity
.endm

.macro s_fadescreenem type
1:
    .byte 0xDC
    .byte \type
.endm

.macro s_buffertclass buffer, tclass
1:
    .byte 0xDD
    .byte \buffer
    .hword \tclass
.endm

.macro s_buffertname buffer, tid
1:
    .byte 0xDE
    .byte \buffer
    .hword \tid
.endm

.macro s_pokenavcall text
1:
    .byte 0xDF
    .word \text
.endm

.macro s_buffercontesttype buffer, type
1:
    .byte 0xE1
    .byte \buffer
    .hword \type
.endm

.macro s_bufferitemsem buffer, itemid, quantity
1:
    .byte 0xE2
    .byte \buffer
    .hword \itemid
    .hword \quantity
.endm

.endif
