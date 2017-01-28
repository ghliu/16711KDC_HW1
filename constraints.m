%%% constraints for optimizing joints inverse kinematics
function [ineq_violations,eq_violations]=constraints(x)
% TODO add obstacle contraints.

global numLink obs posGoal;

pos = fk(x, false);

% be at the target
eq_violations = [];
% eq_violations = pos(1:3) - posGoal(1:3);
% eq_violations = pos - posGoal

ineq_violations=[];


end
%% final end


