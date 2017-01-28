function score = criterion(x)
%%% optimization criterion: x is vector of joint angles 3N * 1
% TODO add obstacle criterion

global maxJoint minJoint posGoal Obs;

% do graphics
pos = fk(x, true);

draw3();

% stay way from max/min joint
score = [];
score(1) = 0.00005*(x - mean(maxJoint + minJoint))'*(x - mean(maxJoint + minJoint));
score(2) = (pos - posGoal)'*(pos - posGoal);

score = sum(score);

% final end
end
