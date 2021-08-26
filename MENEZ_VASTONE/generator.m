%% This gets a generator point on an elliptic curve
function [genX,genY] = generator(a,b,p)
%% This code generates a generator point from the elliptic curve group
[X,Y] = PointsOnCurve(a,b,p);
N = length(X);
genX = [];genY = [];
for i = 1:N
    [xp,yp]= scalarMult(X(i),Y(i),a,p,N);
    genX = [genX;xp];genY = [genY;yp];
end
end
%  if(~(isnan(xp)) && ~(isnan(yp)) && xp ~= Inf && yp ~= Inf)
%         genX = [genX;xp];genY = [genY;yp];
%         break;
%     end
