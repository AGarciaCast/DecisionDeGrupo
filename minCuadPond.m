function w = minCuadPond(M)

% Generar H a partir de M
H;

% Generar b: (0, 0, ..., 1)
[fil, ~] = size(H);
b = zeros(fil);
b(length(b)) = 1;

% Resolver con minimos cuadrados
w = H\b;

% Normalizar
w = w/sum(w);

end
