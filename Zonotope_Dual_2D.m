%% Converting a 2D zonotope vertex enumeration problem to cell enumeration

%% Generate a small zonotope and plot it
clear
d = 2;
n = 4;
G =[-0.5698    0.9575   -0.3414   -1.1797
    -0.0020    0.7378    0.8886    1.3815];
color = ['b' 'r' 'g','m'];
%%
PlotZonotope(G)
hold on
figure(1)
for i = 1:n
    gen = G(:,i)';
    vector = [0,0;gen];
    plot(vector(:,1),vector(:,2),'-','linewidth',2,'color',color(i))
    hold on
end

%% Plot the unit circle on top of it
ang=0:0.01:2*pi; 
xp=cos(ang);
yp=sin(ang);
plot(xp,yp,'color','k');
ylim([-1,3.5])
xlim([-3,1.5])
%% Remove the zonotope and just look at the generators
color = ['b' 'r' 'g','m'];
figure(2)
for i = 1:n
    gen = G(:,i)';
    gen = gen/norm(gen);
    vector = [0,0;gen];
    plot(vector(:,1),vector(:,2),'-','linewidth',2,'color',color(i))
    plot(gen(1),gen(2),'+','markersize',20,'color',color(i),'linewidth',5)
    hold on
end
ang=0:0.01:2*pi; 
xp=cos(ang);
yp=sin(ang);
plot(xp,yp,'color','k');
axis equal
i = 0;
%% Plot the hyperplane defined by each generator vector
i = i+1
%for i = 1:n
    
    % Take the generator and normalize, get components
    gen = G(:,i)';
    gen = gen/norm(gen);
    x = gen(1);
    y = gen(2);
    % Find two unit vectors which define the normal hyperplane
    a = 1;
    b = -a*x/y;
    vec = [a,b]/norm([a,b]);
    a = vec(1);
    b = vec(2);
    figure(2)
    plot(a,b,'.','markersize',20,'color',color(i))
    plot(-a,-b,'.','markersize',20,'color',color(i))
    hplane = [a,b;-a,-b];
    plot(hplane(:,1),hplane(:,2),'--','color',color(i))
    
%end

%% Get rid of the vectors that get in the way and replot
hold off
figure(2)
for i = 1:n
    gen = G(:,i)';
    gen = gen/norm(gen);
    vector = [0,0;gen];
    %plot(vector(:,1),vector(:,2),'-','linewidth',2,'color',color(i))
    plot(gen(1),gen(2),'+','markersize',20,'color',color(i),'linewidth',5)
    hold on
end
ang=0:0.01:2*pi; 
xp=cos(ang);
yp=sin(ang);
plot(xp,yp,'color','k');
axis equal

for i = 1:n
    
    % Take the generator and normalize, get components
    gen = G(:,i)';
    gen = gen/norm(gen);
    x = gen(1);
    y = gen(2);
    
    % Find two unit vectors which define the normal hyperplane
   
    a = 1;
    b = -a*x/y;
    vec = [a,b]/norm([a,b]);
    a = vec(1);
    b = vec(2);
    plot(a,b,'.','markersize',20,'color',color(i))
    plot(-a,-b,'.','markersize',20,'color',color(i))
    hplane = [a,b;-a,-b];
    plot(hplane(:,1),hplane(:,2),'--','color',color(i))
    
end

%% Label the cells
% Order is blue, red, green, magenta
title('Order: (Blue, Red, Green, Magenta)')
set(0,'DefaultAxesFontSize',18,'DefaultTextFontSize',18);
figure(2)
label1 = '(+,+,+,+)';
text(-.375,.6,label1,'linewidth',10)

%%
figure(2)
label2 = '(-,+,+,+)';
text(.2,.6,label2);

%%
figure(2)
label3 = '(-,+,+,-)';
text(.6,.4,label3);

%%
figure(2)
label4 = '(-,+,-,-)';
text(.5,-.2,label4);

label5 = '(-,-,-,-)';
text(.1,-.7,label5);

label6 = '(+,-,-,-)';
text(-.35,-.7,label6);

label7 = '(+,-,-,+)';
text(-.8,-.4,label7);

label8 = '(+,-,+,+)';
text(-.7,.1,label8);

hold off

%% Label the Zonotpe Vertices
set(0,'DefaultAxesFontSize',18,'DefaultTextFontSize',18);
figure(1)
label1 = '(1,1,1,1)';
text(-1.5,3.2,label1,'linewidth',10)

label2 = '(0,1,1,1)';
text(-.75,3.2,label2);

label3 = '(0,1,1,0)';
text(.5,1.75,label3);

label4 = '(0,1,0,0)';
text(.8,.8,label4);

label5 = '(0,0,0,0)';
text(0,-.1,label5);

label6 = '(1,0,0,0)';
text(-.6,-.1,label6);

label7 = '(1,0,0,1)';
text(-2.25,1.25,label7);

label8 = '(1,0,1,1)';
text(-2.5,2.25,label8);

hold off