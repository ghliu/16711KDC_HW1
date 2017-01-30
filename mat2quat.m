function q = mat2quat(R)

% q0 = ( R(1,1) + R(2,2) + R(3,3) + 1) / 4;
% q1 = ( R(1,1) - R(2,2) - R(3,3) + 1) / 4;
% q2 = (-R(1,1) + R(2,2) - R(3,3) + 1) / 4;
% q3 = (-R(1,1) - R(2,2) + R(3,3) + 1) / 4;
% if(q0 < 0), q0 = 0; end;
% if(q1 < 0), q1 = 0; end;
% if(q2 < 0), q2 = 0; end;
% if(q3 < 0), q3 = 0; end;
% q0 = sqrt(q0);
% q1 = sqrt(q1);
% q2 = sqrt(q2);
% q3 = sqrt(q3);
% if(q0 >= q1 && q0 >= q2 && q0 >= q3),
%     q0 = q0*1;
%     q1 = q1*sign(R(3,2) - R(2,3));
%     q2 = q2*sign(R(1,3) - R(3,1));
%     q3 = q3* sign(R(2,1) - R(1,2));    
% else if (q1 >= q0 && q1 >= q2 && q1 >= q3),
%     q0 = q0* sign(R(3,2) - R(2,3));
%     q1 = q1* +1;
%     q2 = q2* sign(R(2,1) + R(1,2));
%     q3 = q3* sign(R(1,3) + R(3,1));
% else if(q2 >= q0 && q2 >= q1 && q2 >= q3),
%     q0 = q0* sign(R(1,3) - R(3,1));
%     q1 = q1* sign(R(2,1) + R(1,2));
%     q2 = q2* +1;
%     q3 = q3* sign(R(3,2) + R(2,3));
% else if(q3 >= q0 && q3 >= q1 && q3 >= q2),
%     q0 = q0* sign(R(2,1) - R(1,2));
%     q1 = q1* sign(R(3,1) + R(1,3));
%     q2 = q2* sign(R(3,2) + R(2,3));
%     q3 = q3* +1;
% else
%     fprintf('coding error\n');
%     end;
%     end;
%     end;
% end;

% q = [q0, q1, q2, q3]';
% q = q / norm(q);

q_w = sqrt((1+R(1,1)+R(2,2)+R(3,3)))/2;
q_x = (R(3,1)-R(2,3))/(4*q_w);
q_y = (R(1,3)-R(3,1))/(4*q_w);
q_z = (R(2,1)-R(1,2))/(4*q_w);

q = [q_w, q_x, q_y, q_z]';
end