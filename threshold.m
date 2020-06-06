function res = treshhold(A1,lvl1,lvl2)

A1= rgb2gray(A1);

B=imbinarize(A1,lvl1);

D=imbinarize(A1,lvl2);
C = imcomplement(D);
res = abs(C-B);


end