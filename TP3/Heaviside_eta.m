function [ y ] = Heaviside(x , eta )

y = 0.5 * ( 1 + 2/pi * atan(x./eta) );

end

