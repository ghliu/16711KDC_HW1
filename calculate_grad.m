function jaco_value = calculate_grad(x)
	global numLink lenLink posLink; 
	
	%create symbolic vars
	x_syms = sym('x',size(x));

	[r p y] = parseInput(x_syms);

	% forward kinematic
	% quaternion
	R = build_rotation_matrix(r, p, y);

	q = mat2quat(R(:,:,numLink));

	% pos
	pos = [0 0 0]';
	for i = 1:numLink,
	    
	    pos = pos + R(:,:,i)*([lenLink(i) 0 0]');
	    
	    
	end;

	pos = [pos ; q];

	jaco = jacobian(pos,x_syms);
% 	x_syms = x;
	jaco_value = double(subs(jaco,x_syms,x));


end

