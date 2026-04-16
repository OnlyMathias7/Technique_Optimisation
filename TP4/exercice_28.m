clc, clear, close all

'/home/etudiants/msaldanha700/Documents/Optimisation/TP3'

message = "Choix fonction";
opt1 = "Newton-Raphson";
opt2 = "Newton-Régularisé";
choice = menu(message,opt1, opt2);
if (choice == 1) 
    opt = opt1;
end
if (choice == 2) 
    opt = opt2;
end
opt11 = "u_0 = [2,-1]";
opt21 = "u_0 = [1;0.25]";
opt31 = "u_0 = [-1;0.5]";
opt41 = "u_0 = [1.25;-0.8]";
opt51 = "u_0 = [2;1]";
choice1 = menu(message,opt11, opt21, opt31, opt41, opt51);
if (choice1 == 1) 
    u_0 = [2;-1];
end
if (choice1 == 2) 
    u_0 = [1;0.25];
end
if (choice1 == 3) 
    u_0 = [-1;0.5];
end
if (choice1 == 4) 
    u_0 = [1.25;-0.8]
end
if (choice1 == 5) 
    u_0 = [2;1];
end



J_u = @(u) 1/4*(u(1)^4)-(1/2)*u(1)^2+(1/4)*u(2)^4-(1/2)*u(2)^2+2*u(1)*u(2);
GJ_u = @(u) [ (u(1)^3)-u(1)+2*u(2); (u(2)^3)-u(2)+2*u(1)];
HJ_u = @(u) [ 3*u(1)^2 2;
              2 3*u(2)^2 ];


tol = 10.^(-3);
max_iter=2500;
bx=[-4,4];
by=[-4,4];
n=50;
d=0.1;
lambda = 1;


[u_est, k, hist_u] = algo_gradiant_pas_pas(u_0,GJ_u, 0, max_iter, tol, opt, J_u, HJ_u, lambda);

%Affichage
figure(1)
Jaff = AffLignesNiveauJ(bx,by,d,J_u,n);
hold on
plot(u_est(1), u_est(2), '*', 'MarkerSize', 10 );
plot(u_0(1), u_0(2), '*', 'MarkerSize', 10 );
plot(hist_u(1,:), hist_u(2,:), 'r');

