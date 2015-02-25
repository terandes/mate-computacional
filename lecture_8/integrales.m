%% Cálculo de integrales. 
f = @(x)abs(sin(x));
x0 = linspace(0,2*pi);
y = f(x0);
%plot(x0,y)

%% integral por regla del trapecio.
function S = trapecio(f,a,b,n)
  dx = (b-a)/n;
  fy = feval(f,linspace(a,b,n+1));
  fy(1) = fy(1)/2;
  fy(n+1) = fy(n+1)/2;
  S = dx*sum(fy);
end

%% integral por regla de simpson.
function S = simpson(f,a,b,n)
  if mod(n,2) == 1
    n = n+1;
  end
  dx=(b-a)/n;
  xi=a:dx:b;
  S= dx/3*(f(xi(1))+2*sum(f(xi(3:2:end-2)))+4*sum(f(xi(2:2:end)))+f(xi(end)));
end
