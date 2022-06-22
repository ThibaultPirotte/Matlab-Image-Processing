function f = Perona_Malik(f, delta, K, alpha)
%Apply K iterations of the Perona-Malik equation on f
    for i = 1:K
        gx = gradx(f);
        gy = grady(f);
        N = arrayfun(@(x) g(x,alpha), normgrad(f));
        gx = N.*gx;
        gy = N.*gy;
        
        f = f + delta * div(gx,gy);
    end    
end

