%% This function carries out modular division of the form --> (num/den)mod p
function i = modDiv(num,den,p)
result = [];
for i = 0:p-1
    m = den.* i;
    x = (m - num)./p;
    if (floor(x) == (x))
        result =[result;i];
    end
end
end
