function [ r p y ] = parseInput(x)

global numLink;

% parse input
x = reshape(x, [numLink, 3]);
r = x(:,1);
p = x(:,2);
y = x(:,3);

end

