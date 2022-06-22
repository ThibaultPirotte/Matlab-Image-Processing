function y = prox4(u,h);    
    u(u>h) = u(u>h) - h;
    u(u<-h) = u(u<-h) + h;
    u(abs(u) < h) = 0;
    y = u;
    
end



