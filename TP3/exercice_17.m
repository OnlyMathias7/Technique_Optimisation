clc, clear, close all


% Chemin dynamique
cheminTP3 = fileparts(mfilename('fullpath'));          % dossier courant (TP3)
cheminVoisin = fullfile(fileparts(cheminTP3), 'TP2');  % dossier voisin (TP2)

addpath(cheminVoisin);

alpha = 0.01;
message = "Choix possible";
opt1 = "Alpha est égal à 0.01";
opt2 = "Alpha est égal à 0.02";
opt3 = "Alpha est égal à 0.04";
choice = menu(message,opt1, opt2, opt3);
if choice == 1 
    alpha = 0.01; end
if (choice == 2 ) 
    alpha = 0.02; end
if (choice == 3 ) 
    alpha = 0.04; end


bx=[-2,2];
by=[-2,2];
n=50;
p=10;
d=0.1;
J_u = @(u) (u(1) - 1).^2 + p*(u(1).^2 -u(2)).^2;
GJ_u = @(u) [2*(u(1)-1)+2*p*(2*u(1))*(u(1).^2-u(2)); -2*p*(u(1).^2-u(2))];
HJ_u = @(u) [2+4*p*(3*(u(1).^2)-u(2)) -4*p*u(1); -4*p*u(1) 2*p];

% α = 0.01, 0.02 puis 0.04.
tol = 10.^(-3);
max_iter=2500;
u_0 = [-1;1];

[u_est, k, hist_u] = algo_gradiant_pas_pas(u_0,GJ_u, alpha, max_iter, tol);


%Affichage
figure(1)
Jaff = AffLignesNiveauJ(bx,by,d,J_u,n);
hold on
plot(u_est(1), u_est(2), '*', 'MarkerSize', 10 );
plot(u_0(1), u_0(2), '*', 'MarkerSize', 10 );
plot(hist_u(1,:), hist_u(2,:), 'r');




