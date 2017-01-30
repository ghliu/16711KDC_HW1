##Part 1##
- Based on the origianl template code, several further optimizations were done. Including
   1. Global variable ```posLink```, which represents the end-point ```(x,y,z)``` position of each link in global frame, was directly stored at the time when we solved forward kinematic. Such variable is directly used in ```draw3()``` function for visualization.

   2. Usage of matrix representation of 3D Euler rotation matrix in function ```build_rotation_matrix(r,p,y)```, and collision check in function ```collision check```

- Obstacle collision check is done by recursively calculating the minimum distance from center of each sphere to each link.

- If target position is not reachable, it would be projected to the nearest point specified by robot maximum reachable radius. In such way we defined the "close" term to Euclidean distance.

- Demo Video:

[![3D Inverse Kinematics Using Matlab Optimization
](http://img.youtube.com/vi/-VxtBApTVHA/0.jpg)](https://youtu.be/-VxtBApTVHA)

##Part 2##


##Part 3##
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

What did you do? Why did it work? What didn't work and why?
##Part 4##
