clc, clear, close all

'/home/etudiants/msaldanha700/Documents/Optimisation/TP3'


J_u = @(u) (u(1)^4)*(1+(u(2)^2))-cos(u(1))+(u(2).^2);
GJ_u = @(u) [ 4*(u(1)^3)*(1+(u(2)^2))+sin(u(1)); 2*u(2)*(u(1).^4)+2*u(2)];
HJ_u = @(u) [12*u(1)^2*(1+u(2).^2)+cos(u(1)) 8*u(1)^3*u(2);
              8*u(1)^3*u(2)                    2*u(1)^4+2 ];


tol = 10.^(-3);
max_iter=2500;
u_0 = [1;1.46];
bx=[-5,5];
by=[-5,5];
n=500;
d=0.1;


[u_est, k, hist_u] = algo_gradiant_pas_pas(u_0,GJ_u, 0, max_iter, tol, "Newton-Raphson", J_u, HJ_u);

%Affichage
figure(1)
Jaff = AffLignesNiveauJ(bx,by,d,J_u,n);
hold on
plot(u_est(1), u_est(2), '*', 'MarkerSize', 10 );
plot(u_0(1), u_0(2), '*', 'MarkerSize', 10 );
plot(hist_u(1,:), hist_u(2,:), 'r');

