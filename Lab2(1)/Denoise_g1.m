function u = Denoise_g1(f, K, lambda, epsilon, tau)

    if nargin < 5
        tau = 1/(lambda + 4);
    end

    u = f;
    for i = 1:K
        c = (epsilon + normgrad(u).^2).^2;      
        u = u + tau*((f-u) + (1/lambda)*div(2*gradx(u)./c, 2*grady(u)./c));
    end
end

