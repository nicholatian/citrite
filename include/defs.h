/*****************************************************************************\
 *                                                                           * 
 *   ########## ####### ######### ##########  ####### ######### ##########   * 
 *   ###    ###   ###   #  ###  # ###     ###   ###   #  ###  # ###    ###   * 
 *   ###          ###      ###    ###     ###   ###      ###    ###          * 
 *   ###          ###      ###    #########     ###      ###    #######      * 
 *   ###          ###      ###    ###   ###     ###      ###    ###          * 
 *   ###    ###   ###      ###    ###    ###    ###      ###    ###    ###   * 
 *   ########## #######    ###    ###     ### #######    ###    ##########   * 
 *                                                                           * 
 *                       HACK: Pokémon Citrite Version                       * 
 *                           OFFICIAL  Source Code                           * 
 *                                                                           * 
 *                  Copyright © 2014-2016 Alexander Nicholi                  * 
 *                           All rights  reserved.                           * 
 *                                                                           * 
\*****************************************************************************/

#ifndef __CIT_DEFINITIONS_H__
#define __CIT_DEFINITIONS_H__

#define PACK __attribute__((__packed__))
#define ALIGN(x) __attribute__((__aligned(x)))
#define WALIGN __attribute__((__aligned(4)))

/* Defines segment */
/* Holds preprocessor definitions for the assembly. */

/* .segment DEFINES */

/* Sound effects */
#define EXCL_BEEP 0x15
#define OBTAINED_BADGE 0x163
#define LEVELED_UP 0x16F
#define POKEMON_HEALED 0x170
#define OBTAINED_ITEM 0x172
#define POKEMON_CAUGHT 0x173
#define OBTAINED_TMHM 0x174
#define OBTAINED_BERRY 0x183
#define REGISTERED_TRAINER 0x1CC
#define FRONTIER_BADGE 0x1D2

/* Specials */
#define SETMAPTILE 0x91

#define QUAKE_X 0x8004
#define QUAKE_Y 0x8005
#define QUAKE_TOTALTIME 0x8006
#define QUAKE_SHAKETIME 0x8007
#define EARTHQUAKE 0x138

/* Script superflags */
#define F_RAINCTRL_E 0x4C0
#define F_RAINCTRL_W 0x4C1
#define F_THUNCTRL_E 0x4C2
#define F_THUNCTRL_W 0x4C3
#define F_DSRTSSTORM 0x4C4

/* Script common vars */
#define NULLVAR, 0x4050 /* Ensure this is always set to 0! */
#define STORY_A 0x4051

/* Subroutine-specific */
#define CANARYBATTLE_ZIGZAGOON 0x3
#define CANARYBATTLE_TRAINER 0x2

/* Supplemental */
#define EM_RUNNINGSHOES 0x8C0

/* imported from PKSV */

#define LASTRESULT 0x800D
#define LASTTALKED 0x800F
#define PLAYERFACING 0x800C

#define PLAYER 0xFF
#define CAMERA 0x7F

#define MSG_POKENAV 0xA
#define MSG_NORMAL 0x6
#define MSG_YESNO 0x5
#define MSG_NOCLOSE 0x4
#define MSG_SIGN 0x3
#define MSG_STANDARD 0x2
#define MSG_FIND 0x1
#define MSG_OBTAIN 0x0

#define _lt 0
#define _eq 1
#define _gt 2
#define _le 3
#define _ge 4
#define _ne 5

#define FR_BADGE_1 0x820
#define FR_BADGE_2 0x821
#define FR_BADGE_3 0x822
#define FR_BADGE_4 0x823
#define FR_BADGE_5 0x824
#define FR_BADGE_6 0x825
#define FR_BADGE_7 0x826
#define FR_BADGE_8 0x827
#define RS_BADGE_1 0x807
#define RS_BADGE_2 0x808
#define RS_BADGE_3 0x809
#define RS_BADGE_4 0x80A
#define RS_BADGE_5 0x80B
#define RS_BADGE_6 0x80C
#define RS_BADGE_7 0x80D
#define RS_BADGE_8 0x80E
#define EM_BADGE_1 0x867
#define EM_BADGE_2 0x868
#define EM_BADGE_3 0x869
#define EM_BADGE_4 0x86A
#define EM_BADGE_5 0x86B
#define EM_BADGE_6 0x86C
#define EM_BADGE_7 0x86D
#define EM_BADGE_8 0x86E
#define RS_POKEMON 0x800
#define RS_POKEDEX 0x801
#define RS_POKENAV 0x802
#define EM_POKEMON 0x860
#define EM_POKEDEX 0x861
#define EM_POKENAV 0x862
#define FR_POKEMON 0x828
#define FR_POKEDEX 0x829
#define RUNNING_SHOES 0x82F

#define BOY 0
#define GIRL 1
#define NO 0
#define YES 1

#define HEAL_POKEMON 0
#define CHOOSE_POKEMON 0x9C
#define CATCH_POKEMON 0x9D
#define FR_NATIONAL_DEX 0x16F
#define EM_NATIONAL_DEX 0x1F3
#define FR_CAMERA_START 0x113
#define FR_CAMERA_END 0x114
#define EM_CAMERA_START 0x116
#define EM_CAMERA_END 0x117

#define DOWN 1
#define UP 2
#define LEFT 3
#define RIGHT 4

#define MISSINGNO 0
#define BULBASAUR 1
#define IVYSAUR 2
#define VENUSAUR 3
#define CHARMANDER 4
#define CHARMELEON 5
#define CHARIZARD 6
#define SQUIRTLE 7
#define WARTORTLE 8
#define BLASTOISE 9
#define CATERPIE 10
#define METAPOD 11
#define BUTTERFREE 12
#define WEEDLE 13
#define KAKUNA 14
#define BEEDRILL 15
#define PIDGEY 16
#define PIDGEOTTO 17
#define PIDGEOT 18
#define RATTATA 19
#define RATICATE 20
#define SPEAROW 21
#define FEAROW 22
#define EKANS 23
#define ARBOK 24
#define PIKACHU 25
#define RAICHU 26
#define SANDSHREW 27
#define SANDSLASH 28
#define NIDORANF 29
#define NIDORINA 30
#define NIDOQUEEN 31
#define NIDORANM 32
#define NIDORINO 33
#define NIDOKING 34
#define CLEFAIRY 35
#define CLEFABLE 36
#define VULPIX 37
#define NINETALES 38
#define JIGGLYPUFF 39
#define WIGGLYTUFF 40
#define ZUBAT 41
#define GOLBAT 42
#define ODDISH 43
#define GLOOM 44
#define VILEPLUME 45
#define PARAS 46
#define PARASECT 47
#define VENONAT 48
#define VENOMOTH 49
#define DIGLETT 50
#define DUGTRIO 51
#define MEOWTH 52
#define PERSIAN 53
#define PSYDUCK 54
#define GOLDUCK 55
#define MANKEY 56
#define PRIMEAPE 57
#define GROWLITHE 58
#define ARCANINE 59
#define POLIWAG 60
#define POLIWHIRL 61
#define POLIWRATH 62
#define ABRA 63
#define KADABRA 64
#define ALAKAZAM 65
#define MACHOP 66
#define MACHOKE 67
#define MACHAMP 68
#define BELLSPROUT 69
#define WEEPINBELL 70
#define VICTREEBEL 71
#define TENTACOOL 72
#define TENTACRUEL 73
#define GEODUDE 74
#define GRAVELER 75
#define GOLEM 76
#define PONYTA 77
#define RAPIDASH 78
#define SLOWPOKE 79
#define SLOWBRO 80
#define MAGNEMITE 81
#define MAGNETON 82
#define FARFETCHD 83
#define DODUO 84
#define DODRIO 85
#define SEEL 86
#define DEWGONG 87
#define GRIMER 88
#define MUK 89
#define SHELLDER 90
#define CLOYSTER 91
#define GASTLY 92
#define HAUNTER 93
#define GENGAR 94
#define ONIX 95
#define DROWZEE 96
#define HYPNO 97
#define KRABBY 98
#define KINGLER 99
#define VOLTORB 100
#define ELECTRODE 101
#define EXEGGCUTE 102
#define EXEGGUTOR 103
#define CUBONE 104
#define MAROWAK 105
#define HITMONLEE 106
#define HITMONCHAN 107
#define LICKITUNG 108
#define KOFFING 109
#define WEEZING 110
#define RHYHORN 111
#define RHYDON 112
#define CHANSEY 113
#define TANGELA 114
#define KANGASKHAN 115
#define HORSEA 116
#define SEADRA 117
#define GOLDEEN 118
#define SEAKING 119
#define STARYU 120
#define STARMIE 121
#define MRMIME 122
#define SCYTHER 123
#define JYNX 124
#define ELECTABUZZ 125
#define MAGMAR 126
#define PINSIR 127
#define TAUROS 128
#define MAGIKARP 129
#define GYARADOS 130
#define LAPRAS 131
#define DITTO 132
#define EEVEE 133
#define VAPOREON 134
#define JOLTEON 135
#define FLAREON 136
#define PORYGON 137
#define OMANYTE 138
#define OMASTAR 139
#define KABUTO 140
#define KABUTOPS 141
#define AERODACTYL 142
#define SNORLAX 143
#define ARTICUNO 144
#define ZAPDOS 145
#define MOLTRES 146
#define DRATINI 147
#define DRAGONAIR 148
#define DRAGONITE 149
#define MEWTWO 150
#define MEW 151
#define CHIKORITA 152
#define BAYLEEF 153
#define MEGANIUM 154
#define CYNDAQUIL 155
#define QUILAVA 156
#define TYPHLOSION 157
#define TOTODILE 158
#define CROCONAW 159
#define FERALIGATR 160
#define SENTRET 161
#define FURRET 162
#define HOOTHOOT 163
#define NOCTOWL 164
#define LEDYBA 165
#define LEDIAN 166
#define SPINARAK 167
#define ARIADOS 168
#define CROBAT 169
#define CHINCHOU 170
#define LANTURN 171
#define PICHU 172
#define CLEFFA 173
#define IGGLYBUFF 174
#define TOGEPI 175
#define TOGETIC 176
#define NATU 177
#define XATU 178
#define MAREEP 179
#define FLAAFFY 180
#define AMPHAROS 181
#define BELLOSSOM 182
#define MARILL 183
#define AZUMARILL 184
#define SUDOWOODO 185
#define POLITOED 186
#define HOPPIP 187
#define SKIPLOOM 188
#define JUMPLUFF 189
#define AIPOM 190
#define SUNKERN 191
#define SUNFLORA 192
#define YANMA 193
#define WOOPER 194
#define QUAGSIRE 195
#define ESPEON 196
#define UMBREON 197
#define MURKROW 198
#define SLOWKING 199
#define MISDREAVUS 200
#define UNOWN 201
#define WOBBUFFET 202
#define GIRAFARIG 203
#define PINECO 204
#define FORRETRESS 205
#define DUNSPARCE 206
#define GLIGAR 207
#define STEELIX 208
#define SNUBBULL 209
#define GRANBULL 210
#define QWILFISH 211
#define SCIZOR 212
#define SHUCKLE 213
#define HERACROSS 214
#define SNEASEL 215
#define TEDDIURSA 216
#define URSARING 217
#define SLUGMA 218
#define MAGCARGO 219
#define SWINUB 220
#define PILOSWINE 221
#define CORSOLA 222
#define REMORAID 223
#define OCTILLERY 224
#define DELIBIRD 225
#define MANTINE 226
#define SKARMORY 227
#define HOUNDOUR 228
#define HOUNDOOM 229
#define KINGDRA 230
#define PHANPY 231
#define DONPHAN 232
#define PORYGON2 233
#define STANTLER 234
#define SMEARGLE 235
#define TYROGUE 236
#define HITMONTOP 237
#define SMOOCHUM 238
#define ELEKID 239
#define MAGBY 240
#define MILTANK 241
#define BLISSEY 242
#define RAIKOU 243
#define ENTEI 244
#define SUICUNE 245
#define LARVITAR 246
#define PUPITAR 247
#define TYRANITAR 248
#define LUGIA 249
#define HO_OH 250
#define CELEBI 251
#define TREECKO 277
#define GROVYLE 278
#define SCEPTILE 279
#define TORCHIC 280
#define COMBUSKEN 281
#define BLAZIKEN 282
#define MUDKIP 283
#define MARSHTOMP 284
#define SWAMPERT 285
#define POOCHYENA 286
#define MIGHTYENA 287
#define ZIGZAGOON 288
#define LINOONE 289
#define WURMPLE 290
#define SILCOON 291
#define BEAUTIFLY 292
#define CASCOON 293
#define DUSTOX 294
#define LOTAD 295
#define LOMBRE 296
#define LUDICOLO 297
#define SEEDOT 298
#define NUZLEAF 299
#define SHIFTRY 300
#define NINCADA 301
#define NINJASK 302
#define SHEDINJA 303
#define TAILLOW 304
#define SWELLOW 305
#define SHROOMISH 306
#define BRELOOM 307
#define SPINDA 308
#define WINGULL 309
#define PELIPPER 310
#define SURSKIT 311
#define MASQUERAIN 312
#define WAILMER 313
#define WAILORD 314
#define SKITTY 315
#define DELCATTY 316
#define KECLEON 317
#define BALTOY 318
#define CLAYDOL 319
#define NOSEPASS 320
#define TORKOAL 321
#define SABLEYE 322
#define BARBOACH 323
#define WHISCASH 324
#define LUVDISC 325
#define CORPHISH 326
#define CRAWDAUNT 327
#define FEEBAS 328
#define MILOTIC 329
#define CARVANHA 330
#define SHARPEDO 331
#define TRAPINCH 332
#define VIBRAVA 333
#define FLYGON 334
#define MAKUHITA 335
#define HARIYAMA 336
#define ELECTRIKE 337
#define MANECTRIC 338
#define NUMEL 339
#define CAMERUPT 340
#define SPHEAL 341
#define SEALEO 342
#define WALREIN 343
#define CACNEA 344
#define CACTURNE 345
#define SNORUNT 346
#define GLALIE 347
#define LUNATONE 348
#define SOLROCK 349
#define AZURILL 350
#define SPOINK 351
#define GRUMPIG 352
#define PLUSLE 353
#define MINUN 354
#define MAWILE 355
#define MEDITITE 356
#define MEDICHAM 357
#define SWABLU 358
#define ALTARIA 359
#define WYNAUT 360
#define DUSKULL 361
#define DUSCLOPS 362
#define ROSELIA 363
#define SLAKOTH 364
#define VIGOROTH 365
#define SLAKING 366
#define GULPIN 367
#define SWALOT 368
#define TROPIUS 369
#define WHISMUR 370
#define LOUDRED 371
#define EXPLOUD 372
#define CLAMPERL 373
#define HUNTAIL 374
#define GOREBYSS 375
#define ABSOL 376
#define SHUPPET 377
#define BANETTE 378
#define SEVIPER 379
#define ZANGOOSE 380
#define RELICANTH 381
#define ARON 382
#define LAIRON 383
#define AGGRON 384
#define CASTFORM 385
#define VOLBEAT 386
#define ILLUMISE 387
#define LILEEP 388
#define CRADILY 389
#define ANORITH 390
#define ARMALDO 391
#define RALTS 392
#define KIRLIA 393
#define GARDEVOIR 394
#define BAGON 395
#define SHELGON 396
#define SALAMENCE 397
#define BELDUM 398
#define METANG 399
#define METAGROSS 400
#define REGIROCK 401
#define REGICE 402
#define REGISTEEL 403
#define KYOGRE 404
#define GROUDON 405
#define RAYQUAZA 406
#define LATIAS 407
#define LATIOS 408
#define JIRACHI 409
#define DEOXYS 410
#define CHIMECHO 411

#define NONE 0x0
#define MASTERBALL 0x1
#define ULTRABALL 0x2
#define GREATBALL 0x3
#define POKEBALL 0x4
#define SAFARIBALL 0x5
#define NETBALL 0x6
#define DIVEBALL 0x7
#define NESTBALL 0x8
#define REPEATBALL 0x9
#define TIMERBALL 0xA
#define LUXURYBALL 0xB
#define PREMIERBALL 0xC
#define POTION 0xD
#define ANTIDOTE 0xE
#define BURNHEAL 0xF
#define ICEHEAL 0x10
#define AWAKENING 0x11
#define PARLYZHEAL 0x12
#define FULLRESTORE 0x13
#define MAXPOTION 0x14
#define HYPERPOTION 0x15
#define SUPERPOTION 0x16
#define FULLHEAL 0x17
#define REVIVE 0x18
#define MAXREVIVE 0x19
#define FRESHWATER 0x1A
#define SODAPOP 0x1B
#define LEMONADE 0x1C
#define MOOMOOMILK 0x1D
#define ENERGYPOWDER 0x1E
#define ENERGYROOT 0x1F
#define HEALPOWDER 0x20
#define REVIVALHERB 0x21
#define ETHER 0x22
#define MAXETHER 0x23
#define ELIXIR 0x24
#define MAXELIXIR 0x25
#define LAVACOOKIE 0x26
#define BLUEFLUTE 0x27
#define YELLOWFLUTE 0x28
#define REDFLUTE 0x29
#define BLACKFLUTE 0x2A
#define WHITEFLUTE 0x2B
#define BERRYJUICE 0x2C
#define SACREDASH 0x2D
#define SHOALSALT 0x2E
#define SHOALSHELL 0x2F
#define REDSHARD 0x30
#define BLUESHARD 0x31
#define YELLOWSHARD 0x32
#define GREENSHARD 0x33
#define HPUP 0x3F
#define PROTEIN 0x40
#define IRON 0x41
#define CARBOS 0x42
#define CALCIUM 0x43
#define RARECANDY 0x44
#define PPUP 0x45
#define ZINC 0x46
#define PPMAX 0x47
#define GUARDSPEC 0x49
#define DIREHIT 0x4A
#define XATTACK 0x4B
#define XDEFEND 0x4C
#define XSPEED 0x4D
#define XACCURACY 0x4E
#define XSPECIAL 0x4F
#define POKEDOLL 0x50
#define FLUFFYTAIL 0x51
#define SUPERREPEL 0x53
#define MAXREPEL 0x54
#define ESCAPEROPE 0x55
#define REPEL 0x56
#define SUNSTONE 0x5D
#define MOONSTONE 0x5E
#define FIRESTONE 0x5F
#define THUNDERSTONE 0x60
#define WATERSTONE 0x61
#define LEAFSTONE 0x62
#define TINYMUSHROOM 0x67
#define BIGMUSHROOM 0x68
#define PEARL 0x6A
#define BIGPEARL 0x6B
#define STARDUST 0x6C
#define STARPIECE 0x6D
#define NUGGET 0x6E
#define HEARTSCALE 0x6F
#define ORANGEMAIL 0x79
#define HARBORMAIL 0x7A
#define GLITTERMAIL 0x7B
#define MECHMAIL 0x7C
#define WOODMAIL 0x7D
#define WAVEMAIL 0x7E
#define BEADMAIL 0x7F
#define SHADOWMAIL 0x80
#define TROPICMAIL 0x81
#define DREAMMAIL 0x82
#define FABMAIL 0x83
#define RETROMAIL 0x84
#define CHERIBERRY 0x85
#define CHESTOBERRY 0x86
#define PECHABERRY 0x87
#define RAWSTBERRY 0x88
#define ASPEARBERRY 0x89
#define LEPPABERRY 0x8A
#define ORANBERRY 0x8B
#define PERSIMBERRY 0x8C
#define LUMBERRY 0x8D
#define SITRUSBERRY 0x8E
#define FIGYBERRY 0x8F
#define WIKIBERRY 0x90
#define MAGOBERRY 0x91
#define AGUAVBERRY 0x92
#define IAPAPABERRY 0x93
#define RAZZBERRY 0x94
#define BLUKBERRY 0x95
#define NANABBERRY 0x96
#define WEPEARBERRY 0x97
#define PINAPBERRY 0x98
#define POMEGBERRY 0x99
#define KELPSYBERRY 0x9A
#define QUALOTBERRY 0x9B
#define HONDEWBERRY 0x9C
#define GREPABERRY 0x9D
#define TAMATOBERRY 0x9E
#define CORNNBERRY 0x9F
#define MAGOSTBERRY 0xA0
#define RABUTABERRY 0xA1
#define NOMELBERRY 0xA2
#define SPELONBERRY 0xA3
#define PAMTREBERRY 0xA4
#define WATMELBERRY 0xA5
#define DURINBERRY 0xA6
#define BELUEBERRY 0xA7
#define LIECHIBERRY 0xA8
#define GANLONBERRY 0xA9
#define SALACBERRY 0xAA
#define PETAYABERRY 0xAB
#define APICOTBERRY 0xAC
#define LANSATBERRY 0xAD
#define STARFBERRY 0xAE
#define ENIGMABERRY 0xAF
#define BRIGHTPOWDER 0xB3
#define WHITEHERB 0xB4
#define MACHOBRACE 0xB5
#define EXPSHARE 0xB6
#define QUICKCLAW 0xB7
#define SOOTHEBELL 0xB8
#define MENTALHERB 0xB9
#define CHOICEBAND 0xBA
#define KINGSROCK 0xBB
#define SILVERPOWDER 0xBC
#define AMULETCOIN 0xBD
#define CLEANSETAG 0xBE
#define SOULDEW 0xBF
#define DEEPSEATOOTH 0xC0
#define DEEPSEASCALE 0xC1
#define SMOKEBALL 0xC2
#define EVERSTONE 0xC3
#define FOCUSBAND 0xC4
#define LUCKYEGG 0xC5
#define SCOPELENS 0xC6
#define METALCOAT 0xC7
#define LEFTOVERS 0xC8
#define DRAGONSCALE 0xC9
#define LIGHTBALL 0xCA
#define SOFTSAND 0xCB
#define HARDSTONE 0xCC
#define MIRACLESEED 0xCD
#define BLACKGLASSES 0xCE
#define BLACKBELT 0xCF
#define MAGNET 0xD0
#define MYSTICWATER 0xD1
#define SHARPBEAK 0xD2
#define POISONBARB 0xD3
#define NEVERMELTICE 0xD4
#define SPELLTAG 0xD5
#define TWISTEDSPOON 0xD6
#define CHARCOAL 0xD7
#define DRAGONFANG 0xD8
#define SILKSCARF 0xD9
#define UPGRADE 0xDA
#define SHELLBELL 0xDB
#define SEAINCENSE 0xDC
#define LAXINCENSE 0xDD
#define LUCKYPUNCH 0xDE
#define METALPOWDER 0xDF
#define THICKCLUB 0xE0
#define STICK 0xE1
#define REDSCARF 0xFE
#define BLUESCARF 0xFF
#define PINKSCARF 0x100
#define GREENSCARF 0x101
#define YELLOWSCARF 0x102
#define MACHBIKE 0x103
#define COINCASE 0x104
#define ITEMFINDER 0x105
#define OLDROD 0x106
#define GOODROD 0x107
#define SUPERROD 0x108
#define SSTICKET 0x109
#define CONTESTPASS 0x10A
#define WAILMERPAIL 0x10C
#define DEVONGOODS 0x10D
#define SOOTSACK 0x10E
#define BASEMENTKEY 0x10F
#define ACROBIKE 0x110
#define POKEBLOCKCASE 0x111
#define LETTER 0x112
#define EONTICKET 0x113
#define REDORB 0x114
#define BLUEORB 0x115
#define SCANNER 0x116
#define GOGOGGLES 0x117
#define METEORITE 0x118
#define RM1KEY 0x119
#define RM2KEY 0x11A
#define RM4KEY 0x11B
#define RM6KEY 0x11C
#define STORAGEKEY 0x11D
#define ROOTFOSSIL 0x11E
#define CLAWFOSSIL 0x11F
#define DEVONSCOPE 0x120
#define TM01 0x121
#define TM02 0x122
#define TM03 0x123
#define TM04 0x124
#define TM05 0x125
#define TM06 0x126
#define TM07 0x127
#define TM08 0x128
#define TM09 0x129
#define TM10 0x12A
#define TM11 0x12B
#define TM12 0x12C
#define TM13 0x12D
#define TM14 0x12E
#define TM15 0x12F
#define TM16 0x130
#define TM17 0x131
#define TM18 0x132
#define TM19 0x133
#define TM20 0x134
#define TM21 0x135
#define TM22 0x136
#define TM23 0x137
#define TM24 0x138
#define TM25 0x139
#define TM26 0x13A
#define TM27 0x13B
#define TM28 0x13C
#define TM29 0x13D
#define TM30 0x13E
#define TM31 0x13F
#define TM32 0x140
#define TM33 0x141
#define TM34 0x142
#define TM35 0x143
#define TM36 0x144
#define TM37 0x145
#define TM38 0x146
#define TM39 0x147
#define TM40 0x148
#define TM41 0x149
#define TM42 0x14A
#define TM43 0x14B
#define TM44 0x14C
#define TM45 0x14D
#define TM46 0x14E
#define TM47 0x14F
#define TM48 0x150
#define TM49 0x151
#define TM50 0x152
#define HM01 0x153
#define HM02 0x154
#define HM03 0x155
#define HM04 0x156
#define HM05 0x157
#define HM06 0x158
#define HM07 0x159
#define HM08 0x15A
#define OAKSPARCEL 0x15D
#define POKEFLUTE 0x15E
#define SECRETKEY 0x15F
#define BIKEVOUCHER 0x160
#define GOLDTEETH 0x161
#define OLDAMBER 0x162
#define CARDKEY 0x163
#define LIFTKEY 0x164
#define HELIXFOSSIL 0x165
#define DOMEFOSSIL 0x166
#define SILPHSCOPE 0x167
#define BICYCLE 0x168
#define TOWNMAP 0x169
#define VSSEEKER 0x16A
#define FAMECHECKER 0x16B
#define TMCASE 0x16C
#define BERRYPOUCH 0x16D
#define TEACHYTV 0x16E
#define TRIPASS 0x16F
#define RAINBOWPASS 0x170
#define TEA 0x171
#define MYSTICTICKET 0x172
#define AURORATICKET 0x173
#define POWDERJAR 0x174
#define RUBY 0x175
#define SAPPHIRE 0x176
#define MAGMAEMBLEM 0x177
#define OLDSEAMAP 0x178

#define SMALLDESK 0x1
#define POKEMONDESK 0x2
#define HEAVYDESK 0x3
#define RAGGEDDESK 0x4
#define COMFORTDESK 0x5
#define PRETTYDESK 0x6
#define BRICKDESK 0x7
#define CAMPDESK 0x8
#define HARDDESK 0x9
#define SMALLCHAIR 0xA
#define POKEMONCHAIR 0xB
#define HEAVYCHAIR 0xC
#define PRETTYCHAIR 0xD
#define COMFORTCHAIR 0xE
#define RAGGEDCHAIR 0xF
#define BRICKCHAIR 0x10
#define CAMPCHAIR 0x11
#define HARDCHAIR 0x12
#define REDPLANT 0x13
#define TROPICALPLANT 0x14
#define PRETTYFLOWERS 0x15
#define COLORFULPLANT 0x16
#define BIGPLANT 0x17
#define GORGEOUSPLANT 0x18
#define REDBRICK 0x19
#define YELLOWBRICK 0x1A
#define REDBALLOON 0x1B
#define BLUEBALLOON 0x1C
#define YELLOWBALLOON 0x1D
#define REDTENT 0x1F
#define BLUETENT 0x20
#define SOLIDBOARD 0x21
#define SLIDE 0x22
#define FENCELENGTH 0x23
#define FENCEWIDTH 0x24
#define TIRE 0x25
#define STAND 0x26
#define MUDBALL 0x27
#define BREAKABLEDOOR 0x28
#define SANDORNAMENT 0x29
#define SILVERSHIELD 0x2A
#define GOLDSHIELD 0x2B
#define GLASSORNAMENT 0x2C
#define ROUNDTV 0x2E
#define CUTETV 0x2F
#define GLITTERMAT 0x30
#define JUMPMAT 0x31
#define SPINMAT 0x32
#define CLOWNOTEMAT 0x33
#define DNOTEMAT 0x34
#define ENOTEMAT 0x35
#define FNOTEMAT 0x36
#define GNOTEMAT 0x37
#define ANOTEMAT 0x38
#define BNOTEMAT 0x39
#define CHIGHNOTEMAT 0x3A
#define SURFMAT 0x3B
#define THUNDERMAT 0x3C
#define FIREBLASTMAT 0x3D
#define POWDERSNOWMAT 0x3E
#define ATTRACTMAT 0x3F
#define FISSUREMAT 0x40
#define SPIKESMAT 0x41
#define BALLPOSTER 0x42
#define GREENPOSTER 0x43
#define REDPOSTER 0x44
#define BLUEPOSTER 0x45
#define CUTEPOSTER 0x46
#define PIKAPOSTER 0x47
#define LONGPOSTER 0x48
#define SEAPOSTER 0x49
#define SKYPOSTER 0x4A
#define KISSPOSTER 0x4B
#define PICHUDOLL 0x4C
#define PIKACHUDOLL 0x4D
#define MARILLDOLL 0x4E
#define TOGEPIDOLL 0x4F
#define CYNDAQUILDOLL 0x50
#define CHIKORITADOLL 0x51
#define TOTODILEDOLL 0x52
#define JIGGLYPUFFDOLL 0x53
#define MEOWTHDOLL 0x54
#define CLEFAIRYDOLL 0x55
#define DITTODOLL 0x56
#define SMOOCHUMDOLL 0x57
#define TREECKODOLL 0x58
#define TORCHICDOLL 0x59
#define MUDKIPDOLL 0x5A
#define DUSKULLDOLL 0x5B
#define WYNAUTDOLL 0x5C
#define BALTOYDOLL 0x5D
#define KECLEONDOLL 0x5E
#define AZURILLDOLL 0x5F
#define SKITTYDOLL 0x60
#define SWABLUDOLL 0x61
#define GULPINDOLL 0x62
#define LOTADDOLL 0x63
#define SEEDOTDOLL 0x64
#define PIKACUSHION 0x65
#define ROUNDCUSHION 0x66
#define KISSCUSHION 0x67
#define ZIGZAGCUSHION 0x68
#define SPINCUSHION 0x69
#define DIAMONDCUSHION 0x6A
#define BALLCUSHION 0x6B
#define GRASSCUSHION 0x6C
#define FIRECUSHION 0x6D
#define WATERCUSHION 0x6E
#define SNORLAXDOLL 0x6F
#define RHYDONDOLL 0x70
#define LAPRASDOLL 0x71
#define VENUSAURDOLL 0x72
#define CHARIZARDDOLL 0x73
#define BLASTOISEDOLL 0x74
#define WAILMERDOLL 0x75
#define REGIROCKDOLL 0x76
#define REGICEDOLL 0x77
#define REGISTEELDOLL 0x78

#define POUND 0x1
#define KARATECHOP 0x2
#define DOUBLESLAP 0x3
#define COMETPUNCH 0x4
#define MEGAPUNCH 0x5
#define PAYDAY 0x6
#define FIREPUNCH 0x7
#define ICEPUNCH 0x8
#define THUNDERPUNCH 0x9
#define SCRATCH 0xA
#define VICEGRIP 0xB
#define GUILLOTINE 0xC
#define RAZORWIND 0xD
#define SWORDDANCE 0xE
#define CUT 0xF
#define GUST 0x10
#define WINGATTACK 0x11
#define WHIRLWIND 0x12
#define FLY 0x13
#define CONSTRICT 0x14
#define SLAM 0x15
#define VINEWHIP 0x16
#define STOMP 0x17
#define DOUBLEKICK 0x18
#define MEGAKICK 0x19
#define JUMPKICK 0x1A
#define ROLLINGKICK 0x1B
#define SANDATTACK 0x1C
#define HEADBUTT 0x1D
#define HORNATTACK 0x1E
#define FURYATTACK 0x1F
#define HORNDRILL 0x20
#define TACKLE 0x21
#define BODYSLAM 0x22
#define WRAP 0x23
#define TAKEDOWN 0x24
#define THRASH 0x25
#define DOUBLEEDGE 0x26
#define TAILWHIP 0x27
#define POISONSTING 0x28
#define TWINEEDLE 0x29
#define PINMISSLE 0x2A
#define LEER 0x2B
#define BITE 0x2C
#define GROWL 0x2D
#define ROAR 0x2E
#define SING 0x2F
#define SUPERSONIC 0x30
#define SONICBOOM 0x31
#define DISABLE 0x32
#define ACID 0x33
#define EMBER 0x34
#define FLAMETHROWER 0x35
#define MIST 0x36
#define WATERGUN 0x37
#define HYDROPUMP 0x38
#define SURF 0x39
#define ICEBEAM 0x3A
#define BLIZZARD 0x3B
#define PSYBEAM 0x3C
#define BUBBLEBEAM 0x3D
#define AURORABEAM 0x3E
#define HYPERBEAM 0x3F
#define PECK 0x40
#define DRILLPECK 0x41
#define SUBMISSION 0x42
#define LOWKICK 0x43
#define COUNTER 0x44
#define SEISMICTOSS 0x45
#define STRENGTH 0x46
#define ABSORB 0x47
#define MEGADRAIN 0x48
#define LEECHSEED 0x49
#define GROWTH 0x4A
#define RAZORLEAF 0x4B
#define SOLARBEAM 0x4C
#define POISONPOWDER 0x4D
#define STUNSPORE 0x4E
#define SLEEPPOWDER 0x4F
#define PETALDANCE 0x50
#define STRINGSHOT 0x51
#define DRAGONRAGE 0x52
#define FIRESPIN 0x53
#define THUNDERSHOCK 0x54
#define THUNDERBOLT 0x55
#define THUNDERWAVE 0x56
#define THUNDER 0x57
#define ROCKTHROW 0x58
#define EARTHQUAKE 0x59
#define FISSURE 0x5A
#define DIG 0x5B
#define TOXIC 0x5C
#define CONFUSION 0x5D
#define PSYCHIC 0x5E
#define HYPNOSIS 0x5F
#define MEDITATE 0x60
#define AGILITY 0x61
#define QUICKATTACK 0x62
#define RAGE 0x63
#define TELEPORT 0x64
#define NIGHTSHADE 0x65
#define MIMIC 0x66
#define SCREECH 0x67
#define DOUBLETEAM 0x68
#define RECOVER 0x69
#define HARDEN 0x6A
#define MINIMIZE 0x6B
#define SMOKESCREEN 0x6C
#define CONFUSERAY 0x6D
#define WITHDRAW 0x6E
#define DEFENSECURL 0x6F
#define BARRIER 0x70
#define LIGHTSCREEN 0x71
#define HAZE 0x72
#define REFLECT 0x73
#define FOCUSENERGY 0x74
#define BIDE 0x75
#define METRONOME 0x76
#define MIRRORMOVE 0x77
#define SELFDESTRUCT 0x78
#define EGGBOMB 0x79
#define LICK 0x7A
#define SMOG 0x7B
#define SLUDGE 0x7C
#define BONECLUB 0x7D
#define FIREBLAST 0x7E
#define WATERFALL 0x7F
#define CLAMP 0x80
#define SWIFT 0x81
#define SKULLBASH 0x82
#define SPIKECANNON 0x83
#define BIND 0x84
#define AMNESIA 0x85
#define KINESIS 0x86
#define EGGLAY 0x87
#define HIJUMPKICK 0x88
#define GLARE 0x89
#define DREAMEATER 0x8A
#define POISONGAS 0x8B
#define BARRAGE 0x8C
#define LEECHLIFE 0x8D
#define SWEETKISS 0x8E
#define SKYATTACK 0x8F
#define TRANSFORM 0x90
#define BUBBLE 0x91
#define DIZZYPUNCH 0x92
#define STUNSPORE 0x93
#define FLASH 0x94
#define PSYWAVE 0x95
#define SPLASH 0x96
#define ACIDARMOR 0x97
#define CRABHAMMER 0x98
#define EXPLOSION 0x99
#define FURYSWIPES 0x9A
#define BONEMERANG 0x9B
#define REST 0x9C
#define ROCKSLIDE 0x9D
#define HYPERFANG 0x9E
#define RESERVE 0x9F
#define CONVERSION 0xA0
#define TRIATTACK 0xA1
#define RAGEFANG 0xA2
#define SLASH 0xA3
#define SUBSTITUTE 0xA4
#define FRUSTRATION 0xA5
#define SKETCH 0xA6
#define TRIPLEKICK 0xA7
#define THIEF 0xA8
#define SPIDERWEB 0xA9
#define MINDREADER 0xAA
#define CURSE 0xAB
#define FLAMEWHEEL 0xAC
#define SNORE 0xAD
#define CURSE 0xAE
#define FLAIL 0xAF
#define CONVERSION2 0xB0
#define AEROBLAST 0xB1
#define COTTONSPORE 0xB2
#define RESURRECTION 0xB3
#define GRUDGE 0xB4
#define POWDERSNOW 0xB5
#define PROTECT 0xB6
#define MACHPUNCH 0xB7
#define SCARYFACE 0xB8
#define FAINTATTACK 0xB9
#define LOVELYKISS 0xBA
#define BELLYDRUM 0xBB
#define SLUDGEBOMB 0xBC
#define MUDSLAP 0xBD
#define OCTAZOOKA 0xBE
#define SPIKES 0xBF
#define SPARKCANNON 0xC0
#define FORESIGHT 0xC1
#define DESTINYBOND 0xC2
#define PERISHSONG 0xC3
#define FROZENWIND 0xC4
#define ABANDON 0xC5
#define BONECRUSH 0xC6
#define LOCKON 0xC7
#define IMPERIALWRATH 0xC8
#define SANDSTORM 0xC9
#define GIGADRAIN 0xCA
#define ENDURE 0xCB
#define CHARM 0xCC
#define ROLLOUT 0xCD
#define FALSESWIPE 0xCE
#define SWAGGER 0xCF
#define MILKDRINK 0xD0
#define SPARK 0xD1
#define FURYCUTTER 0xD2
#define STEELWING 0xD3
#define MEANLOOK 0xD4
#define ATTRACT 0xD5
#define SLEEPTALK 0xD6
#define HEALBELL 0xD7
#define RETURN 0xD8
#define PRESENT 0xD9
#define FRUSTRATION 0xDA
#define SAFEGUARD 0xDB
#define PAINSLIT 0xDC
#define SACREDFIRE 0xDD
#define MAGNITUTDE 0xDE
#define DYNAMICPUNCH 0xDF
#define MEGAHORN 0xE0
#define DRAGONBREATH 0xE1
#define BATONPASS 0xE2
#define ENCORE 0xE3
#define PURSUIT 0xE4
#define RAPIDSPIN 0xE5
#define SWEETSCENT 0xE6
#define IRONTAIL 0xE7
#define METALCLAW 0xE8
#define STRIKETHROW 0xE9
#define MORNINGLIGHT 0xEA
#define PHOTOSYNTHESIS 0xEB
#define MOONLIGHT 0xEC
#define HIDDENPOWER 0xED
#define CROSSCHOP 0xEE
#define TWISTER 0xEF
#define RAINDANCE 0xF0
#define SUNNYDAY 0xF1
#define CRUNCH 0xF2
#define MIRRORCOAT 0xF3
#define SUGGEST 0xF4
#define EXTREMESPEED 0xF5
#define ATOMICPOWER 0xF6
#define SHADOWBALL 0xF7
#define FUTURESIGHT 0xF8
#define ROCKSMASH 0xF9
#define WHIRLPOOL 0xFA
#define BEATUP 0xFB
#define CATDECEIT 0xFC
#define CLAMOUR 0xFD
#define STORE 0xFE
#define SPITOUT 0xFF
#define SWALLOW 0x100
#define HOTWIND 0x101
#define HAIL 0x102
#define ICHAMON 0x103
#define FLATTER 0x104
#define WILLOWISP 0x105
#define PARTINGGIFT 0x106
#define BRAVADO 0x107
#define FIGHTINGPUNCH 0x108
#define RESUSCITATION 0x109
#define STOPTHISFINGER 0x10A
#define NATUREPOWER 0x10B
#define ELECTRIFICATION 0x10C
#define PROVOKE 0x10D
#define HELPOUT 0x10E
#define TRICK 0x10F
#define MORPH 0x110
#define WISH 0x111
#define CATPAW 0x112
#define STICK 0x113
#define STUPIDSTRENGTH 0x114
#define MAGICCOAT 0x115
#define RECYCLE 0x116
#define REVENGE 0x117
#define RIVERBEDSPLIT 0x118
#define YAWN 0x119
#define BEATDOWN 0x11A
#define DAREDEVIL 0x11B
#define ERUPT 0x11C
#define SKILLSWAP 0x11D
#define SEAL 0x11E
#define REFRESH 0x11F
#define MALICE 0x120
#define FALSESWIPE 0x121
#define SECRETPOWER 0x122
#define DIVE 0x123
#define THRUST 0x124
#define CAMOFLAGE 0x125
#define FIREFLYLIGHT 0x126
#define LUSTERPURGE 0x127
#define MISTBALL 0x128
#define FEATHERDANCE 0x129
#define HULADANCE 0x12A
#define BLAZEKICK 0x12B
#define MUDPLAY 0x12C
#define ICEBALL 0x12D
#define NEEDLEARM 0x12E
#define IDLE 0x12F
#define HYPERVOICE 0x130
#define TOXICFANG 0x131
#define BREAKFANG 0x132
#define BLASTBURN 0x133
#define HYDROCANNON 0x134
#define COMETPUNCH 0x135
#define SURPRISE 0x136
#define WEATHERBALL 0x137
#define AROMATHERAPY 0x138
#define CROCODILETEARS 0x139
#define AIRCUTTER 0x13A
#define OVERHEAT 0x13B
#define SNIFFOUT 0x13C
#define ROCKSEAL 0x13D
#define SILVERWIND 0x13E
#define METALNOTE 0x13F
#define GRASSWHISTLE 0x140
#define TICKLE 0x141
#define COSMOPOWER 0x142
#define SPOUT 0x143
#define SIGNALBEAM 0x144
#define SHADOWPUNCH 0x145
#define SUPERNATURALPOWER 0x146
#define SKYUPPER 0x147
#define SANDHELL 0x148
#define ABSOLUTEZERO 0x149
#define MUDDYSTREAM 0x14A
#define SEEDMACHINEGUN 0x14B
#define SWALLOWRETURN 0x14C
#define ICENEEDLE 0x14D
#define IRONWALL 0x14E
#define BLOCK 0x14F
#define HOWLING 0x150
#define DRAGONCLAW 0x151
#define FRENZYPLANT 0x152
#define BUILDUP 0x153
#define SPRING 0x154
#define MADSHOT 0x155
#define POISONTAIL 0x156
#define DESIRE 0x157
#define BOLTECH 0x158
#define MAGICALLEAF 0x159
#define WATERPLAY 0x15A
#define MEDITATION 0x15B
#define LEAFBLADE 0x15C
#define DRAGONDANCE 0x15D
#define ROCKBLAST 0x15E
#define ELECTRICSHOCK 0x15F
#define WATERSURGE 0x160
#define DOOMDESIRE 0x161
#define PSYBOOST 0x162



/* Music aliases */

#define LITTLEROOT_TETSUJI 0x015E
#define GS_ROUTE_38 0x015F
#define WILD_DEFEAT 0x0160
#define WILD_DEFEAT_WINTRO 0x0161
#define LEADER_DEFEAT 0x0162
#define BEAT_ELITE_FOUR 0x0163
#define CRYSTAL_POKECENTER 0x0164
#define GS_SAFFRON_CITY 0x0165
#define CRYSTAL_BATTLE_DOGS 0x0166
#define ROUTE_101 0x0167
#define ROUTE_115 0x0168
#define ROUTE_125 0x0169
#define PETALBURG_CITY 0x016A
#define POKEMON_GYM 0x016C
#define SURFING 0x016D
#define LEVEL_UP 0x016F
#define POKEMON_HEALED 0x0170
#define OBTAINED_BADGE 0x0171
#define OBTAINED_ITEM 0x0172
#define POKEMON_CAUGHT 0x0173
#define OBTAINED_TMHM 0x0174
#define LILYCOVE_MUSEUM 0x0175
#define ROUTE_123 0x0176
#define SLATEPORT_MUSEUM 0x0177
#define EVOLVE_INTRO 0x0178
#define EVOLVING 0x0179
#define DELETED_MOVE 0x017A
#define TUBER_ENCOUNTER 0x017B
#define YOUNGSTER_ENCOUNTER 0x017C
#define SS_CACTUS 0x017D
#define FORTREE_CITY 0x017E
#define BIRCHS_LAB 0x017F
#define BATTLE_TOWER 0x0180
#define SWIMMER_ENCOUNTER 0x0181
#define METEOR_FALLS 0x0182
#define OBTAINED_BERRY 0x0183
#define MAXIES_GONE_MAD 0x0184
#define BEAT_CONTEST 0x0185
#define CONTEST_ROUND 0x0186
#define PAY_NO_ATTENTION 0x0187
#define WEIRD_THEME 0x0188
#define CONTEST_TEST_A 0x0189
#define CONTEST_TEST_B 0x018A
#define CONTEST_TEST_C 0x018B
#define CONTEST_TEST_D 0x018C
#define GENTLEMAN_ENCOUNTER 0x018D
#define VERDANTURF_TOWN 0x018E
#define RUSTBORO_CITY 0x018F
#define POKEMON_CENTER 0x0190
#define ROUTE_104 0x0191
#define ROUTE_119 0x0192
#define BICYCLE_RIDE 0x0193
#define POKE_MART 0x0194
#define LITTLEROOT_TOWN 0x0195
#define SKY_PILLAR 0x0196
#define AROMA_LADY_ENCOUNTER 0x0197
#define LILYCOVE_CITY 0x0198
#define THE_SANDY_DESERT 0x0199
#define HELP_ME 0x019A
#define UNDERWATER_DIVE 0x019B
#define TRAINER_DEFEAT 0x019C
#define TITLE_SCREEN 0x019D
#define INTRODUCTION 0x019E
#define MAYS_THEME 0x019F
#define ELECTRIC_ENCOUNTER 0x01A0
#define COOLTRAINER_ENCOUNTER 0x01A1
#define ROUTE_113 0x01A2
#define AQUA_ENCOUNTER 0x01A3
#define SHOW_ME_AROUND 0x01A4
#define BRENDANS_THEME 0x01A5
#define EVER_GRANDE_CITY 0x01A6
#define HEX_ENCOUNTER 0x01A7
#define MAGMA_AQUA_DEFEAT 0x01A8
#define RIDING_THE_CABLE_CAR 0x01A9
#define GAME_CORNER 0x01AA
#define DEWFORD_TOWN 0x01AB
#define SAFARI_ZONE 0x01AC
#define VICTORY_ROAD 0x01AD
#define TEAM_HIDEOUT 0x01AE
#define SAILING_THE_SEA 0x01AF
#define SHOAL_CAVE 0x01B0
#define SLATEPORT_CITY 0x01B1
#define MT_PYRE 0x01B2
#define POKEMON_TRAINER_SCHOOL 0x01B3
#define YOURE_THE_CHAMP 0x01B4
#define FALLARBOR_TOWN 0x01B5
#define ISLAND_CAVE 0x01B6
#define WON_CONTEST 0x01B7
#define PLAYING_CONTEST 0x01B8
#define MAGMA_ENCOUNTER 0x01B9
#define GAMEFREAK_INTRO_BATTLE 0x01BA
#define THE_FLOOD 0x01BB
#define THE_DROUGHT 0x01BC
#define SOOTOPOLIS_CITY 0x01BD
#define CONTEST_RESULTS 0x01BE
#define HALL_OF_FAME 0x01BF
#define TRICK_MASTERS_HOUSE 0x01C0
#define POKEFAN_ENCOUNTER 0x01C1
#define ELITE_FOUR_ENCOUNTER 0x01C2
#define HIKER_ENCOUNTER 0x01C3
#define CONTEST_LOBBY 0x01C4
#define WHATS_ON_TV 0x01C5
#define WALLACE_ENCOUNTER 0x01C6
#define ENDING_CREDITS 0x01C7
#define THE_END 0x01C8
#define BATTLE_FRONTIER 0x01C9
#define BATTLE_ARENA 0x01CA
#define BATTLE_POINT 0x01CB
#define REGISTERED_TRAINER 0x01CC
#define BATTLE_PYRAMID 0x01CD
#define PYRAMID_TOP 0x01CE
#define BATTLE_PALACE 0x01CF
#define RAYQUAZA_ENTERS 0x01D0
#define BATTLE_TOWER2 0x01D1
#define FRONTIER_BADGE 0x01D2
#define DOME_TOURNAMENT 0x01D3
#define BATTLE_TUBE 0x01D4
#define BATTLE_FACTORY 0x01D5
#define BATTLE_LEGENDARY 0x01D6
#define BATTLE_FRONTIER_BRAIN 0x01D7
#define BATTLE_MEW 0x01D8
#define BATTLE_DOME_LOBBY 0x01D9
#define BATTLE_WILD 0x01DA
#define BATTLE_AQUA_MAGMA 0x01DB
#define BATTLE_TRAINER 0x01DC
#define BATTLE_LEADER 0x01DD
#define BATTLE_CHAMPION 0x01DE
#define BATTLE_REGIS 0x01DF
#define BATTLE_LEGENDARY2 0x01E0
#define BATTLE_RIVAL 0x01E1
#define BATTLE_ELITE_FOUR 0x01E2
#define BATTLE_TEAM_LEADER 0x01E3
#define FOLLOW_ME 0x01E4
#define GAME_CORNER 0x01E5
#define EVIL_LURKS 0x01E6
#define GYM_FRLG 0x01E7
#define JIGGLYPUFFS_SONG 0x01E8
#define GAMEFREAK_INTRO_FRLG 0x01E9
#define POKEMON_THEME 0x01EA
#define CINNABAR_ISLAND 0x01EB
#define TITLE_SCREEN_FRLG 0x01EC
#define HEALING 0x01ED
#define BICYCLE 0x01EE
#define ROCKET_ENCOUNTER 0x01EF
#define LASS_ENCOUNTER 0x01F0
#define FRLG_ENCOUNTER 0x01F1
#define HALL_OF_FAME_FRLG 0x01F2
#define VIRIDIAN_FOREST 0x01F3
#define MOUNT_MOON 0x01F4
#define ABANDONED_PLACE 0x01F5
#define THE_END_EPIC 0x01F6
#define ROUTE_1 0x01F7
#define OAKS_INTRO 0x01F8
#define ROUTE_3 0x01F9
#define ROUTE_15 0x01FA
#define INDIGO_PLATEAU 0x01FB
#define BATTLE_GYM_LEADER_FRLG 0x01FC
#define BATTLE_TRAINER_FRLG 0x01FD
#define BATTLE_WILD_FRLG 0x01FE
#define BATTLE_CHAMPION_FRLG 0x01FF
#define PALLET_TOWN 0x0200
#define OAKS_LAB 0x0201
#define OAK_ENCOUNTER 0x0202
#define POKEMON_CENTER_FRLG 0x0203
#define SS_ANNA 0x0204
#define SURFS_UP 0x0205
#define POKEMON_TOWER 0x0206
#define SILPH_CO 0x0207
#define CERULEAN_CITY 0x0208
#define CELADON_CITY 0x0209
#define TRAINER_VICTORY_FRLG 0x020A
#define WILD_VICTORY_FRLG 0x020B
#define LEADER_VICTORY_FRLG 0x020C
#define VERMILION_CITY 0x020D
#define VIRIDIAN_CITY 0x020E
#define BLUES_THEME 0x020F
#define BLUES_THEME_BIS 0x0210
#define VS_SEEKER_REGISTER 0x0211
#define OBTAINED_PARCEL 0x0212
#define CAUGHT_A_POKEMON_FRLG 0x0213
#define TRAINER_CARD_PHOTO 0x0214
#define GAMEFREAK_INTRO_FRLG 0x0215
#define WILD_VICTORY_FRLG_BIS 0x0216
#define INTRO_MESSAGE_A 0x0217
#define INTRO_MESSAGE_B 0x0218
#define INTRO_MESSAGE_C 0x0219
#define GAME_CORNER_PLUS1 0x021A
#define GAME_CORNER_PLUS2 0x021B
#define NET_CENTER 0x021C
#define MYSTERY_CONNECTION 0x021D
#define GAME_CORNER_PLUS3 0x021E
#define MOUNT_EMBER 0x021F
#define FOLLOW_ME_BIS 0x0220
#define SEVII_ISLAND_PATHS 0x0221
#define TANOBY_RUINS 0x0222
#define SAFFRON_CITY2 0x0223
#define CHERRYGROVE_CITY 0x0224
#define VIOLET_CITY 0x0225
#define POKEFLUTE_SOUND 0x0226
#define BATTLE_DEOXYS 0x0227
#define BATTLE_WILD_FRLG_PLUS2 0x0228
#define BATTLE_WILD_FRLG_PLUS2 0x0229
#define ROCKET_ENCOUNTER2 0x022A
#define DEOXYS_ENCOUNTER 0x022B
#define TRAINER_TOWER 0x022C
#define PALLET_TOWN_FAME_MIX 0x022D
#define TEACHY_TV 0x022E

/* .endsegment */

/* End defines segment */