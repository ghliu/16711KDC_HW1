%%% constraints for optimizing joints inverse kinematics
function [ineq_violations,eq_violations]=constraints(x)
% TODO add obstacle contraints.

global numLink obs posGoal;

pos = fk( x );

% be at the target
eq_violations = [];
eq_violations = pos - posGoal;

ineq_violations=[];


end
%% final end


