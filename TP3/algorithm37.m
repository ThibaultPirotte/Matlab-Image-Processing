function u = algorithm37( u, I1, I2, lambda, tau, epsilon, threshold )

i = 1;


while (1)
    norme_epsilon =sqrt( gradx(u).^2 + grady(u).^2 + epsilon^2 );
    p = u;
    G = p + tau .* (div( gradx(p)./norme_epsilon , grady(p)./norme_epsilon) - lambda.*I1 + lambda.*I2);
   
    u = min(max(G,0),5) ;
    
    
    i = i + 1;
    
    if norm( u - p , 2 ) < threshold
        break;
    end
    
end
fprintf('%d\n', i);



end



