%%
% E:y^1 = x^3 + 44x + 4 over F13
% P = (1,3)-----> Generator Point(Base Point);
%Private keys be k = 5 and a = 2;
%Plaintext m = (12,7) = (m1,m2);
im = imread('image1.jpg');
im = imresize(im,[100 100]);
im = double(im);
im2 = flattener(im);
[X,Y] =  messageEmbed(im2,65239);
a = -1; b = 16; q = 65239; P = [0 38630];randk = 5; randa = 2;m = [X,Y];
obj = MenezesVastoneECC(a,b,q,P);
[Co1,Co2,C1,C2] = obj.encrypt(randa,randk,m);

[M1,~] = obj.decrypt(Co1,Co2,C1,C2,randa);
Q=floor(M1/30);
im = reshape(uint8(Q),100,100);
imshow(im);

