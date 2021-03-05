
#include "textPrint.h"
#include "idt.h"
#include "keyboard.h"
#include "memMap.h"


extern const char Test[];

extern "C" void _start() {

	ClearScreen(BACKGROUND_RED | FOREGROUND_WHITE);
	PrintString(HexToString(0x1234abcd));
	PrintString("\n\r");
	PrintString("Hello world", BACKGROUND_BLINKINGBLUE | FOREGROUND_CYAN);
	SetCursorPosition(PositionFromCoords( 0, 0));

	InitializeIDT();
	PrintString(Test);

	MainKeyboardHandler = KeyboardHandler;

	for (uint_8 i =0 ; i < MemoryRegionCount; i++){
		MemoryMapEntry *memMap= (MemoryMapEntry*)0x5000;
		memMap +=i;
		PrintMemoryMap(memMap, CursorPosition);
	}

	return;
}