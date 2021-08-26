%% THis function adds two points say: P(x1,y1) and Q(x2,y2) to get R(x3,y3)
function [X,Y] = AddDiffPoints(x1,y1,x2,y2,p)
[r,c] = size(x1);X = []; Y = [];
num = y2 - y1;
den = x2 - x1;
lambda = modDiv(num,den,p);
x3 = mod(lambda.^2 - x1 - x2,p);
y3 = mod(lambda.*(x1 - x3) - y1,p);
X = [X x3]; Y = [Y y3];

end
% %% THis function adds two points say: P(x1,y1) and Q(x2,y2) to get R(x3,y3)
% function [X,Y] = AddDiffPoints(x1,y1,x2,y2,p)
% [r,c] = size(x1);X = []; Y = [];
% for i = 1:r
%     num = y2(i) - y1(i);
%     den = x2(i) - x1(i);
%     if(den ~= 0)
%         lambda = modDiv(num,den,p);
%         x3 = mod(lambda^2 - x1(i) - x2(i),p);
%         y3 = mod(lambda*(x1(i) - x3) - y1(i),p);
%     else
%         x3 = inf;y3= inf;
%     end
%     X = [X x3]; Y = [Y y3];
% end
% 
% end