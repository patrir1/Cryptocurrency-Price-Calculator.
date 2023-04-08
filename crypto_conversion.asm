section .data
    usd_to_ars_conversion_rate dd 96.50
    usd_to_eur_conversion_rate dd 0.83

global convert_to_ars
global convert_to_usd
global convert_to_eur

section .text

convert_to_ars:
    fld dword [esp+4]
    fld dword [usd_to_ars_conversion_rate]
    fmul
    fstp dword [esp+8]
    ret 8

convert_to_usd:
    fld dword [esp+4]
    fld1
    fdiv dword [esp+4]
    fstp dword [esp+8]
    ret 8

convert_to_eur:
    fld dword [esp+4]
    fld dword [usd_to_eur_conversion_rate]
    fmul
    fstp dword [esp+8]
    ret 8
