/**
* This file is generated by Overture's VDM-to-C code generator version 0.1.7-SNAPSHOT.
* Website: https://github.com/overturetool/vdm2c
*/

#ifndef CLASSES_Port_H_
#define CLASSES_Port_H_

#define VDM_CG

#include "Vdm.h"

/*  include types used in the class */
#include "Port.h"


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
 
extern TVP numFields_2;


/* -------------------------------
 *
 * The class
 *
 --------------------------------- */ 
 

/*  class id  */
#define CLASS_ID_Port_ID 1

#define PortCLASS struct Port*

/*  The vtable ids  */
#define CLASS_Port__Z8setValueE5X1QCBR 0
#define CLASS_Port__Z8getValueEV 1
#define CLASS_Port__Z4PortEV 2

struct Port
{
	
/* Definition of Class: 'Port' */
	VDM_CLASS_BASE_DEFINITIONS(Port);
	 
	VDM_CLASS_FIELD_DEFINITION(Port,numFields);

};


/* -------------------------------
 *
 * Constructors
 *
 --------------------------------- */ 
 
  
  	/* Fmi.vdmrt 18:7 */
	TVP _Z4PortEV(PortCLASS this_); 


/* -------------------------------
 *
 * public access functions
 *
 --------------------------------- */ 
 
	void Port_const_init();
	void Port_const_shutdown();
	void Port_static_init();
	void Port_static_shutdown();


/* -------------------------------
 *
 * Internal
 *
 --------------------------------- */ 
 

void Port_free_fields(PortCLASS);
PortCLASS Port_Constructor(PortCLASS);



#endif /* CLASSES_Port_H_ */
