%%% constraints for optimizing joints inverse kinematics
function [ineq_violations,eq_violations]=constraints(x)
% TODO add obstacle contraints.

global numLink posLink
global numObs Obs
global posGoal

pos = fk(x, true);
draw3();

% be at the target
eq_violations = [];
% eq_violations = pos(1:3) - posGoal(1:3);
% eq_violations = pos - posGoal

ineq_violations=[]; % should be negative
for i = 1:numLink,
    x1 = posLink(:,i);
    x2 = posLink(:,i+1);
    for j = 1:numObs,
        d = collision_check(Obs(j, 1:3)', x1, x2, Obs(j, end));
        ineq_violations((i-1)*numObs+j) = d;
    end;
end;

% ineq_violations
end
%% final end

function d = collision_check(x0, x1, x2, r)

d = -1;
x12 = x1-x2;

dist2link = norm(cross(x12, x2-x0)) / norm(x12);
proj = x1 + dot(x1-x0,x12) / dot(x12,x12) * x12;

if dist2link < r && all((proj - x1)./(proj - x2) < 0),
    d = 1;
end

end

