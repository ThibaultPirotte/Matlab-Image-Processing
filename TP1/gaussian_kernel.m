
function G = gaussian_kernel (P, var)
%calculate a gaussian kernel of size 2*P-1 * 2*P-1 with variance = var
  sd = sqrt(var);
  G = fspecial('gaussian', 2*P-1, sd);
end

