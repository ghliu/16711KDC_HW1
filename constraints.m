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
    d = collision_check2(Obs(i, 1:3)', x1, x2, Obs(i, end));
    ineq_violations((i-1)*numLink+1:i*numLink) = d;    
end;


end
%% final end
function d = collision_check2(x0, x1, x2, r)
    global numLink
    
    d = -1 * ones(1,numLink);
    x12 = x1 - x2;
    x20 = bsxfun(@minus, x2, x0);
    x10 = bsxfun(@minus, x1, x0);
    
    dist2link = sqrt(sum(cross(x12, x20).^2)) ./ sqrt(sum(x12.^2)); % colomn-wise norm
    dist2x1 = sqrt(sum(x10.^2));
    dist2x2 = sqrt(sum(x20.^2));
    
    proj1 = bsxfun(@times, x12, dot(x10, x12) ./ dot(x12, x12));
    proj2 = proj1 + x12;
    
    % collision happens when 
    % 1. either x10 or x20 is smaller than radius
    % 2. dist2link is smaller than radius, and projection of centeor
    %    to link is between link end point x1, x2
    d(find((dist2x1 < r) | (dist2x2 < r))) = 1;
    d(find((dist2link < r ) & all(proj1 ./ proj2 > 0))) = 1;
    
end

