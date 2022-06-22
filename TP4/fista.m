function y = fista(x,h,tau, K)
   y_x = zeros(size(x));
   y_y = zeros(size(x));
   t = 1;
   zx = zeros(size(x));
   zy = zeros(size(x));
   
   for j = 1:K
       grad_Hzx = -2.*gradx(div(y_x,y_y) + x/h);
       grad_Hzy = -2.*grady(div(y_x,y_y) + x/h);
       
       zx_k = y_x - tau.*grad_Hzx;
       zy_k = y_y - tau.*grad_Hzy;
       
       [zx_k,zy_k] = projection(zx_k, zy_k);
       
       t_k = (1+sqrt(1+4*t^2))/2;
       
       y_x = zx_k + (t-1)/(t_k).*(zx_k-zx);
       y_y = zy_k + (t-1)/(t_k).*(zy_k-zy);
       
       zx = zx_k;
       zy = zy_k;
       t = t_k;
   end
   y = x + h*div(zx,zy);
   
end

