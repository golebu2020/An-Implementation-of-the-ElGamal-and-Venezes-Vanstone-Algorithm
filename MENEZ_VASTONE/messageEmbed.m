function [X,Y] =  messageEmbed(m,q)
% m ---> message m = 2174;
% q ---> Large Prime Number a = 4177
%% Embedding message on the elliptic curve
k = 30;[r,~] = size(m);
X = [];Y = [];
for i = 1:r
    for j =0:29
        %disp(j)
        x = m(i)*k + j;
        ysquare = x^3 - x + 16;
        ysquare_mod_q = mod(ysquare,q);
        y = sqrt(ysquare_mod_q);
        if((y) == floor(y))
            break;
        end
    end
    X = [X;x]; Y= [Y;y];
end
end
