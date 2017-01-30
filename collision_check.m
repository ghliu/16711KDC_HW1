function d = collision_check(x0, x1, x2, r)
    global numLink
    
    d = -1 * ones(1,numLink);
    x12 = x1 - x2;
    x20 = bsxfun(@minus, x2, x0);
    x10 = bsxfun(@minus, x1, x0);
    
    dist2link = sqrt(sum(cross(x12, x20).^2)) ./ sqrt(sum(x12.^2)); % colomn-wise norm
    dist2x1 = sqrt(sum(x10.^2));
    dist2x2 = sqrt(sum(x20.^2));
    
    proj1 = bsxfun(@times, x12, dot(x10, x12) ./ dot(x12, x12));
    proj2 = proj1 + x12;
    
    % collision happens when 
    % 1. either x10 or x20 is smaller than radius
    % 2. dist2link is smaller than radius, and projection of centeor
    %    to link is between link end point x1, x2
    d(find((dist2x1 < r) | (dist2x2 < r))) = 1;
    d(find((dist2link < r ) & all(proj1 ./ proj2 > 0))) = 1;
    
end