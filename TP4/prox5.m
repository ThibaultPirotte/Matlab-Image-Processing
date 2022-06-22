function y= prox5(x,h,tau, K)
    zx = zeros(size(x));
    zy = zeros(size(x));
    
    for i = 1:K
           grad_Hzx = -2.*gradx(div(zx,zy) + x/h);
           grad_Hzy = -2.*grady(div(zx,zy) + x/h);
           
           zx = zx - tau.*grad_Hzx;
           zy = zy - tau.*grad_Hzy;
           
           [zx,zy] = projection(zx,zy);
    end
    y = x+h*div(zx,zy);
    

    
end

