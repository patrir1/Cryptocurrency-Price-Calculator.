section .text
    global convert64
    global otherConvert64


convert64:
      push      rbp
      mov       rbp, rsp
      sub       rsp, 0x8
      movss     [rbp-0xc], xmm0
      movss     [rbp-0x10], xmm1
      movss     xmm0, [rbp-0xc]
      mulss     xmm0, [rbp-0x10]
      ;movss     [rbp-0x08], xmm0
      leave
      ;pop       rbp
      ret  
      ;-----------------------------
      ;mulss     xmm0, xmm1
      ;ret
      ;-----------------------------
      ;push      rbp
      ;mov       rbp, rsp
      ;add       rsp, 0x4
      ;fld       dword [rbp-0x0c]
      ;fld       dword [rbp-0x08]
      ;mulss     xmm0, xmm1      ; registros donde se almacena los puntos flotantes
      ;leave
      ;ret
      

otherConvert64:
      ; Usando el stack
      push   rbp
      mov    rbp, rsp
      movss  [rbp-0x04], xmm0 ; xmm0 almacena el primer parametro 
      movss  [rbp-0x08], xmm5 ; xmm5 almacena el sexto parametro
      movss  xmm0, [rbp-0x04] ; movemos el 1er valor dentro del stack a xmm0
      mulss  xmm0, [rbp-0x08] ; multiplicamos el 6to valor dentro del stack al xmm0
      pop    rbp
      ret

      ;--------------------------------------------------
      ; Sin usar el stack
      ;mulss     xmm0, xmm5
      ;ret  