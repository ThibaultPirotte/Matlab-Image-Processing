function [ y ] = compute_energie_412( u, I1, I2, lambda, teta)
[m,n] = size(u);
tau = 0.25;
sigma = 0.5;
epsilon = 1;
i = 0;

z = randn(m, n+n);
energy = [];
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
    
    energ = sum(sum(sqrt( gradx(u).^2 + grady(u).^2 + epsilon^2 ))) + lambda*sum(sum(I1.*u)) + lambda*sum(sum(I2.*(1-u)));
   
    energy = [energy;energ]; 
    
    uu = u + teta*(u - p);
    grad = sigma * [gradx(uu), grady(uu)];
    
    
    
    i = i+1;
    if i == 20
        break;
    end
    
end
fprintf('%d\n', i);

y = sortrows(energy,-1);

end