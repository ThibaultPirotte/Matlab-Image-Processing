function Map=change_sign(J)
    %detect change of sign on a matrix J
    [m,n] = size(J);
    
    Map = zeros;
    
    for i=1:m
        for j=1:n-1
            if (J(i,j)*J(i,j+1)<=0)
                if(abs(J(i,j)) <=abs(J(i,j+1)))
                    Map(i,j) = 1;
                else
                    Map(i,j+1)=1;
                end
            end
        end
    end
    
    for j = 1:n
        for i = 1:m-1
            if(J(i,j)*J(i+1,j)<=0)
                if(abs(J(i,j)) <= abs(J(i+1,j)))
                    Map(i,j)=1;
                else
                    Map(i+1,j)=1;
                end
            end
        end
    end
    
              
           
    