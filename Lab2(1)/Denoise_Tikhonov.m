function u = Denoise_Tikhonov (f, K, lambda, tau)
    if nargin < 4
        tau = 1/(lambda + 4);
    end
    
    u = f;
    
    for i = 1:K
        u = u + tau*(lambda * (f - u) + div(gradx(u), grady(u)));  
    end   
    
end

