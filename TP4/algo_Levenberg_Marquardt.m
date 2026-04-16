function [u_est,k, hist_u, hist_armijo] = algo_Levenberg_Marquardt(u,GJ, alpha, max_iter, tol,Jac, r, option )

    if nargin == 7
        option = "Défaut";      
    end 
    
    flag = true;
    k=0;
    alp= alpha;
    hist_u = [];
    hist_u = [hist_u u];
    while (flag)
        
        k=k+1;
        if option == "Défaut"
            Jq = Jac(u);
            d=-(Jq'*Jq+alp*eye(2))\GJ(u);
            f0 = norm(r(u)).^2;
            f1 = norm(r(u+d)).^2;
            if(f1<f0)
                u1 = u+d;
                alp = alp/10;
            else 
                u1= u;
                alp = 10*alp;
                k=k-1;
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