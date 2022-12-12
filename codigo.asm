
_graus:

;codigo.c,30 :: 		void graus(char pos_row, char pos_char) {
;codigo.c,32 :: 		Lcd_Cmd(64);
	MOVLW      64
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;codigo.c,33 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
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
;codigo.c,34 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;codigo.c,35 :: 		Lcd_Chr(pos_row, pos_char, 0);
	MOVF       FARG_graus_pos_row+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_graus_pos_char+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	CLRF       FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;codigo.c,36 :: 		}
L_end_graus:
	RETURN
; end of _graus

_tempAlta:

;codigo.c,38 :: 		void tempAlta(int i){
;codigo.c,39 :: 		RB0_bit = 1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;codigo.c,40 :: 		RB1_bit = 0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;codigo.c,41 :: 		RB2_bit = 0;
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
;codigo.c,42 :: 		RB3_bit = 0;
	BCF        RB3_bit+0, BitPos(RB3_bit+0)
;codigo.c,43 :: 		if(i==1){RB3_bit = 1;}
	MOVLW      0
	XORWF      FARG_tempAlta_i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__tempAlta64
	MOVLW      1
	XORWF      FARG_tempAlta_i+0, 0
L__tempAlta64:
	BTFSS      STATUS+0, 2
	GOTO       L_tempAlta3
	BSF        RB3_bit+0, BitPos(RB3_bit+0)
L_tempAlta3:
;codigo.c,44 :: 		}
L_end_tempAlta:
	RETURN
; end of _tempAlta

_tempEstavel:

;codigo.c,45 :: 		void tempEstavel(){
;codigo.c,46 :: 		RB0_bit = 0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;codigo.c,47 :: 		RB1_bit = 1;
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
;codigo.c,48 :: 		RB2_bit = 0;
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
;codigo.c,49 :: 		RB3_bit = 0;
	BCF        RB3_bit+0, BitPos(RB3_bit+0)
;codigo.c,50 :: 		}
L_end_tempEstavel:
	RETURN
; end of _tempEstavel

_tempBaixa:

;codigo.c,51 :: 		void tempBaixa(){
;codigo.c,52 :: 		RB0_bit = 0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;codigo.c,53 :: 		RB1_bit = 0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;codigo.c,54 :: 		RB2_bit = 1;
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
;codigo.c,55 :: 		RB3_bit = 0;
	BCF        RB3_bit+0, BitPos(RB3_bit+0)
;codigo.c,56 :: 		}
L_end_tempBaixa:
	RETURN
; end of _tempBaixa

_main:

;codigo.c,58 :: 		void main() {
;codigo.c,59 :: 		TRISA = 0xff; // configura todo PORTA como entrada
	MOVLW      255
	MOVWF      TRISA+0
;codigo.c,60 :: 		TRISB = 0x00; // configura todo PORTB como saida
	CLRF       TRISB+0
;codigo.c,61 :: 		TRISD = 0x00; // configura todo PORTD como saida
	CLRF       TRISD+0
;codigo.c,62 :: 		PORTA = 0x00; // inicializa os bits em nivel logico baixo
	CLRF       PORTA+0
;codigo.c,63 :: 		PORTB = 0x00; // inicializa os bits em nivel logico baixo
	CLRF       PORTB+0
;codigo.c,64 :: 		PORTD = 0x00; // inicializa os bits em nivel logico baixo
	CLRF       PORTD+0
;codigo.c,65 :: 		adcon0 = 0b00000001; //seleciona pino analogico AN0
	MOVLW      1
	MOVWF      ADCON0+0
;codigo.c,67 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;codigo.c,68 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;codigo.c,69 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;codigo.c,71 :: 		Lcd_Out(1,1,"Temperatura:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_codigo+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;codigo.c,73 :: 		while(1)
L_main4:
;codigo.c,75 :: 		store = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _store+0
	MOVF       R0+1, 0
	MOVWF      _store+1
	CLRF       _store+2
	CLRF       _store+3
;codigo.c,76 :: 		TC = (store*vdd*factor)/ad_resolution;
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
;codigo.c,78 :: 		dezena = TC/10;
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
;codigo.c,79 :: 		unidade = TC % 10;
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
;codigo.c,80 :: 		dec = (((store*vdd*factor)%ad_resolution)*10)/ad_resolution;
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
;codigo.c,82 :: 		disp_t;
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
;codigo.c,84 :: 		if(((dezena==2)&&(unidade==4)&&(dec==0))||((dezena<=2)&&(unidade<=3)&&(dec<=9))||((dezena<=1)&&(unidade<=9)&&(dec<=9))){
	MOVF       _dezena+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main61
	MOVF       _unidade+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__main61
	MOVF       _dec+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main61
	GOTO       L__main58
L__main61:
	MOVF       _dezena+0, 0
	SUBLW      2
	BTFSS      STATUS+0, 0
	GOTO       L__main60
	MOVF       _unidade+0, 0
	SUBLW      3
	BTFSS      STATUS+0, 0
	GOTO       L__main60
	MOVF       _dec+0, 0
	SUBLW      9
	BTFSS      STATUS+0, 0
	GOTO       L__main60
	GOTO       L__main58
L__main60:
	MOVF       _dezena+0, 0
	SUBLW      1
	BTFSS      STATUS+0, 0
	GOTO       L__main59
	MOVF       _unidade+0, 0
	SUBLW      9
	BTFSS      STATUS+0, 0
	GOTO       L__main59
	MOVF       _dec+0, 0
	SUBLW      9
	BTFSS      STATUS+0, 0
	GOTO       L__main59
	GOTO       L__main58
L__main59:
	GOTO       L_main14
L__main58:
;codigo.c,85 :: 		tempBaixa();
	CALL       _tempBaixa+0
;codigo.c,86 :: 		}
L_main14:
;codigo.c,87 :: 		if(((dezena==2)&&(unidade==4)&&(dec>1))||((dezena==2)&&(unidade>=4)&&(dec<=9))||((dezena==3)&&(unidade<=1)&&(dec<=9))||((dezena==3)&&(unidade==2)&&(dec==0))){
	MOVF       _dezena+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main57
	MOVF       _unidade+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__main57
	MOVF       _dec+0, 0
	SUBLW      1
	BTFSC      STATUS+0, 0
	GOTO       L__main57
	GOTO       L__main53
L__main57:
	MOVF       _dezena+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main56
	MOVLW      4
	SUBWF      _unidade+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L__main56
	MOVF       _dec+0, 0
	SUBLW      9
	BTFSS      STATUS+0, 0
	GOTO       L__main56
	GOTO       L__main53
L__main56:
	MOVF       _dezena+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main55
	MOVF       _unidade+0, 0
	SUBLW      1
	BTFSS      STATUS+0, 0
	GOTO       L__main55
	MOVF       _dec+0, 0
	SUBLW      9
	BTFSS      STATUS+0, 0
	GOTO       L__main55
	GOTO       L__main53
L__main55:
	MOVF       _dezena+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main54
	MOVF       _unidade+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main54
	MOVF       _dec+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main54
	GOTO       L__main53
L__main54:
	GOTO       L_main25
L__main53:
;codigo.c,88 :: 		i = 0;
	CLRF       _i+0
	CLRF       _i+1
;codigo.c,89 :: 		tempEstavel();
	CALL       _tempEstavel+0
;codigo.c,90 :: 		}
L_main25:
;codigo.c,91 :: 		if(((dezena==3)&&(unidade==2)&&(dec>1))||((dezena==3)&&((unidade>=3)&&(unidade<=4))&&(dec<=9))||((dezena==3)&&(unidade==5)&&(dec==0))){
	MOVF       _dezena+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main52
	MOVF       _unidade+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main52
	MOVF       _dec+0, 0
	SUBLW      1
	BTFSC      STATUS+0, 0
	GOTO       L__main52
	GOTO       L__main48
L__main52:
	MOVF       _dezena+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main50
	MOVLW      3
	SUBWF      _unidade+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L__main50
	MOVF       _unidade+0, 0
	SUBLW      4
	BTFSS      STATUS+0, 0
	GOTO       L__main50
L__main51:
	MOVF       _dec+0, 0
	SUBLW      9
	BTFSS      STATUS+0, 0
	GOTO       L__main50
	GOTO       L__main48
L__main50:
	MOVF       _dezena+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main49
	MOVF       _unidade+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L__main49
	MOVF       _dec+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main49
	GOTO       L__main48
L__main49:
	GOTO       L_main36
L__main48:
;codigo.c,92 :: 		tempAlta(i);
	MOVF       _i+0, 0
	MOVWF      FARG_tempAlta_i+0
	MOVF       _i+1, 0
	MOVWF      FARG_tempAlta_i+1
	CALL       _tempAlta+0
;codigo.c,93 :: 		}
L_main36:
;codigo.c,94 :: 		if(((dezena==3)&&(unidade==5)&&(dec>1))||((dezena>=3)&&(unidade>=5)&&(dec<=9))){
	MOVF       _dezena+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main47
	MOVF       _unidade+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L__main47
	MOVF       _dec+0, 0
	SUBLW      1
	BTFSC      STATUS+0, 0
	GOTO       L__main47
	GOTO       L__main45
L__main47:
	MOVLW      3
	SUBWF      _dezena+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L__main46
	MOVLW      5
	SUBWF      _unidade+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L__main46
	MOVF       _dec+0, 0
	SUBLW      9
	BTFSS      STATUS+0, 0
	GOTO       L__main46
	GOTO       L__main45
L__main46:
	GOTO       L_main43
L__main45:
;codigo.c,95 :: 		i = 1;
	MOVLW      1
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
;codigo.c,96 :: 		tempAlta(i);
	MOVLW      1
	MOVWF      FARG_tempAlta_i+0
	MOVLW      0
	MOVWF      FARG_tempAlta_i+1
	CALL       _tempAlta+0
;codigo.c,97 :: 		}
L_main43:
;codigo.c,98 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main44:
	DECFSZ     R13+0, 1
	GOTO       L_main44
	DECFSZ     R12+0, 1
	GOTO       L_main44
	DECFSZ     R11+0, 1
	GOTO       L_main44
	NOP
;codigo.c,99 :: 		}
	GOTO       L_main4
;codigo.c,100 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
