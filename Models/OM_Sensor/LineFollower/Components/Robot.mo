within LineFollower.Components;
model Robot
  //Author: Mark D. Jackson - m.jackson3@ncl.ac.uk
  //Date  : 28/10/2015
  import Modelica.Blocks.Interfaces.RealInput;
  import Modelica.Blocks.Interfaces.RealOutput;
  import .LineFollower.Components.Sensor;
  //input and outputs
  //Real robot_state[4] = {0.138, -0.08, 0, 0};
  RealInput robot_state[4] annotation (Placement(transformation(extent={{-120,-10},
            {-100,10}}), iconTransformation(extent={{-120,-10},{-100,10}})));
  Sensor sensor1 annotation(Placement(visible = true, transformation(origin={0,60},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensor sensor2 annotation(Placement(visible = true, transformation(origin={0,30},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensor sensor3 annotation(Placement(visible = true, transformation(origin={0,0},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensor sensor4 annotation(Placement(visible = true, transformation(origin={0,-30},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensor sensor5 annotation(Placement(visible = true, transformation(origin={0,-60},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  RealOutput sensor_value[5]
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  //Connect Inputs
  connect(robot_state, sensor1.robot_state) annotation (Line(
      points={{-110,0},{-56,0},{-56,60},{-10.8,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(robot_state, sensor2.robot_state) annotation (Line(
      points={{-110,0},{-56,0},{-56,30},{-10.8,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(robot_state, sensor3.robot_state) annotation (Line(
      points={{-110,0},{-10.8,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(robot_state, sensor4.robot_state) annotation (Line(
      points={{-110,0},{-56,0},{-56,-30},{-10.8,-30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(robot_state, sensor5.robot_state) annotation (Line(
      points={{-110,0},{-56,0},{-56,-60},{-10.8,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  //Connect Outputs
  connect(sensor1.sensor_output, sensor_value[1]) annotation (Line(
      points={{11,60},{56,60},{56,-8},{110,-8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sensor2.sensor_output, sensor_value[2]) annotation (Line(
      points={{11,30},{56,30},{56,-4},{110,-4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sensor3.sensor_output, sensor_value[3]) annotation (Line(
      points={{11,0},{110,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sensor4.sensor_output, sensor_value[4]) annotation (Line(
      points={{11,-30},{56,-30},{56,4},{110,4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sensor5.sensor_output, sensor_value[5]) annotation (Line(
      points={{11,-60},{56,-60},{56,8},{110,8}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation(experiment(StartTime = 0, StopTime = 60), Icon(coordinateSystem(extent={{-100,
            -100},{100,100}},                                                                                     preserveAspectRatio=false,  initialScale = 0.1, grid = {2, 2}),
        graphics={Text(
          extent={{-20,20},{20,-20}},
          lineColor={0,0,255},
          textString="R"), Rectangle(extent={{-100,100},{100,-100}},
            lineColor={0,0,255})}),                                                                                             Diagram(coordinateSystem(extent={{-100,
            -100},{100,100}},                                                                                                    preserveAspectRatio=false,  initialScale = 0.1, grid = {2, 2}),
        graphics));
end Robot;
