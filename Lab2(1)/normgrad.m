function out = normgrad(im)
%Return a matrix with the norm of the gradient for all points in im
    gx = gradx(im);
    gy = grady(im);
    out = sqrt(gx.*gx + gy.*gy);
end

