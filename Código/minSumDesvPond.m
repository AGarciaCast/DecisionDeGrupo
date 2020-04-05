function [w, n, p] = minSumDesvPond(M)
s = size(M);
long = (s(1)*s(2))-s(1);

x = zeros(s(1) + long + long, 1);
f = [zeros(s(1),1); ones(long,1); ones(long,1)];

% No hay desigualdades
A = [];
b = [];

Aeq = zeros(long, s(2));

k=1;
for i = 1:s(1)
    for j = 1:s(2)
        if (i ~= j)
            % Generar Aeq
            Aeq(k,i) = 1;
            Aeq(k,j) = -M(i,j);
            k = k + 1;
        end
    end
end

N = eye(long);
P = -1 * eye(long);
Aeq = [[Aeq N P]; [ones(1, s(1)) zeros(1, 2*long)]];

beq = zeros([long+1,1]);
beq(long+1) = 1;

% Todos los elementos de x mayor o igual que 0
lb = zeros(length(x), 1);

ub = [];

x = linprog(f, A, b, Aeq, beq, lb, ub);

% Coger de x la parte que nos interesa
w = x(1:s(1));

% Normalizar
w = w/sum(w);

n = x(s(1)+1:s(1)+long);
p = x(s(1)+long+1:s(1)+2*long);
end