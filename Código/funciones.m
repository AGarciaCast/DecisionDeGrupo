function w = funciones(M, metodo)

if metodo == 0
    [~, w, ~] = potencia(M);
elseif metodo == 1
        w = minCuadLog(M);
else
    w = minCuadPond(M);
end

end
    
% Testear con caso de prueba

% Falta calcular indices de consistencia??
