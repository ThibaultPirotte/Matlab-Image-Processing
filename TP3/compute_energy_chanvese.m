function y = compute_energy_chanvese( image, phi, lambda, eta, tau, epsilon, n, param)

i = 1;
norme = 100000;

energy = [];

while i < 20
  
    heavyside = Heaviside_eta(phi, eta);

    c1 = sum ( sum(heavyside.*image)./length(find(phi>=0)) );
    c2 = sum ( sum((1-heavyside).*image)./length(find(phi<0)) );
    
    i1 = (image - c1).^2;
    i2 = (image - c2).^2;
   
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
    
    u = heavyside;
    energ = sum(sum(sqrt( gradx(u).^2 + grady(u).^2 + epsilon^2 ))) + lambda*sum(sum(i1.*u)) + lambda*sum(sum(i2.*(1-u)));
    energy = [energy;energ]; 
    
    if (mod(i,n) == 0)
        phi = signed_distance_from_mask(phi>0);
    end
    
    i = i + 1;
    
end

y = sortrows(energy, -1);
    

end

