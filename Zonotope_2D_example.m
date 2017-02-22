%% A Small Example of a 2D zonotope
% Each column of the matrix is a generator

G = [2 1 -1 4; -1 3 4 5];
[d,n] = size(G);

%% Or generate a random zonotope

n = 5;
G = randn(2,n);

%% Plot the generators as vectors in the plane
figure(1)
for i = 1:n
    vector = [0,0;G(:,i)'];
    plot(vector(:,1),vector(:,2),'-','color','b','linewidth',2)
    hold on
end

%% Plot all points of the zonotope

S = CubetoZonotope(G');
figure(1)
plot(S(:,1),S(:,2),'.','markersize',30,'color','b')
hold on
axis equal

%% Plot the zonotope using the delaunay trianglulation

DT = delaunayTriangulation(S);
[K,v] = convexHull(DT);
Vertices = DT.Points(K,:);
plot(Vertices(:,1),Vertices(:,2),'color','g')
title(['A Small 2D Zonotope with ' num2str(n) ' generators'])
hold off

% This plot can also be made directly by calling PlotZonotope(G)