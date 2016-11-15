within LineFollower.Examples;
model TestRobot

  Components.Robot robot annotation (Placement(transformation(extent={{20,-30},{80,30}})));
  Modelica.Blocks.Sources.Sine sine1(freqHz=0.1)
    annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  Modelica.Blocks.Sources.Constant const3(k=0)
    annotation (Placement(transformation(extent={{-60,-80},{-40,-60}})));
  Modelica.Blocks.Continuous.Integrator integrator1 annotation(Placement(visible = true, transformation(origin={-50,50},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 0.01) annotation(Placement(visible = true, transformation(origin={-90,50},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const2(k=0)
    annotation (Placement(transformation(extent={{-60,-50},{-40,-30}})));
  Modelica.Blocks.Interfaces.RealOutput sensor_value[5]
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  connect(const1.y,integrator1. u) annotation(Line(points={{-79,50},{-62,50}},                 color = {0, 0, 127}));
  connect(integrator1.y, robot.robot_state[1]) annotation (Line(
      points={{-39,50},{-12,50},{-12,-2.25},{17,-2.25}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const3.y, robot.robot_state[4]) annotation (Line(
      points={{-39,-70},{-12,-70},{-12,2.25},{17,2.25}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sine1.y, robot.robot_state[2]) annotation (Line(
      points={{-39,10},{-12,10},{-12,-0.75},{17,-0.75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const2.y, robot.robot_state[3]) annotation (Line(
      points={{-39,-40},{-12,-40},{-12,0.75},{17,0.75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(robot.sensor_value, sensor_value) annotation (Line(
      points={{83,0},{110,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation(experiment(StartTime = 0, StopTime = 60), Icon(coordinateSystem(extent={{-100,
            -100},{100,100}},                                                                                     preserveAspectRatio=false,  initialScale = 0.1, grid = {2, 2}),
        graphics={Text(
          extent={{-20,20},{20,-20}},
          lineColor={0,0,255},
          textString="TestRobot"), Rectangle(extent={{-100,100},{100,-100}},
            lineColor={0,0,255})}),                                                                                             Diagram(coordinateSystem(extent={{-100,
            -100},{100,100}},                                                                                                    preserveAspectRatio=false,  initialScale = 0.1, grid = {2, 2}),
        graphics));
end TestRobot;
