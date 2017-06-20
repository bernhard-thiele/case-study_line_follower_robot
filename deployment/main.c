/*
 * main.c
 *
 *  Created on: Sep 29, 2016
 *      Author: parallels
 */

#include <stdarg.h>

#include "Vdm.h"
#include "Fmu.h"
#include "FmuModel.h"

#include "adcutil.h"
#include <avr/io.h>
#include <util/delay_basic.h>
#include <util/delay.h>


#define FMI_FORWARDROTATE 0
#define FMI_LEFTVAL 1
#define FMI_RIGHTVAL 2
#define FMI_SERVOLEFTOUT 3
#define FMI_SERVORIGHTOUT 5
#define FMI_BACKWARDROTATE 6
#define FMI_FORWARDSPEED 7


void fmuLoggerCache(void *componentEnvironment, fmi2String instanceName,
                    fmi2Status status, fmi2String category, fmi2String message,
                    ...) {}

int main() {
  DDRB = 0xff;
  DDRD = 0x00;
  PORTD = 0xff;
  PORTB = 0xff;

  InitADC();

  fmi2CallbackFunctions callback = {&fmuLoggerCache, NULL, NULL, NULL, NULL};
 
  //systemInit();

  //Initialize rest of the buffer.

	fmiBuffer.realBuffer[FMI_LEFTVAL] = 0.0;
	fmiBuffer.realBuffer[FMI_RIGHTVAL] = 0.0;
  fmiBuffer.realBuffer[FMI_FORWARDROTATE] = 5.0;
  fmiBuffer.realBuffer[FMI_SERVOLEFTOUT] = 0.0;
  fmiBuffer.realBuffer[FMI_SERVORIGHTOUT] = 0.0;
  fmiBuffer.realBuffer[FMI_BACKWARDROTATE] = 1.0;
  fmiBuffer.realBuffer[FMI_FORWARDSPEED] = 4.0;
  
  fmi2Component instReturn = fmi2Instantiate("this system", fmi2CoSimulation, _FMU_GUID, "", &callback, fmi2True, fmi2True);

  if(instReturn == NULL)
	return 1;

  double now = 0;
  double step = 0.01;

  while (true) {
    // hardware sync inputs to buffer
   fmiBuffer.realBuffer[FMI_LEFTVAL] = ReadADC(0);
fmiBuffer.realBuffer[FMI_RIGHTVAL] = ReadADC(1);

	//Read switch values that indicate sensor threshold crossings.
	//fmiBuffer.realBuffer[FMI_LEFTVAL] = bit_is_set(PIND, PD0) ? 200.0 : 0.0; //ReadADC(0);
    //fmiBuffer.realBuffer[FMI_RIGHTVAL] = bit_is_set(PIND, PD1) ? 200.0 : 0.0;

    fmi2DoStep(NULL, now, step, false);
	
    now = now + step;

    // sync buffer with hardware
    if (fmiBuffer.realBuffer[FMI_SERVOLEFTOUT] >= 4) {
		PORTB &= ~(1 << PINB3);
    } else {
      PORTB |= 1 << PINB3;
    }

	if (fmiBuffer.realBuffer[FMI_SERVORIGHTOUT] <= -4) {
		PORTB &= ~(1 << PINB4);
    } else {
      PORTB |= 1 << PINB4;
    }

	if (bit_is_set(PIND, PD0)) {
		PORTB &= ~(1 << PINB5);
    } else {
      PORTB |= 1 << PINB5;
    }

	if (bit_is_set(PIND, PD1)) {
		PORTB &= ~(1 << PINB6);
    } else {
      PORTB |= 1 << PINB6;
    }

    // alive indicator
    PORTB |= (1 << PINB0);
    _delay_ms(200);
    PORTB &= ~(1 << PINB0);
    _delay_ms(200);
  }

  return 0;
}
