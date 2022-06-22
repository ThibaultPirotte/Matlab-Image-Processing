%% 
Im = double(imread('cameraman.tif'));
Im_noise = add_gaussian_noise(Im, 30);
figure; imshow(Im_noise/255.);


%% Denoising with prox5
K = 40;
tau = 0.01;
h = 30;
energy = zeros(K);
res1 = res;
for i = 1:K
    res = prox5(Im_noise,h,tau,i);
    energy(i) = norm(Im_noise-res,2).^2 + sum(sum(abs(gradx(res)) + abs(grady(res))));
end
figure; imshow(res/255.);


%% Denoising with FISTA

energy2 = zeros(K);

for i = 1:K
    res2 = fista(Im_noise,h,tau,i);
    energy2(i) = norm(Im_noise-res2,2).^2 + sum(sum(abs(gradx(res2)) + abs(grady(res2))));
end
figure; imshow(res2/255.);

x = [1:K];
figure; plot(x, energy,x,energy2); title('Evolution de la fonctionelle pendant 40 itérations'); legend({'gradient projeté','fista'});

%% Deconvolution with prox5
K = 40;

G = fspecial('gaussian',7,20);
f = Im_noise;
figure; imshow(imfilter(f,G)/255.);
energy3 = zeros(K);

lambda = 0.1;
gradF = lambda*imfilter(imfilter(f,G) - f, G);

for i = 1:K
    res3 = prox5(f - h*gradF, h,tau,i);
    energy3(i) = lambda*norm(Im_noise-imfilter(res3,G),2).^2 + sum(sum(abs(gradx(res3)) + abs(grady(res3))));
end
figure; imshow(res3/255.);





%% Deconvolution with fista

energy4 = zeros(K);

gradF = lambda*imfilter(imfilter(f,G) - f, G);

for i = 1:K
    res4 = fista(f - h*gradF, h,tau,i);
    energy4(i) = lambda * norm(Im_noise-imfilter(res4,G),2).^2 + sum(sum(abs(gradx(res4)) + abs(grady(res4))));
end
figure; imshow(res4/255.);
%plot(energy4)

x = [1:K];
figure; plot(x, energy3,x,energy4); title('Evolution de la fonctionelle pendant 40 itérations'); legend({'gradient projeté','fista'});




