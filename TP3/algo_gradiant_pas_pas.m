function [u_est,k, hist_u, hist_armijo] = algo_gradiant_pas_pas(u,GJ, alpha, max_iter, tol, option, J, HJ, lambda)

    if nargin == 5
        option = "Defaut";
        J = 0;      
    end 

    flag = true;
    k=0;
    hist_u = [];
    hist_u = [hist_u u];
    hist_armijo = [];
    while (flag)
        
        k=k+1;
        if option == "Defaut"
            u1=u-alpha*(GJ(u));
        end 
        if option == "Armijo"
            [u1, alpha, it] = recherche_Armijo(u,J, GJ, 0.5, -GJ(u),1);
            hist_armijo = [hist_armijo [alpha;it]];
        end
        if option == "Newton-Raphson"
            u1=u-inv(HJ(u))*GJ(u);     
        end
        if option == "Newton-Régularisé"
            A = HJ(u)+ lambda*eye(2);
            u1=u-inv(A)*GJ(u);  
            f1 = J(u);
            f2 = J(u1);
            if (f2<f1)
                lambda = lambda/10;
            else 
                lambda = lambda*10;
                u1 = u;
            end
        end
        hist_u = [hist_u u1];
        
        if (norm(GJ(u1))< tol)            
            flag= false;
            u_est = u1;
        end

        if ( k >= max_iter )
            flag= false;
            disp("Attention pas de convergence.");
            u_est = u1;
        end
        u=u1;       
    end
end
