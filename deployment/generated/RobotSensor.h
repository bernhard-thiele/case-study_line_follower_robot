/**
* This file is generated by Overture's VDM-to-C code generator version 0.1.7-SNAPSHOT.
* Website: https://github.com/overturetool/vdm2c
*/

#ifndef CLASSES_RobotSensor_H_
#define CLASSES_RobotSensor_H_

#define VDM_CG

#include "Vdm.h"

/*  include types used in the class */
#include "RobotSensor.h"
#include "RealPort.h"


/* -------------------------------
 *
 * Quotes
 *
 --------------------------------- */ 
 


/* -------------------------------
 *
 * values / global const
 *
 --------------------------------- */ 
 
extern TVP numFields_1;


/* -------------------------------
 *
 * The class
 *
 --------------------------------- */ 
 

/*  class id  */
#define CLASS_ID_RobotSensor_ID 0

#define RobotSensorCLASS struct RobotSensor*

/*  The vtable ids  */
#define CLASS_RobotSensor__Z11RobotSensorE8CRealPort 0
#define CLASS_RobotSensor__Z10getReadingEV 1
#define CLASS_RobotSensor__Z11RobotSensorEV 2

struct RobotSensor
{
	
/* Definition of Class: 'RobotSensor' */
	VDM_CLASS_BASE_DEFINITIONS(RobotSensor);
	 
	VDM_CLASS_FIELD_DEFINITION(RobotSensor,port);
	VDM_CLASS_FIELD_DEFINITION(RobotSensor,numFields);

};


/* -------------------------------
 *
 * Constructors
 *
 --------------------------------- */ 
 
  
  	/* RobotSensor.vdmrt 9:8 */
	TVP _Z11RobotSensorE8CRealPort(RobotSensorCLASS this_, TVP p); 
  	/* RobotSensor.vdmrt 1:7 */
	TVP _Z11RobotSensorEV(RobotSensorCLASS this_); 


/* -------------------------------
 *
 * public access functions
 *
 --------------------------------- */ 
 
	void RobotSensor_const_init();
	void RobotSensor_const_shutdown();
	void RobotSensor_static_init();
	void RobotSensor_static_shutdown();


/* -------------------------------
 *
 * Internal
 *
 --------------------------------- */ 
 

void RobotSensor_free_fields(RobotSensorCLASS);
RobotSensorCLASS RobotSensor_Constructor(RobotSensorCLASS);



#endif /* CLASSES_RobotSensor_H_ */
