function phi = chanvese( image, phi, lambda, eta, tau, epsilon, n, threshold, param )
i = 1;
norme = 100000;

while norme > threshold
  
    heaviside = Heaviside_eta(phi, eta);

    c1 = sum ( sum(heaviside.*image)./length(find(phi>=0)) );
    c2 = sum ( sum((1-heaviside).*image)./length(find(phi<0)) );
   
    norme_epsilon =sqrt( gradx(phi).^2 + grady(phi).^2 + epsilon^2 );
  
    p = phi;
    

    G = delta_eta(p, eta).*(div(gradx(p)./norme_epsilon, grady(p)./norme_epsilon) - lambda.*(image - c1).^2 + lambda.*(image - c2).^2);

    if param == true
        tauk = 1/2*(max(max(abs(G))));
    else
        tauk = tau;
    end
    

    phi = p + tauk * G ;
    
    norme = norm( Heaviside_eta(phi, eta) - Heaviside_eta (p, eta) , 2 );
    
    if (mod(i,n) == 0)
        phi = signed_distance_from_mask(phi>0);
    end
    
    i = i + 1;
    
end
    
fprintf('%d\n', i);


end

