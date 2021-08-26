classdef ECCElgamal
    %% DONE!
    properties
        %% Inputs:a,b,q,P,M
        % P is the base point/generator point
        a = []; b = [];
        q = []; P = [];
    end
    methods
        %%
        function obj = ECCElgamal(a,b,q,P)
            obj.a = a; obj.b = b;
            obj.q = q; obj.P = P;
        end
        % Public key generation (Alice)
        function [aP1,aP2] = publicKeyGen(obj)
            randa = randi(20);% generate random no
            %randa = 23; %randa is th generated public key
            setappdata(0,'randa',randa);
            [aP1,aP2] = scalarMult(obj.P(1),obj.P(2),obj.a,obj.q,randa);%comute aP
            
        end
        % Encryption (Bob)
        function [bP1,bP2,x,y]= encrypt(obj,aP1,aP2,M)
            randb = randi(20); %generate random no
            %randb = 25;
            [bP1,bP2] = scalarMult(obj.P(1),obj.P(2),obj.a,obj.q,randb); %compute bP;
            [baP1,baP2] = scalarMult(aP1,aP2,obj.a,obj.q,randb);%compute b(aP)
            %sending Bob ----> Alice (M + b(aP))
            [r,c] = size(M(:,1));
            if  M(:,1) == repmat(baP1,r,c)
                if((M(:,2) == repmat(baP2,r,c)))
                    [x,y]= AddSamePoints(M(:,1),M(:,2),M(:,1),M(:,2),obj.a,obj.q);%(bP,M+b(aP)) mod q
                else
                    [x,y] = AddDiffPoints(M(:,1),M(:,2),repmat(baP1,r,c),repmat(baP2,r,c),obj.q);
                end
            else
                [x,y] = AddDiffPoints(M(:,1),M(:,2),repmat(baP1,r,c),repmat(baP2,r,c),obj.q);
            end
        end
        % Decryption (Alice)
        function [M1,M2] = decrypt(obj,bP1,bP2,x,y) %bP, M + b(aP) mod q
            x=x'; y=y';
            randa = getappdata(0,'randa');
            [abP1,abP2] = scalarMult(bP1,bP2,obj.a,obj.q,randa);
            %M = [(M + b(aP)) - a(bP)];
            [r,c] = size(x);
            if (x == repmat(abP1,r,c))
                if(y == repmat(abP2,r,c))
                    [M1,M2]= AddSamePoints(x,y,repmat(abP1,r,c),repmat(-abP2,r,c),obj.a,obj.q);
                else
                    [M1,M2] = AddDiffPoints(x,y,repmat(abP1,r,c),repmat(-abP2,r,c),obj.q);
                end
            else
                [M1,M2] = AddDiffPoints(x,y,repmat(abP1,r,c),repmat(-abP2,r,c),obj.q);
            end
            M1 = M1'; M2 = M2';
        end
    end
end


