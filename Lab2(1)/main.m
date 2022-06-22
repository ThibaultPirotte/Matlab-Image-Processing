im = imread('cameraman.tif');
im = double(im);
figure;
imshow(im/255.);title('Base Image');

im_noise = add_gaussian_noise(im,20);
figure; imshow(im_noise/255.);

im_res = Denoise_Tikhonov(im_noise, 20, 1);
figure; imshow(im_res/255.);
im_res = Denoise_Tikhonov(im_noise, 20, 0.1);
figure; imshow(im_res/255.);
im_res = Denoise_Tikhonov(im_noise, 20, 0.01);
figure; imshow(im_res/255.);

%im_res = Denoise_TV(im_noise,100,0.1,1,0.4);
%figure; imshow(im_res/255.);
%im_res = Denoise_TV(im_noise,100,0.001,1,0.4);
%figure; imshow(im_res/255.);
%im_res = Denoise_TV(im_noise,100,0.0001,1,0.4);
%figure; imshow(im_res/255.);

%im_res = Fourier_Tychonov(im_noise,1);
%figure; imshow(im_res/255.);
%im_res = Fourier_Tychonov(im_noise,0.1);
%figure; imshow(im_res/255.);


%G= fspecial('gaussian',[7 7],5);
%im_res = imfilter(im_noise, G);
%figure; imshow(im_res/255.);
%im_res2 = Deconvolution_TV(im_res, 100, G, 1 , 1, 0.2);
%figure; imshow(im_res2/255.);
%im_res2 = Deconvolution_TV(im_res, 100, G, 0.1 , 1, 0.2);
%figure; imshow(im_res2/255.);

%im_res = Denoise_g1(im_noise, 1000, 0.0001, 0.5,0.01);
%figure; imshow(im_res/255.);


%im_res = Denoise_g2(im_noise, 1000, 0.01, 0.8,1);
%figure; imshow(im_res/255.);
%im_res = Denoise_g2(im_noise, 1000, 0.001, 0.8,1);
%figure; imshow(im_res/255.);

%im = imread('Im2.png');
%im = double(im);

%M = imread('Im2_mask.png');
%M = double(M)/255.;


%figure;
%imshow(im/255.);

%im_res = Inpainting_TV(im, M, 1, 1000, 1,0.2);
%figure;imshow(im_res/255.);

%im_res = Inpainting_Tichonov(im, M, 1000,1);
%figure; imshow(im_res/255.);
