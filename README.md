# DESCRIÇÃO DO PROJETO

O projeto consiste de um sistema que execute um controle de temperatura para 
mantê-la entre 24ºC e 32ºC.\
O valor da temperatura será referente ao emitido por um resistor de aquecimento. 
O valor da temperatura será variado através de um potenciômetro, para variar a 
resistência de aquecimento. O valor da temperatura será captado pelo sensor de 
temperatura LM35 que está localizado ao lado do resistor de aquecimento. O valor
atual de temperatura, em graus celsius (ºC), deverá ser mostrado no display LCD.
O valor da temperatura deve ser confirmado por um termômetro contido num 
multímetro. Deve-se comparar o valor de temperatura exibido no LCD com o valor 
medido pelo multímetro.\
Enquanto a temperatura se mantiver entre 24ºC e 32ºC, um led verde deve ser 
mantido aceso. Se a temperatura ultrapassar o valor de 32 ºC, um led vermelho 
deve ser ligado. Caso a temperatura esteja abaixo de 24 ºC, um led azul deve ser 
ligado.\
Quando a temperatura atingir o valor de 35 ºC a ventoinha deve ser acionada para 
resfriar o resistor de aquecimento até que a temperatura volte a ficar menor ou igual 
a 32 ºC, quando então, a ventoinha será automaticamente desligada e o led verde 
ligado novamente.

# MATERIAIS E DISPOSITIVOS UTILIZADOS
* Sensor de temperatura LM35;
* Display LCD;
* LEDs;
* Gravador de microcontrolador PIC16F877A;
* Simulador de circuitos eletrônicos Proteus;
* Compilador em linguagem C MikroC;
