function out = add_gaussian_noise (I, s)
  % add a gaussian noise to an image
  [m,n] = size(I);
  out = I+s*randn(m,n);
end
