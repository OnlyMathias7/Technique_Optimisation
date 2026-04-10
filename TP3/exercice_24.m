clc, clear, close all,

message = "Choix fonction";
opt1 = "a = 1, c = 0 et d = 1 (r = 1)";
opt2 = "a = 0.5, c = 0.1 et d = 0.5 (r = 1.5)";
opt3 = "a = 7.5, c = 4.5 et d = 5 (r = 7)";
opt4 = "a = 1, c = 0 et d = 5 (r = 5)";
opt5 = "a = 1, c = 0 et d = 10 (r = 10)";
opt6 = "a = 25, c = 0.001 et d = 0.5 (r = 50)";
choice = menu(message,opt1, opt2, opt3, opt4, opt5, opt6);
if (choice == 1) 
    a=1; c=0; d=0; r=1;  
end
if (choice == 2) 
    a=0.5; c=0.1; d=0.5; r=1.5;  
end
if (choice == 3) 
    a=7.5; c=4.5; d=5; r=7;  
end
if (choice == 4) 
    a=1; c=0; d=5; r=5;  
end
if (choice == 5) 
    a=1; c=0; d=10; r=10;  
end
if (choice == 6) 
    a=25; c=0.001; d=0.5; r=50;  
end

A_matrice = [a c ; c d];
b = [-2; 1];
J_u = @(u) 0.5*(u'*A*u)-b'*u ;
GJ_u = @(u) A*u-b;

