function valeur = algo_dichotomie(f,a,b)

%Algo de dichotomie
k=10^(-9);
flag = true;
N=0;
while(flag)
    c=(a+b)/2;
    if (f(a)*f(c)<=0) 
        b=c;
    else 
        a=c;
    end
    N=N+1;
    if(abs(b-a)<k)
        disp('On a trouver une valeur');
        flag = false;
        valeur=(a+b)/2;
    end
end
disp('On a fait itération :');
disp(N);
end 