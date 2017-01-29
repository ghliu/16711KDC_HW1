function pos = fk(x, update)
% forward kinematic to map joints to pos vector
% pos : 7*1 vector [x y z quaternion]'
% update : boolean flag used to update posLink, which
%          is used for draw3 function later

global numLink lenLink posLink;

% parse input
[r p y] = parseInput(x);

% forward kinematic
% quaternion
R = build_rotation_matrix(r, p, y);
q = mat2quat(R(:,:,numLink));

% pos
pos = [0 0 0]';
for i = 1:numLink,
    
    pos = pos + R(:,:,i)*([lenLink(i) 0 0]');
    if update, posLink(:,i+1) = pos; end;
    
end;

pos = [pos ; q];

end


