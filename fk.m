function pos = fk(x, update)
% forward kinematic to map joints to pos vector
% pos : 7*1 vector [x y z quaternion]'
% update : boolean flag used to update posLink, which
%          is used for draw3 function later

global numLink lenLink posLink;

% parse input
[r p y] = parseInput(x);

% forward kinematic
R = build_rotation_matrix(r, p, y);
pos = [0 0 0]';
q = [1 0 0 0]';
for i = 1:numLink,
    % quaternion TODO
        
    % pos
    pos = pos + R(:,:,i)*([lenLink(i) 0 0]')
    if update, posLink(:,i+1) = pos; end;
    
end;

pos = [pos ; q];

end

function R = build_rotation_matrix(r, p, y)

global numLink

Rz = zeros(3,3,numLink); Rz(3,3,:) = 1;
Rz(1,1,:)= cos(y); Rz(1,2,:)=-sin(y); 
Rz(2,1,:)= sin(y); Rz(2,2,:)= cos(y);

Ry = zeros(3,3,numLink); Ry(2,2,:) = 1;
Ry(1,1,:)= cos(p); Ry(1,3,:)= sin(p); 
Ry(3,1,:)=-sin(p); Ry(3,3,:)= cos(p);

Rx = zeros(3,3,numLink); Rx(1,1,:) = 1;
Rx(2,2,:)= cos(r); Rx(2,3,:)=-sin(r); 
Rx(3,2,:)= sin(r); Rx(3,3,:)= cos(r);

R = zeros(3,3,numLink); R(:,:,1) = eye(3,3);
for i = 1:numLink,
    % recursive calculate R1, R1R2, R1R2R3, ...
    R(:,:,i) = R(:,:,i)*Rx(:,:,i)*Ry(:,:,i)*Rz(:,:,i);
    
    if i < numLink,
        R(:,:,i+1) = R(:,:,i);
    end;
end;

end