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

function q = mat2quat(R)

q0 = ( R(1,1) + R(2,2) + R(3,3) + 1) / 4;
q1 = ( R(1,1) - R(2,2) - R(3,3) + 1) / 4;
q2 = (-R(1,1) + R(2,2) - R(3,3) + 1) / 4;
q3 = (-R(1,1) - R(2,2) + R(3,3) + 1) / 4;
if(q0 < 0), q0 = 0; end;
if(q1 < 0), q1 = 0; end;
if(q2 < 0), q2 = 0; end;
if(q3 < 0), q3 = 0; end;
q0 = sqrt(q0);
q1 = sqrt(q1);
q2 = sqrt(q2);
q3 = sqrt(q3);
if(q0 >= q1 && q0 >= q2 && q0 >= q3),
    q0 = q0*1;
    q1 = q1*sign(R(3,2) - R(2,3));
    q2 = q2*sign(R(1,3) - R(3,1));
    q3 = q3* sign(R(2,1) - R(1,2));    
else if (q1 >= q0 && q1 >= q2 && q1 >= q3),
    q0 = q0* sign(R(3,2) - R(2,3));
    q1 = q1* +1;
    q2 = q2* sign(R(2,1) + R(1,2));
    q3 = q3* sign(R(1,3) + R(3,1));
else if(q2 >= q0 && q2 >= q1 && q2 >= q3),
    q0 = q0* sign(R(1,3) - R(3,1));
    q1 = q1* sign(R(2,1) + R(1,2));
    q2 = q2* +1;
    q3 = q3* sign(R(3,2) + R(2,3));
else if(q3 >= q0 && q3 >= q1 && q3 >= q2),
    q0 = q0* sign(R(2,1) - R(1,2));
    q1 = q1* sign(R(3,1) + R(1,3));
    q2 = q2* sign(R(3,2) + R(2,3));
    q3 = q3* +1;
else
    fprintf('coding error\n');
    end;
    end;
    end;
end;

q = [q0, q1, q2, q3]';
q = q / norm(q);

end