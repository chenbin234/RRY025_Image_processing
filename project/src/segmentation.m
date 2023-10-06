<<<<<<< HEAD
I = imread('./img/protrait_1.png');
=======
addpath('fun/');
addpath('img/');
addpath('out/');

I = imread('portrait_2.png');
>>>>>>> ebf29e2985ba232ec1c03ce8438105b0cc598f52
imshow(I);
Igray = rgb2gray(I);
rmat = I(:,:,1);
gmat = I(:,:,2);
bmat = I(:,:,3);
levelr = graythresh(rmat)
levelg = graythresh(gmat)
levelb = graythresh(bmat)
Ithresh = imbinarize(Igray, 0.5);
I1 = imbinarize(rmat, levelr);
I2 = imbinarize(gmat, levelg);
I3 = imbinarize(bmat, levelb);
Isum = (I1&I2&I3);
% imshowpair(I, Ithresh, 'montage');


figure;
subplot(2, 2, 1), imshow(I1);
title('Red');
subplot(2, 2, 2), imshow(I2);
title('Green');
subplot(2, 2, 3), imshow(I3);
title('Blue');
subplot(2, 2, 4), imshow(Isum);
title('Original')
Icomp = imcomplement(Isum);
Ifilled = imfill(Icomp, 'holes');


se = strel('disk', 25);
figure, imshow(Ifilled)

title('Ifilled effect')
%Iopenned = imopen(Ifilled, se);
%figure, imshow(Iopenned)
%title('Iopenned effect');

imshowpair(I, Ifilled, 'montage')



