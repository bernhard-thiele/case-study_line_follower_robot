within LineFollower.Components;
block Sensor

  function getResource
    output String r;
  protected 
    String s;
  algorithm
    s := Modelica.Utilities.Files.loadResource("modelica://LineFollower/Resources/Data/map.txt");
    r := s;
    // annotation(__ModelicaAssociation_Impure=true, Inline=false);
  end getResource;

  //Author: Mark D. Jackson - m.jackson3@ncl.ac.uk
  //Date  : 28/10/2015
  import Modelica.Blocks.Interfaces.RealInput;
  import Modelica.Blocks.Interfaces.RealOutput;
  parameter String fileNameMapTable(fixed = false) = getResource() "File with map data" annotation(Evaluate=false);
    
  RealInput robot_state[4] annotation (Placement(transformation(extent={{-116,-8},
            {-100,8}}), iconTransformation(extent={{-116,-8},{-100,8}})));
  RealOutput sensor_output annotation(Placement(transformation(extent={{100,-10},
            {120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  RawToReflectivity raw_to_reflectivity1 annotation (Placement(visible=true,
        transformation(
        origin={36,52},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  AmbientLight ambient_light1 annotation (Placement(visible=true,
        transformation(
        origin={36,24},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  PercentageTo8BitValue percentageto8bitvalue1 annotation(Placement(visible = true, transformation(origin = {36, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AD_8bit ad_8bit1 annotation(Placement(visible = true, transformation(origin = {36, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //response_delay response_delay1 annotation(Placement(visible = true, transformation(origin = {36, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CalculateSensorPosition calculate_sensor_position1
    annotation (Placement(visible=true, transformation(
        origin={0,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Tables.CombiTable2D combitable2d1(tableOnFile = true, fileName = fileNameMapTable, tableName = "map") annotation(Placement(visible = true, transformation(origin={10,78},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(robot_state[1], calculate_sensor_position1.robot_state[1]);
  connect(robot_state[2], calculate_sensor_position1.robot_state[2]);
  connect(robot_state[3], calculate_sensor_position1.robot_state[3]);
  connect(robot_state[4], calculate_sensor_position1.robot_state[4]);
  connect(calculate_sensor_position1.sensor_position[2], combitable2d1.u1);
  connect(calculate_sensor_position1.sensor_position[1], combitable2d1.u2);
  connect(combitable2d1.y, raw_to_reflectivity1.raw_map_reading);
  connect(raw_to_reflectivity1.reflectivity, ambient_light1.i);
  //connect(ambient_light1.o, response_delay1.i);
  //connect(response_delay1.o, percentageto8bitvalue1.i);
  connect(ambient_light1.o, percentageto8bitvalue1.i);
  connect(percentageto8bitvalue1.o, ad_8bit1.i);
  //connect output
  connect(ad_8bit1.o, sensor_output);
  annotation(experiment(StartTime = 0, StopTime = 60), Diagram(coordinateSystem(extent={{-100,
            -100},{100,100}},                                                                                        preserveAspectRatio=false,  initialScale = 0.1, grid = {2, 2}), graphics={  Line(origin = {-1.14459, 38.1769}, points = {{37.1446, 9.82305}, {37.1446, -14.1769}})}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics={Text(
          extent={{20,-20},{-22,20}},
          lineColor={0,0,255},
          textString="S"), Rectangle(extent={{-100,100},{100,-100}}, lineColor={
              0,0,255})}));
end Sensor;
