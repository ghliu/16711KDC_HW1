%%% constraints for optimizing joints inverse kinematics
function [ineq_violations,eq_violations]=constraints(x)
% TODO add obstacle contraints.

global numLink posLink
global numObs Obs
global posGoal

pos = fk(x);
draw3();

% be at the target
eq_violations = [];
% eq_violations = pos(1:3) - posGoal(1:3);
% eq_violations = pos - posGoal

ineq_violations=[]; % should be negative

for i = 1:numObs,
    x1 = posLink(:,1:end-1);
    x2 = posLink(:,2:end);
    d = collision_check(Obs(i, 1:3)', x1, x2, Obs(i, end));
    ineq_violations((i-1)*numLink+1:i*numLink) = d;    
end;


end
%% final end


