function out = lap_edge(im)
%Find the contours of im by finding the change of sign of the laplacian
    gx = gradx(im);
    gy = grady(im);
    laplace = div(gx,gy);
    out = change_sign(laplace);
end

