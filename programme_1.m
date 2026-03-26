clc, clear, close all,

f_x = @(x) (x.^2)-10;
f_x2 = @(x) (x.^2)-2; %[0; 4, 5]
f_x3 = @(x) (4*x.^3) + (4*x.^2) - 15*x - 18 ;  %[0; 2, 5]
f_x4 = @(x) (x - 1).^3 -x;
f_x5 = @(x) (x.^3)-x;
f_x6 = @(x) (x - 1).^2 - 2 ;%sur [−3; 4.5]
f_x7 = @(x) (x - 1).^4-2*x2+x-1; %sur [−3; 4.5]


% figure
% calc_affichage(f_x,3,4, sqrt(10));
% figure
% calc_affichage(f_x2,4,5, 0);
% figure
% calc_affichage(f_x3,0,2, 0);

estimation = algo_dichotomie(f_x,3,5)
estimation2 = algo_dichotomie(f_x2,0,5)
estimation3 = algo_dichotomie(f_x3,0,5)


t=0:0.001:4.5;
% figure
% plot(t,f_x(t),'LineWidth',2);
% figure
% plot(t,f_x2(t),'LineWidth',2);
% figure
% plot(t,f_x3(t),'LineWidth',2);
figure
plot(t,f_x4(t),'LineWidth',2);
figure
plot(t,f_x5(t),'LineWidth',2);

valeur1 = algo_trichotomie(f_x4,1,2.5);
valeur2 = algo_trichotomie(f_x5,0,4.5);

