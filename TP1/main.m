im = imread('cameraman.tif');
im = double(im);
figure;
imshow(im/255.);title('Base Image');

im_noise = add_gaussian_noise(im,40);
figure; imshow(im_noise/255.);title('Image with noise');

im_res = heat_equation(im_noise, 1/8, 20);
im_res2 = heat_equation(im_noise, 1/8, 40);
figure; 
subplot(1,2,1), imshow(im_res/255.); title('Heat Equation K=20')
subplot(1,2,2), imshow(im_res2/255.); title('Heat Equation K=40')


im_res3 = heat_equation2(im_noise, 1/8, 20);
im_res4 = heat_equation2(im_noise, 1/8, 40);
figure; 
subplot(1,2,1), imshow(im_res/255.); title('Convolution with gaussian K=20');
subplot(1,2,2), imshow(im_res2/255.); title('Convolution with gaussian K=40');

contours1 = Marr_Hildreth(im_noise,10);
contours2 = Marr_Hildreth(im_res,10);
contours3 = Marr_Hildreth(im_res2,10);
figure;
subplot(1,3,1), imshow(contours1);
subplot(1,3,2), imshow(contours2);
subplot(1,3,3), imshow(contours3);
title('Evolution of contours while denoising with heat equation')

im_res = Perona_Malik(im_noise, 1/8, 15, 20);
im_res2 = Perona_Malik(im_noise, 1/8, 15, 40);
figure; 
subplot(1,2,1), imshow(im_res/255.); title('Perona Malik, a = 10, K=20');
subplot(1,2,2), imshow(im_res2/255.); title('Perona_Malik, a = 10, K = 40');

contours4 = Marr_Hildreth(im_res2, 10);
figure;
subplot(1,2,1), imshow(contours3); title('Heat Equation')
subplot(1,2,2), imshow(contours4); title('Perona Malik')

im_noise = add_gaussian_noise(im,80);

im_res = heat_equation(im_noise, 1/8,40);
im_res2 = Perona_Malik(im_noise, 1/8,40,10);
im_res3 = Perona_Malik2(im_noise, 1/8,40,10,2);
contours1 = Marr_Hildreth(im_res, 15);
contours2 = Marr_Hildreth(im_res2,15);
contours3 = Marr_Hildreth(im_res3,15);
figure;
subplot(1,3,1), imshow(contours1);title('Heat Equation')
subplot(1,3,2), imshow(contours2);title('Perona Malik')
subplot(1,3,3), imshow(contours3);title('Perona Malik v2')



