#pragma once
#include "typedefs.h"
#include "io.cpp"

#define VGA_MEMORY (uint_8*)0xb8000
#define VGA_WIDTH 80
uint_16 CursorPosition;


void SetCursorPosition(uint_16 position){

  outb(0x3D4, 0x0F);
  outb(0x3D5, (uint_8)(position & 0xFF));
  outb(0x3D4, 0x0E);
  outb(0x3D5, (uint_8)((position >> 8) & 0xFF));

  CursorPosition = position;
}
