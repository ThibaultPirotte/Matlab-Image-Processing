function u = Inpainting_Tichonov(f, M, K, lambda, tau)
    if nargin < 5
       tau = 1/(lambda + 4);
    end
       
    u = f;
    for i = 1:K
        u = u + tau*(lambda*(f - u).*M + div(gradx(u), grady(u)));
    end
end

