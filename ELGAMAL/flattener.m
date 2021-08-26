function im2 = flattener(im)
[r,c] = size(im);
im2 = reshape(im,r*c,1);

end