function u = algorithm410( u, z, I1, I2, lambda)
tau = 0.25;
sigma = 0.5;
i = 1;
[m,n] = size(u);

while (1)
    
    
    if norm(z + sigma * [gradx(u), grady(u)])<=1
        z = z + sigma * [gradx(u), grady(u)];
    else
        z = (z + sigma * [gradx(u), grady(u)])./norm(z + sigma * [gradx(u), grady(u)]);
    end
    p = u;
    G = p + tau * ( div(z(:,1:n), z(:,n+1:n+n)) - lambda * I1 + lambda * I2);
    u = min(max(G,0),1) ;
    
    i = i+1;
   
    if norm( u - p, 2)<0.1
        break;
    end
   
    
end
fprintf('%d\n', i);


end


