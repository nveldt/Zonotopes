function S = CubetoZonotope(V)
% Given a set of points in R^2 or R^3, stored in the matrix V, reconstruct
% the zonotope output by the function f: {0,1}^n --> R^d that maps each
% vertex of the n-dimensional cube to a point in R^2 or R^3.
% Be careful about running this for high n, as the number of points in the
% output is 2^n.

[n,d] = size(V);
S = zeros(2^n,d);

x = dec2bin(0:2^n-1);

for i = 1:length(x);
    vector = zeros(n,1);
    for j=1:n
        vector(j) = str2num(x(i,j));
    end
    S(i,:) = (V'*vector)';
end

end