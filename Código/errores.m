function [errorInf, errorFro, errorUno, errorErrRel] = errores(M,w)

% Error
% Construccion W
for i = 1:size(w)
    for j = 1:size(w)
        W(i,j) = w(i)/w(j);
    end
end

% Matriz de residuos
R = abs(M-W) ;

% Norma Infinito: residuo maximo y su indice
[errorInf, I] = max(R(:));
[I_row, I_col] = ind2sub(size(R),I)

% Norma Frobenius
errorFro = norm(R,'fro');

% Norma 1 
errorUno = sum(sum(R));

% Norma "ErrorRel"
errorErrRel = norm(R./M, 'fro');

% Norma "Aciertos": suma 1 si esta por encima de 1/2 ???

end