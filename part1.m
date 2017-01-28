function [r, p, y] = part1( target, link_length, min_roll, max_roll, min_pitch, max_pitch, min_yaw, max_yaw, obstacles )
%% Function that uses optimization to do inverse kinematics for a snake robot

%%Outputs 
  % [r, p, y] = roll, pitch, yaw vectors of the N joint angles
  %            (N link coordinate frames)
%%Inputs:
    % target: [x, y, z, q0, q1, q2, q3]' position and orientation of the end
    %    effector
    % link_length : Nx1 vectors of the lengths of the links
    % min_xxx, max_xxx are the vectors of the 
    %    limits on the roll, pitch, yaw of each link.
    % limits for a joint could be something like [-pi, pi]
    % obstacles: A Mx4 matrix where each row is [ x y z radius ] of a sphere
    %    obstacle. M obstacles.

% Your code goes here.

%% 

r = 0; p = 0; y = 0;

global numLink lenLink posLink 
global numObs Obs
global maxJoint minJoint  posGoal;

lenLink = link_length;
numLink = length(link_length);
posLink = zeros(3, numLink+1); % end-point position of each link in global frame,
                               % include world origin

maxJoint = [max_roll ; max_pitch; max_yaw]
minJoint = [min_roll ; min_pitch; min_yaw]
Obs = obstacles
numObs = size(obstacles,1);
posGoal = target

initdraw;

%% solve

% initialize
p0 = zeros(numLink*3, 1);

% do optimization
options = optimset('Display','iter','MaxFunEvals',1000000,'Algorithm','sqp');
[x,fval,exitflag]=fmincon(@criterion,p0,[],[],[],[],minJoint,maxJoint,@constraints,options);

% report solution
if exitflag == -2,
    fprintf('No feasible point was found.\n');
else if exitflag == 0,
    fprintf('Number of iterations exceeded options.MaxIterations or number of function.\n');
else
    exitflag
    fval
    [r p y] = parseInput(x)
    end
end



end


