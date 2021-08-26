%% This gets a generator point on an elliptic curve
function [Xm,Ym] = generator(a,b,p)
%% This code generates a generator point from the elliptic curve group
[X,Y] = PointsOnCurve(a,b,p);Xm = []; Ym = [];
N = length(X);

for i = 1:10
    [xp,yp]= scalarMult(X(i),Y(i),a,p,N);
    if(~(isnan(xp)) && ~(isnan(yp)))
        Xm = [Xm;xp]; Ym = [Ym;yp];
        break;
    end
end
end

