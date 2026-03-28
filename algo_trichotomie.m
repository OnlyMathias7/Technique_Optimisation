function [valeur,n] = algo_trichotomie(f,a,b)

%Algo de trichotomie
tol=10^(-9);
flag = true;
n=0;
    while(flag)
        n=n+1;
        l=(b-a)/3; %((2/3)^n)*l_0;
        p=a+l;
        q=a+2*l;
        if (f(p)<f(q)) 
            b=q;
        else 
            a=p;
        end
        if(abs(b-a)<tol)
            flag = false;
            valeur=(a+b)/2;
        end
        
    end
end