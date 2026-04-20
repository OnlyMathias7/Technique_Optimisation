clc, clear, close all

% Chemin dynamique
cheminTP3 = fileparts(mfilename('fullpath'));          % dossier courant (TP4)
cheminVoisin = fullfile(fileparts(cheminTP3), 'TP3');  % dossier voisin (TP3)

addpath(cheminVoisin);

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
opt11 = "u_0 = [2,1]";
opt21 = "u_0 = [1;1.46]";
choice1 = menu(message,opt11, opt21);
if (choice1 == 1) 
    u_0 = [2;1];
end
if (choice1 == 2) 
    u_0 = [1;1.46];
end



J_u = @(u) (u(1)^4)*(1+(u(2)^2))-cos(u(1))+(u(2).^2);
GJ_u = @(u) [ 4*(u(1)^3)*(1+(u(2)^2))+sin(u(1)); 2*u(2)*(u(1).^4)+2*u(2)];
HJ_u = @(u) [12*u(1)^2*(1+u(2).^2)+cos(u(1)) 8*u(1)^3*u(2);
              8*u(1)^3*u(2)                    2*u(1)^4+2 ];


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

