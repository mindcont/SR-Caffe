 clc;
 clear all;
 close all;

a= imread('./images/Set5/baby_GT.bmp');
b= imread('./images/Set5/bird_GT.bmp');
c= imread('./images/Set5/butterfly_GT.bmp');

% Test/Demo_SR_Conv.m Line 57-59
% figure;imshow(uint8(im_b));title('Bicubic Interpolation');
% figure;imshow(uint8(im_h));title('SR Reconstruction');
% figure;imshow(uint8(im_gt));title('Origin');

% follow your way, display not right
% figure;imshow(a);title('baby');
% figure;imshow(b);title('bird');
% figure;imshow(c);title('butterfly');

% right display code
imshow(a),title('baby');
figure,imshow(b),title('bird');
figure,imshow(c),title('butterfly');
