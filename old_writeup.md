=======
#16-711: Kinematics, Dynamic Systems, and Control#
- Spring 2017
- HW1
- Team members: 
   - Guan-Horng Liu (guanhorl@andrew.cum.edu)
   - Arpit Agarwal (arpita1@andrew.cmu.edu)

##Usage##
- Run the script ```main```.
- Global variables:
   - ```method```: algorithm for solving optimization problem. 
   - ```localMin```: enable multiple local minimums searching in part 4.
NOTE: Matlab version is  2016a
##Problem Set##


###Part 1###
- Based on the original template code, several further optimizations were done. Including
   1. Global variable ```posLink```, which represents the end-point ```(x,y,z)``` position of each link in global frame, was directly stored at the time when we solved forward kinematic. Such variable is directly used in ```draw3()``` function for visualization.

   2. Usage of matrix representation of 3D Euler rotation matrix in function ```build_rotation_matrix(r,p,y)```, and collision check in function ```collision check```

- Obstacle collision check is done by recursively calculating the minimum distance from center of each sphere to each link.

- If target position is not reachable, it would be projected to the nearest point specified by robot maximum reachable radius. The closeness is defined in terms of Euclidean distance of the end-effector from the goal position.

- Demo Video:

[![3D Inverse Kinematics Using Matlab Optimization
](http://img.youtube.com/vi/-VxtBApTVHA/0.jpg)](https://youtu.be/-VxtBApTVHA)

###Part 2###
We derived the derivative of score with respect to joint angles by calculating the symbolic representation of end-effector position wrt joint angles and using the ```jacobian``` functionwhich was evaluated using ```subs``` function in matlab . The derivative was feeded to the ```fmincon``` function to use for optimization instead of finite difference. The results obtained are as follows  
number of iterations:155
fval = 1.0713e-04
soloution obtained
r = [ 0.0061,  0.0125, 0.0187]
p =[ -0.0308, 0.0057, 0.0281]
y =[-0.1998, 1.4005, 0.3696]
Run-time: 3447.548609 seconds
Most of time was taken to calculate the exact gradients. 
###Part 3###
| Method        | Number of iterations          | f-val  | Time
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |
- interior-point
```
number of iterations:54
fval =

   1.0713e-04


r =

    0.0019
    0.0165
    0.0180


p =

   -0.0302
    0.0067
    0.0278


y =

   -0.1999
    1.4004
    0.3697

First order optimality norm of step
    8.745e-07    5.770e-04

run-time:47.728608 seconds
```

- sqp
```
number of iterations:49
fval =

   1.0713e-04


r =

    0.0089
    0.0106
    0.0197


p =

   -0.0305
    0.0037
    0.0292


y =

   -0.1997
    1.4005
    0.3696
First order optimality norm of step
1.940e-04   2.624e-07

run-time: 41.894020 seconds
```

- active-set
```
number of iterations:16

fval =

   1.0735e-04


r =

    0.0263
   -0.0040
    0.0365


p =

   -0.0307
   -0.0171
    0.0345


y =

   -0.1991
    1.3996
    0.3704

First order optimality norm of step
0.000485

run-time:15.311468 seconds
```

- CMA-ES
```
number of iterations:333
fval =

    0.0063

    r =

   -0.0728
   -1.9295
   -1.9731


p =

    1.1389
    0.3992
    1.2643


y =

    0.4404
    3.1416
   -1.6406

run-time: 291.663268 seconds
```
###Part 4###
In order to search for multiple local minimums, we utilized the ```MultiStart``` object in Matlab. Set the global variable ```localMin``` to ```true``` to enable multiple local minimums searching.

