clc, clear, close all


J_u = @(u) (1/2)*((u(1)-1)^2+100*(u(1)^2-u(2))^2);
GJ_u = @(u) [ (u(1)-1)+200*(u(1)^3-u(1)*u(2)); 100*(u(2)-u(1)^2)];
r = @(u) [1-u(1); 10*(u(2)-u(1)^2)];
Jac = @(u) [1 0 ; 20*u(1) -10];


tol = 10.^(-3);
max_iter=2500;
bx=[-4,4];
by=[-4,4];
n=50;
d=0.1;
alpha = 1;
option = "Défaut";
u_0 = [-1.2;1];

[u_est, k, hist_u] = algo_Levenberg_Marquardt(u_0,GJ_u,alpha, max_iter, tol,Jac, r, option);

%Affichage
figure(1)
Jaff = AffLignesNiveauJ(bx,by,d,J_u,n);
hold on
plot(u_est(1), u_est(2), '*', 'MarkerSize', 10 );
plot(u_0(1), u_0(2), '*', 'MarkerSize', 10 );
plot(hist_u(1,:), hist_u(2,:), 'r');
