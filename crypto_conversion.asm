; Define las variables para almacenar las tasas de conversión
usd_to_ars_conversion_rate dd 96.50
usd_to_eur_conversion_rate dd 0.83

; Define las funciones que convierten de una moneda a otra
global convert_to_ars
global convert_to_usd
global convert_to_eur

section .text

; Función que convierte de USD a ARS
convert_to_ars:
   push   ebp
   mov    ebp,esp
   sub    esp,0x4
   fld    dword  [ebp+0xc]
   fld    dword  [ebp+0x8]
   fmulp st1, st0
   fstp   dword  [ebp-0x4]
   fld    dword  [ebp-0x4]
   leave
   ret

; Función que convierte de USD a USD (esto es inútil, pero está aquí como ejemplo)
convert_to_usd:
    ; Cargar el valor de USD a convertir en el coprocesador de punto flotante
    fld dword [esp+4]
    ; Cargar 1.0 en el coprocesador de punto flotante
    fld1
    ; Dividir los valores en el coprocesador de punto flotante
    fdiv dword [esp+4]
    ; Almacenar el resultado en la ubicación de memoria correspondiente en la pila
    fstp dword [esp+8]
    ; Devolver el control al código que llamó a esta función
    ret 8

; Función que convierte de USD a EUR
convert_to_eur:
    ; Cargar el valor de USD a convertir en el coprocesador de punto flotante
    fld dword [esp+4]
    ; Cargar la tasa de conversión de USD a EUR en el coprocesador de punto flotante
    fld dword [usd_to_eur_conversion_rate]
    ; Multiplicar los valores en el coprocesador de punto flotante
    fmul
    ; Almacenar el resultado en la ubicación de memoria correspondiente en la pila
    fstp dword [esp+8]
    ; Devolver el control al código que llamó a esta función
    ret 8
