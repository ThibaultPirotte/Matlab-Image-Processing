function out = Marr_Hildreth(im, n)
%Find the contours by applying grad_edge AND lap_edge
    out = grad_edge(im,n) + lap_edge(im);
    out(out == 1) = 0;
    out(out == 2) = 1;
end



