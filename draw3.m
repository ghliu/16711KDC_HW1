function draw3()
% do forward kinematics

global posGoal;
global numLink posLink
global h_axes drawLink drawGoal


for i = 1:numLink,
    set(drawLink{i},'Parent',h_axes,...
        'Xdata', posLink(1, i:i+1), ...
        'Ydata', posLink(2, i:i+1), ...
        'Zdata', posLink(3, i:i+1), ...
        'visible','on');
end;

set(drawGoal,'Parent',h_axes,...
    'Xdata', [posGoal(1)-0.02 posGoal(1)+0.01], ...
    'Ydata', [posGoal(2)-0.02 posGoal(2)+0.01], ...
    'Zdata', [posGoal(3)-0.02 posGoal(3)+0.01], ...
    'visible','on');

drawnow

% debug
% for i = 1:numLink,
%     norm(posLink(:, i) - posLink(:, i+1))
% end;

% delay
 for j = 1:1000000
   z = sin(sqrt(100.0*j));
 end

end
