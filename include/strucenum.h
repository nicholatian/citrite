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
 *                          Pokémon Citrite Version                          * 
 *                              OFFICIAL Source                              * 
 *                                                                           * 
 *                  Copyright © 2014-2016 Alexander Nicholi                  * 
 *                            All rights reserved                            * 
 *                                                                           * 
\*****************************************************************************/

#ifndef __STRUCENUM_H__
#define __STRUCENUM_H__

typedef enum music : uint16_t
{
    littleroot_town_tetsuji = 0x15E,
    music_gs_route_38 = 0x15F,
    music_wild_pokemon_defeat = 0x160,
    music_wild_pokemon_defeat_intro = 0x161,
    music_gym_leader_defeat = 0x162,
    music_acquired_badge = 0x163,
    music_crystal_pokemon_center = 0x164,
    music_gs_saffron_city = 0x165,
    music_crystal_battle_ldogs = 0x166,
    music_route_theme_1 = 0x167,
    music_route_theme_2 = 0x168,
    music_route_theme_3 = 0x169,
    music_petalburg_city = 0x16A,
    music_oldale_town = 0x16B,
    music_gym_theme = 0x16C,
    music_surfing = 0x16D,
    music_caves_and_darkness = 0x16E,
    music_level_up = 0x16F,
    music_pokemon_healed = 0x170,
    music_big_victory = 0x171,
    music_acquired_item = 0x172,
    music_pokemon_caught = 0x173,
    music_got_tmhm = 0x174,
    music_lilycove_museum = 0x175,
    music_route_theme_4 = 0x176,
    music_slateport_museum = 0x177,
    music_evolve_intro = 0x178,
    music_evolving = 0x179,
    music_unknown_victory_1 = 0x17A,
    music_tuber_encounter = 0x17B,
    music_youngster_encounter = 0x17C,
    music_a_faraway_place = 0x17D,
    music_fortree_city = 0x17E,
    music_birchs_lab = 0x17F,
    music_battle_tower = 0x180,
    music_swimmer_encounter = 0x181,
    music_meteor_falls = 0x182,
    music_got_a_berry = 0x183,
    music_unknown_victory_1 = 0x184,
    music_unknown_victory_3 = 0x185,
    music_unknown_victory_4 = 0x186,
    music_pay_no_attention = 0x187,
    music_unknown_theme_1 = 0x188,
    music_beauty_contest_test_1 = 0x189,
    music_beauty_contest_test_2 = 0x18A,
    music_beauty_contest_test_3 = 0x18B,
    music_beauty_contest_test_4 = 0x18C,
    music_gentleman_encounter = 0x18D,
    music_verdanturf_town = 0x18E,
    music_rustboro_city = 0x18F,
    music_pokemon_center = 0x190,
    music_route_theme_5 = 0x191,
    music_route_theme_6 = 0x192,
    music_bicycle_ride = 0x193,
    music_pokemart = 0x194,
    music_littleroot_town = 0x195,
    music_sky_pillar = 0x196,
    music_aroma_encounter = 0x197,
    music_lilycove_city = 0x198,
    music_the_sandy_desert = 0x199,
    music_help_me = 0x19A,
    music_underwater_dive = 0x19B,
    music_trainer_defeat = 0x19C,
    music_title_screen = 0x19D,
    music_introduction = 0x19E,
    music_mays_theme = 0x19F,
    music_electric_encounter = 0x1A0,
    music_biker_encounter = 0x1A1,
    music_route_theme_7 = 0x1A2,
    music_aqua_encounter = 0x1A3,
    music_show_me_around = 0x1A4,
    music_brendans_theme = 0x1A5,
    music_ever_grande_city = 0x1A6,
    music_hex_encounter = 0x1A7,
    music_important_defeat = 0x1A8,
    music_riding_the_cable_car = 0x1A9,
    music_game_corner = 0x1AA,
    music_dewford_town = 0x1AB,
    music_safari_zone = 0x1AC,
    music_victory_road = 0x1AD,
    music_team_hideout = 0x1AE,
    music_sailing_the_sea = 0x1AF,
    music_shoal_cave = 0x1B0,
    music_slateport_city = 0x1B1,
    music_the_fog_of_mt_pyre = 0x1B2,
    music_pokemon_trainer_school = 0x1B3,
    music_youre_the_champ = 0x1B4,
    music_lavaridge_town = 0x1B5,
    music_island_cave = 0x1B6,
    music_important_2_defeat = 0x1B7,
    music_beauty_contest = 0x1B8,
    music_magma_encounter = 0x1B9,
    music_the_pokemon = 0x1BA,
    music_the_flood = 0x1BB,
    music_the_drought = 0x1BC,
    music_sootopolis_city = 0x1BD,
    music_berry_blending_results = 0x1BE,
    music_hall_of_fame = 0x1BF,
    music_youre_being_watched = 0x1C0,
    music_Kid_Encounter = 0x1C1,
    music_elite_eour_theme = 0x1C2,
    music_sailor_encounter = 0x1C3,
    music_Beauty_Contest_Lobby = 0x1C4,
    music_Whats_On_TV = 0x1C5,
    music_Unknown_Encounter = 0x1C6,
    music_Ending_Credits = 0x1C7,
    music_The_End = 0x1C8,
    music_battle_frontier = 0x1C9,
    music_battle_arena = 0x1CA,
    music_battle_point = 0x1CB,
    music_registered_trainer = 0x1CC,
    music_battle_pyramid = 0x1CD,
    music_pyramid_top = 0x1CE,
    music_battle_palace = 0x1CF,
    music_rayquaza_enters = 0x1D0,
    music_battle_tower = 0x1D1,
    music_frontier_badge = 0x1D2,
    music_dome_tournament = 0x1D3,
    music_battle_tube = 0x1D4,
    music_battle_factory = 0x1D5,
    music_battle_legendary_pokemon = 0x1D6,
    music_battle_frontier_brain = 0x1D7,
    music_battle_mew = 0x1D8,
    music_battle_dome_lobby = 0x1D9,
    music_battle_wild_pokemon = 0x1DA,
    music_battle_aqua_magma = 0x1DB,
    music_battle_trainer = 0x1DC,
    music_battle_gym_leader = 0x1DD,
    music_battle_champion = 0x1DE,
    music_battle_regis = 0x1DF,
    music_battle_legendary_pokemon = 0x1E0,
    music_battle_rival = 0x1E1,
    music_battle_elite_four = 0x1E2,
    music_battle_team_leader = 0x1E3,
    music_show_me_around_frlg = 0x1E4,
    music_game_corner_frlg = 0x1E5,
    music_evil_eurks = 0x1E6,
    music_gym_theme_frlg = 0x1E7,
    music_jigglypuffs_song = 0x1E8,
    music_introduction_frlg = 0x1E9,
    music_pokemon_theme_frlg = 0x1EA,
    music_cinnabar_island = 0x1EB,
    music_lavender_town = 0x1EC,
    music_healing_frlg = 0x1ED,
    music_bicycle_frlg = 0x1EE,
    music_encounter_1 = 0x1EF,
    music_encounter_2 = 0x1F0,
    music_encounter_3 = 0x1F1,
    music_hall_of_fame_frlg = 0x1F2,
    music_viridian_forest = 0x1F3,
    music_mount_moon = 0x1F4,
    music_abandoned_place = 0x1F5,
    music_end_credits_frlg = 0x1F6,
    music_route_theme_8 = 0x1F7,
    music_prof_oak_intro = 0x1F8,
    music_route_theme_10 = 0x1F9,
    music_route_theme_11 = 0x1FA,
    music_indigo_plateau = 0x1FB,
    music_battle_3 = 0x1FC,
    music_battle_4 = 0x1FD,
    music_battle_5 = 0x1FE,
    music_battle_6 = 0x1FF,
    music_pallet_town = 0x200,
    music_oaks_lab = 0x201,
    music_oaks_theme = 0x202,
    music_pokemon_center = 0x203,
    music_ss_anne = 0x204,
    music_surfing_frlg = 0x205,
    music_pokemon_tower = 0x206,
    music_silph_co = 0x207,
    music_cerulean_city = 0x208,
    music_celadon_city = 0x209,
    music_victory_1 = 0x20A,
    music_victory_2 = 0x20B,
    music_victory_3 = 0x20C,
    music_vermillion_city = 0x20D,
    music_viridian_city = 0x20E,
    music_garys_theme = 0x20F,
    music_garys_theme_bis = 0x210,
    music_fanfare_3 = 0x211,
    music_fanfare_4 = 0x212,
    music_caught_a_pokemon = 0x213,
    music_trainer_card_photo = 0x214,
    music_gamefreak_frlg = 0x215,
    music_victory_2_bis = 0x216,
    music_intro_message_1 = 0x217,
    music_intro_message_2 = 0x218,
    music_intro_message_3 = 0x219,
    music_game_corner_p1 = 0x21A,
    music_game_corner_p2 = 0x21B,
    music_net_center = 0x21C,
    music_mystery_connection = 0x21D,
    music_came_corner_p3 = 0x21E,
    music_mount_ember = 0x21F,
    music_show_me_around_alt = 0x220,
    music_sevii_island_paths = 0x221,
    music_tanoby_ruins = 0x222,
    music_islands_1_3 = 0x223,
    music_islands_4_5 = 0x224,
    music_islands_6_7 = 0x225,
    music_pokeflute = 0x226,
    music_battle_deoxys = 0x227,
    music_battle_5_p1 = 0x228,
    music_battle_5_p2 = 0x229,
    music_encounter_4 = 0x22A,
    music_deoxys_encounter = 0x22B,
    music_trainer_tower = 0x22C,
    music_pallet_town_fame_mix = 0x22D,
    music_teachy_tv = 0x22E
} music_t;

typedef enum darkness : uint8_t
{
    darkness_normal = 0,
    darkness_flash = 1,
    darkness_noflash = 2
} darkness_t;

typedef enum weather : uint8_t
{
    weather_inhouse = 0x0,
    weather_sunny = 0x1,
    weather_regular = 0x2,
    weather_rainy = 0x3,
    weather_three_snowflakes = 0x4,
    weather_rainy_tstorm = 0x5,
    weather_steady_mist = 0x6,
    weather_steady_snowing = 0x7,
    weather_sandstorm = 0x8,
    weather_mist_topright = 0x9,
    weather_bright_mist = 0xA,
    weather_cloudy = 0xB,
    weather_heat_wave = 0xC,
    weather_heavy_tstorm = 0xD,
    weather_underwater = 0xE,
    weather_unused = 0xF
} weather_t;

typedef enum labeltype : uint8_t
{
    donotshow = 0x0,
    show = 0x1,
    unk_2 = 0x2,
    unk_3 = 0x3,
    unk_4 = 0x4,
    unk_5 = 0x5,
    show_village = 0x6,
    unk_7 = 0x7,
    unk_8 = 0x8,
    unk_9 = 0x9,
    unk_a = 0xA,
    unk_b = 0xB,
    unk_c = 0xC,
    show_city = 0xD
    unk_e = 0xE,
    unk_f = 0xF
} labeltype_t;

typedef enum battlebg : uint8_t
{
    random = 0x0,
    gym = 0x1,
    rocket = 0x2,
    unk_3 = 0x3,
    elitefour_1 = 0x4,
    elitefour_2 = 0x5,
    elitefour_3 = 0x6,
    elitefour_4 = 0x7,
    big_red_pokeball = 0x8,
    unk_9 = 0x9,
    unk_a = 0xA,
    unk_b = 0xB,
    unk_c = 0xC,
    unk_d = 0xD,
    unk_e = 0xE,
    unk_f = 0xF
} battlebg_t;

typedef struct map_header
{
    map_footer_t* footer;
    map_entities_t* entities;
    pscript_t* lscripts;
    map_connects_t* connects;
    music_t music;
    uint16_t layout_num;
    uint8_t label_num;
    darkness_t darkness;
    weather_t weather;
    uint8_t maptype;
    uint16_t nul_0;
    labeltype_t labeltype;
    battlebg_t battlebg;
} map_header_t;

typedef struct map_footer
{
    uint32_t width;
    uint32_t height;
    uint16_t border[4];
    uint16_t* data;
    blockset_t* blockset_a;
    blockset_t* blockset_b;
} map_footer_t;

typedef struct map_entities
{
    uint8_t npc_num;
    uint8_t warp_num;
    uint8_t trigger_num;
    uint8_t sign_num;
    npc_t* npcs;
    warp_t* warps;
    trigger_t* triggers;
    sign_t* signs;
} map_entities_t;

typedef struct map_connects
{
    uint32_t count;
    map_connect_t* connects;
} map_connects_t;

typedef struct map_connect
{
    uint32_t type;
    uint32_t offset;
    uint8_t bank;
    uint8_t map;
    uint16_t nul_0;
} map_connect_t;

typedef struct npc
{
    uint8_t pid;
    uint8_t sprite;
    uint16_t nul_0;
    uint16_t x_pos;
    uint16_t y_pos;
    uint8_t height;
    uint8_t behave;
    uint16_t behaveprop;
    uint16_t bitfield_0;
    uint16_t view_rad;
    pscript_t* script;
    uint16_t visible_flag;
    uint16_t nul_1;
} npc_t;

typedef struct warp
{
    uint16_t x_pos;
    uint16_t y_pos;
    uint8_t height;
    uint8_t warp;
    uint8_t map;
    uint8_t bank;
} warp_t;

typedef struct trigger
{
    uint16_t x_pos;
    uint16_t y_pos;
    uint8_t height;
    uint8_t nul_0;
    uint16_t var;
    uint16_t value;
    uint16_t nul_1;
    pscript_t* script;
} trigger_t;

typedef struct sign
{
    uint16_t x_pos;
    uint16_t y_pos;
    uint8_t height;
    uint8_t nul_0;
    uint16_t nul_1;
    pscript_t* script;
} sign_t;

typedef struct blockset
{
    uint8_t lzss;
    uint8_t palmode;
    uint16_t nul_0;
    void* tileset;
    color_t* pals;
    void* data;
    uint8_t* behave_bg;
    void* anim_code;
} blockset_t;

#endif /* __STRUCENUM_H__ */
