// Modulo de conexoes LCD
sbit LCD_RS at RD4_bit;
sbit LCD_EN at RD5_bit;
sbit LCD_D4 at RD0_bit;
sbit LCD_D5 at RD1_bit;
sbit LCD_D6 at RD2_bit;
sbit LCD_D7 at RD3_bit;

sbit LCD_RS_Direction at TRISD4_bit;
sbit LCD_EN_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD0_bit;
sbit LCD_D5_Direction at TRISD1_bit;
sbit LCD_D6_Direction at TRISD2_bit;
sbit LCD_D7_Direction at TRISD3_bit;

#define ad_resolution 1023 // resolucao do pic16f877a
#define vdd 5 // alimentacao ttl
#define factor 100 // fator de corrrecao do sensor LM35

#define disp_t lcd_chr(2,9,dezena+48); lcd_chr_cp(unidade+48); \
               lcd_chr_cp('.'); lcd_chr_cp(dec+48); graus(2,13);

unsigned long store, TC; // variaveis de armazenamento
unsigned char dezena, unidade, dec;

const char character[] = {6,9,6,0,0,0,0,0};

int i = 0;

void graus(char pos_row, char pos_char) {
  char i;
    Lcd_Cmd(64);
    for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Chr(pos_row, pos_char, 0);
}

void tempAlta(int i){
     RB0_bit = 1;
     RB1_bit = 0;
     RB2_bit = 0;
     RB3_bit = 0;
     if(i==1){RB3_bit = 1;}
}
void tempEstavel(){
     RB0_bit = 0;
     RB1_bit = 1;
     RB2_bit = 0;
     RB3_bit = 0;
}
void tempBaixa(){
     RB0_bit = 0;
     RB1_bit = 0;
     RB2_bit = 1;
     RB3_bit = 0;
}

void main() {
     TRISA = 0xff; // configura todo PORTA como entrada
     TRISB = 0x00; // configura todo PORTB como saida
     TRISD = 0x00; // configura todo PORTD como saida
     PORTA = 0x00; // inicializa os bits em nivel logico baixo
     PORTB = 0x00; // inicializa os bits em nivel logico baixo
     PORTD = 0x00; // inicializa os bits em nivel logico baixo
     adcon0 = 0b00000001; //seleciona pino analogico AN0

     Lcd_Init();
     Lcd_Cmd(_LCD_CLEAR);               // Clear display
     Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off

     Lcd_Out(1,1,"Temperatura:");
     
     while(1)
     {
        store = ADC_Read(0);
        TC = (store*vdd*factor)/ad_resolution;

        dezena = TC/10;
        unidade = TC % 10;
        dec = (((store*vdd*factor)%ad_resolution)*10)/ad_resolution;
        
        disp_t;
        
        if(((dezena==2)&&(unidade==4)&&(dec==0))||((dezena<=2)&&(unidade<=3)&&(dec<=9))||((dezena<=1)&&(unidade<=9)&&(dec<=9))){
          tempBaixa();
        }
        if(((dezena==2)&&(unidade==4)&&(dec>1))||((dezena==2)&&(unidade>=4)&&(dec<=9))||((dezena==3)&&(unidade<=1)&&(dec<=9))||((dezena==3)&&(unidade==2)&&(dec==0))){
          i = 0;
          tempEstavel();
        }
        if(((dezena==3)&&(unidade==2)&&(dec>1))||((dezena==3)&&((unidade>=3)&&(unidade<=4))&&(dec<=9))||((dezena==3)&&(unidade==5)&&(dec==0))){
          tempAlta(i);
        }
        if(((dezena==3)&&(unidade==5)&&(dec>1))||((dezena>=3)&&(unidade>=5)&&(dec<=9))){
          i = 1;
          tempAlta(i);
        }
        delay_ms(100);
     }
}