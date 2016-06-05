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

/* Engine functions */

setvar                                         = 0x809D6B0|1;
random_                                        = 0x806F620|1;
oam_rotate                                     = 0x80A71B4|1;
malloc                                         = 0x8000B38|1;
calloc                                         = 0x8000B4C|1;
free                                           = 0x8000B60|1;
exit_to_ow_                                    = 0x8003604|1;
task_exec                                      = 0x80A910C|1;
objc_exec                                      = 0x80069C0|1;
obj_sync_something                             = 0x8006A0C|1;
fade_and_return_progress_probably              = 0x80A1A1C|1;
gpu_sprites_upload                             = 0x8007188|1;
copy_queue_process                             = 0x800742C|1;
gpu_pal_upload                                 = 0x80A19C0|1;
fade_screen                                    = 0x80A1AD4|1;
load_objgfx                                    = 0x80084F8|1;
load_compressed_objgfx                         = 0x8034988|1;
LZ77UnCompAnyRam                               = 0x8034A08|1;
play_fanfare                                   = 0x80A30E4|1;
wait_fanfare                                   = 0x80A3120|1;
play_sound                                     = 0x80A37A4|1;
play_cry                                       = 0x80A3404|1;
wait_sound                                     = 0x80A38A0|1;
lcd_io_set                                     = 0x80010B4|1;
gpu_sync_bg_show                               = 0x8001B30|1;
set_callback2                                  = 0x8000540|1;
vblank_handler_set                             = 0x80006F0|1;
textbox_bg_init                                = 0x80031C0|1;
box_border_load_tiles_and_pal                  = 0x80987BC|1;
box_curved_1_load_tiles_and_pal                = 0x809877C|1;
enable_rbox                                    = 0x800378C|1;
template_instanciate_forward_search            = 0x8006DF4|1;
gpu_pal_apply                                  = 0x80A1938|1;
is_c1_link_related_active                      = 0x8085D8C|1;
sub_08087598                                   = 0x8087598|1;
vblank_hblank_handler_set_zero                 = 0x8121E68|1;
clear_io_regs_maybe                            = 0x8121DA0|1;
tilemaps_sync_none                             = 0x81999A8|1;
dma_task_delete_something                      = 0x8009FB8|1;
boot_fade_sequence                             = 0x80A1A74|1;
obj_and_aux_reset_all                          = 0x8006974|1;
gpu_pal_allocator_reset                        = 0x800870C|1;
tasks_init                                     = 0x80A8F50|1;
pokeparty_enum_sth                             = 0x81B209C|1;
sub_081B04F8                                   = 0x81B04F8|1;
sub_081B01CC                                   = 0x81B01CC|1;
sub_081B01B0                                   = 0x81B01B0|1;
task_add                                       = 0x80A8FB0|1;
rboxid_clear_pixels                            = 0x8003C48|1;
sub_080045B0                                   = 0x80045B0|1;
sub_0809882C                                   = 0x809882C|1;
sub_080017BC                                   = 0x80017BC|1;
bg_vram_setup                                  = 0x80017E8|1;
bgid_set_tilemap                               = 0x8002250|1;
sub_08121E10                                   = 0x8121E10|1;
bgid_mark_for_sync                             = 0x81999BC|1;
gpu_tile_obj_decompress_alloc_tag_and_upload_2 = 0x8034530|1;
gpu_tile_obj_decompress_alloc_tag_and_upload_3 = 0x803458C|1;
gpu_pal_obj_alloc_tag_and_apply                = 0x8008744|1;
pokemenu_get_pokedata                          = 0x81B0DE8|1;
pokemenu_set_bg_maybe                          = 0x81B0F28|1;
pokemenu_showmsg_maybe                         = 0x81B2428|1;
sub_081B3054                                   = 0x81B3054|1;
pokemenu_get_pokeattr_something                = 0x81B314C|1;
song_play_and_auto_config                      = 0x82E0130|1;
c3_tutorial_oak_boy_girl                       = 0x80AA67C|1;
sub_080AAB44                                   = 0x80AAB44|1;
sub_080AA780                                   = 0x80AA780|1;
sub_0816F2A8                                   = 0x816F2A8|1;
sub_080AAB2C                                   = 0x80AAB2C|1;
sub_080BA384                                   = 0x80BA384|1;
bgid_mod_x_offset                              = 0x8001D04|1;
bgid_mod_y_offset                              = 0x8001E7C|1;
load_rbox_tiles_addr                           = 0x8098758|1;
gpu_copy_to_tileset                            = 0x8001944|1;
put_text_on_tilemap_maybe                      = 0x80BAB68|1;
sub_081DB368                                   = 0x81DB368|1;
font_get_width_of_string                       = 0x8005ED8|1;
optsmenu_tilemap_load_sth2                     = 0x80BB0D0|1;
optsmenu_tilemap_load_sth                      = 0x80BB104|1;
optsmenu_tilemap_sth                           = 0x80BB154|1;
optsmenu_load_highlight_overlay                = 0x80BAB38|1;
rboxid_to_vram                                 = 0x8003658|1;
load_rbox_tiles_addr                           = 0x8098758|1;
optsmenu_change_item_addtask                   = 0x80BA83C|1;
optsmenu_loadtext_textspeed                    = 0x80BAC38|1;
optsmenu_loadtext_battlescene                  = 0x80BAD08|1;
optsmenu_loadtext_battlestyle                  = 0x80BAD84|1;
optsmenu_loadtext_sound                        = 0x80BAE08|1;
optsmenu_loadtext_buttons                      = 0x80BB028|1;
optsmenu_loadtext_menustyle                    = 0x80BAF0C|1;

/* BIOS Functions */

LZ77UnCompVram   = 0x82E708C|1;
LZ77UnCompWram   = 0x82E7078|1;
memcpy           = 0x82E93D4|1;
memset           = 0x82E9434|1;
CpuSet           = 0x82E7084|1;
Div              = 0x82E7088|1;
ArcTan2          = 0x82E7078|1;
BgAffineSet      = 0x82E707C|1;
CpuFastSet       = 0x82E7080|1;
MultiBoot        = 0x82E7094|1;
ObjAffineSet     = 0x82E709C|1;
RegisterRamReset = 0x82E70A8|1;
Sqrt             = 0x82E70C4|1;
VBlankIntrWait   = 0x82E70C8|1;
__udivsi3        = 0x82E7B68|1;
__umodsi3        = 0x82E7BE0|1;
