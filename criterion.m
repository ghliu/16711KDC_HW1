function [score, g] = criterion(x)
%%% optimization criterion: x is vector of joint angles 3N * 1
% TODO add obstacle criterion

global maxJoint minJoint posGoal obs;

% do graphics
pos = fk(x, true);

draw3();

joint_limit_penalty = 0.00005;
% stay way from max/min joint
score = [];
score(1) = joint_limit_penalty*(x - mean(maxJoint + minJoint))'*(x - mean(maxJoint + minJoint));
score(2) = (pos - posGoal)'*(pos - posGoal);

score = sum(score);

% compute gradient vector
if nargout > 1
	jaco = calculate_grad(x);
	g = joint_limit_penalty*2*(x - mean(maxJoint + minJoint)) + 2*jaco'*(pos - posGoal);
end

% final end
end
