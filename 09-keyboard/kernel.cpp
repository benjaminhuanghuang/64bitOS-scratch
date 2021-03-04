
#include "textPrint.cpp"
#include "idt.cpp"
#include "keyboard.cpp"

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
	return;
}