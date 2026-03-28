function [] = calc_affichage(f,a,b, x_theorique, option_algo)

t= a:0.1:b;

if (option_algo==1)
    estimation = algo_dichotomie(f,a,b);
end

if (option_algo==2)
    estimation = algo_trichotomie(f,a,b);
end

disp(['Pour la fonction ' func2str(f) ' : (sur ' num2str(a) ',' num2str(b) ')']);
disp("L'estimation est de :");
disp(estimation);
disp("L'erreur est de :");
erreur = x_theorique-estimation;
disp(erreur);
%Figure

figure
hold on;
plot(t,f(t),'LineWidth',2);
plot(estimation,f(estimation),'+', 'MarkerSize',20);


end