classdef MenezesVastoneECC
    %% Done!
    properties
        %% Inputs:a,b,q,P,M
        % P is the base point/generator point
        a = []; b = [];
        q = []; P = [];
    end
    methods
        %%
        function obj = MenezesVastoneECC(a,b,q,P)
            obj.a = a; obj.b = b;
            obj.q = q; obj.P = P;
        end
        %% Both Alice and Bob must agree on the values of randa and randk
        %% before the commencement of encyrption and decryption
        % Encryption (Alice)
        function [Co1,Co2,C1,C2] = encrypt(obj,randa,randk,m)
            [B1,B2] = scalarMult(obj.P(1),obj.P(2),obj.a,obj.q,randa); %B = aP, randa and randk are private keys
            [y1,y2] = scalarMult(B1,B2,obj.a,obj.q,randk); %(y1,y2) = kB
            [Co1,Co2] = scalarMult(obj.P(1),obj.P(2),obj.a,obj.q,randk); %Co = kP
            C1 = mod(y1*m(:,1),obj.q); %y1*m1 mod q
            C2 = mod(y2*m(:,2),obj.q); %y2*m2 mod q
        end
        % Decryption (Bob)
        function [m1,m2] = decrypt(obj,C1,C2,C3,C4,randa)
            [y1,y2] = scalarMult(C1,C2,obj.a,obj.q,randa); %aCoc
            m1 = modDiv(C3,y1,obj.q);
            m2 = modDiv(C4,y2,obj.q);
        end
    end
    
end


