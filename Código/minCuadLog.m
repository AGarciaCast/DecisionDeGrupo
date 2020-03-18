function w = minCuadLog(M)

L = log(M);
n = size(L,1);

% Generar H
A = zeros(n-1, n);
A(:,1) = ones(n-1, 1);
for k = 2:n
    A(k-1,k) = -1;
end
% A =
% 1    -1     0     0
% 1     0    -1     0
% 1     0     0    -1

H = A;
for i = 2:n
    A(:, [i-1 i]) = A(:, [i i-1]); % Cambia columna i por i-1
    H = [H; A];
end

% Generar b: poner poner fila por fila de la matriz L sin la diagonal en un vector
b = L(1, 2:n);
for i = 2:n
    b = [b L(i, [1:i-1 i+1:n])];
end
b = b'

% Resolver con minimos cuadrados
v = H\b;

% Deshacer el cambio de logaritmo. 
w = exp(v);

% Normalizar
w = w/sum(w);

end
