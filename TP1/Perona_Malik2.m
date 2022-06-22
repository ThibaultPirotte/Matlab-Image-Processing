function f = Perona_Malik2(f, delta, K, alpha, var)
%Enhancement of the Perona Malik equation with a convolution of the
%gradient
    for i = 1:K        
        %G = gaussian_kernel(2,var);
        %C = imfilter(f, G, 'replicate');
        C = imgaussfilt(f, var);
        N = arrayfun(@(x) g(x,alpha), normgrad(C));
        
        gx = N.* gradx(f);
        gy = N.* grady(f);
        
        f = f+delta*div(gx,gy);
    
    end
end

