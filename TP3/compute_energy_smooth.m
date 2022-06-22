function [ Energy ] = compute_energy_smooth(u, I1, I2, lambda, epsilon)
i = 1;
tau = 0.1;
energy = [];

while (1)
    norme_epsilon =sqrt( gradx(u).^2 + grady(u).^2 + epsilon^2 );

    p = u;

    G = p + tau .* (div( gradx(p)./norme_epsilon , grady(p)./norme_epsilon) - lambda.*I1 + lambda.*I2);
   
 
    u = min(max(G,0),1) ;
    
    i = i+1;

    energ = sum(sum(sqrt( gradx(u).^2 + grady(u).^2 + epsilon^2 ))) + lambda*sum(sum(I1.*u)) + lambda*sum(sum(I2.*(1-u)));
    energy = [energy;energ]; 
    
    if i == 20
        break;
    end
    
    
    
end
fprintf('%d\n', i);
%%%
Energy = sortrows(energy,-1);

end


