%function testScriptElGamal()
im = imread('image1.jpg');
im = imresize(im,[200 200]);
im = double(im);
im2 = flattener(im);
[X,Y] =  messageEmbed(im2,65239);
c = ECCElgamal(-1,16,65239,[0 38630]);
[aP1,aP2] = c.publicKeyGen();
[bP1,bP2,x,y]= c.encrypt(aP1,aP2,[X Y]);
[M1,~] = c.decrypt(bP1,bP2,x,y);
Q=floor(M1/30);
im = reshape(uint8(Q),200,200);
imshow(im);
%end
