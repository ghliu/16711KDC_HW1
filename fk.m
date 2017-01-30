function pos = fk(x)
% forward kinematic to map joints to pos vector
% pos : 7*1 vector [x y z quaternion]'

global numLink lenLink posLink;

% parse input
[r p y] = parseInput(x);

% forward kinematic
% quaternion
R = double(build_rotation_matrix(r, p, y));
q = mat2quat(R(:,:,numLink));

% pos
pos = [0 0 0]';
for i = 1:numLink,
    
    pos = pos + R(:,:,i)*([lenLink(i) 0 0]');
    posLink(:,i+1) = pos;
    
end;

pos = [pos ; q];

end


