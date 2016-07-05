# case-study_line_follower_robot

## Case Study Description

This example, originally developed in the DESTECS project. The model simulates a robot that can follow a line painted on the ground. The line contrasts from the background and the robot uses a number of sensors to detect light and dark areas on the ground. The robot has two wheels, each powered by individual motors to enable the robot to make controlled changes in direction. The number and position of the sensors may be configured in the model. A controller takes input from the sensors and encoders from the wheels to make outputs to the motors. 

The robot moves through a number of phases as it follows a line. At the start of each line is a specific pattern that will be known in advance. Once a genuine line is detected on the ground, the robot follows it until it detects that the end of the line has been reached, when it should go to an idle state. 

## INTO-CPS Technology


### INTO SysML profile

The multi-model architecture, defined in the INTO-CPS SysML profile, splits the original model into three subsystems, as shown in  the Architecture Structure Diagram. This version comprises *BodyParts* and *SensorParts* subsystems and a *Controller* cyber component. The *BodyParts* subsystem, with a target platform as 20-sim as a CT model, comprises the Body, Encoder, Wheel and Motor components. The *SensorParts* subsystem contains only Sensor components. The *Controller* component remains the same as the original SysML model. 

Connections are made between the different subsystems, and the underlying components realising the source and destination of values.

### Models 

The multi-model produced and analysed using INTO-CPS technology stems from the baseline Crescendo co-model. The multi-model comprises 4 models, splitting the Crescendo model into a multi-CT model, with a single DE model. 

The Crescendo elements (a VDM-RT controller and a 20-sim plant) are largely unchanged, modified so that the 20-sim model is partitioned into 3 high-level submodels: a *body* and two models for the robot *sensors*. By modelling in this way, each submodel can be exported as a separate FMU. For the purposes of multi-modelling, we concentrate on the 20-sim Body subsystem which does not contain the sensors. In their place, the body submodel contains ports for the robot position: *robot_x*, *robot_y*, *robot_z* and *robot_theta*. The other ports  are the same as in the baseline Crescendo model (*total_energy_used*, *servo_left_input* and *servo_right_input*, *wheel_left_rotation* and *wheel_right_rotation*) for interfacing with the controller and visualisation models. The Sensor model contains a link to the map and models a single sensor, taking inputs related to the robot position (*robot_x*, *robot_y*, *robot_z* and *robot_theta*) and returning the current sensor reading(*lf_1_sensor_reading*). 

The VDM-RT controller model is unchanged from the original Crescendo controller.

An OpenModelica model has been defined to model the robot sensors - an alternative to the 20-sim sensor model - this model has the same port collection as the 20-sim version.


### Multi-Models

The case study has two multi-models, one without and one with 3D visualisation (*lfr-1* and *lfr-2* respectively). The two multi-models share several connections; with the *lfr-2* version having additional connections to the 3D visualisation FMU. 

The first collection of connections is between the Body 20-sim model and the Controller VDM-RT model. In this collection, there are several connections corresponding to signals for the actuators that power the motors for the wheels:
- from the *Controller* **servo_left** variable of type real to the **servo_left_input** port of the *Body*; and
- from the *Controller* **servo_right** variable of type real to the **servo_right_input** port of the *Body*

The second collection of connections is present between the Sensor models and the Controller VDM-RT model. For each sensor there is one connection to the controller to represent inputs from line-following sensors that can detect areas of light and dark on the ground. Therefore for a two-sensor model there are two connections:
- from the *Sensor1* **lf_1_sensor_reading** port to the *Controller* **lfLeftVal** port; and 
- from the *Sensor2* **lf_1_sensor_reading** port to the *Controller* **lfRightVal** port. 

A third collection of connections exist between the body and the sensors related to the robot position:
- from the *Body* **robot_x** port to the *Sensor1* and *Sensor2* **robot_x** port; 
- from the *Body* **robot_y** port to the *Sensor1* and *Sensor2* **robot_y** port; 
- from the *Body* **robot_z** port to the *Sensor1* and *Sensor2* **robot_z** port; and 
- from the *Body* **robot_theta** port to the *Sensor1* and *Sensor2* **robot_theta** port. 

Two design parameters are present also: the separation of the line-following sensors from the centre line, in metres (**line_follow_x**; and the distance forward of the line-following sensors from the centre of the robot, in metres (**line_follow_y**).

The final collection of connections are only present in the *lfr-2* multi-model, enabling 3D visualisation:
- from the *Body* **robot_x** port to the *3D* **animation.robot.position.x** port; 
- from the *Body* **robot_y** port to the *3D* **animation.robot.position.y** port; 
- from the *Body* **robot_theta** port to the *3D* **animation.robot.angle.z** port;
- from the *Sensor1* **lf_1_sensor_reading** port to the *3D* **animation.sensor.lf.left.reading** port; and
- from the *Sensor2* **lf_1_sensor_reading** port to the *3D* **animation.sensor.lf.left.reading** port.

### Co-simulation

For both the *lfr-1* and *lfr-2* multi-models, co-simulations require approximately 25-30 seconds of simulation to traverse the full map, using a step size of 0.01 seconds.

### Analyses and Experiments

#### Change controller/sensors

#### Sim due to previous results (may tie with previous point)

#### Design Space Exploration

