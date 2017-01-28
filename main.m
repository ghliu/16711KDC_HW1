

% clear all;


target = [1 1 1 1 0 0 0];
link_length = [0.5 0.5 0.5]';
numLink = length(link_length);
min_roll = -pi * ones(numLink,1);
max_roll =  pi * ones(numLink,1);
min_pitch = -pi * ones(numLink,1);
max_pitch = pi * ones(numLink,1);
min_yaw = -pi * ones(numLink,1);
max_yaw =  pi * ones(numLink,1);
obstacles = [];


[r, p, y] = part1( target, link_length, min_roll, max_roll, min_pitch, max_pitch, min_yaw, max_yaw, obstacles );