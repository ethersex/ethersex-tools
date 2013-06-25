This script controls a fan which is attached to PORTD, PIN7 using the
PWM function of Timer2. The scripts reads the temperature of a 1wire
sensor and adjusts the fanspeed accordingly.

* Below 28.2 Celcius, the fan is off (cooling does not make sense in most
applications where room temperature ~= component temperature)
* Above 60.0 Celcius, PWM is 255, which results in maximum fanspeed.
* Between 28.2 - 60.0 Celcius, the speed is linear

Steps:

1. Connect the gate pin of the FET to PD7
2. Change the 1wire identifier
3. Change active high/low
