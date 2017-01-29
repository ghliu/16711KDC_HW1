function R = build_rotation_matrix(r, p, y)

global numLink

Rz(1,1,:) = cos(y);
Rz(1,2,:) = -sin(y);
Rz(1,3,:) = zeros(size(r));
Rz(2,1,:) = sin(y);
Rz(2,2,:) = cos(y);
Rz(2,3,:) = zeros(size(r));
Rz(3,1,:) = zeros(size(r));
Rz(3,2,:) = zeros(size(r));
Rz(3,3,:) = ones(size(r));

% Ry = [cos(p) zeros(size(r)) sin(p);
% 		zeros(size(r)) zeros(size(r)) zeros(size(r));
% 		-sin(p) cos(p) ones(size(r))];

Ry(1,1,:) = cos(p);
Ry(1,2,:) = zeros(size(r));
Ry(1,3,:) = sin(p);
Ry(2,1,:) = zeros(size(r));
Ry(2,2,:) = ones(size(r));
Ry(2,3,:) = zeros(size(r));
Ry(3,1,:) = -sin(p);
Ry(3,2,:) = zeros(size(r));
Ry(3,3,:) = cos(p);

% Rx = [ones(size(r)) zeros(size(r)) zeros(size(r));
% 		zeros(size(r)) cos(r) -sin(r);
% 		zeros(size(r)) sin(r) cos(r)];
Rx(2,2,:) = cos(r);
Rx(1,1,:) = ones(size(r));
Rx(1,2,:) = zeros(size(r));
Rx(1,3,:) = zeros(size(r));
Rx(2,1,:) = zeros(size(r));

Rx(2,3,:) = -sin(r);
Rx(3,1,:) = zeros(size(r));
Rx(3,2,:) = sin(r);
Rx(3,3,:) = cos(p);

R = sym('R',size(Rx)); R(:,:,1) = eye(3,3);
for i = 1:numLink,
    % recursive calculate R1, R1R2, R1R2R3, ...
    R(:,:,i) = R(:,:,i)*Rx(:,:,i)*Ry(:,:,i)*Rz(:,:,i);
    
    if i < numLink,
        R(:,:,i+1) = R(:,:,i);
    end;
end

