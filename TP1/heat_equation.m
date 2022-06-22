
function f = heat_equation (f, delta, K)
%Apply K iterations of the Heat equation on f with
%a time delta = delta
  for i = 1:K
    fgradx = gradx(f);
    fgrady = grady(f);
    flaplace = div(fgradx, fgrady);
    f = f + delta*flaplace;
  end
end
