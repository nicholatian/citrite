/*****************************************************************************\
 *                                                                           * 
 *   .d8888b.  888888b.         d8888          d88P    .d8888b.  8888888888  * 
 *  d88P  Y88b 888  "88b       d88888         d88P    d88P  Y88b 888         * 
 *  888    888 888  .88P      d88P888        d88P     888    888 888         * 
 *  888        8888888K.     d88P 888       d88P      888        8888888     * 
 *  888  88888 888  "Y88b   d88P  888      d88P       888  88888 888         * 
 *  888    888 888    888  d88P   888     d88P        888    888 888         * 
 *  Y88b  d88P 888   d88P d8888888888    d88P         Y88b  d88P 888         * 
 *   "Y8888P88 8888888P" d88P     888   d88P           "Y8888P88 888         * 
 *                                                                           * 
 *                       Game Boy Advance / Game Freak                       * 
 *                           C ROM Hacking Library                           * 
 *                                                                           * 
 *                  Copyright © 2015-2016 Alexander Nicholi                  * 
 *                                                                           * 
 * Licensed under the Apache License, Version 2.0 (the “License”); you may   * 
 * not use this file except in compliance with the License. You may obtain a * 
 * copy of the License at                                                    *
 *                                                                           * 
 *     http://www.apache.org/licenses/LICENSE-2.0                            * 
 *                                                                           * 
 * Unless required by applicable law or agreed to in writing, software       * 
 * distributed under the License is distributed on an “AS IS” BASIS, WITHOUT * 
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the  * 
 * License for the specific language governing permissions and limitations   * 
 * under the License.                                                        * 
\*****************************************************************************/

#ifndef __GF_BPEE_H__
#define __GF_BPEE_H__

void boxPrint(u8 bgmaybe, u8 font, u8 x, u8 y, u32 bar, u32 baz, u32 txtpointer)
{
	int (*func3)(u8,u8,u8,u8,u32,u32,u32) = (int (*)(void))0x08199E64+1;
	func3(bgmaybe,font,x,y,bar,baz,txtpointer);
}

void writeBoxesToTilemap(u8 a, u8 b)
{
	int (*func5)(u8,u8) = (int (*)(void))0x08003659;
	func5(a,b);
}

void drawTutorialBar(u8 a, u8 b)
{
	int (*func2)(u8,u8) = (int (*)(void))0x08003C48+1;
	func2(a,b);
}

void loadTutorialText(u32 *textAddr)
{
	int (*func)(u8) = (int (*)(u32))0x08098C19;	/*load tutorial bar palette */
	loadPalette(func(2),0xB0,0x20);
	drawTutorialBar(0x0,0xFF);	
	boxPrint(0x0,0x0,0x2,0x1,instsData,0x00000000,textAddr);
	
	int (*func4)(u8) = (int (*)(void))0x0800378D;
	func4(0x0);
	
	writeBoxesToTilemap(0x0,3);
}

void reloadTutorialText(u32 *textAddr, int shortText)
{
	drawTutorialBar(0x0,0xFF);
	boxPrint(0x0,0x0,0x2,0x1,instsData,0x00000000,textAddr);
}

void initMapData(u8 *r0, u32 *r1, u8 *r2)
{
	int (*func)(u8,u32,u8) = (int (*)(void))0x080017E9;
	func(r0,r1,r2);
}

void forceNewBoxAndInitBG(u32 *addr)
{
	int (*func)(u32) = (int (*)(void))0x080031C1;
	func(addr);
}

void loadSpritePal(u32 *addr) {
	int (*func)(u32) = (int (*)(void))0x08008745;
	func(addr);
}

u32 getAttr(void* pointer, int bit) {
    u32 (*func)(void*, u32) = (u32 (*)(void*, u32))0x0806A519;
    return func(pointer, bit);
}

int div(u8 num, u8 den) {
  int (*func)(u8,u8) = (int (*)(void))0x082E7540+1;
  return func(num,den);
}

int intToStr(int offset, int num, int flag, int digits) {
  int (*func)(int,int,int,int) = (int (*)(void))0x08008CC0+1; /*flag: 0 and 4+ - nothing special */
  return func(offset,num,flag,digits);                        /*1 - offset to the right */
}                                                             /*2 - replaces empty digits with 0 (example, 2 digits would be like "009" instead of "9" */

int getItemName(int id) {
  int (*func)(int) = (int (*)(void))0x080D7474+1;
  return func(id);
}

int getItemDesc(int id) {
  int (*func)(int) = (int (*)(void))0x080D7524+1;
  return func(id);
}

int getItemID(int pocket, int position) {
  int (*func)(int,int) = (int (*)(void))0x080D6F14+1;
  return func(pocket, position);
}

int getItemIMG(int id, int imgOrPal) {
  int (*func)(int,int) = (int (*)(void))0x081AFFFC+1;
  return func(id, imgOrPal);
}

int buildStringsForPocket(int pocket) {
  int (*func)(int) = (int (*)(void))0x081AB240+1;
  return func(pocket);
}

int drawSelectionDesc(int r0) {
  int (*func)(int) = (int (*)(void))0x081AB6B0+1;
  return func(r0);
}

int gpuSyncBgShow(int bg) {
  int (*func)(int) = (int (*)(void))0x08001B30+1;
  return func(bg);
}

void loadBoxFrames() {
	int (*func)(void) = (int (*)(void))0x081AE054+1;
	func();
}

/* Common Functions */

u8 getBNibble1(u8 cScore) { return (cScore & 0b11110000) >> 4; }
u8 getBNibble2(u8 cScore) { return cScore & 0b00001111; }
u8 compressBNibbles(u8 score1, u8 score2) { return (score1 << 4) | score2; }

u8 getHNibble1(u16 hword) { return (hword & 0b1111000000000000) >> 12; }
u8 getHNibble2(u16 hword) { return (hword & 0b0000111100000000) >> 8; }
u8 getHNibble3(u16 hword) { return (hword & 0b0000000011110000) >> 4; }
u8 getHNibble4(u16 hword) { return (hword & 0b0000000000001111); }
u16 compressHNibbles(u8 nibble1, u8 nibble2, u8 nibble3, u8 nibble4) { return (((((nibble1 << 4) | nibble2) << 4) | nibble3) << 4) | nibble4; }

void makeTextTrans(int startLoc, int endLoc) {
for(int i=startLoc; i<endLoc;i++) {
    u16 hword = (*(u16*) i);
    u8 n1 = getHNibble1(hword);
    u8 n2 = getHNibble2(hword);
    u8 n3 = getHNibble3(hword);
    u8 n4 = getHNibble4(hword);
    if(n1 == 0xF) n1 = 0;
    if(n2 == 0xF) n2 = 0;
    if(n3 == 0xF) n3 = 0;
    if(n4 == 0xF) n4 = 0;
    (*(u16*) i) = compressHNibbles(n4, n3, n2, n1);
  }
}

void initStuff()
{
	storeCallback2(0);
	globalVars = malloc(0x1000);

	int blank = 0;
	DMA3Source = &blank;
	DMA3Dest = globalVars;
	DMA3Options = 0x81000040;
	for(int i=0x10;i<0x20;i+=2) changeIO(i,0);
  
	clearOAM();
	
	int (*func2)(void) = (int (*)(void))0x0800870D;
	func2();
	
	int (*func3)(u8) = (int (*)(void))0x080017BD;
	func3(0x0);
	
	const u32 mapDataUnk[2] = {
		0x000001E0, 0x000011D9
	};

	initMapData(0x1,mapDataUnk,0x2);
}

void loadText(int textboxData, int text) {
	enableBox(textboxBGInit(textboxData));
	prepTextSpace(0,0);

  loadNormalTextbox(0,1,text,0,1,0,0);
	writeBoxToTilemap(0,3);
}

void loadDefaultMsgbox() {
  loadStandardBoxBorders(532,0);
	loadMessageBoxBorders(512,0);
}

void initVideo(u16 regdispcnt) {
  REG_DISPCNT = regdispcnt;

	u32 x = 0x80 << 5;
	u32 endAddr = 0xC0 << 0x13;
	int blank = 0;

	for(u32 i = 0xC0 << 9; i > x ; i -= x, endAddr += x) {
		DMA3Source = &blank;
		DMA3Dest = endAddr;
		DMA3Options = 0x81000800;
	}
}

void zeroToDash(int textLoc) { if((*(u8*)textLoc) == 0xA1) (*(u8*)textLoc) = 0xAE; }/*"0", "-" */

void fadeIncrementG0() {
  (*(u8 *)globalVars) += 1;
  fadeScreen();
}

/* Common Constants */

const u8 textboxData[12] = { /* BG number, X pos, Y pos, width, height, palette slot, tile number (2 bytes), list terminator */
        0x00, 0x03, 0x0F, 0x18, 0x04, 0x0F, 0x94, 0x02, 0xFF, 0x0, 0x0, 0x0
};

#endif /* __GF_BPEE_H__ */
