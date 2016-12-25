function [A1,B1,C1,D1] = normalizeImage(Image, V, V1, V2)
A1 = imnoise(Image, 'speckle', V); 
norma=im2double(A1);
P1 = norm(norma, 'fro'); % find the ‘fro” norm of the output image after speckle noise is added
B1 = imnoise(Image, 'salt & pepper', V1); 
normb=im2double(B1);
B1 = B1/norm(normb, 'fro')*P1; 
C1 = imnoise(Image, 'Gaussian', 0, V2); 
normc=im2double(C1);
C1 = C1/norm(normc,'fro')*P1;
D1 = imnoise(Image, 'poisson'); 
normd= im2double(D1);
D1 = D1/norm(normd,'fro')*P1; 
end

