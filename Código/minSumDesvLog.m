function [w, n, p] = minSumDesvLog(M)
s = size(M);
long = (s(1)*s(2))-s(1);

x = zeros(s(1) + long + long, 1);
f = [zeros(s(1),1); ones(long,1); ones(long,1)];

% No hay desigualdades
A = [];
b = [];

Aeq = zeros(long, s(2));
beq = zeros(long, 1);

k=1;
for i = 1:s(1)
    for j = 1:s(2)
        if (i ~= j)
            % Generar Aeq
            Aeq(k,i) = -1;
            Aeq(k,j) = 1;
            % Generar beq
            beq(k) = -log(M(i,j));
            k = k + 1;
        end
    end
end

N = eye(long);
P = -1 * eye(long);

Aeq = [Aeq N P];

% Todos los elementos de x mayor o igual que 0
lb = zeros(length(x), 1);

ub = [];

x = linprog(f, A, b, Aeq, beq, lb, ub);

% Coger de x la parte que nos interesa
v = x(1:s(1));
% Deshacer el cambio logaritmico
w = exp(v);
% Normalizar
w = w/sum(w);

n = x(s(1)+1:s(1)+long);
p = x(s(1)+long+1:s(1)+2*long);
end