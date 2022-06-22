function u = Denoise_TV(f, K, lambda, epsilon, tau)

    if nargin < 5
        tau = 1/(lambda + 4);
    end

    u = f;
    for i = 1:K
        c = sqrt(normgrad(u).^2 + epsilon);        
        u = u + tau*(lambda*(f-u) + div(gradx(u)./c, grady(u)./c));
    end
end

