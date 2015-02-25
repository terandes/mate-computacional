%For es leeeeento. 
A = rand(100); b = rand(100,1);
t = cputime;
v = A*b; t1 = cputime-t;
w = zeros(100,1);
t = cputime;
for n = 1:100,
  for m = 1:100
    w(n) = w(n)+A(n,m)*b(m);
  end
end
t2 = cputime-t;
norm(v-w), t2/t1

%% plot en 3D.
x = -2:0.1:2;
[xx,yy] = meshgrid(x,x);
z = sin(xx.^2-yy.^2);
mesh(x,x,z);
surf(x,x,z);

%% Ajuste por mínimos cuadrados a línea
function coeff = least_square (x,y)
  n = length(x);
  A = [x ones(n,1)];
  coeff = A\y;
end

x = linspace(0,10,100)';
x = [x;x]
y = x + normrnd (0, 4, 200,1);
coeff = least_square(x,y);

plot(x,y,'x');
hold on
interv = [min(x) max(x)];
plot(interv,coeff(1)*interv+coeff(2));
