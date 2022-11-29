
_main:

;controle_temperatura_mikroc.c,17 :: 		void main() {
;controle_temperatura_mikroc.c,18 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;controle_temperatura_mikroc.c,19 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;controle_temperatura_mikroc.c,20 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;controle_temperatura_mikroc.c,21 :: 		PORTD = 0x00;
	CLRF       PORTD+0
;controle_temperatura_mikroc.c,22 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
