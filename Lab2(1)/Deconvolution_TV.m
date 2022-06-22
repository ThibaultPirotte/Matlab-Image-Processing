function u = Deconvolution_TV(f, K, G, lambda, epsilon, tau)    
    if nargin < 6
        tau = 1/(lambda + 4);
    end
    u = f;
    
    for i = 1:K
        c = sqrt(normgrad(u).^2 + epsilon^2);
        ufilter = imfilter(u, G,'replicate');
        u = u + tau*(lambda * imfilter(f - ufilter,G, 'replicate') + div(gradx(u)./c, grady(u)./c));
    end

end

