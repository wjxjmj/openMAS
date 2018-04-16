# OpenMAS
A research and simulation library for multi-agent systems.
The first version of this library is expected to publish before 2018/06/30.

This libray is concerned to provide a set of easy-to-use simulation tools for reasearchers in fields such as multi-agent systems, multi-robot systems, wireless sensor networks, economic networks and ecological networks.

# Features

## agent-model support
* singel-integrator particles
* double-integrator particles
* self-propelled particles
* general-linear models
(The above models will provide in the first version of this library.)
* user-defined nonlinear models
* two-wheels cars
* four-wheels cars
* quad-rotors aircrafts
* fixed-wing aircrafts
* ships
* satellites
* walking humans
* smart grids
* sellers and cosumers

## Communication capability support
* sensors
* wirless networks
* random comunication topologies
* preset fixed communication topologeis
* switching communication topologies
* time-varing communication topologies

## Visualization support
* 2D annimatio
* 3D annimation
* gif files support
* video files support

## Simulation methods support
* Runge-Kutta methods
* Fixed-step methods

## Multi-levels interface
* Level-0 interface. In this level, we provide a template including a ode32 simulation template and a fixed-step template and the user can control all the variables and to build a novel system.
* Level-1 inteface. In this level, we provide a serious of common systems and the users just take care of the algorithm parts and get rid of the details of simulation details.
* level-2 inteface. In this level, we provide a set of commom agents and users can only concentrating on the distributed protocols.

# Coding style
To be continued
