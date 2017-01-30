function [ r p y ] = parseInput(x)

global numLink;

% parse input
x = reshape(x, [numLink, 3]);
r = x(:,1);
p = x(:,2);
y = x(:,3);
% r = x(0*numLink+1:1*numLink, :);
% p = x(1*numLink+1:2*numLink, :);
% y = x(2*numLink+1:3*numLink, :);

end

