function [valeur,n] = algo_dichotomie(f,a,b)

%Algo de dichotomie
k=10^(-9);
flag = true;
n=0;
while(flag)
    c=(a+b)/2;
    if (f(a)*f(c)<=0) 
        b=c;
    else 
        a=c;
    end
    n=n+1;
    if(abs(b-a)<k)
        flag = false;
        valeur=(a+b)/2;
    end
end
end 