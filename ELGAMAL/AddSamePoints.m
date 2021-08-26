%% THis function adds same points i.e.: P(x1,y1)+ P(x1,y1) = 2P(x1,y1) -- > Point Doubling Operation
function [x3,y3] = AddSamePoints(x1,y1,x2,y2,a,p)
num = 3*x1.^2 + a;
den = 2*y1;
[r,c] = size(x1);
lambda = modDiv(num,den,p);
lambda = repmat(lambda,r,c);
x3 = mod(lambda.^2 - x1 - x2,p);
y3 = mod(lambda.*(x1 - x3) - y1,p);
end