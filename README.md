# OpenMAS 
A research and simulation library for multi-agent systems. This library is concerned to provide a set of easy-to-use simulation tools for researchers in fields such as multi-agent systems, multi-robot systems, wireless sensor networks, economic networks and ecological networks.

# Level-0 interface is now avaiable

usage:
 Firstly, regist dynamic variables using global variable state. For example:
```octave
global state
state.x=unifrnd(-1,1,[2,10]);
state.theta=unifrnd(-pi,pi,[1,10]);
```
Then you have regist 10 nonholonomic particles with initial random values.

Next, you could define a global variable named 'para' to contain parameters. For example:
```octave
global para
para.c1=1;
para.c2=2;
```
Then, you should define a function to describe the differential equations. In this function, you need to claim global variables named 'state' and 'grad'. In addtion, you also need the 'para' if you need parameters. Once you regist a variable such as x and theta, then there will be automatically a grad_x and grad_theta and you have to assign values to them.
```octave
function myAlgorithm(t)
global grad state para
grad.dot_x = %some values
grad.dot_theta = %some_values;
end
```
After doing that, you need to start the simulation by a simple function 'go'. For example:
go(@myAlgorithm);

When finished, the evolution of state is recorded into a global variable 'result' and you can take the data directly by name+His. For example:
```octave
global result
result.xHis
result.thetaHis
```
---


# Features

## agent-model support 
* single-integrator particles 
* double-integrator particles 
* self-propelled particles 
* general-linear models 
(The above models will provide in the first version of this library.) 
* user-defined nonlinear models 
* two-wheels cars 
* four-wheels cars 
* quad-rotors aircraft 
* fixed-wing aircraft 
* ships 
* satellites 
* walking humans 
* smart grids 
* sellers and consumers

## communication capability support 
* sensors 
* wireless networks 
* random communication topologies 
* preset fixed communication topologies 
* switching communication topologies 
* time-varying communication topologies

## visualization support 
* 2D animation 
* 3D animation 
* GIF files support 
* video files support

## simulation methods support 
* Runge-Kutta methods 
* Fixed-step methods

## multi-levels interface 
* Level-0 interface. In this level, we provide a template including a ode45 simulation template and a fixed-step template and the user can control all the variables and to build a novel system. 
* Level-1 interface. In this level, we provide a serious of common systems and the users just take care of the algorithm parts and get rid of the details of simulation details. 
* level-2 interface. In this level, we provide a set of common agents and users can only concentrating on the distributed protocols.

# Coding style To be continued 
