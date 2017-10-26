clear all
close all

tic

img=imread('peppers.png');
img=im2double(img);

R=img(:,:,1);
G=img(:,:,2);
B=img(:,:,3);

Z=[R(:) G(:) B(:)];

nColor = 100;
Method = 'SOM Neural Network';

NetSize=[floor(sqrt(nColor)) ceil(sqrt(nColor))];
nColor = prod(NetSize);
[IDX, C]=SOM(Z,NetSize);

Z2=C(IDX,:);

R2=reshape(Z2(:,1),size(R));
G2=reshape(Z2(:,2),size(G));
B2=reshape(Z2(:,3),size(B));

img2=zeros(size(img));
img2(:,:,1)=R2;
img2(:,:,2)=G2;
img2(:,:,3)=B2;

subplot(1,2,1);
imshow(img);
title('Original Image');

subplot(1,2,2);
imshow(img2);
title(['Color Reduced Image (k = ' num2str(nColor) ') using ' Method]);

toc
