function R = build_rotation_matrix(r, p, y)

global numLink

Rz(1,1,:) = cos(y);
Rz(1,2,:) = -sin(y);
Rz(1,3,:) = zeros(3,1);
Rz(2,1,:) = sin(y);
Rz(2,2,:) = cos(y);
Rz(2,3,:) = zeros(3,1);
Rz(3,1,:) = zeros(3,1);
Rz(3,2,:) = zeros(3,1);
Rz(3,3,:) = ones(3,1);

% Ry = [cos(p) zeros(3,1) sin(p);
% 		zeros(3,1) zeros(3,1) zeros(3,1);
% 		-sin(p) cos(p) ones(3,1)];

Ry(1,1,:) = cos(p);
Ry(1,2,:) = zeros(3,1);
Ry(1,3,:) = sin(p);
Ry(2,1,:) = zeros(3,1);
Ry(2,2,:) = ones(3,1);
Ry(2,3,:) = zeros(3,1);
Ry(3,1,:) = -sin(p);
Ry(3,2,:) = zeros(3,1);
Ry(3,3,:) = cos(p);

% Rx = [ones(3,1) zeros(3,1) zeros(3,1);
% 		zeros(3,1) cos(r) -sin(r);
% 		zeros(3,1) sin(r) cos(r)];

Rx(1,1,:) = ones(3,1);
Rx(1,2,:) = zeros(3,1);
Rx(1,3,:) = zeros(3,1);
Rx(2,1,:) = zeros(3,1);
Rx(2,2,:) = cos(r);
Rx(2,3,:) = -sin(r);
Rx(3,1,:) = zeros(3,1);
Rx(3,2,:) = sin(r);
Rx(3,3,:) = cos(p);

R = zeros(3,3,numLink); R(:,:,1) = eye(3,3);
for i = 1:numLink,
    % recursive calculate R1, R1R2, R1R2R3, ...
    R(:,:,i) = R(:,:,i)*Rx(:,:,i)*Ry(:,:,i)*Rz(:,:,i);
    
    if i < numLink,
        R(:,:,i+1) = R(:,:,i);
    end;
end

end
