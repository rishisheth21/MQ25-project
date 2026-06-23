close all
clear all
clc
figure

%gather inputs
x1 = input('Enter starting x position: ');
y1 = input('Enter starting y position: ');
r = input('Enter radius: ');


%plot center
plot(x1,y1, 'ok');
hold on

%circle coords
x1_cir = x1 + r*sind([0:1:45]); %x
y1_cir= y1 + r*cosd([0:1:45]); %y

%plot circle
plot(x1_cir, y1_cir,'-k', 'LineWidth', 2);

%axis
xlabel('x axis')
ylabel('y axis')
axis equal
