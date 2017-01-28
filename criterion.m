function score = criterion(x)
%%% optimization criterion: x is vector of joint angles 3N * 1
% TODO add obstacle criterion

global maxJoint minJoint posGoal obs;

% do graphics
pos = fk(x, true);

draw3();

score = (pos - posGoal)'*(pos - posGoal) + 0.05*(x - maxJoint)'*(x - maxJoint) ...
    + 0.05*(x - minJoint)'*(x - minJoint);

% final end
end
