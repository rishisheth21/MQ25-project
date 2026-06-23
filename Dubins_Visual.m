close all
clear all
clc
figure

%start info
x1 = input('Enter starting x position: ');
y1 = input('Enter starting y position: ');
theta1 = input('Enter starting heading: ');
a = 270 - theta1;

%final info
x2 = input('Enter final x position: ');
y2 = input('Enter final y position: ');
theta2 = input('Enter final heading: ');
B = 270 - theta2;

%constant turn radius
r = input('Vehicle turn radius: ');

%determine starting circle centers
x1_rightcirctr = x1 + (r*cosd(a)); %right
y1_rightcirctr = y1 + (r*sind(a));
x1_leftcirctr = x1 - (r*cosd(a)); %left
y1_leftcirctr = y1 - (r*sind(a));

%determine final circle centers
x2_rightcirctr = x2 + (r*cosd(B)); %right
y2_rightcirctr = y2 + (r*sind(B));
x2_leftcirctr = x2 - (r*cosd(B)); %left
y2_leftcirctr = y2 - (r*sind(B));

%determine start circles
x1_rightcir = x1_rightcirctr + r*sind([1:1:360]); %right
y1_rightcir = y1_rightcirctr + r*cosd([1:1:360]);
x1_leftcir = x1_leftcirctr + r*sind([1:1:360]); %left
y1_leftcir = y1_leftcirctr + r*cosd([1:1:360]);

%determine final circles
x2_rightcir = x2_rightcirctr + r*sind([1:1:360]); %right
y2_rightcir = y2_rightcirctr + r*cosd([1:1:360]);
x2_leftcir = x2_leftcirctr + r*sind([1:1:360]); %left
y2_leftcir = y2_leftcirctr + r*cosd([1:1:360]);

%determine tangent points
%tangent point 1 - start circle
%angular position of point upon circle
theta1tan = 270 - atan2d((x2_rightcirctr - x1_rightcirctr),(y2_rightcirctr - y1_rightcirctr));
theta1tantri  = theta1tan - 90; %temporary triangle angle
x1_rightcirtan = x1_rightcirctr + (r*cosd(theta1tantri)); %tangent point x coord
y1_rightcirtan = y1_rightcirctr + (r*sind(theta1tantri)); %tangent point y coord

%tangent point 2 - end circle
%angular position of point upon circle
theta2tan = 270 - atan2d((x2_rightcirctr - x1_rightcirctr),(y2_rightcirctr - y1_rightcirctr));
theta2tantri  = theta2tan - 90; %temporary triangle angle
x2_rightcirtan = x2_rightcirctr + (r*cosd(theta2tantri)); %tangent point x coord
y2_rightcirtan = y2_rightcirctr + (r*sind(theta2tantri)); %tangent point y coord

%determine circle paths
x1_rightcirpath = x1_rightcirctr + r*sind([(90 - theta1):1:theta1tan]); %start
y1_rightcirpath = y1_rightcirctr + r*cosd([(90 - theta1):1:theta1tan]);
x2_rightcirpath = x2_rightcirctr + r*sind([(-B):1:(-theta2tan)]); %end
y2_rightcirpath = y2_rightcirctr + r*cosd([(-B):1: (-theta2tan)]);

%Plot Start Circles
plot(x1_rightcir, y1_rightcir,'-r'); %right
hold on
plot(x1_leftcir, y1_leftcir,'--b'); %left
hold on

%Plot End Circles
plot(x2_rightcir, y2_rightcir,'-r'); %right
hold on
plot(x2_leftcir, y2_leftcir,'--b'); %left
hold on

%Plot Points
plot(x1, y1,'ok'); %start point
text(x1, y1,'   start','FontSize',12); %label start
hold on
plot(x1_rightcirctr, y1_rightcirctr,'or'); %right start circle
text(x1_rightcirctr, y1_rightcirctr,'   right','FontSize',12); %label right
hold on
plot(x1_leftcirctr, y1_leftcirctr,'ob'); % left start circle
text(x1_leftcirctr, y1_leftcirctr,'   left','FontSize',12); %label left
hold on
plot(x2, y2,'ok'); %end point
text(x2, y2,'   end','FontSize',12); %label end
hold on
plot(x2_rightcirctr, y2_rightcirctr,'or'); %right end circle
text(x2_rightcirctr, y2_rightcirctr,'   right','FontSize',12); %label right
hold on
plot(x2_leftcirctr, y2_leftcirctr,'ob'); % left end circle
text(x2_leftcirctr, y2_leftcirctr,'   left','FontSize',12); %label left
hold on

%Axis
xlabel('x axis')
ylabel('y axis')
axis equal

%Plot Tangent Points
plot(x1_rightcirtan, y1_rightcirtan, 'og'); %tangent point 1
text(x1_rightcirtan, y1_rightcirtan,'   tan pt 1','FontSize',12); %label point tan1 pt
plot(x2_rightcirtan, y2_rightcirtan, 'og'); %tangent point 2
text(x2_rightcirtan, y2_rightcirtan,'   tan pt 2','FontSize',12); %label point tan2 pt
plot([x1_rightcirtan, x2_rightcirtan], [y1_rightcirtan, y2_rightcirtan], '--k', 'LineWidth', 2);
hold on

%Plot circle paths
plot(x1_rightcirpath, y1_rightcirpath,'--k', 'LineWidth', 2);
hold on
plot(x2_rightcirpath, y2_rightcirpath,'--k', 'LineWidth', 2);
hold on




