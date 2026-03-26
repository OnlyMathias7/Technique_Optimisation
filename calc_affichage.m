function [] = calc_affichage(f,a,b, x_theorique)

t= a:0.1:b;

estimation = algo_dichotomie(f,a,b);
disp("L'estimation est de :");
disp(estimation);
disp("L'erreur est de :");
erreur = x_theorique-estimation;
disp(erreur);
%Figure

plot(t,f(t),'LineWidth',2);
%plot(f_x(estimation),estimation,'LineWidth','+',2);

end