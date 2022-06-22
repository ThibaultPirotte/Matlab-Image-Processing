%%Read image
Image = double(imread('eight.tif'));
image = add_gaussian_noise(Image, 20);

%% Mask
mask = roipoly(Image/255);
phi = signed_distance_from_mask(mask);

lambda = 0.1;
lambdaa = 0.01;
lambdaaa = 0.001;

eta = 1;
tau = 1;
epsilon = 1;
n = 10;
threshold = 0.1;
parameter0 = 1; 
parameter1 = 0; 

%%%%Display the initial curve
figure;
imagesc(Image);
title('Initianal curve');
colormap gray
hold on
contour(phi>0,'r','Linewidth',3);

%%%%%Display ChanVese result
tic
u=chanvese( Image, phi, lambdaaa, eta, tau, epsilon, n, threshold, parameter1)>0;
figure('Name', 'Final ChanVese');
imagesc(Image);
title('Final ChanVese');
colormap gray
hold on
contour(u,'r','Linewidth',3);
toc

%Compute (I-c1)²
I1 = (Image - 110).^2;
I2 = (Image - 227).^2;

%%%%Algorithm 3.7
[p,q]=size(I1);
tauu = 0.1;
u37 = randn(p,q);
tic
u37= algorithm37( u37/norm(u37), I1, I2, lambdaaa, tauu, epsilon, threshold );
figure('Name', 'Final 37');
imagesc(Image);
title('Final algo3.7');
colormap gray
hold on
contour(u37,'r','Linewidth',3);
toc

%%Compute_energy_smooth_Chan_Vese
figure;
subplot(2,1,1);
tic
energy_chan = compute_energy_chanvese(Image, phi, lambdaaa, eta, tau, epsilon, n, parameter1);
X_chan = [1:1:length(energy_chan)];
plot(X_chan, energy_chan);
title('Energy Chan-Vese');
toc

%%Compute_energy_smooth_Chan_Esedoglu
subplot(2,1,2);
tic
energy_esedoglu = compute_energy_smooth(Image>0, I1, I2, lambdaaa, epsilon);
X_chan_esed = [1:1:length(energy_esedoglu)];
plot(X_chan_esed, energy_esedoglu);
title('Energy Chan Esedoglu');
toc



%%%Algorithm 4.10
z = randn(p,q+q);
u410 = randn(p,q);

tic
u3=algorithm410( u410/norm(u410), z, I1, I2, lambdaaa);
figure('Name', 'Final 4.10');
imagesc(Image);
title('Final 4.10');
colormap gray
hold on
contour(u3,'r','Linewidth',3);
toc

%%Compute energy -> algorithm 4.10
figure;
tic
energy_410 = compute_energie(u410, I1, I2, lambdaaa);
X_chan_410 = [1:1:length(energy_410)];
plot(X_chan_410, energy_410);
title('Energy Chan 410');
toc

%%Algorithm 4.12
z412 = randn(p,q+q);
u412 = abs(randn(p,q));
teta = 0;
tic
u4 = algorithm412( u412/norm(u412), z412, I1, I2, lambdaaa, teta);
figure('Name', 'Final 4.12');
imagesc(Image);
title('Final 4.12');
colormap gray
hold on
contour(u4,'r','Linewidth',3);
toc

%%Compute energy -> algorithm 4.12
figure;
tic
energy_412 = compute_energie_412(u412, I1, I2, lambdaaa, 0);
X_chan_412 = [1:1:length(energy_412)];
plot(X_chan_412, energy_412);
title('Energy Chan 412 teta=0');
toc

