function [errorInf, IndexMaxErr, errorFro, errorUno, errorErrRel] = errores(M,w)

% Error
% Construccion W
W=zeros(size(M));
for i = 1:size(w)
    for j = 1:size(w)
        W(i,j) = w(i)/w(j);
    end
end

% Matriz de residuos
R = abs(M-W) ;

% Norma Infinito: residuo maximo y su indice
[errorInf, I] = max(R(:));
[I_row, I_col] = ind2sub(size(R),I);
IndexMaxErr =[I_row, I_col];
% Norma Frobenius
errorFro = norm(R,'fro');

% Norma 1 
errorUno = norm(R,1);

% Norma "ErrorRel"
errorErrRel = norm(R./M, 'fro');

% Norma "Aciertos": suma 1 si esta por encima de 1/2 ???

end