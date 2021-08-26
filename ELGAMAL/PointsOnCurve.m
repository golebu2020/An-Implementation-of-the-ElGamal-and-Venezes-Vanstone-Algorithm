function [X,Y] = PointsOnCurve(a,b,p)
%% prime number p, a and b
clc;
%% Quadratic REsidue
Q = (p-1)/2;
x = 1:Q;
%% x^2 mod p
X2 = mod(x.^2,p);
%% (p-x)^2 mod p
X3 = mod((x-p).^2,p);
%% Quadratic Residue Set
Qp = sort(X3);
x = 0:p-1; % x
y_2 = mod(x.^3 + a*x + b,p); %y^2
%% determining if y^2 is a member of Qp
y_2E = ismember(y_2,Qp);
%% Filtering...x_filter, y_2_filter
x_filter = []; y_2_filter = [];
for i = 1:length(y_2E)
    if(y_2E(i) == 1)
        x_filter = [x_filter;x(i)];
        y_2_filter = [y_2_filter;y_2(i)];
    end
end
x = x_filter; %Reassigning
y_2 = y_2_filter; %Reassigning
%% Getting Sqaure roots, i.e., y1
y1 = [];
for j = y_2'
    ys = sqrt(j);
    if floor(ys) == ys
        y1 = [y1;ys];
    else
        for i = 0:p-1
            if(mod(i*i,p) == j)
                y1 = [y1;i];
                break;
            end
        end
    end
    
end
%% Second Point y2
y2 = p - y1;
%% Hence, the points on the Elliptic Cuve E for the finite field 2p is given as:
X = repmat(x,2,1);
Y = [y1;y2];
X = [inf;X]; Y =[inf;Y];
end



