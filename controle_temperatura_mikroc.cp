#line 1 "C:/Users/sarah/OneDrive/Documentos/MicMic/Sensor-Temperatura---Proteus/controle_temperatura_mikroc.c"

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





unsigned long store, t_Celsius;
unsigned char dezena, unidade, dec1, dec2;

void main() {
 TRISA = 0xff;
 TRISB = 0x00;
 TRISD = 0x00;
 PORTA = 0x00;
 PORTB = 0x00;
 PORTD = 0x00;
 adcon0 = 0b00000001;

 void Lcd_Init
 Lcd_Cmd(_LCD_Cursor_Off);
 Lcd_Cmd(_LCD_CLEAR);

 Lcd_Out(1,1,"Temperatura:");

 while(1)
 {
 store = ADC_Read(0);
 t_Celsius = (store* 5 * 100 )/ 1023 ;

 dezena = t_Celsius/10;
 unidade = t_Celsius % 10;
 }

}
