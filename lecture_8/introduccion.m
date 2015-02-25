%% Script introductorio para la clase de Mate computacional.
%% Calculos sencillos. 
exp(log(1))
exp(-i*pi)

%% pequeña diferencia
1-0.2-0.2-0.2-0.2-0.2
1-0.25-0.25-0.25-0.25

%% Asignación de variables 
aux = exp(1);
val = log(aux);

%% Manejo de vectores.
vec1 = [1,1,1,1,1,1]
vec1'
vec1*vec1
vec1'*vec1
vec1*vec1'
vec2 = [1,2,3,4,5,6]
vec1.*vec2

%% Manejo de Matrices
mat1 = [1,2;3,4]
mat2 = [-1,0;0,-1]
mat3 = [1,2,3;4,5,6]
mat1 * mat2 
mat1 * mat3
mat1 * mat3'

% Accesar valores.
mat3(:,1)
mat3(1:2,:)

%% Solución de sistemas de ecuaciones
A = [1, pi, exp(1);
     2, 3, 4;
     log(10), -1, 0.2;
    ]
b = [5,10,11]'
x = b\A


