# Root-Cause Identification in Simulation Models

## Overview

This repository hosts the implementation of an automated method for root-cause identification of deviations between simulation model outputs and real plant data, aimed at enhancing the accuracy of simulation models for both model calibration and plant diagnosis. The approach employs an Adaptive Causal Directed Graph (ACDG) which integrates structural plant information, dynamic data, and first-principle knowledge to systematically identify parameters with significant causal influence on observed deviations.
> **Note:** This Repository is still under development. Scripts and models will be uploaded as soon as the publication process is completed.

## Method

The proposed method for root-cause identification of deviations between simulation model output and plant data employs an Adaptive Causal Directed Graph. It automates the identification of root causes by leveraging both the plant structure, based on AutomationML plant model, and causal inference, based on a first-principle ruleset.
The key steps of the method are:
### Graph Construction

1. **Static Data Integration**:
   - The graph is constructed using vertices representing state variables and parameters of the simulation model and the real plant. Vertices are extracted from the AutomationML plant model. State variable vertices and parameter vertices are created by parsing the Attributes of each InternalElement of the InstanceHierarchy of the AutomationML file.
   - Edges between vertices are created based on a first-principle ruleset, which itself is based on formulae from thermodynamics and fluid mechanics. The ruleset is applied to all InternalElement Attributes. The full rule set will be published after the publication process is complete.

2. **Dynamic Data Integration**:
   - Time series data from sensors and actuators, along with simulation output, are integrated into the graph. This data influences the structure of the graph dynamically, as e.g. product flow might be prevented at certain time steps due to acutator positions.
   - At each time step, deviations between the observed data and the model output are calculated. These deviations are mapped onto the corresponding vertex in the graph.

### Causal Analysis

1. **Parameter Influence Analysis**:
   - The method calculates the causal influence of each parameter on the deviations observed. This includes assessing the direction and magnitude of influence each parameter has on state variables.

2. **Reciprocal Influence Analysis**:
   - The method considers the reciprocal influences between (both observable and unobservable) state variables, ensuring that the dynamic interdependencies within the plant are accounted for in the analysis.

3. **Root-Cause Identification**:
   - Causal influences across the graph are calculated by a modified dijkstra algorithm and cumulated over time.
   - The method provides a ranked list of parameters based on their causal influence on the deviations, highlighting the areas that require attention for model calibration or plant diagnosis.

## Implementation

### Simulation Model

The simulation model used for validation of this method is based on the Modelica language, simulating a fluid mixing process plant. 
The Modelica Standard Library is used for the modelling of fluid components.
Th model includes a control matrix that reflects real-time actuator feedback from the physical plant.
The model comprises 55 components and 152 parameters, representing potential root causes for observable deviations.

### Test Cases

The test cases used in this repository are generated from the simulation model. 
The dataset "Testcases/ModVA_online_stable_res_original.csv" represents the plant in normal operating mode. 
All other test cases represent parameter alterations. For each test case deviations to the aforementioned dataset are calculated.
These test cases serve as a basis for validating the effectiveness of the root-cause identification method.

## Repository Structure

- `srcipts/`: Contains all script files for the implementation of the root-cause identification method.
>**Note**: Scripts will be uploaded as soon as the publication process is completed.
- `models/`: Contains the Modelica model and the AutomationML model of the plant. 
- `testcases/`: Includes deviation datasets generated from the simulation.
- `docs/`: Documentation of first-principle rules, Mapping information between simulation and AutomationML file and overview of Test Cases.
>**Note**: Rule set will be uploaded as soon as the publication process is completed.

## Reference

For more details on the methodology, validation, and implications of this research, please refer to our paper:

>**Note**: The proposed method and implementation is currently in the process of being published



## License

This project is licensed under the terms of the MIT license.