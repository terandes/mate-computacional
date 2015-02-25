function [N, i]= newton(f,fp,x0,tol,nmax)
  err = 1; i = 0;
  while err >= tol && i<= nmax
    f0 = f(x0);
    f1 = fp(x0);
    x1 = x0 - f0/f1;
    err = abs((x1-x0)/x1);
    if feval(f,x1) <= tol
      err = 0;      
    end
    i++;
    x0 = x1;
  end
  N = x1;
end
