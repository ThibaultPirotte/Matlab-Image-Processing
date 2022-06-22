function u = Fourier_Tychonov(f, lambda)
    F = fft2(f);
    [m,n] = size(F);
    
    
    p = [1:m];
    p = repmat(p,n,1).';
    
    q = [1:n];
    q = repmat(q,m,1);
    
    den = lambda + 4 * (sin((pi/m)*p).^2 + sin((pi/n)*q).^2);
    Fu = (lambda * F)./ den;
    
    u = real(ifft2(Fu));   
end

