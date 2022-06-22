function p = algorithm412( u, z, I1, I2, lambda, teta)
tau = 0.25;
sigma = 0.5;
i = 1;
[m,n] = size(u);

grad = sigma * [gradx(u), grady(u)];
while (1)
    
    if norm(z + grad)<=1
        z = z + grad;
    else
        z = (z + grad)./norm(z + grad);
    end
    p = u;
    G = p + tau * ( div(z(:,1:n), z(:,n+1:n+n)) - lambda * I1 + lambda * I2);
    u = min(max(G,0),1) ;
    uu = u + teta*(u - p);
    grad = sigma * [gradx(uu), grady(uu)];
    
    i = i+1;
    
    if norm( u - p, 2)<0.1
        break;
    end
   
    
end
fprintf('%d\n', i);

end

