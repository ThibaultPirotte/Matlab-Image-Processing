function [zx,zy] = projection(zx, zy)
    norm_z = sqrt(zx.^2 + zy.^2);
    norm_z(norm_z < 1) = 1;
    
    zx = zx./norm_z;
    zy = zy./norm_z;
    
    
    


end

