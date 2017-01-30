

clear all;

% reach the position (0.5,0.5,0) with r=0, p=0, y=90 at the end point
target = [0.5 0.5 0.02 0.707 0 0 0.707]';
link_length = [0.4 0.3 0.3]';
% link_length = [0.4]';
numLink = length(link_length);
min_roll = -pi * ones(numLink,1);
max_roll =  pi * ones(numLink,1);
min_pitch = -pi * ones(numLink,1);
max_pitch = pi * ones(numLink,1);
min_yaw = -pi * ones(numLink,1);
max_yaw =  pi * ones(numLink,1);
obstacles = [-0.5 0.3 0.3 0.1];

tic

% for cmaes use part1

% [r, p, y] = part1( target, link_length, min_roll, max_roll, min_pitch, max_pitch, min_yaw, max_yaw, obstacles );
[r, p, y] = part2( target, link_length, min_roll, max_roll, min_pitch, max_pitch, min_yaw, max_yaw, obstacles );

toc