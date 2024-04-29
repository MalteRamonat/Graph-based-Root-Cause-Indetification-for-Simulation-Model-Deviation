model ModVA_online_stable
/*
Documentation of Simulation Runs and changes to the model
run 1:        according to documentation to my best knowledge
result run 1: found that 1) B203 is filled much faster that B201 with B202 in the middle
              This will be due to the shorter lenght of the pipes to B203 in comparison to B201
              in reality, however it is the other way around. B201 is filled faster than B203
              This is due to the Tee no receiving as much of the fast moving water
              Thus is not modeled correctly in Modelica. I have adjusted this in reality by slightly closing the vavles above the tanks
              I will try do do something similar for the simulation in run 2.
              Hopefully I can fix this issue by installing automatic valves in the real plant
              Another issue that I found is that P202 pumps much faster than P201 in reality.
              This might be due to differences in pressure drops after the two pumps. I will try to ammend for this in run 2.
  
run 2:       reduced V204.m_flow_nominal and V205.m_flow_nominal, changed N_in for P202
result run 2:
*/
  replaceable package Medium = Modelica.Media.Water.StandardWaterOnePhase constrainedby Modelica.Media.Interfaces.PartialMedium;
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-150, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  // Tanks
  Modelica.Fluid.Examples.AST_BatchPlant.BaseClasses.TankWithTopPorts tank_B201(redeclare package Medium = Medium, V0 = 0.0001, crossArea = 0.01431355, height = 0.22, level_start = 0.15108, nPorts = 1, nTopPorts = 1, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.011, height = 0, zeta_out = 0, zeta_in = 1)}, stiffCharacteristicForEmptyPort = false) annotation(
    Placement(visible = true, transformation(origin = {-89, 31}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  Modelica.Fluid.Examples.AST_BatchPlant.BaseClasses.TankWithTopPorts tank_B202(redeclare package Medium = Medium, V0 = 0.0001, crossArea = 0.01431355, height = 0.22, level_start = 0.151, nPorts = 1, nTopPorts = 1, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.011, height = 0, zeta_out = 0, zeta_in = 1)}, stiffCharacteristicForEmptyPort = false) annotation(
    Placement(visible = true, transformation(origin = {-51, 31}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  Modelica.Fluid.Examples.AST_BatchPlant.BaseClasses.TankWithTopPorts tank_B203(redeclare package Medium = Medium, V0 = 0.0001, crossArea = 0.01431355, height = 0.22, level_start = 0.15108, nPorts = 1, nTopPorts = 1, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.011, height = 0, zeta_out = 0, zeta_in = 1)}, stiffCharacteristicForEmptyPort = false) annotation(
    Placement(visible = true, transformation(origin = {-13, 31}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  Modelica.Fluid.Examples.AST_BatchPlant.BaseClasses.TankWithTopPorts tank_B204(redeclare package Medium = Medium, V0 = 0.0001, crossArea = 0.0324, height = 0.35, level_start = 0.00136, nPorts = 1, nTopPorts = 1, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.011, height = 0, zeta_out = 0, zeta_in = 1)}, stiffCharacteristicForEmptyPort = false) annotation(
    Placement(visible = true, transformation(origin = {47, 25}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  /*                       
              Modelica.Fluid.Vessels.OpenTank tank_B201(redeclare package Medium = Medium, T_start = Modelica.Units.Conversions.from_degC(20), crossArea = 0.01431355, height = 0.22, level_start = 0.2, nPorts = 0, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.01, height = 0.22, zeta_out = 0, zeta_in = 1), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.01, height = 0.000001, zeta_out = 0, zeta_in = 1)}, use_portsData = true) annotation(
                Placement(visible = true, transformation(origin = {-88, 28}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
               
              Modelica.Fluid.Vessels.OpenTank tank_B202(redeclare package Medium = Medium, T_start = Modelica.Units.Conversions.from_degC(20), crossArea = 0.01431355, height = 0.22, level_start = 0.2, nPorts = 0, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.01, height = 0.22, zeta_out = 0, zeta_in = 1), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.01, height = 0.000001, zeta_out = 0, zeta_in = 1)}, use_portsData = true) annotation(
                Placement(visible = true, transformation(origin = {-50, 28}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
              Modelica.Fluid.Vessels.OpenTank tank_B203(redeclare package Medium = Medium, T_start = Modelica.Units.Conversions.from_degC(20), crossArea = 0.01431355, height = 0.22, level_start = 0.2, nPorts = 0, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.01, height = 0.22, zeta_out = 0, zeta_in = 1), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.01, height = 0.000001, zeta_out = 0, zeta_in = 1)}, use_portsData = true) annotation(
                Placement(visible = true, transformation(origin = {-14, 28}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
              Modelica.Fluid.Vessels.OpenTank tank_B204(redeclare package Medium = Medium, T_start = Modelica.Units.Conversions.from_degC(20), crossArea = 0.0324, height = 0.35, level_start = 0.01, nPorts = 0, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.01, height = 0.34, zeta_out = 0, zeta_in = 1), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.01, height = 0.000001, zeta_out = 0, zeta_in = 1)}, use_portsData = true) annotation(
                Placement(visible = true, transformation(origin = {46, 26}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
            */
  //Actuators
  //Valves
  Modelica.Fluid.Valves.ValveLinear V201(redeclare package Medium = Medium, dp_nominal = 20, dp_start = 0, m_flow_nominal = 0.1, m_flow_small = 0.000001, m_flow_start = 0) annotation(
    Placement(visible = true, transformation(origin = {-88, -12}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
  Modelica.Fluid.Valves.ValveLinear V202(redeclare package Medium = Medium, dp_nominal = 20, dp_start = 0, m_flow_nominal = 0.1, m_flow_small = 0.000001, m_flow_start = 0) annotation(
    Placement(visible = true, transformation(origin = {-50, -10}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
  Modelica.Fluid.Valves.ValveLinear V203(redeclare package Medium = Medium, dp_nominal = 20, dp_start = 0, m_flow_nominal = 0.1, m_flow_small = 0.000001, m_flow_start = 0) annotation(
    Placement(visible = true, transformation(origin = {-14, -8}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
  Modelica.Fluid.Valves.ValveLinear V204(redeclare package Medium = Medium, dp_nominal = 20, dp_start = 0, m_flow_nominal = 0.1, m_flow_small = 0.000001, m_flow_start = 0) annotation(
    Placement(visible = true, transformation(origin = {-14, 70}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
  Modelica.Fluid.Valves.ValveLinear V205(redeclare package Medium = Medium, dp_nominal = 20, dp_start = 0, m_flow_nominal = 0.1, m_flow_small = 0.000001, m_flow_start = 0) annotation(
    Placement(visible = true, transformation(origin = {-50, 70}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
  Modelica.Fluid.Valves.ValveLinear V206(redeclare package Medium = Medium, dp_nominal = 20, dp_start = 0, m_flow_nominal = 0.1, m_flow_small = 0.000001, m_flow_start = 0) annotation(
    Placement(visible = true, transformation(origin = {-88, 70}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
  Modelica.Fluid.Valves.ValveLinear V207(redeclare package Medium = Medium, dp_nominal = 2000, dp_start = 0, m_flow_nominal = 0.1, m_flow_small = 0.000001, m_flow_start = 0) annotation(
    Placement(visible = true, transformation(origin = {88, 28}, extent = {{6, 6}, {-6, -6}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveLinear V209(redeclare package Medium = Medium, dp_nominal = 20, dp_start = 0, m_flow_nominal = 0.1, m_flow_small = 0.000001, m_flow_start = 0) annotation(
    Placement(visible = true, transformation(origin = {120, -10}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  //Pumps
  Modelica.Fluid.Machines.PrescribedPump P201(redeclare package Medium = Medium, N_nominal = 166.43, m_flow_start = 0.000001, T_start = system.T_start, V(displayUnit = "m3") = 0.00004398128, checkValve = true, checkValveHomotopy = Modelica.Fluid.Types.CheckValveHomotopyType.Closed, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = {0.000122, 0.0002, 0.00025}, head_nominal = {2.045, 1.534, 1.022}), massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nParallel = 1, p_a_start = 100000, p_b_start = 100000, use_N_in = true) annotation(
    Placement(visible = true, transformation(origin = {-9, -55}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Fluid.Machines.PrescribedPump P202(redeclare package Medium = Medium, N_nominal = 166.43, m_flow_start = 0.000001, T_start = system.T_start, V(displayUnit = "m3") = 0.00004398128, checkValve = true, checkValveHomotopy = Modelica.Fluid.Types.CheckValveHomotopyType.Closed, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = {0.000122, 0.0002, 0.00025}, head_nominal = {2.045, 1.534, 1.022}), massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nParallel = 1, p_a_start = 100000, p_b_start = 100000, use_N_in = true) annotation(
    Placement(transformation(origin = {65, -19}, extent = {{-7, -7}, {7, 7}})));
  //Sensors
  Modelica.Fluid.Sensors.VolumeFlowRate FI201(redeclare package Medium = Medium) annotation(
    Placement(transformation(origin = {12, -26}, extent = {{-6, 6}, {6, -6}}, rotation = 90)));
  //Pipes
  Modelica.Fluid.Pipes.StaticPipe pipe_V206_B201(redeclare package Medium = Medium, diameter = 0.01, height_ab = -0.05, length = 0.15) annotation(
    Placement(visible = true, transformation(origin = {-88, 55}, extent = {{5, -5}, {-5, 5}}, rotation = 90)));
  Modelica.Fluid.Pipes.StaticPipe pipe_V205_B202(redeclare package Medium = Medium, diameter = 0.01, height_ab = -0.05, length = 0.15) annotation(
    Placement(visible = true, transformation(origin = {-50, 55}, extent = {{5, -5}, {-5, 5}}, rotation = 90)));
  Modelica.Fluid.Pipes.StaticPipe pipe_V204_B203(redeclare package Medium = Medium, diameter = 0.01, height_ab = -0.05, length = 0.15) annotation(
    Placement(visible = true, transformation(origin = {-14, 55}, extent = {{5, -5}, {-5, 5}}, rotation = 90)));
  Modelica.Fluid.Pipes.StaticPipe pipe_B201_V201(redeclare package Medium = Medium, diameter = 0.5, height_ab = -0.04, length = 0.27) annotation(
    Placement(visible = true, transformation(origin = {-88, 5}, extent = {{5, -5}, {-5, 5}}, rotation = 90)));
  Modelica.Fluid.Pipes.StaticPipe pipe_B202_V202(redeclare package Medium = Medium, diameter = 0.01, height_ab = -0.04, length = 0.27) annotation(
    Placement(visible = true, transformation(origin = {-50, 5}, extent = {{5, -5}, {-5, 5}}, rotation = 90)));
  Modelica.Fluid.Pipes.StaticPipe pipe_B203_V203(redeclare package Medium = Medium, diameter = 0.01, height_ab = -0.04, length = 0.27) annotation(
    Placement(visible = true, transformation(origin = {-14, 5}, extent = {{5, -5}, {-5, 5}}, rotation = 90)));
  Modelica.Fluid.Pipes.StaticPipe pipe_V201_Tee1(redeclare package Medium = Medium, diameter = 0.01, height_ab = 0, length = 0.19) annotation(
    Placement(visible = true, transformation(origin = {-76, -36}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe_V202_Tee2(redeclare package Medium = Medium, diameter = 0.01, height_ab = 0, length = 0.11) annotation(
    Placement(visible = true, transformation(origin = {-43, -19}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe_V203_Tee2(redeclare package Medium = Medium, diameter = 0.01, height_ab = 0, length = 0.31) annotation(
    Placement(visible = true, transformation(origin = {-19, -19}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe_Tee2_Tee1(redeclare package Medium = Medium, diameter = 0.01, height_ab = 0, length = 0.11) annotation(
    Placement(visible = true, transformation(origin = {-47, -29}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe_Tee1_P201(redeclare package Medium = Medium, diameter = 0.01, height_ab = 0, length = 0.16) annotation(
    Placement(visible = true, transformation(origin = {-37, -55}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe_P201_FI201(redeclare package Medium = Medium, diameter = 0.01, height_ab = 0.05, length = 0.05) annotation(
    Placement(visible = true, transformation(origin = {13, -45}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Fluid.Pipes.StaticPipe pipe_FI201_B204(redeclare package Medium = Medium, diameter = 0.01, height_ab = 0.405, length = 0.57) annotation(
    Placement(visible = true, transformation(origin = {13, -5}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Fluid.Pipes.StaticPipe pipe_B204_P202(redeclare package Medium = Medium, diameter = 0.01, height_ab = 0.055, length = 0.65) annotation(
    Placement(visible = true, transformation(origin = {47, -7}, extent = {{5, 5}, {-5, -5}}, rotation = 90)));
  Modelica.Fluid.Pipes.StaticPipe pipe_P202_Tee3(redeclare package Medium = Medium, diameter = 0.01, height_ab = 0.1, length = 0.1) annotation(
    Placement(transformation(origin = {81, -19}, extent = {{-5, 5}, {5, -5}})));
  Modelica.Fluid.Pipes.StaticPipe pipe_Tee3_V207(redeclare package Medium = Medium, diameter = 0.01, height_ab = 0.09, length = 0.09) annotation(
    Placement(visible = true, transformation(origin = {101, -9}, extent = {{-5, 5}, {5, -5}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe_Tee3_V209(redeclare package Medium = Medium, diameter = 0.01, height_ab = 0, length = 0.12) annotation(
    Placement(visible = true, transformation(origin = {87, 7}, extent = {{-5, 5}, {5, -5}}, rotation = 90)));
  Modelica.Fluid.Pipes.StaticPipe pipe_V207_Tee4(redeclare package Medium = Medium, diameter = 0.01, height_ab = 0.215, length = 0.44) annotation(
    Placement(visible = true, transformation(origin = {87, 49}, extent = {{-5, 5}, {5, -5}}, rotation = 90)));
  Modelica.Fluid.Pipes.StaticPipe pipe_Tee4_V204(redeclare package Medium = Medium, diameter = 0.01, height_ab = 0, length = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-15, 85}, extent = {{5, -5}, {-5, 5}}, rotation = 90)));
  Modelica.Fluid.Pipes.StaticPipe pipe_Tee4_Tee5(redeclare package Medium = Medium, diameter = 0.01, height_ab = 0, length = 0.2) annotation(
    Placement(visible = true, transformation(origin = {-31, 99}, extent = {{5, 5}, {-5, -5}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe_Tee5_V205(redeclare package Medium = Medium, diameter = 0.01, height_ab = 0, length = 0.10) annotation(
    Placement(visible = true, transformation(origin = {-49, 85}, extent = {{5, 5}, {-5, -5}}, rotation = 90)));
  Modelica.Fluid.Pipes.StaticPipe pipe_Tee5_V206(redeclare package Medium = Medium, diameter = 0.01, height_ab = 0, length = 0.30) annotation(
    Placement(visible = true, transformation(origin = {-69, 99}, extent = {{5, 5}, {-5, -5}}, rotation = 0)));
  // Fittings
  //Tees
  Modelica.Fluid.Fittings.TeeJunctionVolume Tee1(redeclare package Medium = Medium, V = 0.0000003) annotation(
    Placement(visible = true, transformation(origin = {-59, -45}, extent = {{5, -5}, {-5, 5}}, rotation = 90)));
  Modelica.Fluid.Fittings.TeeJunctionVolume Tee3(redeclare package Medium = Medium, V = 0.0000003) annotation(
    Placement(visible = true, transformation(origin = {87, -9}, extent = {{-5, 5}, {5, -5}}, rotation = 90)));
  Modelica.Fluid.Fittings.TeeJunctionVolume Tee2(redeclare package Medium = Medium, V = 0.0000003) annotation(
    Placement(visible = true, transformation(origin = {-31, -23}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Fluid.Fittings.TeeJunctionVolume Tee4(redeclare package Medium = Medium, V = 0.0000003) annotation(
    Placement(visible = true, transformation(origin = {-15, 99}, extent = {{5, 5}, {-5, -5}}, rotation = 0)));
  Modelica.Fluid.Fittings.TeeJunctionVolume Tee5(redeclare package Medium = Medium, V = 0.0000003) annotation(
    Placement(visible = true, transformation(origin = {-49, 99}, extent = {{5, 5}, {-5, -5}}, rotation = 0)));
  //Boundaries
  Modelica.Fluid.Sources.FixedBoundary boundary(redeclare package Medium = Medium, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {142, -18}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  //Signals
  //Pump Characteristics
  //Control
  //State Graph
  // Cut to reduce compilation time
  /*
                  Modelica.Blocks.Sources.RealExpression B201_level(y = tank_B201.level) annotation(
                    Placement(visible = true, transformation(origin = {-376, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
                  Modelica.Blocks.Sources.RealExpression B202_level(y = tank_B202.level) annotation(
                    Placement(visible = true, transformation(origin = {-378, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
                  Modelica.Blocks.Sources.RealExpression B203_level(y = tank_B203.level) annotation(
                    Placement(visible = true, transformation(origin = {-378, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
                  Modelica.Blocks.Sources.RealExpression B204_level(y = tank_B204.level) annotation(
                    Placement(visible = true, transformation(origin = {-378, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
                  Modelica.Blocks.Sources.BooleanExpression LA210(y = if tank_B201.level > 0.219 then true else false) annotation(
                    Placement(visible = true, transformation(origin = {-350, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
                  Modelica.Blocks.Sources.BooleanExpression LS202(y = if tank_B201.level < 0.01 then true else false) annotation(
                    Placement(visible = true, transformation(origin = {-350, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
                  Modelica.Blocks.Sources.BooleanExpression LA211(y = if tank_B202.level > 0.219 then true else false) annotation(
                    Placement(visible = true, transformation(origin = {-350, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
                  Modelica.Blocks.Sources.BooleanExpression LS203(y = if tank_B202.level < 0.01 then true else false) annotation(
                    Placement(visible = true, transformation(origin = {-350, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
                  Modelica.Blocks.Sources.BooleanExpression LA212(y = if tank_B203.level > 0.219 then true else false) annotation(
                    Placement(visible = true, transformation(origin = {-350, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
                  Modelica.Blocks.Sources.BooleanExpression LS204(y = if tank_B203.level < 0.01 then true else false) annotation(
                    Placement(visible = true, transformation(origin = {-350, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
                  Modelica.Blocks.Sources.BooleanExpression LA213(y = if tank_B204.level > 0.349 then true else false) annotation(
                    Placement(visible = true, transformation(origin = {-350, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
                  Modelica.Blocks.Sources.BooleanExpression LS205(y = if tank_B204.level > 0.175 then true else false) annotation(
                    Placement(visible = true, transformation(origin = {-350, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
                  Modelica.Blocks.Sources.BooleanExpression LS206(y = if tank_B204.level < 0.01 then true else false) annotation(
                    Placement(visible = true, transformation(origin = {-350, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
                 */
  Modelica.Blocks.Continuous.FirstOrder P201_Characteristic(T = 1, k = 100) annotation(
    Placement(visible = true, transformation(origin = {-90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder P202_Characteristic(T = 1, k = 100) annotation(
    Placement(visible = true, transformation(origin = {46, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable ActuatorControl(table = [0.666854, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0; 2.264114, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0; 4.106151, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0; 5.783177, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0; 7.447019, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0; 9.814724, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 11.754659, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 13.599756, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 15.295871, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 17.318095, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 19.074766, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 20.712872, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 23.129505, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 25.167623, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 26.984116, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 28.586626, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 30.406396, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 32.269142, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 34.052007, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 36.58265, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 38.515127, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 40.325494, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 42.094042, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 43.817702, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 45.549161, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 47.410033, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 50.095151, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 52.067417, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 53.744265, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 55.587115, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 57.363715, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 59.155736, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 61.005047, 0.0, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 63.436195, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 65.677674, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 67.560966, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 69.436265, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 71.513907, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 73.350972, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 75.293184, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 78.404312, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 80.202358, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 82.141783, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 83.814043, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 85.707245, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 87.566434, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0; 90.038029, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 92.217756, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 93.854544, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 95.676617, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 97.501968, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 99.314063, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 101.061773, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 104.026916, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 105.945619, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 107.759215, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 109.589133, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 111.436024, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 113.194939, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 115.018431, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 117.746421, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 119.591208, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 121.410771, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 123.211876, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 125.019708, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 126.841594, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 128.616877, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 131.23173, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 133.366693, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 135.050119, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 136.883837, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 138.71233, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 140.527072, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 142.243114, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 145.552872, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 147.309516, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 149.131956, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 150.741282, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 152.516386, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 154.233695, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 156.346259, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 158.719098, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 160.516454, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 162.198375, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 164.046575, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 165.878051, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 167.752968, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 169.554128, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 172.382396, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0; 173.98046, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 175.817602, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 177.584147, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 179.248814, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 180.8506, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 182.6878, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 185.319406, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 187.179768, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 189.004828, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 190.64956, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 192.509592, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 194.352724, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 196.219967, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 199.040477, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 200.725484, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 202.541335, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 204.376295, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 206.219092, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 207.99933, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 209.720573, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 212.304772, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 214.378148, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 216.144101, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 217.866007, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 219.705401, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 221.548564, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 223.414371, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 226.016638, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 227.847286, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 229.667512, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 231.461149, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 233.266878, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 235.007902, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 236.556219, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 239.152058, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 240.690333, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 242.479088, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 244.040506, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 245.829351, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 247.773196, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 249.520818, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 251.662394, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 253.629351, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 255.201461, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 256.993829, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 258.657842, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 260.380454, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 262.359694, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 265.145443, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 267.310858, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 269.107158, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 270.911712, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 272.489274, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 274.278789, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 276.028289, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 278.878051, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 280.841813, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 282.695797, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 284.544489, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 286.367064, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 288.180805, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 290.008459, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 292.615, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 294.541678, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 296.348332, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 298.130875, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 299.798388, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 301.677196, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 303.499406, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 305.968482, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 308.029571, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 309.662424, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 311.518713, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 313.322109, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 315.035305, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 316.694023, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 319.251427, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 321.281378, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 323.047602, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 324.853199, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 326.68375, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 328.4959, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 330.308528, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 332.706952, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 335.499928, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0; 337.132809, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 338.705362, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 340.48793, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 342.159027, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 343.747388, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 346.444254, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 348.240664, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 350.047771, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 351.91725, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 353.792009, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 355.56704, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 357.259334, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 359.954397, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 361.863531, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 363.63193, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 365.403944, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 367.2445, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 369.020953, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 370.669756, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 373.279925, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 375.308272, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 377.091095, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 378.825833, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 380.397725, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 382.227843, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 383.971616, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 386.391847, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 388.631872, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 390.461215, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 392.303895, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 394.082855, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 395.802631, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 398.314111, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 401.338516, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 403.133806, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 404.800972, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 406.587992, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 408.385043, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 410.154069, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 412.385694, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 414.924363, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 416.538447, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 418.362086, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 420.137205, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 421.835312, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 423.693003, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 426.142855, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 428.567123, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 430.63432, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 432.47676, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 434.303885, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 436.012996, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 437.831108, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 440.233939, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 442.347847, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 444.055039, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 445.613745, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 447.424714, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 449.137949, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 450.750491, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 453.363084, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 455.547529, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 457.38652, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 459.115137, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 460.67571, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 462.403267, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 464.03554, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 466.728878, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 469.088028, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0; 470.993791, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 472.927662, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 474.766552, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 476.568704, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 478.295913, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 481.022744, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 482.860925, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 484.469332, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 486.324138, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 488.272259, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 490.083122, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 491.906933, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 494.315967, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 496.334041, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0; 498.149002, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0; 499.896796, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 502.147907, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 503.902905, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 505.754311, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 508.251027, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 509.972587, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 511.584422, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 513.558521, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 515.423801, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 517.2658, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 519.299894, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 521.59348, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 523.75387, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 525.613032, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 527.467523, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 529.358959, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 531.153447, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 533.252802, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 535.957854, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 537.60879, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 539.414137, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 541.260321, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 543.102545, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 544.801439, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 547.130158, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 549.609897, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 551.404528, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 553.483404, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 555.298445, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 557.112744, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 558.864165, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 561.290159, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 563.226639, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 564.974444, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 566.634757, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 568.461445, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 570.228371, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 571.955945, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 574.617904, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 577.118952, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0; 578.807363, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0; 580.653431, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 582.5073, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 584.316522, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 586.124416, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 588.520033, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 590.365808, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 592.397704, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 594.12916, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 595.726273, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 597.544422, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0; 599.375498, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0])  annotation(
    Placement(transformation(origin = {-168, -10}, extent = {{-10, -10}, {10, 10}})));
equation
//Control_V201.y = if time < 5 then true else false;
  V207.opening = 1;
//  V209.opening = 0.00000001;
/*
  B204_empty.condition = if tank_B201.level > 0.219 or tank_B202.level > 0.219 or tank_B203.level > 0.219 or tank_B204.level < 0.01 then true else false;
  V201.opening = if Empty_B201.active then 1 else 0;
  V202.opening = if Empty_B202.active then 1 else 0;
  V203.opening = if Empty_B203.active then 1 else 0;
  V204.opening = if Empty_B204.active then 1 else 0;
  V205.opening = if Empty_B204.active then 1 else 0;
  V206.opening = if Empty_B204.active then 1 else 0;
  V207.opening = if Empty_B204.active then 1 else 0;
  V209.opening = 0;
  P201.N_in = if Empty_B201.active or Empty_B202.active or Empty_B203.active then 166.43 else 0.0000001;
  P202.N_in = if Empty_B204.active then 166.43 else 0.0000001;
  */
  connect(P201.port_b, pipe_P201_FI201.port_a) annotation(
    Line(points = {{-2, -54}, {14, -54}, {14, -50}}, color = {0, 127, 255}));
  connect(pipe_P201_FI201.port_b, FI201.port_a) annotation(
    Line(points = {{14, -40}, {14, -36}, {12, -36}, {12, -32}}, color = {0, 127, 255}));
  connect(FI201.port_b, pipe_FI201_B204.port_a) annotation(
    Line(points = {{12, -20}, {12, -15}, {14, -15}, {14, -10}}, color = {0, 127, 255}));
  connect(pipe_B204_P202.port_b, P202.port_a) annotation(
    Line(points = {{47, -12}, {47, -19}, {58, -19}}, color = {0, 127, 255}));
  connect(pipe_P202_Tee3.port_a, P202.port_b) annotation(
    Line(points = {{76, -19}, {72, -19}}, color = {0, 127, 255}));
  connect(pipe_V202_Tee2.port_b, Tee2.port_1) annotation(
    Line(points = {{-38, -18}, {-30, -18}}, color = {0, 127, 255}));
  connect(pipe_V203_Tee2.port_b, Tee2.port_3) annotation(
    Line(points = {{-24, -19}, {-26, -18}, {-26, -22}}, color = {0, 127, 255}));
  connect(Tee2.port_2, pipe_Tee2_Tee1.port_a) annotation(
    Line(points = {{-30, -28}, {-42, -28}}, color = {0, 127, 255}));
  connect(pipe_V201_Tee1.port_b, Tee1.port_3) annotation(
    Line(points = {{-70, -36}, {-64, -36}, {-64, -44}}, color = {0, 127, 255}));
  connect(Tee1.port_1, pipe_Tee2_Tee1.port_b) annotation(
    Line(points = {{-58, -40}, {-58, -28}, {-52, -28}}, color = {0, 127, 255}));
  connect(Tee1.port_2, pipe_Tee1_P201.port_a) annotation(
    Line(points = {{-58, -50}, {-60, -50}, {-60, -54}, {-42, -54}}, color = {0, 127, 255}));
  connect(pipe_Tee1_P201.port_b, P201.port_a) annotation(
    Line(points = {{-32, -54}, {-16, -54}}, color = {0, 127, 255}));
  connect(pipe_P202_Tee3.port_b, Tee3.port_1) annotation(
    Line(points = {{86, -19}, {88, -19}, {88, -14}}, color = {0, 127, 255}));
  connect(Tee3.port_3, pipe_Tee3_V207.port_a) annotation(
    Line(points = {{92, -8}, {96, -8}}, color = {0, 127, 255}));
  connect(Tee3.port_2, pipe_Tee3_V209.port_a) annotation(
    Line(points = {{88, -4}, {88, 2}}, color = {0, 127, 255}));
  connect(pipe_Tee5_V206.port_a, Tee5.port_2) annotation(
    Line(points = {{-64, 100}, {-54, 100}}, color = {0, 127, 255}));
  connect(Tee5.port_3, pipe_Tee5_V205.port_a) annotation(
    Line(points = {{-48, 94}, {-48, 90}}));
  connect(Tee5.port_1, pipe_Tee4_Tee5.port_b) annotation(
    Line(points = {{-44, 100}, {-36, 100}}, color = {0, 127, 255}));
  connect(pipe_Tee4_Tee5.port_a, Tee4.port_2) annotation(
    Line(points = {{-26, 100}, {-20, 100}}, color = {0, 127, 255}));
  connect(Tee4.port_3, pipe_Tee4_V204.port_a) annotation(
    Line(points = {{-14, 94}, {-14, 90}}, color = {0, 127, 255}));
  connect(Tee4.port_1, pipe_V207_Tee4.port_b) annotation(
    Line(points = {{-10, 100}, {88, 100}, {88, 54}}, color = {0, 127, 255}));
  connect(pipe_V206_B201.port_b, tank_B201.topPorts[1]) annotation(
    Line(points = {{-88, 50}, {-88, 42}}, color = {0, 127, 255}));
  connect(tank_B201.ports[1], pipe_B201_V201.port_a) annotation(
    Line(points = {{-88, 20}, {-88, 10}}, color = {0, 127, 255}));
  connect(pipe_V205_B202.port_b, tank_B202.topPorts[1]) annotation(
    Line(points = {{-50, 50}, {-50, 42}}, color = {0, 127, 255}));
  connect(tank_B202.ports[1], pipe_B202_V202.port_a) annotation(
    Line(points = {{-50, 20}, {-50, 10}}, color = {0, 127, 255}));
  connect(tank_B203.topPorts[1], pipe_V204_B203.port_b) annotation(
    Line(points = {{-12, 42}, {-14, 42}, {-14, 50}}, color = {0, 127, 255}));
  connect(tank_B203.ports[1], pipe_B203_V203.port_a) annotation(
    Line(points = {{-12, 20}, {-14, 20}, {-14, 10}}, color = {0, 127, 255}));
  connect(tank_B204.ports[1], pipe_B204_P202.port_a) annotation(
    Line(points = {{48, 14}, {48, -2}}, color = {0, 127, 255}));
  connect(pipe_FI201_B204.port_b, tank_B204.topPorts[1]) annotation(
    Line(points = {{14, 0}, {10, 0}, {10, 46}, {48, 46}, {48, 36}}, color = {0, 127, 255}));
  connect(pipe_Tee5_V206.port_b, V206.port_a) annotation(
    Line(points = {{-74, 100}, {-88, 100}, {-88, 76}}, color = {0, 127, 255}));
  connect(V206.port_b, pipe_V206_B201.port_a) annotation(
    Line(points = {{-88, 64}, {-88, 60}}, color = {0, 127, 255}));
  connect(V205.port_a, pipe_Tee5_V205.port_b) annotation(
    Line(points = {{-50, 76}, {-50, 78}, {-48, 78}, {-48, 80}}));
  connect(V205.port_b, pipe_V205_B202.port_a) annotation(
    Line(points = {{-50, 64}, {-50, 60}}, color = {0, 127, 255}));
  connect(V204.port_a, pipe_Tee4_V204.port_b) annotation(
    Line(points = {{-14, 76}, {-14, 80}}, color = {0, 127, 255}));
  connect(V204.port_b, pipe_V204_B203.port_a) annotation(
    Line(points = {{-14, 64}, {-14, 60}}, color = {0, 127, 255}));
  connect(V207.port_b, pipe_V207_Tee4.port_a) annotation(
    Line(points = {{88, 34}, {88, 44}}, color = {0, 127, 255}));
  connect(V207.port_a, pipe_Tee3_V209.port_b) annotation(
    Line(points = {{88, 22}, {88, 12}}, color = {0, 127, 255}));
  connect(V209.port_a, pipe_Tee3_V207.port_b) annotation(
    Line(points = {{114, -10}, {106, -10}, {106, -8}}));
  connect(V209.port_b, boundary.ports[1]) annotation(
    Line(points = {{126, -10}, {132, -10}, {132, -18}}, color = {0, 127, 255}));
  connect(V201.port_a, pipe_B201_V201.port_b) annotation(
    Line(points = {{-88, -6}, {-88, 0}}, color = {0, 127, 255}));
  connect(V201.port_b, pipe_V201_Tee1.port_a) annotation(
    Line(points = {{-88, -18}, {-88, -36}, {-82, -36}}, color = {0, 127, 255}));
  connect(V202.port_a, pipe_B202_V202.port_b) annotation(
    Line(points = {{-50, -4}, {-50, 0}}, color = {0, 127, 255}));
  connect(V202.port_b, pipe_V202_Tee2.port_a) annotation(
    Line(points = {{-50, -16}, {-50, -18}, {-48, -18}}, color = {0, 127, 255}));
  connect(V203.port_a, pipe_B203_V203.port_b) annotation(
    Line(points = {{-14, -2}, {-14, 0}}, color = {0, 127, 255}));
  connect(V203.port_b, pipe_V203_Tee2.port_a) annotation(
    Line(points = {{-14, -14}, {-14, -18}}, color = {0, 127, 255}));
  connect(P201_Characteristic.y, P201.N_in) annotation(
    Line(points = {{-78, -70}, {-78, -59}, {-44, -59}, {-44, -60}, {-25.5, -60}, {-25.5, -48}, {-9, -48}}, color = {0, 0, 127}));
  connect(P202_Characteristic.y, P202.N_in) annotation(
    Line(points = {{58, -70}, {58, -12}, {65, -12}}, color = {0, 0, 127}));
  connect(ActuatorControl.y[1], V201.opening) annotation(
    Line(points = {{-156, -10}, {-92, -10}, {-92, -12}}, color = {0, 0, 127}));
  connect(ActuatorControl.y[2], V202.opening) annotation(
    Line(points = {{-156, -10}, {-54, -10}}, color = {0, 0, 127}));
  connect(ActuatorControl.y[3], V203.opening) annotation(
    Line(points = {{-156, -10}, {-18, -10}, {-18, -8}}, color = {0, 0, 127}));
  connect(ActuatorControl.y[4], V204.opening) annotation(
    Line(points = {{-156, -10}, {-110, -10}, {-110, 70}, {-18, 70}}, color = {0, 0, 127}));
  connect(ActuatorControl.y[5], V205.opening) annotation(
    Line(points = {{-156, -10}, {-112, -10}, {-112, 70}, {-54, 70}}, color = {0, 0, 127}));
  connect(ActuatorControl.y[6], V206.opening) annotation(
    Line(points = {{-156, -10}, {-112, -10}, {-112, 70}, {-92, 70}}, color = {0, 0, 127}));
  connect(ActuatorControl.y[8], P201_Characteristic.u) annotation(
    Line(points = {{-156, -10}, {-134, -10}, {-134, -70}, {-102, -70}}, color = {0, 0, 127}));
  connect(ActuatorControl.y[9], P202_Characteristic.u) annotation(
    Line(points = {{-156, -10}, {-134, -10}, {-134, -70}, {34, -70}}, color = {0, 0, 127}));
  connect(ActuatorControl.y[7], V209.opening) annotation(
    Line(points = {{-156, -10}, {-134, -10}, {-134, -104}, {120, -104}, {120, -6}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")),
 //good results with IDA, max 1 Integration and 1 Processor. Still need to figure out optimal solver setup
 // cvode produces veery fast results
    Diagram(coordinateSystem(extent = {{-280, 120}, {160, -180}})),
    version = "",
    experiment(StartTime = 0, StopTime = 600, Tolerance = 1e-06, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "ida", variableFilter = ".*level|.*flow|.*opening|.*p|.*N"));
end ModVA_online_stable;