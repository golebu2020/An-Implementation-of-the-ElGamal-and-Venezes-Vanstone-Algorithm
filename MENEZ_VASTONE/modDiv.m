%% This function carries out modular division of the form --> (num/den)mod p
function result = modDiv(num,den,p)
result = [];
for j = 1:length(num)
    for i = 0:p-1
        m = den*i;
        x = (m - num(j))./p;
        if (floor(x) == (x))
            result =[result;i];
           
        end
    end
end
end
