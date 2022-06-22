function u = Denoise_g2(f, K, lambda, epsilon, tau)

    if nargin < 5
        tau = 1/(lambda + 4);
    end

    u = f;
    for i = 1:K
        c = epsilon + normgrad(u).^2;      
        u = u + tau*(lambda*(f-u) + div(2*gradx(u)./c, 2*grady(u)./c));
    end
end

