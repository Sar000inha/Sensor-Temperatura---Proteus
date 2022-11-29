// LCD module connections
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

unsigned long store, t_Celsius; // variaveis de armazenamento
unsigned char dezena, unidade, dec1, dec2;

void main() { // funcao principal
     TRISA = 0xff; // configura todo PORTA como entrada
     TRISB = 0x00; // configura todo PORTB como saida
     TRISD = 0x00; // configura todo PORTD como saida
     PORTA = 0x00; // inicializa os bits em nivel logico baixo
     PORTB = 0x00; // inicializa os bits em nivel logico baixo
     PORTD = 0x00; // inicializa os bits em nivel logico baixo
     adcon0 = 0b00000001; //seleciona pino analogico AN0

     Lcd_Init(); // inicializa lcd
     Lcd_Cmd(_LCD_Cursor_Off); // apaga cursor
     Lcd_Cmd(_LCD_CLEAR); // limpa lcd

     Lcd_Out(1,1,"Temperatura:"); // escreve na linha 1 e coluna 1 "temperatura"

     while(1)
     {
        store = ADC_Read(0);
        t_Celsius = (store*vdd*factor)/ad_resolution;
        
        dezena = t_Celsius/10;
        unidade = t_Celsius % 10;
     }

} 

/* * PORTAS DOS COMPONENTES ELETRONICOS
 - led vermelho : RB0
 - led verde : RB1
 - led azul : RB2
*/