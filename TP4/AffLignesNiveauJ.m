function Jaff = AffLignesNiveauJ(bx,by,d,J,n)
% bx : bornes en x
% by : bornes en y
% d  : incr�ment en x et en y
% J  : fonction
% n  : nombre de lignes de niveau
x = (bx(1):d:bx(2))'; 
y = (by(1):d:by(2))';
Jaff = zeros(length(x),length(y));
for i = 1:length(x)
    for j = 1:length(y)
        Jaff(i,j) = J([x(i);y(j)]);
    end
end
contour(x,y,Jaff',n); hold on; axis('square'); zoom on; grid minor;
xlabel('u_1'); ylabel('u_2'); 
end