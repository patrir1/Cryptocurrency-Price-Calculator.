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
      movss  [rbp-0x18], xmm1
      movss  xmm0, [rbp-0x4]
      mulss  xmm0, [rbp-0x18]
      pop    rbp
      ret  

otherConvert64:
      endbr64 
      push   rbp
      mov    rbp, rsp
      movss  [rbp-0x04], xmm0
      movss  [rbp-0x18], xmm5
      movss  xmm0, [rbp-0x04]
      mulss  xmm0, [rbp-0x18]
      pop    rbp
      ret  