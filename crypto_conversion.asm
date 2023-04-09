global convert

section .text

; Funcion de conversion
convert:
   push   ebp
   mov    ebp,esp
   sub    esp,0x4
   fld    dword  [ebp+0xc]
   fld    dword  [ebp+0x8]
   fmulp  st1, st0
   leave
   ret