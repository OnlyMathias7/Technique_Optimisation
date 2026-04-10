function [u1,a,it] = recherche_Armijo(u0,J,G,beta,d,a_ini)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% param�tres d'entr�e
% u0 = point initial
% J = fonction � minimiser
% G = gradient de J
% beta = coefficient beta (0<beta<1 ... proche de 0.1 c'est bien !)
% --- param�tres optionnels
% d = direction de descente choisie (par d�faut -G(u0))
% a_ini = valeur initiale de alpha (1 par defaut)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CA = Condition d'Armijo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% param�tres de sortie
% u1 = point final
% a = valeur finale de alpha
% it = nombre d'it�rations dans l'�tape
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if nargin == 4
    d = -G(u0);
end
if nargin == 6
    a = a_ini;
else
    a = 1;
end

phi =@(alpha) J(u0+alpha*d);     % fonction � minimiser
gp = beta*G(u0)'*d; % beta phi'(0)
f0 = phi(0); % J(u0)
f1 = phi(a); % J(u0+a*d);
it = 1;
if f1 < f0+a*gp % CA verifiee
    while f1 < f0+a*gp % CA verifiee
        a = 2*a;
        f1 = phi(a);
        it = it + 1;
    end
    a = a/2; 
    f1 = phi(a); % la CA n'est plus verifiee
else % CA non verifiee
    while f1 > f0+a*gp % CA non verifiee
        a = a/2;
        f1 = phi(a);
        it = it + 1;
    end
    %a = a*2; 
    f1 = phi(a); % la CA est enfin verifiee
end
u1 = u0 + a*d;