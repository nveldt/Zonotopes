%% A 3D zonotope and its dual

set(0,'DefaultAxesFontSize',18,'DefaultTextFontSize',18);
clear
V = [.1 .2 3;
    1 2 1;
    -1 2 -1;
    -.5 -.4 1];
n = size(V,1);

for i = 1:n-1
    V(i,:) = 2*(V(i,:)/norm(V(i,:)));
end
    
G = V';
color = ['b' 'r' 'g','m'];
%%
PlotZonotope(G,1,0)
n = size(G,2);
hold on

%% Plot the Zonotope generators
figure(1)
for i = 1:n
    gen = G(:,i)';
    vector = [0,0,0;gen];
    plot3(vector(:,1),vector(:,2),vector(:,3),'-','linewidth',3,'color',color(i))
    hold on
end

v = G*[1;1;1;1];
plot3(v(1),v(2),v(3),'o','markersize',20)
hold off
%% Plot the sphere with it
PlotZonotope(G,2,0)
figure(2)
[x, y, z] = sphere(128);
h = surfl(x, y, z); 
set(h, 'FaceAlpha', .2)
shading interp
colormap bone
for i = 1:n
    gen = G(:,i)';
    vector = [0,0,0;gen];
    plot3(vector(:,1),vector(:,2),vector(:,3),'-','linewidth',3,'color',color(i))
    hold on
end
hold on
PlotZonotope(G,2,0)
%% Plot the Hyperplanes
V = G';

figure(3)
[x, y, z] = sphere(128);
h = surfl(x, y, z); 
set(h, 'FaceAlpha', 1)
shading interp
colormap white
axis equal
hold on
plot3(0,0,0,'o')

for i = 1:n
H = [zeros(1,3);V(i,:)];

plot3(H(:,1),H(:,2),H(:,3),'color',color(i),'linewidth',3)
grid on
axis equal

a = V(i,1);
b = V(i,2);
c = V(i,3);

points = [];
epsilon = .00001;
for x = -1:.01:1
    for y = 0:.1:sqrt(1-x^2)-epsilon
        z = 1/c*(-a*x-b*y);
        vec = [x y z];
        vec = vec/(norm(vec));
        points = [points;vec];
    end
    for y = -sqrt(1-x^2)-epsilon:.1:0
        z = 1/c*(-a*x-b*y);
        vec = [x y z];
        vec = vec/(norm(vec));
        points = [points;vec];
    end
end

plot3(points(:,1),points(:,2),points(:,3),'.','color',color(i),'markersize',8)
end
hold on

%% Label one vertex and its corresponding cell
title('Order: (Blue, Red, Green, Magenta)')
text(.1,.8,.7,'(+,+,+,+)')

figure(1)
text(-.5,3,3,'(1,1,1,1)')

%% Generate a random vertex and map it onto the zonotope
d = 3;
x = randn(d,1);
x = x/norm(x);
figure(3)
hold on
plot3(x(1),x(2),x(3),'.','markersize',30)


v = sign(G'*x);
v = v+1;
v = v/2;
w = G*v;

figure(1)
hold on
plot3(w(1),w(2),w(3),'o','markersize',30)
%% Remove holds
figure(1)
hold off
figure(2)
hold off
figure(3)
hold off