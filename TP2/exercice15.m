clc, clear, close all


p=10;
J_u = @(u) (u(1) - 1).^2 + p*(u(1).^2 -u(2)).^2;
GJ_u = @(u) [2*(u(1)-1)+2*p*(2*u(1))*(u(1).^2-u(2)); -2*p*(u(1).^2-u(2))];
HJ_u = @(u) [2+4*p*(3*(u(1).^2)-u(2)) -4*p*u(1); -4*p*u(1) 2*p];

bx=[-2,2];
by=[-2,2];
d=0.1;
direction = {[1.5;-1],[1;1],[-0.3;1],[-1;1], [1.5;-1.6]};
p=10;
n=50;
u_star=[1;1];
u_0 = [-1.2;1];
[Vp,vp] = eig(HJ_u(u_star));            % Vp : vecteurs propres; vp : valeurs propres;
cpt=0;


figure(1)
Jaff = AffLignesNiveauJ(bx,by,d,J_u,n);
plot(u_star(1), u_star(2), 'g+', 'MarkerSize',25);

[x,y]= meshgrid(-2:d:2,-2:d:2);
figure(2)
mesh(x,y,Jaff);
hold on;
plot3(u_star(1), u_star(2),J_u(u_star), 'g+', 'MarkerSize',25);


%Vérifier en traçant les lignes de niveau pour U = [0, 95; 1, 05]2 (zoom, figure 3).
bx=[0.95,1.05];
by=[0.95,1.05];
figure(3)
Jaff_2 = AffLignesNiveauJ(bx,by,0.01,J_u,n);
for j=1:size(direction,2)
    for i=0:0.1:2
        
        u=u_0+i*direction{j};
        figure(1)
        hold on;
        plot(u(1),u(2), 'r+'); 
        figure(2)
        hold on;
        plot3(u(2),u(1),J_u(u), 'r+'); 
        figure(3+j)
        plot(i,J_u(u),'rx');
        hold on;
    end    
end

