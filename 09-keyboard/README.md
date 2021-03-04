# Keyboard , IDT

https://www.youtube.com/watch?v=QRhFo-CnpvQ&list=PLxN4E629pPnKKqYsNVXpmCza8l0Jb6l8-&index=12&ab_channel=Poncho

https://www.youtube.com/watch?v=YoTFCATOj3w&list=PLxN4E629pPnKKqYsNVXpmCza8l0Jb6l8-&index=13&ab_channel=Poncho

Define the idt in like script
```
  .idt BLOCK(0x1000) : ALIGN(0x1000)
  {
    _idt = .;
    . = . + 0x1000;
  }
```



Remap the pic chip

