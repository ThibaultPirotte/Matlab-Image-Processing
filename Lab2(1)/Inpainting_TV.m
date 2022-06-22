function u = Inpainting_TV(f, M, epsilon, K, lambda, tau)
    if nargin < 6
        tau = 1/(lambda + 4);
    end
    
    u = f;

    for i = 1:K
        c = sqrt(normgrad(u).^2 + epsilon^2);
        u = u + tau*(lambda*(f - u).*M + div(gradx(u)./c, grady(u)./c));
    end
    
    
    


end

