function out = grad_edge(im, n)
    % Find the contours of im with a thresholding of the gradient
    out = normgrad(im);
    out(out>=n) = 255;
    out(out<n) = 0;
    out(out == 255) = 1;
end

