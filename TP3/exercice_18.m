clc, clear, close all

message = "Choix fonction";
opt1 = "Fonction 1 : u(1).^2+u(2).^4";
opt2 = "Fonction 2 : (u(1)-0.5).^2+u(2).^4";
choice = menu(message,opt1, opt2);
if choice == 1 
    J_u = @(u) u(1).^2+u(2).^4;
    GJ_u = @(u) [ 2*u(1);4*u(2).^3 ]; 
end
if (choice == 2 ) 
    J_u = @(u) (u(1)-0.5).^2+u(2).^4;
    GJ_u = @(u) [ 2*(u(1)-0.5);4*u(2).^3 ];
end

%Tracer les lignes de niveau pour U = [−2; 2] × [−2; 2].
bx=[-2,2];
by=[-2,2];
n=50;p=10;d=0.1;

alpha = 0.02;
tol = 10.^(-3);
max_iter=2500;
u_0 = [1;1.1];

[u_est, k, hist_u, hist_armijo] = algo_gradiant_pas_pas(u_0,GJ_u, alpha, max_iter, tol, "Armijo", J_u);


%Affichage
figure(1)
Jaff = AffLignesNiveauJ(bx,by,d,J_u,n);
hold on
plot(u_est(1), u_est(2), '*', 'MarkerSize', 10 );
plot(u_0(1), u_0(2), '*', 'MarkerSize', 10 );
plot(hist_u(1,:), hist_u(2,:), 'r');


