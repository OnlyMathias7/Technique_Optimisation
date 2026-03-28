clc, clear, close all,

f_x = @(x) (x.^2)-10;
f_x2 = @(x) (x.^2)-2; %[0; 4, 5]
f_x3 = @(x) (4*x.^3) + (4*x.^2) - 15*x - 18 ;  %[0; 2, 5]
f_x4 = @(x) (x - 1).^3 -x;
f_x5 = @(x) (x.^3)-x;
f_x6 = @(x) (x - 1).^2 - 2 ;%sur [−3; 4.5]
f_x7 = @(x) (x - 1).^4-2*(x.^2)+x-1; %sur [−3; 4.5]



%Exercice 2
calc_affichage(f_x,3,4, sqrt(10), 1);

%Exercice 3
calc_affichage(f_x2,0,5, sqrt(2), 1);
calc_affichage(f_x3,0,2, 0, 2);

%Exercice 4
calc_affichage(f_x4,1,2.5,0, 2);
calc_affichage(f_x5,0,4.5, 0, 2);
calc_affichage(f_x6,-3, 4.5,0,2);
calc_affichage(f_x7, -3, 4.5, 0,2);

%Exercice 8


