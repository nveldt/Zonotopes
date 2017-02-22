%% A Small Example of a 3D zonotope

%% This is an extended version of the 2D example...if you flatten it
% is still looks like the the 2D examples!

G = [2 1 -1 4; -1 3 4 5; 2 -5 -2 -4];
[d,n] = size(G);

%% Or load another nice-looking zonotope

load 3DzonoExample.mat
%% Or generate a random zonotope

n = 5;
G = randn(3,n);

%% Plot the generators as vectors in the plane
figure(1)
for i = 1:n
    vector = [0,0,0;G(:,i)'];
    plot3(vector(:,1),vector(:,2),vector(:,3),'-','color','r','linewidth',2)
    hold on
end
grid on

%% Plot all points of the zonotope

S = CubetoZonotope(G');
figure(1)
plot3(S(:,1),S(:,2),S(:,3),'.','markersize',30,'color','b')
hold on
axis equal

%% Plot the zonotope using the delaunay trianglulation

DT = delaunayTriangulation(S);
[K,v] = convexHull(DT);
trisurf(K,DT.Points(:,1),DT.Points(:,2),DT.Points(:,3),'FaceColor','g','FaceAlpha',.2)
title(['A Small 3D Zonotope with ' num2str(n) ' generators'])
hold off

% This plot can also be made directly by calling PlotZonotope(G)