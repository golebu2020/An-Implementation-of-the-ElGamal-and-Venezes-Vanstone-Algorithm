function [x2,y2]= scalarMult(x1,y1,a,p,N)
% x2 = zeros(length(x1)); y2 = zeros(length(y1));
for i = 2:N
    if(i == 2)
        [x2,y2] = AddSamePoints(x1,y1,x1,y1,a,p);
    else
        [x3,y3] = AddDiffPoints(x2,y2,x1,y1,p);
        x2 = x3; y2 = y3;
    end
end
end