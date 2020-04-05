function w = funciones(M, metodo)

if nargin == 1
    [~, w, ~] = potencia(M);
elseif nargin == 2
    if metodo == 0
        [~, w, ~] = potencia(M);
    elseif metodo == 1
        w = minCuadLog(M);
    elseif metodo == 2
        w = minCuadPond(M);
    elseif metodo == 3
        [w, ~, ~] = minSumDesvLog(M);
    else
        [w, ~, ~] = minSumDesvPond(M);
    end
else
    fprintf("Número erróneo de argumentos\n");
end

return

