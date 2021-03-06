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

.ifndef __GF_DEFS_S__
.equ __GF_DEFS_S__, 1

@ Defines segment
@ Holds preprocessor definitions for the assembly.

@ .segment DEFINES

@ General defines
.equ TRUE, 0x1
.equ FALSE, 0x0

@ Sound effects
.equ EXCL_BEEP, 0x15
.equ OBTAINED_BADGE, 0x163
.equ LEVELED_UP, 0x16F
.equ POKEMON_HEALED, 0x170
.equ OBTAINED_ITEM, 0x172
.equ POKEMON_CAUGHT, 0x173
.equ OBTAINED_TMHM, 0x174
.equ OBTAINED_BERRY, 0x183
.equ REGISTERED_TRAINER, 0x1CC
.equ FRONTIER_BADGE, 0x1D2

@ Specials
.equ SETMAPTILE, 0x91

.equ QUAKE_X, 0x8004
.equ QUAKE_Y, 0x8005
.equ QUAKE_TOTALTIME, 0x8006
.equ QUAKE_SHAKETIME, 0x8007
.equ EARTHQUAKE, 0x138

@ Script superflags
.equ F_RAINCTRL_E, 0x4C0
.equ F_RAINCTRL_W, 0x4C1
.equ F_THUNCTRL_E, 0x4C2
.equ F_THUNCTRL_W, 0x4C3
.equ F_DSRTSSTORM, 0x4C4

@ Script common vars
.equ NULLVAR, 0x4050 @ Ensure this is always set to, 0!
.equ STORY_A, 0x4051

@ Subroutine-specific
.equ CANARYBATTLE_ZIGZAGOON, 0x3
.equ CANARYBATTLE_TRAINER, 0x2

@ Supplemental
.equ EM_RUNNINGSHOES, 0x8C0

@ Map assembly specific
.equ _MAP_MUSIC_DEBUG, 0x22E
.equ _MAP_MUSIC_INSIDE, 0x17E
.equ _MAP_MUSIC_GROUNDZERO, 0x1B6
.equ _MAP_MUSIC_CANARYMEADOWS, 0x221

.equ _MAP_BORDER_FAILSAFE, 0x8FB0000
.equ _MAP_DATA_FAILSAFE, 0x8FB0008
.equ _MAP_BORDER_DEBUG, 0x8FB00AC
.equ _MAP_DATA_DEBUG, 0x8FB00B4
.equ _MAP_BORDER_GROUNDZERO, 0x8FB0278
.equ _MAP_DATA_GROUNDZERO, 0x8FB0280
.equ _MAP_BORDER_CANARYMEADOWS, 0x8FB2800
.equ _MAP_DATA_CANARYMEADOWS, 0x8FB2808
.equ _MAP_BORDER_TRYONHILLTOPS, 0x8FB3D20
.equ _MAP_DATA_TRYONHILLTOPS, 0x8FB3D28
.equ _MAP_DATA_GROUNDZERO0, 0x8FB4438
.equ _MAP_BORDER_GROUNDZERO0, 0x8FB4430
.equ _MAP_DATA_GROUNDZERO1, 0x8FB4500
.equ _MAP_BORDER_GROUNDZERO1, 0x8FB5524
.equ _MAP_DATA_GROUNDZERO2, 0x8FB45C8
.equ _MAP_BORDER_GROUNDZERO2, 0x8FB552C
.equ _MAP_DATA_GROUNDZERO3, 0x8FB4690
.equ _MAP_BORDER_GROUNDZERO3, 0x8FB5534
.equ _MAP_DATA_CANARYMEADOWS0, 0x8FB47A0
.equ _MAP_BORDER_CANARYMEADOWS0, 0x8FB4430
.equ _MAP_BORDER_AMALTHEAJUNGLE, 0x8FB489C
.equ _MAP_DATA_AMALTHEAJUNGLE, 0x8FB48A4

.equ _MAP_TILESET_IMG_OUTDOORS, 0x08F94B60
.equ _MAP_TILESET_PAL_OUTDOORS, 0x08F8B800
.equ _MAP_BLOCKSET_DATA_OUTDOORS, 0x08F8BB60
.equ _MAP_BEHAVEBG_DATA_OUTDOORS, 0x08F8DB60
.equ _MAP_ANIMATION_ASM_OUTDOORS, 0x080A0B21

.equ _MAP_TILESET_IMG_INDOORS, 0x08FA0B60
.equ _MAP_TILESET_PAL_INDOORS, 0x8F8B9A0 @0x0940BA80
.equ _MAP_BLOCKSET_DATA_INDOORS, 0x08F92760
.equ _MAP_BEHAVEBG_DATA_INDOORS, 0x08FA4760
.equ _MAP_ANIMATION_ASM_INDOORS, 0x00000000

.equ _MAP_TILESET_IMG_PCMARTGARBAGE, 0x8F9CB60
.equ _MAP_TILESET_PAL_PCMARTGARBAGE, 0x8F8B9A0
.equ _MAP_BLOCKSET_DATA_PCMARTGARBAGE, 0x8F90360
.equ _MAP_BEHAVEBG_DATA_PCMARTGARBAGE, 0x8F92360
.equ _MAP_ANIMATION_ASM_PCMARTGARBAGE, 0x80A0B49

.equ _MAP_TILESET_IMG_GROUNDZERO, 0x8F98B60
.equ _MAP_TILESET_PAL_GROUNDZERO, 0x8F8B800 @0x940B8C0
.equ _MAP_BLOCKSET_DATA_GROUNDZERO, 0x8F8DF60
.equ _MAP_BEHAVEBG_DATA_GROUNDZERO, 0x8F8FF60
.equ _MAP_ANIMATION_ASM_GROUNDZERO, 0x00000000

.equ _MAP_TILESET_IMG_POKELAB, 0x8FA4D00
.equ _MAP_TILESET_PAL_POKELAB, 0x8FA4C20 @0x9424C20
.equ _MAP_BLOCKSET_DATA_POKELAB, 0x8FA8D00
.equ _MAP_BEHAVEBG_DATA_POKELAB, 0x8FAAD00
.equ _MAP_ANIMATION_ASM_POKELAB, 0x00000000



@ imported from PKSV

.equ LASTRESULT, 0x800D
.equ LASTTALKED, 0x800F
.equ PLAYERFACING, 0x800C

.equ PLAYER, 0xFF
.equ CAMERA, 0x7F

.equ MSG_POKENAV, 0xA
.equ MSG_NORMAL, 0x6
.equ MSG_YESNO, 0x5
.equ MSG_NOCLOSE, 0x4
.equ MSG_SIGN, 0x3
.equ MSG_STANDARD, 0x2
.equ MSG_FIND, 0x1
.equ MSG_OBTAIN, 0x0

.equ _lt, 0
.equ _eq, 1
.equ _gt, 2
.equ _le, 3
.equ _ge, 4
.equ _ne, 5

.equ FR_BADGE_1, 0x820
.equ FR_BADGE_2, 0x821
.equ FR_BADGE_3, 0x822
.equ FR_BADGE_4, 0x823
.equ FR_BADGE_5, 0x824
.equ FR_BADGE_6, 0x825
.equ FR_BADGE_7, 0x826
.equ FR_BADGE_8, 0x827
.equ RS_BADGE_1, 0x807
.equ RS_BADGE_2, 0x808
.equ RS_BADGE_3, 0x809
.equ RS_BADGE_4, 0x80A
.equ RS_BADGE_5, 0x80B
.equ RS_BADGE_6, 0x80C
.equ RS_BADGE_7, 0x80D
.equ RS_BADGE_8, 0x80E
.equ EM_BADGE_1, 0x867
.equ EM_BADGE_2, 0x868
.equ EM_BADGE_3, 0x869
.equ EM_BADGE_4, 0x86A
.equ EM_BADGE_5, 0x86B
.equ EM_BADGE_6, 0x86C
.equ EM_BADGE_7, 0x86D
.equ EM_BADGE_8, 0x86E
.equ RS_POKEMON, 0x800
.equ RS_POKEDEX, 0x801
.equ RS_POKENAV, 0x802
.equ EM_POKEMON, 0x860
.equ EM_POKEDEX, 0x861
.equ EM_POKENAV, 0x862
.equ FR_POKEMON, 0x828
.equ FR_POKEDEX, 0x829
.equ RUNNING_SHOES, 0x82F

.equ BOY, 0
.equ GIRL, 1
.equ NO, 0
.equ YES, 1
.equ true, YES
.equ false, NO

.equ HEAL_POKEMON, 0
.equ CHOOSE_POKEMON, 0x9C
.equ CATCH_POKEMON, 0x9D
.equ FR_NATIONAL_DEX, 0x16F
.equ EM_NATIONAL_DEX, 0x1F3
.equ FR_CAMERA_START, 0x113
.equ FR_CAMERA_END, 0x114
.equ EM_CAMERA_START, 0x116
.equ EM_CAMERA_END, 0x117

.equ DOWN, 1
.equ UP, 2
.equ LEFT, 3
.equ RIGHT, 4

.equ MISSINGNO, 0
.equ BULBASAUR, 1
.equ IVYSAUR, 2
.equ VENUSAUR, 3
.equ CHARMANDER, 4
.equ CHARMELEON, 5
.equ CHARIZARD, 6
.equ SQUIRTLE, 7
.equ WARTORTLE, 8
.equ BLASTOISE, 9
.equ CATERPIE, 10
.equ METAPOD, 11
.equ BUTTERFREE, 12
.equ WEEDLE, 13
.equ KAKUNA, 14
.equ BEEDRILL, 15
.equ PIDGEY, 16
.equ PIDGEOTTO, 17
.equ PIDGEOT, 18
.equ RATTATA, 19
.equ RATICATE, 20
.equ SPEAROW, 21
.equ FEAROW, 22
.equ EKANS, 23
.equ ARBOK, 24
.equ PIKACHU, 25
.equ RAICHU, 26
.equ SANDSHREW, 27
.equ SANDSLASH, 28
.equ NIDORANF, 29
.equ NIDORINA, 30
.equ NIDOQUEEN, 31
.equ NIDORANM, 32
.equ NIDORINO, 33
.equ NIDOKING, 34
.equ CLEFAIRY, 35
.equ CLEFABLE, 36
.equ VULPIX, 37
.equ NINETALES, 38
.equ JIGGLYPUFF, 39
.equ WIGGLYTUFF, 40
.equ ZUBAT, 41
.equ GOLBAT, 42
.equ ODDISH, 43
.equ GLOOM, 44
.equ VILEPLUME, 45
.equ PARAS, 46
.equ PARASECT, 47
.equ VENONAT, 48
.equ VENOMOTH, 49
.equ DIGLETT, 50
.equ DUGTRIO, 51
.equ MEOWTH, 52
.equ PERSIAN, 53
.equ PSYDUCK, 54
.equ GOLDUCK, 55
.equ MANKEY, 56
.equ PRIMEAPE, 57
.equ GROWLITHE, 58
.equ ARCANINE, 59
.equ POLIWAG, 60
.equ POLIWHIRL, 61
.equ POLIWRATH, 62
.equ ABRA, 63
.equ KADABRA, 64
.equ ALAKAZAM, 65
.equ MACHOP, 66
.equ MACHOKE, 67
.equ MACHAMP, 68
.equ BELLSPROUT, 69
.equ WEEPINBELL, 70
.equ VICTREEBEL, 71
.equ TENTACOOL, 72
.equ TENTACRUEL, 73
.equ GEODUDE, 74
.equ GRAVELER, 75
.equ GOLEM, 76
.equ PONYTA, 77
.equ RAPIDASH, 78
.equ SLOWPOKE, 79
.equ SLOWBRO, 80
.equ MAGNEMITE, 81
.equ MAGNETON, 82
.equ FARFETCHD, 83
.equ DODUO, 84
.equ DODRIO, 85
.equ SEEL, 86
.equ DEWGONG, 87
.equ GRIMER, 88
.equ MUK, 89
.equ SHELLDER, 90
.equ CLOYSTER, 91
.equ GASTLY, 92
.equ HAUNTER, 93
.equ GENGAR, 94
.equ ONIX, 95
.equ DROWZEE, 96
.equ HYPNO, 97
.equ KRABBY, 98
.equ KINGLER, 99
.equ VOLTORB, 100
.equ ELECTRODE, 101
.equ EXEGGCUTE, 102
.equ EXEGGUTOR, 103
.equ CUBONE, 104
.equ MAROWAK, 105
.equ HITMONLEE, 106
.equ HITMONCHAN, 107
.equ LICKITUNG, 108
.equ KOFFING, 109
.equ WEEZING, 110
.equ RHYHORN, 111
.equ RHYDON, 112
.equ CHANSEY, 113
.equ TANGELA, 114
.equ KANGASKHAN, 115
.equ HORSEA, 116
.equ SEADRA, 117
.equ GOLDEEN, 118
.equ SEAKING, 119
.equ STARYU, 120
.equ STARMIE, 121
.equ MRMIME, 122
.equ SCYTHER, 123
.equ JYNX, 124
.equ ELECTABUZZ, 125
.equ MAGMAR, 126
.equ PINSIR, 127
.equ TAUROS, 128
.equ MAGIKARP, 129
.equ GYARADOS, 130
.equ LAPRAS, 131
.equ DITTO, 132
.equ EEVEE, 133
.equ VAPOREON, 134
.equ JOLTEON, 135
.equ FLAREON, 136
.equ PORYGON, 137
.equ OMANYTE, 138
.equ OMASTAR, 139
.equ KABUTO, 140
.equ KABUTOPS, 141
.equ AERODACTYL, 142
.equ SNORLAX, 143
.equ ARTICUNO, 144
.equ ZAPDOS, 145
.equ MOLTRES, 146
.equ DRATINI, 147
.equ DRAGONAIR, 148
.equ DRAGONITE, 149
.equ MEWTWO, 150
.equ MEW, 151
.equ CHIKORITA, 152
.equ BAYLEEF, 153
.equ MEGANIUM, 154
.equ CYNDAQUIL, 155
.equ QUILAVA, 156
.equ TYPHLOSION, 157
.equ TOTODILE, 158
.equ CROCONAW, 159
.equ FERALIGATR, 160
.equ SENTRET, 161
.equ FURRET, 162
.equ HOOTHOOT, 163
.equ NOCTOWL, 164
.equ LEDYBA, 165
.equ LEDIAN, 166
.equ SPINARAK, 167
.equ ARIADOS, 168
.equ CROBAT, 169
.equ CHINCHOU, 170
.equ LANTURN, 171
.equ PICHU, 172
.equ CLEFFA, 173
.equ IGGLYBUFF, 174
.equ TOGEPI, 175
.equ TOGETIC, 176
.equ NATU, 177
.equ XATU, 178
.equ MAREEP, 179
.equ FLAAFFY, 180
.equ AMPHAROS, 181
.equ BELLOSSOM, 182
.equ MARILL, 183
.equ AZUMARILL, 184
.equ SUDOWOODO, 185
.equ POLITOED, 186
.equ HOPPIP, 187
.equ SKIPLOOM, 188
.equ JUMPLUFF, 189
.equ AIPOM, 190
.equ SUNKERN, 191
.equ SUNFLORA, 192
.equ YANMA, 193
.equ WOOPER, 194
.equ QUAGSIRE, 195
.equ ESPEON, 196
.equ UMBREON, 197
.equ MURKROW, 198
.equ SLOWKING, 199
.equ MISDREAVUS, 200
.equ UNOWN, 201
.equ WOBBUFFET, 202
.equ GIRAFARIG, 203
.equ PINECO, 204
.equ FORRETRESS, 205
.equ DUNSPARCE, 206
.equ GLIGAR, 207
.equ STEELIX, 208
.equ SNUBBULL, 209
.equ GRANBULL, 210
.equ QWILFISH, 211
.equ SCIZOR, 212
.equ SHUCKLE, 213
.equ HERACROSS, 214
.equ SNEASEL, 215
.equ TEDDIURSA, 216
.equ URSARING, 217
.equ SLUGMA, 218
.equ MAGCARGO, 219
.equ SWINUB, 220
.equ PILOSWINE, 221
.equ CORSOLA, 222
.equ REMORAID, 223
.equ OCTILLERY, 224
.equ DELIBIRD, 225
.equ MANTINE, 226
.equ SKARMORY, 227
.equ HOUNDOUR, 228
.equ HOUNDOOM, 229
.equ KINGDRA, 230
.equ PHANPY, 231
.equ DONPHAN, 232
.equ PORYGON2, 233
.equ STANTLER, 234
.equ SMEARGLE, 235
.equ TYROGUE, 236
.equ HITMONTOP, 237
.equ SMOOCHUM, 238
.equ ELEKID, 239
.equ MAGBY, 240
.equ MILTANK, 241
.equ BLISSEY, 242
.equ RAIKOU, 243
.equ ENTEI, 244
.equ SUICUNE, 245
.equ LARVITAR, 246
.equ PUPITAR, 247
.equ TYRANITAR, 248
.equ LUGIA, 249
.equ HO_OH, 250
.equ CELEBI, 251
.equ TREECKO, 277
.equ GROVYLE, 278
.equ SCEPTILE, 279
.equ TORCHIC, 280
.equ COMBUSKEN, 281
.equ BLAZIKEN, 282
.equ MUDKIP, 283
.equ MARSHTOMP, 284
.equ SWAMPERT, 285
.equ POOCHYENA, 286
.equ MIGHTYENA, 287
.equ ZIGZAGOON, 288
.equ LINOONE, 289
.equ WURMPLE, 290
.equ SILCOON, 291
.equ BEAUTIFLY, 292
.equ CASCOON, 293
.equ DUSTOX, 294
.equ LOTAD, 295
.equ LOMBRE, 296
.equ LUDICOLO, 297
.equ SEEDOT, 298
.equ NUZLEAF, 299
.equ SHIFTRY, 300
.equ NINCADA, 301
.equ NINJASK, 302
.equ SHEDINJA, 303
.equ TAILLOW, 304
.equ SWELLOW, 305
.equ SHROOMISH, 306
.equ BRELOOM, 307
.equ SPINDA, 308
.equ WINGULL, 309
.equ PELIPPER, 310
.equ SURSKIT, 311
.equ MASQUERAIN, 312
.equ WAILMER, 313
.equ WAILORD, 314
.equ SKITTY, 315
.equ DELCATTY, 316
.equ KECLEON, 317
.equ BALTOY, 318
.equ CLAYDOL, 319
.equ NOSEPASS, 320
.equ TORKOAL, 321
.equ SABLEYE, 322
.equ BARBOACH, 323
.equ WHISCASH, 324
.equ LUVDISC, 325
.equ CORPHISH, 326
.equ CRAWDAUNT, 327
.equ FEEBAS, 328
.equ MILOTIC, 329
.equ CARVANHA, 330
.equ SHARPEDO, 331
.equ TRAPINCH, 332
.equ VIBRAVA, 333
.equ FLYGON, 334
.equ MAKUHITA, 335
.equ HARIYAMA, 336
.equ ELECTRIKE, 337
.equ MANECTRIC, 338
.equ NUMEL, 339
.equ CAMERUPT, 340
.equ SPHEAL, 341
.equ SEALEO, 342
.equ WALREIN, 343
.equ CACNEA, 344
.equ CACTURNE, 345
.equ SNORUNT, 346
.equ GLALIE, 347
.equ LUNATONE, 348
.equ SOLROCK, 349
.equ AZURILL, 350
.equ SPOINK, 351
.equ GRUMPIG, 352
.equ PLUSLE, 353
.equ MINUN, 354
.equ MAWILE, 355
.equ MEDITITE, 356
.equ MEDICHAM, 357
.equ SWABLU, 358
.equ ALTARIA, 359
.equ WYNAUT, 360
.equ DUSKULL, 361
.equ DUSCLOPS, 362
.equ ROSELIA, 363
.equ SLAKOTH, 364
.equ VIGOROTH, 365
.equ SLAKING, 366
.equ GULPIN, 367
.equ SWALOT, 368
.equ TROPIUS, 369
.equ WHISMUR, 370
.equ LOUDRED, 371
.equ EXPLOUD, 372
.equ CLAMPERL, 373
.equ HUNTAIL, 374
.equ GOREBYSS, 375
.equ ABSOL, 376
.equ SHUPPET, 377
.equ BANETTE, 378
.equ SEVIPER, 379
.equ ZANGOOSE, 380
.equ RELICANTH, 381
.equ ARON, 382
.equ LAIRON, 383
.equ AGGRON, 384
.equ CASTFORM, 385
.equ VOLBEAT, 386
.equ ILLUMISE, 387
.equ LILEEP, 388
.equ CRADILY, 389
.equ ANORITH, 390
.equ ARMALDO, 391
.equ RALTS, 392
.equ KIRLIA, 393
.equ GARDEVOIR, 394
.equ BAGON, 395
.equ SHELGON, 396
.equ SALAMENCE, 397
.equ BELDUM, 398
.equ METANG, 399
.equ METAGROSS, 400
.equ REGIROCK, 401
.equ REGICE, 402
.equ REGISTEEL, 403
.equ KYOGRE, 404
.equ GROUDON, 405
.equ RAYQUAZA, 406
.equ LATIAS, 407
.equ LATIOS, 408
.equ JIRACHI, 409
.equ DEOXYS, 410
.equ CHIMECHO, 411

.equ NONE, 0x0
.equ MASTERBALL, 0x1
.equ ULTRABALL, 0x2
.equ GREATBALL, 0x3
.equ POKEBALL, 0x4
.equ SAFARIBALL, 0x5
.equ NETBALL, 0x6
.equ DIVEBALL, 0x7
.equ NESTBALL, 0x8
.equ REPEATBALL, 0x9
.equ TIMERBALL, 0xA
.equ LUXURYBALL, 0xB
.equ PREMIERBALL, 0xC
.equ POTION, 0xD
.equ ANTIDOTE, 0xE
.equ BURNHEAL, 0xF
.equ ICEHEAL, 0x10
.equ AWAKENING, 0x11
.equ PARLYZHEAL, 0x12
.equ FULLRESTORE, 0x13
.equ MAXPOTION, 0x14
.equ HYPERPOTION, 0x15
.equ SUPERPOTION, 0x16
.equ FULLHEAL, 0x17
.equ REVIVE, 0x18
.equ MAXREVIVE, 0x19
.equ FRESHWATER, 0x1A
.equ SODAPOP, 0x1B
.equ LEMONADE, 0x1C
.equ MOOMOOMILK, 0x1D
.equ ENERGYPOWDER, 0x1E
.equ ENERGYROOT, 0x1F
.equ HEALPOWDER, 0x20
.equ REVIVALHERB, 0x21
.equ ETHER, 0x22
.equ MAXETHER, 0x23
.equ ELIXIR, 0x24
.equ MAXELIXIR, 0x25
.equ LAVACOOKIE, 0x26
.equ BLUEFLUTE, 0x27
.equ YELLOWFLUTE, 0x28
.equ REDFLUTE, 0x29
.equ BLACKFLUTE, 0x2A
.equ WHITEFLUTE, 0x2B
.equ BERRYJUICE, 0x2C
.equ SACREDASH, 0x2D
.equ SHOALSALT, 0x2E
.equ SHOALSHELL, 0x2F
.equ REDSHARD, 0x30
.equ BLUESHARD, 0x31
.equ YELLOWSHARD, 0x32
.equ GREENSHARD, 0x33
.equ HPUP, 0x3F
.equ PROTEIN, 0x40
.equ IRON, 0x41
.equ CARBOS, 0x42
.equ CALCIUM, 0x43
.equ RARECANDY, 0x44
.equ PPUP, 0x45
.equ ZINC, 0x46
.equ PPMAX, 0x47
.equ GUARDSPEC, 0x49
.equ DIREHIT, 0x4A
.equ XATTACK, 0x4B
.equ XDEFEND, 0x4C
.equ XSPEED, 0x4D
.equ XACCURACY, 0x4E
.equ XSPECIAL, 0x4F
.equ POKEDOLL, 0x50
.equ FLUFFYTAIL, 0x51
.equ SUPERREPEL, 0x53
.equ MAXREPEL, 0x54
.equ ESCAPEROPE, 0x55
.equ REPEL, 0x56
.equ SUNSTONE, 0x5D
.equ MOONSTONE, 0x5E
.equ FIRESTONE, 0x5F
.equ THUNDERSTONE, 0x60
.equ WATERSTONE, 0x61
.equ LEAFSTONE, 0x62
.equ TINYMUSHROOM, 0x67
.equ BIGMUSHROOM, 0x68
.equ PEARL, 0x6A
.equ BIGPEARL, 0x6B
.equ STARDUST, 0x6C
.equ STARPIECE, 0x6D
.equ NUGGET, 0x6E
.equ HEARTSCALE, 0x6F
.equ ORANGEMAIL, 0x79
.equ HARBORMAIL, 0x7A
.equ GLITTERMAIL, 0x7B
.equ MECHMAIL, 0x7C
.equ WOODMAIL, 0x7D
.equ WAVEMAIL, 0x7E
.equ BEADMAIL, 0x7F
.equ SHADOWMAIL, 0x80
.equ TROPICMAIL, 0x81
.equ DREAMMAIL, 0x82
.equ FABMAIL, 0x83
.equ RETROMAIL, 0x84
.equ CHERIBERRY, 0x85
.equ CHESTOBERRY, 0x86
.equ PECHABERRY, 0x87
.equ RAWSTBERRY, 0x88
.equ ASPEARBERRY, 0x89
.equ LEPPABERRY, 0x8A
.equ ORANBERRY, 0x8B
.equ PERSIMBERRY, 0x8C
.equ LUMBERRY, 0x8D
.equ SITRUSBERRY, 0x8E
.equ FIGYBERRY, 0x8F
.equ WIKIBERRY, 0x90
.equ MAGOBERRY, 0x91
.equ AGUAVBERRY, 0x92
.equ IAPAPABERRY, 0x93
.equ RAZZBERRY, 0x94
.equ BLUKBERRY, 0x95
.equ NANABBERRY, 0x96
.equ WEPEARBERRY, 0x97
.equ PINAPBERRY, 0x98
.equ POMEGBERRY, 0x99
.equ KELPSYBERRY, 0x9A
.equ QUALOTBERRY, 0x9B
.equ HONDEWBERRY, 0x9C
.equ GREPABERRY, 0x9D
.equ TAMATOBERRY, 0x9E
.equ CORNNBERRY, 0x9F
.equ MAGOSTBERRY, 0xA0
.equ RABUTABERRY, 0xA1
.equ NOMELBERRY, 0xA2
.equ SPELONBERRY, 0xA3
.equ PAMTREBERRY, 0xA4
.equ WATMELBERRY, 0xA5
.equ DURINBERRY, 0xA6
.equ BELUEBERRY, 0xA7
.equ LIECHIBERRY, 0xA8
.equ GANLONBERRY, 0xA9
.equ SALACBERRY, 0xAA
.equ PETAYABERRY, 0xAB
.equ APICOTBERRY, 0xAC
.equ LANSATBERRY, 0xAD
.equ STARFBERRY, 0xAE
.equ ENIGMABERRY, 0xAF
.equ BRIGHTPOWDER, 0xB3
.equ WHITEHERB, 0xB4
.equ MACHOBRACE, 0xB5
.equ EXPSHARE, 0xB6
.equ QUICKCLAW, 0xB7
.equ SOOTHEBELL, 0xB8
.equ MENTALHERB, 0xB9
.equ CHOICEBAND, 0xBA
.equ KINGSROCK, 0xBB
.equ SILVERPOWDER, 0xBC
.equ AMULETCOIN, 0xBD
.equ CLEANSETAG, 0xBE
.equ SOULDEW, 0xBF
.equ DEEPSEATOOTH, 0xC0
.equ DEEPSEASCALE, 0xC1
.equ SMOKEBALL, 0xC2
.equ EVERSTONE, 0xC3
.equ FOCUSBAND, 0xC4
.equ LUCKYEGG, 0xC5
.equ SCOPELENS, 0xC6
.equ METALCOAT, 0xC7
.equ LEFTOVERS, 0xC8
.equ DRAGONSCALE, 0xC9
.equ LIGHTBALL, 0xCA
.equ SOFTSAND, 0xCB
.equ HARDSTONE, 0xCC
.equ MIRACLESEED, 0xCD
.equ BLACKGLASSES, 0xCE
.equ BLACKBELT, 0xCF
.equ MAGNET, 0xD0
.equ MYSTICWATER, 0xD1
.equ SHARPBEAK, 0xD2
.equ POISONBARB, 0xD3
.equ NEVERMELTICE, 0xD4
.equ SPELLTAG, 0xD5
.equ TWISTEDSPOON, 0xD6
.equ CHARCOAL, 0xD7
.equ DRAGONFANG, 0xD8
.equ SILKSCARF, 0xD9
.equ UPGRADE, 0xDA
.equ SHELLBELL, 0xDB
.equ SEAINCENSE, 0xDC
.equ LAXINCENSE, 0xDD
.equ LUCKYPUNCH, 0xDE
.equ METALPOWDER, 0xDF
.equ THICKCLUB, 0xE0
.equ STICK, 0xE1
.equ REDSCARF, 0xFE
.equ BLUESCARF, 0xFF
.equ PINKSCARF, 0x100
.equ GREENSCARF, 0x101
.equ YELLOWSCARF, 0x102
.equ MACHBIKE, 0x103
.equ COINCASE, 0x104
.equ ITEMFINDER, 0x105
.equ OLDROD, 0x106
.equ GOODROD, 0x107
.equ SUPERROD, 0x108
.equ SSTICKET, 0x109
.equ CONTESTPASS, 0x10A
.equ WAILMERPAIL, 0x10C
.equ DEVONGOODS, 0x10D
.equ SOOTSACK, 0x10E
.equ BASEMENTKEY, 0x10F
.equ ACROBIKE, 0x110
.equ POKEBLOCKCASE, 0x111
.equ LETTER, 0x112
.equ EONTICKET, 0x113
.equ REDORB, 0x114
.equ BLUEORB, 0x115
.equ SCANNER, 0x116
.equ GOGOGGLES, 0x117
.equ METEORITE, 0x118
.equ RM1KEY, 0x119
.equ RM2KEY, 0x11A
.equ RM4KEY, 0x11B
.equ RM6KEY, 0x11C
.equ STORAGEKEY, 0x11D
.equ ROOTFOSSIL, 0x11E
.equ CLAWFOSSIL, 0x11F
.equ DEVONSCOPE, 0x120
.equ TM01, 0x121
.equ TM02, 0x122
.equ TM03, 0x123
.equ TM04, 0x124
.equ TM05, 0x125
.equ TM06, 0x126
.equ TM07, 0x127
.equ TM08, 0x128
.equ TM09, 0x129
.equ TM10, 0x12A
.equ TM11, 0x12B
.equ TM12, 0x12C
.equ TM13, 0x12D
.equ TM14, 0x12E
.equ TM15, 0x12F
.equ TM16, 0x130
.equ TM17, 0x131
.equ TM18, 0x132
.equ TM19, 0x133
.equ TM20, 0x134
.equ TM21, 0x135
.equ TM22, 0x136
.equ TM23, 0x137
.equ TM24, 0x138
.equ TM25, 0x139
.equ TM26, 0x13A
.equ TM27, 0x13B
.equ TM28, 0x13C
.equ TM29, 0x13D
.equ TM30, 0x13E
.equ TM31, 0x13F
.equ TM32, 0x140
.equ TM33, 0x141
.equ TM34, 0x142
.equ TM35, 0x143
.equ TM36, 0x144
.equ TM37, 0x145
.equ TM38, 0x146
.equ TM39, 0x147
.equ TM40, 0x148
.equ TM41, 0x149
.equ TM42, 0x14A
.equ TM43, 0x14B
.equ TM44, 0x14C
.equ TM45, 0x14D
.equ TM46, 0x14E
.equ TM47, 0x14F
.equ TM48, 0x150
.equ TM49, 0x151
.equ TM50, 0x152
.equ HM01, 0x153
.equ HM02, 0x154
.equ HM03, 0x155
.equ HM04, 0x156
.equ HM05, 0x157
.equ HM06, 0x158
.equ HM07, 0x159
.equ HM08, 0x15A
.equ OAKSPARCEL, 0x15D
.equ POKEFLUTE, 0x15E
.equ SECRETKEY, 0x15F
.equ BIKEVOUCHER, 0x160
.equ GOLDTEETH, 0x161
.equ OLDAMBER, 0x162
.equ CARDKEY, 0x163
.equ LIFTKEY, 0x164
.equ HELIXFOSSIL, 0x165
.equ DOMEFOSSIL, 0x166
.equ SILPHSCOPE, 0x167
.equ BICYCLE, 0x168
.equ TOWNMAP, 0x169
.equ VSSEEKER, 0x16A
.equ FAMECHECKER, 0x16B
.equ TMCASE, 0x16C
.equ BERRYPOUCH, 0x16D
.equ TEACHYTV, 0x16E
.equ TRIPASS, 0x16F
.equ RAINBOWPASS, 0x170
.equ TEA, 0x171
.equ MYSTICTICKET, 0x172
.equ AURORATICKET, 0x173
.equ POWDERJAR, 0x174
.equ RUBY, 0x175
.equ SAPPHIRE, 0x176
.equ MAGMAEMBLEM, 0x177
.equ OLDSEAMAP, 0x178

.equ SMALLDESK, 0x1
.equ POKEMONDESK, 0x2
.equ HEAVYDESK, 0x3
.equ RAGGEDDESK, 0x4
.equ COMFORTDESK, 0x5
.equ PRETTYDESK, 0x6
.equ BRICKDESK, 0x7
.equ CAMPDESK, 0x8
.equ HARDDESK, 0x9
.equ SMALLCHAIR, 0xA
.equ POKEMONCHAIR, 0xB
.equ HEAVYCHAIR, 0xC
.equ PRETTYCHAIR, 0xD
.equ COMFORTCHAIR, 0xE
.equ RAGGEDCHAIR, 0xF
.equ BRICKCHAIR, 0x10
.equ CAMPCHAIR, 0x11
.equ HARDCHAIR, 0x12
.equ REDPLANT, 0x13
.equ TROPICALPLANT, 0x14
.equ PRETTYFLOWERS, 0x15
.equ COLORFULPLANT, 0x16
.equ BIGPLANT, 0x17
.equ GORGEOUSPLANT, 0x18
.equ REDBRICK, 0x19
.equ YELLOWBRICK, 0x1A
.equ REDBALLOON, 0x1B
.equ BLUEBALLOON, 0x1C
.equ YELLOWBALLOON, 0x1D
.equ REDTENT, 0x1F
.equ BLUETENT, 0x20
.equ SOLIDBOARD, 0x21
.equ SLIDE, 0x22
.equ FENCELENGTH, 0x23
.equ FENCEWIDTH, 0x24
.equ TIRE, 0x25
.equ STAND, 0x26
.equ MUDBALL, 0x27
.equ BREAKABLEDOOR, 0x28
.equ SANDORNAMENT, 0x29
.equ SILVERSHIELD, 0x2A
.equ GOLDSHIELD, 0x2B
.equ GLASSORNAMENT, 0x2C
.equ ROUNDTV, 0x2E
.equ CUTETV, 0x2F
.equ GLITTERMAT, 0x30
.equ JUMPMAT, 0x31
.equ SPINMAT, 0x32
.equ CLOWNOTEMAT, 0x33
.equ DNOTEMAT, 0x34
.equ ENOTEMAT, 0x35
.equ FNOTEMAT, 0x36
.equ GNOTEMAT, 0x37
.equ ANOTEMAT, 0x38
.equ BNOTEMAT, 0x39
.equ CHIGHNOTEMAT, 0x3A
.equ SURFMAT, 0x3B
.equ THUNDERMAT, 0x3C
.equ FIREBLASTMAT, 0x3D
.equ POWDERSNOWMAT, 0x3E
.equ ATTRACTMAT, 0x3F
.equ FISSUREMAT, 0x40
.equ SPIKESMAT, 0x41
.equ BALLPOSTER, 0x42
.equ GREENPOSTER, 0x43
.equ REDPOSTER, 0x44
.equ BLUEPOSTER, 0x45
.equ CUTEPOSTER, 0x46
.equ PIKAPOSTER, 0x47
.equ LONGPOSTER, 0x48
.equ SEAPOSTER, 0x49
.equ SKYPOSTER, 0x4A
.equ KISSPOSTER, 0x4B
.equ PICHUDOLL, 0x4C
.equ PIKACHUDOLL, 0x4D
.equ MARILLDOLL, 0x4E
.equ TOGEPIDOLL, 0x4F
.equ CYNDAQUILDOLL, 0x50
.equ CHIKORITADOLL, 0x51
.equ TOTODILEDOLL, 0x52
.equ JIGGLYPUFFDOLL, 0x53
.equ MEOWTHDOLL, 0x54
.equ CLEFAIRYDOLL, 0x55
.equ DITTODOLL, 0x56
.equ SMOOCHUMDOLL, 0x57
.equ TREECKODOLL, 0x58
.equ TORCHICDOLL, 0x59
.equ MUDKIPDOLL, 0x5A
.equ DUSKULLDOLL, 0x5B
.equ WYNAUTDOLL, 0x5C
.equ BALTOYDOLL, 0x5D
.equ KECLEONDOLL, 0x5E
.equ AZURILLDOLL, 0x5F
.equ SKITTYDOLL, 0x60
.equ SWABLUDOLL, 0x61
.equ GULPINDOLL, 0x62
.equ LOTADDOLL, 0x63
.equ SEEDOTDOLL, 0x64
.equ PIKACUSHION, 0x65
.equ ROUNDCUSHION, 0x66
.equ KISSCUSHION, 0x67
.equ ZIGZAGCUSHION, 0x68
.equ SPINCUSHION, 0x69
.equ DIAMONDCUSHION, 0x6A
.equ BALLCUSHION, 0x6B
.equ GRASSCUSHION, 0x6C
.equ FIRECUSHION, 0x6D
.equ WATERCUSHION, 0x6E
.equ SNORLAXDOLL, 0x6F
.equ RHYDONDOLL, 0x70
.equ LAPRASDOLL, 0x71
.equ VENUSAURDOLL, 0x72
.equ CHARIZARDDOLL, 0x73
.equ BLASTOISEDOLL, 0x74
.equ WAILMERDOLL, 0x75
.equ REGIROCKDOLL, 0x76
.equ REGICEDOLL, 0x77
.equ REGISTEELDOLL, 0x78

.equ POUND, 0x1
.equ KARATECHOP, 0x2
.equ DOUBLESLAP, 0x3
.equ COMETPUNCH, 0x4
.equ MEGAPUNCH, 0x5
.equ PAYDAY, 0x6
.equ FIREPUNCH, 0x7
.equ ICEPUNCH, 0x8
.equ THUNDERPUNCH, 0x9
.equ SCRATCH, 0xA
.equ VICEGRIP, 0xB
.equ GUILLOTINE, 0xC
.equ RAZORWIND, 0xD
.equ SWORDDANCE, 0xE
.equ CUT, 0xF
.equ GUST, 0x10
.equ WINGATTACK, 0x11
.equ WHIRLWIND, 0x12
.equ FLY, 0x13
.equ CONSTRICT, 0x14
.equ SLAM, 0x15
.equ VINEWHIP, 0x16
.equ STOMP, 0x17
.equ DOUBLEKICK, 0x18
.equ MEGAKICK, 0x19
.equ JUMPKICK, 0x1A
.equ ROLLINGKICK, 0x1B
.equ SANDATTACK, 0x1C
.equ HEADBUTT, 0x1D
.equ HORNATTACK, 0x1E
.equ FURYATTACK, 0x1F
.equ HORNDRILL, 0x20
.equ TACKLE, 0x21
.equ BODYSLAM, 0x22
.equ WRAP, 0x23
.equ TAKEDOWN, 0x24
.equ THRASH, 0x25
.equ DOUBLEEDGE, 0x26
.equ TAILWHIP, 0x27
.equ POISONSTING, 0x28
.equ TWINEEDLE, 0x29
.equ PINMISSLE, 0x2A
.equ LEER, 0x2B
.equ BITE, 0x2C
.equ GROWL, 0x2D
.equ ROAR, 0x2E
.equ SING, 0x2F
.equ SUPERSONIC, 0x30
.equ SONICBOOM, 0x31
.equ DISABLE, 0x32
.equ ACID, 0x33
.equ EMBER, 0x34
.equ FLAMETHROWER, 0x35
.equ MIST, 0x36
.equ WATERGUN, 0x37
.equ HYDROPUMP, 0x38
.equ SURF, 0x39
.equ ICEBEAM, 0x3A
.equ BLIZZARD, 0x3B
.equ PSYBEAM, 0x3C
.equ BUBBLEBEAM, 0x3D
.equ AURORABEAM, 0x3E
.equ HYPERBEAM, 0x3F
.equ PECK, 0x40
.equ DRILLPECK, 0x41
.equ SUBMISSION, 0x42
.equ LOWKICK, 0x43
.equ COUNTER, 0x44
.equ SEISMICTOSS, 0x45
.equ STRENGTH, 0x46
.equ ABSORB, 0x47
.equ MEGADRAIN, 0x48
.equ LEECHSEED, 0x49
.equ GROWTH, 0x4A
.equ RAZORLEAF, 0x4B
.equ SOLARBEAM, 0x4C
.equ POISONPOWDER, 0x4D
.equ STUNSPORE, 0x4E
.equ SLEEPPOWDER, 0x4F
.equ PETALDANCE, 0x50
.equ STRINGSHOT, 0x51
.equ DRAGONRAGE, 0x52
.equ FIRESPIN, 0x53
.equ THUNDERSHOCK, 0x54
.equ THUNDERBOLT, 0x55
.equ THUNDERWAVE, 0x56
.equ THUNDER, 0x57
.equ ROCKTHROW, 0x58
.equ EARTHQUAKE, 0x59
.equ FISSURE, 0x5A
.equ DIG, 0x5B
.equ TOXIC, 0x5C
.equ CONFUSION, 0x5D
.equ PSYCHIC, 0x5E
.equ HYPNOSIS, 0x5F
.equ MEDITATE, 0x60
.equ AGILITY, 0x61
.equ QUICKATTACK, 0x62
.equ RAGE, 0x63
.equ TELEPORT, 0x64
.equ NIGHTSHADE, 0x65
.equ MIMIC, 0x66
.equ SCREECH, 0x67
.equ DOUBLETEAM, 0x68
.equ RECOVER, 0x69
.equ HARDEN, 0x6A
.equ MINIMIZE, 0x6B
.equ SMOKESCREEN, 0x6C
.equ CONFUSERAY, 0x6D
.equ WITHDRAW, 0x6E
.equ DEFENSECURL, 0x6F
.equ BARRIER, 0x70
.equ LIGHTSCREEN, 0x71
.equ HAZE, 0x72
.equ REFLECT, 0x73
.equ FOCUSENERGY, 0x74
.equ BIDE, 0x75
.equ METRONOME, 0x76
.equ MIRRORMOVE, 0x77
.equ SELFDESTRUCT, 0x78
.equ EGGBOMB, 0x79
.equ LICK, 0x7A
.equ SMOG, 0x7B
.equ SLUDGE, 0x7C
.equ BONECLUB, 0x7D
.equ FIREBLAST, 0x7E
.equ WATERFALL, 0x7F
.equ CLAMP, 0x80
.equ SWIFT, 0x81
.equ SKULLBASH, 0x82
.equ SPIKECANNON, 0x83
.equ BIND, 0x84
.equ AMNESIA, 0x85
.equ KINESIS, 0x86
.equ EGGLAY, 0x87
.equ HIJUMPKICK, 0x88
.equ GLARE, 0x89
.equ DREAMEATER, 0x8A
.equ POISONGAS, 0x8B
.equ BARRAGE, 0x8C
.equ LEECHLIFE, 0x8D
.equ SWEETKISS, 0x8E
.equ SKYATTACK, 0x8F
.equ TRANSFORM, 0x90
.equ BUBBLE, 0x91
.equ DIZZYPUNCH, 0x92
.equ STUNSPORE, 0x93
.equ FLASH, 0x94
.equ PSYWAVE, 0x95
.equ SPLASH, 0x96
.equ ACIDARMOR, 0x97
.equ CRABHAMMER, 0x98
.equ EXPLOSION, 0x99
.equ FURYSWIPES, 0x9A
.equ BONEMERANG, 0x9B
.equ REST, 0x9C
.equ ROCKSLIDE, 0x9D
.equ HYPERFANG, 0x9E
.equ RESERVE, 0x9F
.equ CONVERSION, 0xA0
.equ TRIATTACK, 0xA1
.equ RAGEFANG, 0xA2
.equ SLASH, 0xA3
.equ SUBSTITUTE, 0xA4
.equ FRUSTRATION, 0xA5
.equ SKETCH, 0xA6
.equ TRIPLEKICK, 0xA7
.equ THIEF, 0xA8
.equ SPIDERWEB, 0xA9
.equ MINDREADER, 0xAA
.equ CURSE, 0xAB
.equ FLAMEWHEEL, 0xAC
.equ SNORE, 0xAD
.equ CURSE, 0xAE
.equ FLAIL, 0xAF
.equ CONVERSION2, 0xB0
.equ AEROBLAST, 0xB1
.equ COTTONSPORE, 0xB2
.equ RESURRECTION, 0xB3
.equ GRUDGE, 0xB4
.equ POWDERSNOW, 0xB5
.equ PROTECT, 0xB6
.equ MACHPUNCH, 0xB7
.equ SCARYFACE, 0xB8
.equ FAINTATTACK, 0xB9
.equ LOVELYKISS, 0xBA
.equ BELLYDRUM, 0xBB
.equ SLUDGEBOMB, 0xBC
.equ MUDSLAP, 0xBD
.equ OCTAZOOKA, 0xBE
.equ SPIKES, 0xBF
.equ SPARKCANNON, 0xC0
.equ FORESIGHT, 0xC1
.equ DESTINYBOND, 0xC2
.equ PERISHSONG, 0xC3
.equ FROZENWIND, 0xC4
.equ ABANDON, 0xC5
.equ BONECRUSH, 0xC6
.equ LOCKON, 0xC7
.equ IMPERIALWRATH, 0xC8
.equ SANDSTORM, 0xC9
.equ GIGADRAIN, 0xCA
.equ ENDURE, 0xCB
.equ CHARM, 0xCC
.equ ROLLOUT, 0xCD
.equ FALSESWIPE, 0xCE
.equ SWAGGER, 0xCF
.equ MILKDRINK, 0xD0
.equ SPARK, 0xD1
.equ FURYCUTTER, 0xD2
.equ STEELWING, 0xD3
.equ MEANLOOK, 0xD4
.equ ATTRACT, 0xD5
.equ SLEEPTALK, 0xD6
.equ HEALBELL, 0xD7
.equ RETURN, 0xD8
.equ PRESENT, 0xD9
.equ FRUSTRATION, 0xDA
.equ SAFEGUARD, 0xDB
.equ PAINSLIT, 0xDC
.equ SACREDFIRE, 0xDD
.equ MAGNITUTDE, 0xDE
.equ DYNAMICPUNCH, 0xDF
.equ MEGAHORN, 0xE0
.equ DRAGONBREATH, 0xE1
.equ BATONPASS, 0xE2
.equ ENCORE, 0xE3
.equ PURSUIT, 0xE4
.equ RAPIDSPIN, 0xE5
.equ SWEETSCENT, 0xE6
.equ IRONTAIL, 0xE7
.equ METALCLAW, 0xE8
.equ STRIKETHROW, 0xE9
.equ MORNINGLIGHT, 0xEA
.equ PHOTOSYNTHESIS, 0xEB
.equ MOONLIGHT, 0xEC
.equ HIDDENPOWER, 0xED
.equ CROSSCHOP, 0xEE
.equ TWISTER, 0xEF
.equ RAINDANCE, 0xF0
.equ SUNNYDAY, 0xF1
.equ CRUNCH, 0xF2
.equ MIRRORCOAT, 0xF3
.equ SUGGEST, 0xF4
.equ EXTREMESPEED, 0xF5
.equ ATOMICPOWER, 0xF6
.equ SHADOWBALL, 0xF7
.equ FUTURESIGHT, 0xF8
.equ ROCKSMASH, 0xF9
.equ WHIRLPOOL, 0xFA
.equ BEATUP, 0xFB
.equ CATDECEIT, 0xFC
.equ CLAMOUR, 0xFD
.equ STORE, 0xFE
.equ SPITOUT, 0xFF
.equ SWALLOW, 0x100
.equ HOTWIND, 0x101
.equ HAIL, 0x102
.equ ICHAMON, 0x103
.equ FLATTER, 0x104
.equ WILLOWISP, 0x105
.equ PARTINGGIFT, 0x106
.equ BRAVADO, 0x107
.equ FIGHTINGPUNCH, 0x108
.equ RESUSCITATION, 0x109
.equ STOPTHISFINGER, 0x10A
.equ NATUREPOWER, 0x10B
.equ ELECTRIFICATION, 0x10C
.equ PROVOKE, 0x10D
.equ HELPOUT, 0x10E
.equ TRICK, 0x10F
.equ MORPH, 0x110
.equ WISH, 0x111
.equ CATPAW, 0x112
.equ STICK, 0x113
.equ STUPIDSTRENGTH, 0x114
.equ MAGICCOAT, 0x115
.equ RECYCLE, 0x116
.equ REVENGE, 0x117
.equ RIVERBEDSPLIT, 0x118
.equ YAWN, 0x119
.equ BEATDOWN, 0x11A
.equ DAREDEVIL, 0x11B
.equ ERUPT, 0x11C
.equ SKILLSWAP, 0x11D
.equ SEAL, 0x11E
.equ REFRESH, 0x11F
.equ MALICE, 0x120
.equ FALSESWIPE, 0x121
.equ SECRETPOWER, 0x122
.equ DIVE, 0x123
.equ THRUST, 0x124
.equ CAMOFLAGE, 0x125
.equ FIREFLYLIGHT, 0x126
.equ LUSTERPURGE, 0x127
.equ MISTBALL, 0x128
.equ FEATHERDANCE, 0x129
.equ HULADANCE, 0x12A
.equ BLAZEKICK, 0x12B
.equ MUDPLAY, 0x12C
.equ ICEBALL, 0x12D
.equ NEEDLEARM, 0x12E
.equ IDLE, 0x12F
.equ HYPERVOICE, 0x130
.equ TOXICFANG, 0x131
.equ BREAKFANG, 0x132
.equ BLASTBURN, 0x133
.equ HYDROCANNON, 0x134
.equ COMETPUNCH, 0x135
.equ SURPRISE, 0x136
.equ WEATHERBALL, 0x137
.equ AROMATHERAPY, 0x138
.equ CROCODILETEARS, 0x139
.equ AIRCUTTER, 0x13A
.equ OVERHEAT, 0x13B
.equ SNIFFOUT, 0x13C
.equ ROCKSEAL, 0x13D
.equ SILVERWIND, 0x13E
.equ METALNOTE, 0x13F
.equ GRASSWHISTLE, 0x140
.equ TICKLE, 0x141
.equ COSMOPOWER, 0x142
.equ SPOUT, 0x143
.equ SIGNALBEAM, 0x144
.equ SHADOWPUNCH, 0x145
.equ SUPERNATURALPOWER, 0x146
.equ SKYUPPER, 0x147
.equ SANDHELL, 0x148
.equ ABSOLUTEZERO, 0x149
.equ MUDDYSTREAM, 0x14A
.equ SEEDMACHINEGUN, 0x14B
.equ SWALLOWRETURN, 0x14C
.equ ICENEEDLE, 0x14D
.equ IRONWALL, 0x14E
.equ BLOCK, 0x14F
.equ HOWLING, 0x150
.equ DRAGONCLAW, 0x151
.equ FRENZYPLANT, 0x152
.equ BUILDUP, 0x153
.equ SPRING, 0x154
.equ MADSHOT, 0x155
.equ POISONTAIL, 0x156
.equ DESIRE, 0x157
.equ BOLTECH, 0x158
.equ MAGICALLEAF, 0x159
.equ WATERPLAY, 0x15A
.equ MEDITATION, 0x15B
.equ LEAFBLADE, 0x15C
.equ DRAGONDANCE, 0x15D
.equ ROCKBLAST, 0x15E
.equ ELECTRICSHOCK, 0x15F
.equ WATERSURGE, 0x160
.equ DOOMDESIRE, 0x161
.equ PSYBOOST, 0x162



@ Music aliases

.equ LITTLEROOT_TETSUJI, 0x015E
.equ GS_ROUTE_38, 0x015F
.equ WILD_DEFEAT, 0x0160
.equ WILD_DEFEAT_WINTRO, 0x0161
.equ LEADER_DEFEAT, 0x0162
.equ BEAT_ELITE_FOUR, 0x0163
.equ CRYSTAL_POKECENTER, 0x0164
.equ GS_SAFFRON_CITY, 0x0165
.equ CRYSTAL_BATTLE_DOGS, 0x0166
.equ ROUTE_101, 0x0167
.equ ROUTE_115, 0x0168
.equ ROUTE_125, 0x0169
.equ PETALBURG_CITY, 0x016A
.equ POKEMON_GYM, 0x016C
.equ SURFING, 0x016D
.equ LEVEL_UP, 0x016F
.equ POKEMON_HEALED, 0x0170
.equ OBTAINED_BADGE, 0x0171
.equ OBTAINED_ITEM, 0x0172
.equ POKEMON_CAUGHT, 0x0173
.equ OBTAINED_TMHM, 0x0174
.equ LILYCOVE_MUSEUM, 0x0175
.equ ROUTE_123, 0x0176
.equ SLATEPORT_MUSEUM, 0x0177
.equ EVOLVE_INTRO, 0x0178
.equ EVOLVING, 0x0179
.equ DELETED_MOVE, 0x017A
.equ TUBER_ENCOUNTER, 0x017B
.equ YOUNGSTER_ENCOUNTER, 0x017C
.equ SS_CACTUS, 0x017D
.equ FORTREE_CITY, 0x017E
.equ BIRCHS_LAB, 0x017F
.equ BATTLE_TOWER, 0x0180
.equ SWIMMER_ENCOUNTER, 0x0181
.equ METEOR_FALLS, 0x0182
.equ OBTAINED_BERRY, 0x0183
.equ MAXIES_GONE_MAD, 0x0184
.equ BEAT_CONTEST, 0x0185
.equ CONTEST_ROUND, 0x0186
.equ PAY_NO_ATTENTION, 0x0187
.equ WEIRD_THEME, 0x0188
.equ CONTEST_TEST_A, 0x0189
.equ CONTEST_TEST_B, 0x018A
.equ CONTEST_TEST_C, 0x018B
.equ CONTEST_TEST_D, 0x018C
.equ GENTLEMAN_ENCOUNTER, 0x018D
.equ VERDANTURF_TOWN, 0x018E
.equ RUSTBORO_CITY, 0x018F
.equ POKEMON_CENTER, 0x0190
.equ ROUTE_104, 0x0191
.equ ROUTE_119, 0x0192
.equ BICYCLE_RIDE, 0x0193
.equ POKE_MART, 0x0194
.equ LITTLEROOT_TOWN, 0x0195
.equ SKY_PILLAR, 0x0196
.equ AROMA_LADY_ENCOUNTER, 0x0197
.equ LILYCOVE_CITY, 0x0198
.equ THE_SANDY_DESERT, 0x0199
.equ HELP_ME, 0x019A
.equ UNDERWATER_DIVE, 0x019B
.equ TRAINER_DEFEAT, 0x019C
.equ TITLE_SCREEN, 0x019D
.equ INTRODUCTION, 0x019E
.equ MAYS_THEME, 0x019F
.equ ELECTRIC_ENCOUNTER, 0x01A0
.equ COOLTRAINER_ENCOUNTER, 0x01A1
.equ ROUTE_113, 0x01A2
.equ AQUA_ENCOUNTER, 0x01A3
.equ SHOW_ME_AROUND, 0x01A4
.equ BRENDANS_THEME, 0x01A5
.equ EVER_GRANDE_CITY, 0x01A6
.equ HEX_ENCOUNTER, 0x01A7
.equ MAGMA_AQUA_DEFEAT, 0x01A8
.equ RIDING_THE_CABLE_CAR, 0x01A9
.equ GAME_CORNER, 0x01AA
.equ DEWFORD_TOWN, 0x01AB
.equ SAFARI_ZONE, 0x01AC
.equ VICTORY_ROAD, 0x01AD
.equ TEAM_HIDEOUT, 0x01AE
.equ SAILING_THE_SEA, 0x01AF
.equ SHOAL_CAVE, 0x01B0
.equ SLATEPORT_CITY, 0x01B1
.equ MT_PYRE, 0x01B2
.equ POKEMON_TRAINER_SCHOOL, 0x01B3
.equ YOURE_THE_CHAMP, 0x01B4
.equ FALLARBOR_TOWN, 0x01B5
.equ ISLAND_CAVE, 0x01B6
.equ WON_CONTEST, 0x01B7
.equ PLAYING_CONTEST, 0x01B8
.equ MAGMA_ENCOUNTER, 0x01B9
.equ GAMEFREAK_INTRO_BATTLE, 0x01BA
.equ THE_FLOOD, 0x01BB
.equ THE_DROUGHT, 0x01BC
.equ SOOTOPOLIS_CITY, 0x01BD
.equ CONTEST_RESULTS, 0x01BE
.equ HALL_OF_FAME, 0x01BF
.equ TRICK_MASTERS_HOUSE, 0x01C0
.equ POKEFAN_ENCOUNTER, 0x01C1
.equ ELITE_FOUR_ENCOUNTER, 0x01C2
.equ HIKER_ENCOUNTER, 0x01C3
.equ CONTEST_LOBBY, 0x01C4
.equ WHATS_ON_TV, 0x01C5
.equ WALLACE_ENCOUNTER, 0x01C6
.equ ENDING_CREDITS, 0x01C7
.equ THE_END, 0x01C8
.equ BATTLE_FRONTIER, 0x01C9
.equ BATTLE_ARENA, 0x01CA
.equ BATTLE_POINT, 0x01CB
.equ REGISTERED_TRAINER, 0x01CC
.equ BATTLE_PYRAMID, 0x01CD
.equ PYRAMID_TOP, 0x01CE
.equ BATTLE_PALACE, 0x01CF
.equ RAYQUAZA_ENTERS, 0x01D0
.equ BATTLE_TOWER2, 0x01D1
.equ FRONTIER_BADGE, 0x01D2
.equ DOME_TOURNAMENT, 0x01D3
.equ BATTLE_TUBE, 0x01D4
.equ BATTLE_FACTORY, 0x01D5
.equ BATTLE_LEGENDARY, 0x01D6
.equ BATTLE_FRONTIER_BRAIN, 0x01D7
.equ BATTLE_MEW, 0x01D8
.equ BATTLE_DOME_LOBBY, 0x01D9
.equ BATTLE_WILD, 0x01DA
.equ BATTLE_AQUA_MAGMA, 0x01DB
.equ BATTLE_TRAINER, 0x01DC
.equ BATTLE_LEADER, 0x01DD
.equ BATTLE_CHAMPION, 0x01DE
.equ BATTLE_REGIS, 0x01DF
.equ BATTLE_LEGENDARY2, 0x01E0
.equ BATTLE_RIVAL, 0x01E1
.equ BATTLE_ELITE_FOUR, 0x01E2
.equ BATTLE_TEAM_LEADER, 0x01E3
.equ FOLLOW_ME, 0x01E4
.equ GAME_CORNER, 0x01E5
.equ EVIL_LURKS, 0x01E6
.equ GYM_FRLG, 0x01E7
.equ JIGGLYPUFFS_SONG, 0x01E8
.equ GAMEFREAK_INTRO_FRLG, 0x01E9
.equ POKEMON_THEME, 0x01EA
.equ CINNABAR_ISLAND, 0x01EB
.equ TITLE_SCREEN_FRLG, 0x01EC
.equ HEALING, 0x01ED
.equ BICYCLE, 0x01EE
.equ ROCKET_ENCOUNTER, 0x01EF
.equ LASS_ENCOUNTER, 0x01F0
.equ FRLG_ENCOUNTER, 0x01F1
.equ HALL_OF_FAME_FRLG, 0x01F2
.equ VIRIDIAN_FOREST, 0x01F3
.equ MOUNT_MOON, 0x01F4
.equ ABANDONED_PLACE, 0x01F5
.equ THE_END_EPIC, 0x01F6
.equ ROUTE_1, 0x01F7
.equ OAKS_INTRO, 0x01F8
.equ ROUTE_3, 0x01F9
.equ ROUTE_15, 0x01FA
.equ INDIGO_PLATEAU, 0x01FB
.equ BATTLE_GYM_LEADER_FRLG, 0x01FC
.equ BATTLE_TRAINER_FRLG, 0x01FD
.equ BATTLE_WILD_FRLG, 0x01FE
.equ BATTLE_CHAMPION_FRLG, 0x01FF
.equ PALLET_TOWN, 0x0200
.equ OAKS_LAB, 0x0201
.equ OAK_ENCOUNTER, 0x0202
.equ POKEMON_CENTER_FRLG, 0x0203
.equ SS_ANNA, 0x0204
.equ SURFS_UP, 0x0205
.equ POKEMON_TOWER, 0x0206
.equ SILPH_CO, 0x0207
.equ CERULEAN_CITY, 0x0208
.equ CELADON_CITY, 0x0209
.equ TRAINER_VICTORY_FRLG, 0x020A
.equ WILD_VICTORY_FRLG, 0x020B
.equ LEADER_VICTORY_FRLG, 0x020C
.equ VERMILION_CITY, 0x020D
.equ VIRIDIAN_CITY, 0x020E
.equ BLUES_THEME, 0x020F
.equ BLUES_THEME_BIS, 0x0210
.equ VS_SEEKER_REGISTER, 0x0211
.equ OBTAINED_PARCEL, 0x0212
.equ CAUGHT_A_POKEMON_FRLG, 0x0213
.equ TRAINER_CARD_PHOTO, 0x0214
.equ GAMEFREAK_INTRO_FRLG, 0x0215
.equ WILD_VICTORY_FRLG_BIS, 0x0216
.equ INTRO_MESSAGE_A, 0x0217
.equ INTRO_MESSAGE_B, 0x0218
.equ INTRO_MESSAGE_C, 0x0219
.equ GAME_CORNER_PLUS1, 0x021A
.equ GAME_CORNER_PLUS2, 0x021B
.equ NET_CENTER, 0x021C
.equ MYSTERY_CONNECTION, 0x021D
.equ GAME_CORNER_PLUS3, 0x021E
.equ MOUNT_EMBER, 0x021F
.equ FOLLOW_ME_BIS, 0x0220
.equ SEVII_ISLAND_PATHS, 0x0221
.equ TANOBY_RUINS, 0x0222
.equ SAFFRON_CITY2, 0x0223
.equ CHERRYGROVE_CITY, 0x0224
.equ VIOLET_CITY, 0x0225
.equ POKEFLUTE_SOUND, 0x0226
.equ BATTLE_DEOXYS, 0x0227
.equ BATTLE_WILD_FRLG_PLUS2, 0x0228
.equ BATTLE_WILD_FRLG_PLUS2, 0x0229
.equ ROCKET_ENCOUNTER2, 0x022A
.equ DEOXYS_ENCOUNTER, 0x022B
.equ TRAINER_TOWER, 0x022C
.equ PALLET_TOWN_FAME_MIX, 0x022D
.equ TEACHY_TV, 0x022E

.equ asm_nop, 0x46C0

@ .endsegment

@ End defines segment

.endif
