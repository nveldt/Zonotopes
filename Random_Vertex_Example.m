%% Demonstrate how to get a random vertex of the zonotope
% This is based on the results from:

% Stinson, Gleich, and Constantine
% A randomized algorithm for enumerating zonotope vertices
% https://arxiv.org/abs/1602.06620
% 2016


d = 2;
n = 5;
G = randn(d,n);

%%
PlotZonotope(G);
hold on
x = randn(d,1);
v = sign(G'*x); % we are dealing with a 0,1 zonotope, not a -1,1 zonotope
v = v+1;
v = v/2;
v = G*v;

plot(v(1),v(2),'o','markersize',20,'color','r')

hold off
%% 3D example
load 3DzonoExample

G = randn(3,n);


%% Generate a random vector
PlotZonotope(G)
hold on
[d,n] = size(G);
x = randn(d,1);
v = sign(G'*x); % we are dealing with a 0,1 zonotope, not a -1,1 zonotope
v = v+1;
v = v/2;
v = G*v;
plot3(v(1),v(2),v(3),'o','markersize',25,'linewidth',2)
hold off