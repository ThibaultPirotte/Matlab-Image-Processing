function out = heat_equation2(f, delta, K)
    G = gaussian_kernel(floor(K*delta+1), 2*K*delta);
    out = imfilter(f, G, 'replicate');

end

