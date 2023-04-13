%%
getd = @(p)path(p,path);
%%
clc; clear all; close all;
Io = imread('sy2.bmp');
rng('default');
[m, n, p] = size(Io);
if p~=1
    Io=rgb2gray(Io);
    p=1;
end
figure(1)
imshow(Io);
%%
I=imnoise(Io,'gaussian',0,20^2/255^2);
I=imnoise(uint8(I),'salt & pepper',0.15);
I = ricernd(double(I), 0);
I=uint8(I);
figure(2)
imshow(I);
%%
[counts,x]=imhist(I);
figure(3)
imhist(I);
%%
se=3;
If=w_recons_CO(double(I),strel('square',se));
If=uint8(If);
figure(4)
imshow(If);
%%
alpha=5;
Isum=(double(I)+alpha*double(If))./(1+alpha);
Isum=uint8(Isum);
figure(5)
imshow(Isum);
%%
X = reshape(double(Isum), m*n, p);
%%
%Parameters
C = 4;error = 1e-6;b=2;
lambda = 79*std(X); %This parameter 1/4 can be tuned

tic;
[E,center,U,iter] = LRFCM1(double(Isum),C,error,b,lambda);
toc;
[~,label]=max(U',[],2);
Is=reshape(center(label, :), m, n, p);
figure(6)
imshow(uint8(Is),'border','tight')
