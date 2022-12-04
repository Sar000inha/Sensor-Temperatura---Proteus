
_graus:

;codigo.c,29 :: 		void graus(char pos_row, char pos_char) {
;codigo.c,31 :: 		Lcd_Cmd(64);
	MOVLW      64
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;codigo.c,32 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
	CLRF       graus_i_L0+0
L_graus0:
	MOVF       graus_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_graus1
	MOVF       graus_i_L0+0, 0
	ADDLW      _character+0
	MOVWF      R0+0
	MOVLW      hi_addr(_character+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       graus_i_L0+0, 1
	GOTO       L_graus0
L_graus1:
;codigo.c,33 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;codigo.c,34 :: 		Lcd_Chr(pos_row, pos_char, 0);
	MOVF       FARG_graus_pos_row+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_graus_pos_char+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	CLRF       FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;codigo.c,35 :: 		}
L_end_graus:
	RETURN
; end of _graus

_ledVermelho:

;codigo.c,37 :: 		void ledVermelho(){
;codigo.c,38 :: 		RB0_bit = 1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;codigo.c,39 :: 		RB1_bit = 0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;codigo.c,40 :: 		RB2_bit = 0;
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
;codigo.c,41 :: 		RB3_bit = 0;
	BCF        RB3_bit+0, BitPos(RB3_bit+0)
;codigo.c,42 :: 		}
L_end_ledVermelho:
	RETURN
; end of _ledVermelho

_ledVerde:

;codigo.c,43 :: 		void ledVerde(){
;codigo.c,44 :: 		RB0_bit = 0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;codigo.c,45 :: 		RB1_bit = 1;
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
;codigo.c,46 :: 		RB2_bit = 0;
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
;codigo.c,47 :: 		RB3_bit = 0;
	BCF        RB3_bit+0, BitPos(RB3_bit+0)
;codigo.c,48 :: 		}
L_end_ledVerde:
	RETURN
; end of _ledVerde

_ledAzul:

;codigo.c,49 :: 		void ledAzul(){
;codigo.c,50 :: 		RB0_bit = 0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;codigo.c,51 :: 		RB1_bit = 0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;codigo.c,52 :: 		RB2_bit = 1;
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
;codigo.c,53 :: 		RB3_bit = 0;
	BCF        RB3_bit+0, BitPos(RB3_bit+0)
;codigo.c,54 :: 		}
L_end_ledAzul:
	RETURN
; end of _ledAzul

_ventoinha:

;codigo.c,55 :: 		void ventoinha(){
;codigo.c,56 :: 		RB0_bit = 1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;codigo.c,57 :: 		RB1_bit = 0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;codigo.c,58 :: 		RB2_bit = 0;
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
;codigo.c,59 :: 		RB3_bit = 1;
	BSF        RB3_bit+0, BitPos(RB3_bit+0)
;codigo.c,60 :: 		}
L_end_ventoinha:
	RETURN
; end of _ventoinha

_main:

;codigo.c,62 :: 		void main() {
;codigo.c,63 :: 		TRISA = 0xff; // configura todo PORTA como entrada
	MOVLW      255
	MOVWF      TRISA+0
;codigo.c,64 :: 		TRISB = 0x00; // configura todo PORTB como saida
	CLRF       TRISB+0
;codigo.c,65 :: 		TRISD = 0x00; // configura todo PORTD como saida
	CLRF       TRISD+0
;codigo.c,66 :: 		PORTA = 0x00; // inicializa os bits em nivel logico baixo
	CLRF       PORTA+0
;codigo.c,67 :: 		PORTB = 0x00; // inicializa os bits em nivel logico baixo
	CLRF       PORTB+0
;codigo.c,68 :: 		PORTD = 0x00; // inicializa os bits em nivel logico baixo
	CLRF       PORTD+0
;codigo.c,69 :: 		adcon0 = 0b00000001; //seleciona pino analogico AN0
	MOVLW      1
	MOVWF      ADCON0+0
;codigo.c,71 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;codigo.c,72 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;codigo.c,73 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;codigo.c,75 :: 		Lcd_Out(1,1,"Temperatura:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_codigo+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;codigo.c,77 :: 		while(1)
L_main3:
;codigo.c,79 :: 		store = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _store+0
	MOVF       R0+1, 0
	MOVWF      _store+1
	CLRF       _store+2
	CLRF       _store+3
;codigo.c,80 :: 		TC = (store*vdd*factor)/ad_resolution;
	MOVF       _store+0, 0
	MOVWF      R0+0
	MOVF       _store+1, 0
	MOVWF      R0+1
	MOVF       _store+2, 0
	MOVWF      R0+2
	MOVF       _store+3, 0
	MOVWF      R0+3
	MOVLW      5
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Mul_32x32_U+0
	MOVLW      100
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Mul_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+8
	MOVF       R0+1, 0
	MOVWF      FLOC__main+9
	MOVF       R0+2, 0
	MOVWF      FLOC__main+10
	MOVF       R0+3, 0
	MOVWF      FLOC__main+11
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       FLOC__main+8, 0
	MOVWF      R0+0
	MOVF       FLOC__main+9, 0
	MOVWF      R0+1
	MOVF       FLOC__main+10, 0
	MOVWF      R0+2
	MOVF       FLOC__main+11, 0
	MOVWF      R0+3
	CALL       _Div_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+4
	MOVF       R0+1, 0
	MOVWF      FLOC__main+5
	MOVF       R0+2, 0
	MOVWF      FLOC__main+6
	MOVF       R0+3, 0
	MOVWF      FLOC__main+7
	MOVF       FLOC__main+4, 0
	MOVWF      _TC+0
	MOVF       FLOC__main+5, 0
	MOVWF      _TC+1
	MOVF       FLOC__main+6, 0
	MOVWF      _TC+2
	MOVF       FLOC__main+7, 0
	MOVWF      _TC+3
;codigo.c,82 :: 		dezena = TC/10;
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       FLOC__main+4, 0
	MOVWF      R0+0
	MOVF       FLOC__main+5, 0
	MOVWF      R0+1
	MOVF       FLOC__main+6, 0
	MOVWF      R0+2
	MOVF       FLOC__main+7, 0
	MOVWF      R0+3
	CALL       _Div_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVF       R0+2, 0
	MOVWF      FLOC__main+2
	MOVF       R0+3, 0
	MOVWF      FLOC__main+3
	MOVF       FLOC__main+0, 0
	MOVWF      _dezena+0
;codigo.c,83 :: 		unidade = TC % 10;
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       FLOC__main+4, 0
	MOVWF      R0+0
	MOVF       FLOC__main+5, 0
	MOVWF      R0+1
	MOVF       FLOC__main+6, 0
	MOVWF      R0+2
	MOVF       FLOC__main+7, 0
	MOVWF      R0+3
	CALL       _Div_32x32_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R8+2, 0
	MOVWF      R0+2
	MOVF       R8+3, 0
	MOVWF      R0+3
	MOVF       R0+0, 0
	MOVWF      _unidade+0
;codigo.c,84 :: 		dec = (((store*vdd*factor)%ad_resolution)*10)/ad_resolution;
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       FLOC__main+8, 0
	MOVWF      R0+0
	MOVF       FLOC__main+9, 0
	MOVWF      R0+1
	MOVF       FLOC__main+10, 0
	MOVWF      R0+2
	MOVF       FLOC__main+11, 0
	MOVWF      R0+3
	CALL       _Div_32x32_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R8+2, 0
	MOVWF      R0+2
	MOVF       R8+3, 0
	MOVWF      R0+3
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Mul_32x32_U+0
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Div_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      _dec+0
;codigo.c,86 :: 		disp_t;
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      FLOC__main+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      48
	ADDWF      _unidade+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	MOVLW      46
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	MOVLW      48
	ADDWF      _dec+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	MOVLW      2
	MOVWF      FARG_graus_pos_row+0
	MOVLW      13
	MOVWF      FARG_graus_pos_char+0
	CALL       _graus+0
;codigo.c,88 :: 		if(((dezena==2)&&(unidade==4)&&(dec==0))||((dezena<=2)&&(unidade<=3)&&(dec<=9))||((dezena<=1)&&(unidade<=9)&&(dec<=9))){
	MOVF       _dezena+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main60
	MOVF       _unidade+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__main60
	MOVF       _dec+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main60
	GOTO       L__main57
L__main60:
	MOVF       _dezena+0, 0
	SUBLW      2
	BTFSS      STATUS+0, 0
	GOTO       L__main59
	MOVF       _unidade+0, 0
	SUBLW      3
	BTFSS      STATUS+0, 0
	GOTO       L__main59
	MOVF       _dec+0, 0
	SUBLW      9
	BTFSS      STATUS+0, 0
	GOTO       L__main59
	GOTO       L__main57
L__main59:
	MOVF       _dezena+0, 0
	SUBLW      1
	BTFSS      STATUS+0, 0
	GOTO       L__main58
	MOVF       _unidade+0, 0
	SUBLW      9
	BTFSS      STATUS+0, 0
	GOTO       L__main58
	MOVF       _dec+0, 0
	SUBLW      9
	BTFSS      STATUS+0, 0
	GOTO       L__main58
	GOTO       L__main57
L__main58:
	GOTO       L_main13
L__main57:
;codigo.c,89 :: 		ledAzul();
	CALL       _ledAzul+0
;codigo.c,90 :: 		}
L_main13:
;codigo.c,91 :: 		if(((dezena==2)&&(unidade==4)&&(dec>1))||((dezena==2)&&(unidade>=4)&&(dec<=9))||((dezena==3)&&(unidade<=1)&&(dec<=9))||((dezena==3)&&(unidade==2)&&(dec==0))){
	MOVF       _dezena+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main56
	MOVF       _unidade+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__main56
	MOVF       _dec+0, 0
	SUBLW      1
	BTFSC      STATUS+0, 0
	GOTO       L__main56
	GOTO       L__main52
L__main56:
	MOVF       _dezena+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main55
	MOVLW      4
	SUBWF      _unidade+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L__main55
	MOVF       _dec+0, 0
	SUBLW      9
	BTFSS      STATUS+0, 0
	GOTO       L__main55
	GOTO       L__main52
L__main55:
	MOVF       _dezena+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main54
	MOVF       _unidade+0, 0
	SUBLW      1
	BTFSS      STATUS+0, 0
	GOTO       L__main54
	MOVF       _dec+0, 0
	SUBLW      9
	BTFSS      STATUS+0, 0
	GOTO       L__main54
	GOTO       L__main52
L__main54:
	MOVF       _dezena+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main53
	MOVF       _unidade+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main53
	MOVF       _dec+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main53
	GOTO       L__main52
L__main53:
	GOTO       L_main24
L__main52:
;codigo.c,92 :: 		ledVerde();
	CALL       _ledVerde+0
;codigo.c,93 :: 		}
L_main24:
;codigo.c,94 :: 		if(((dezena==3)&&(unidade==2)&&(dec>1))||((dezena==3)&&((unidade>=3)&&(unidade<=4))&&(dec<=9))||((dezena==3)&&(unidade==5)&&(dec==0))){
	MOVF       _dezena+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main51
	MOVF       _unidade+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main51
	MOVF       _dec+0, 0
	SUBLW      1
	BTFSC      STATUS+0, 0
	GOTO       L__main51
	GOTO       L__main47
L__main51:
	MOVF       _dezena+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main49
	MOVLW      3
	SUBWF      _unidade+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L__main49
	MOVF       _unidade+0, 0
	SUBLW      4
	BTFSS      STATUS+0, 0
	GOTO       L__main49
L__main50:
	MOVF       _dec+0, 0
	SUBLW      9
	BTFSS      STATUS+0, 0
	GOTO       L__main49
	GOTO       L__main47
L__main49:
	MOVF       _dezena+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main48
	MOVF       _unidade+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L__main48
	MOVF       _dec+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main48
	GOTO       L__main47
L__main48:
	GOTO       L_main35
L__main47:
;codigo.c,95 :: 		ledVermelho();
	CALL       _ledVermelho+0
;codigo.c,96 :: 		}
L_main35:
;codigo.c,97 :: 		if(((dezena==3)&&(unidade==5)&&(dec>1))||((dezena>=3)&&(unidade>=5)&&(dec<=9))){
	MOVF       _dezena+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main46
	MOVF       _unidade+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L__main46
	MOVF       _dec+0, 0
	SUBLW      1
	BTFSC      STATUS+0, 0
	GOTO       L__main46
	GOTO       L__main44
L__main46:
	MOVLW      3
	SUBWF      _dezena+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L__main45
	MOVLW      5
	SUBWF      _unidade+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L__main45
	MOVF       _dec+0, 0
	SUBLW      9
	BTFSS      STATUS+0, 0
	GOTO       L__main45
	GOTO       L__main44
L__main45:
	GOTO       L_main42
L__main44:
;codigo.c,98 :: 		ledVermelho();
	CALL       _ledVermelho+0
;codigo.c,99 :: 		ventoinha();
	CALL       _ventoinha+0
;codigo.c,100 :: 		}
L_main42:
;codigo.c,101 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main43:
	DECFSZ     R13+0, 1
	GOTO       L_main43
	DECFSZ     R12+0, 1
	GOTO       L_main43
	DECFSZ     R11+0, 1
	GOTO       L_main43
	NOP
;codigo.c,102 :: 		}
	GOTO       L_main3
;codigo.c,103 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
