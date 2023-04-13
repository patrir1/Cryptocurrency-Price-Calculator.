section .text
   ;global convert
   global convert64
   global otherConvert64

; Funcion de conversion

;convert:
 ;  push   ebp
  ; mov    ebp,esp
   ;sub    esp,0x4
   ;fld    dword  [ebp+0xc]
   ;fld    dword  [ebp+0x8]
   ;fmulp  st1, st0
   ;leave
   ;ret
   

convert64:
      endbr64 
      push   rbp
      mov    rbp, rsp
      movss  [rbp-0x4], xmm0
      movss  [rbp-0x8], xmm1
      movss  xmm0, [rbp-0x4]
      mulss  xmm0, [rbp-0x8]
      pop    rbp
      ret  

otherConvert64:
      push     rbp
      mov      rbp, rsp

      ; el valor devuelto ocupa los primeros 4 bytes (float)
      fld      dword [rbp+8]     ; el primer parametro se encuentra en los siguientes 4 bytes por lo que movemos el puntero 8 posiciones
      fld      dword [rbp+28]    ; el ultimo parametro se encuentra en los ultimos 4 bytes por lo que movemos el puntero 28 posiciones
      fmulp    st1, st0
      leave
      ret