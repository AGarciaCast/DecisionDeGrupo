function [errorInf, IndexMaxErr, errorFro, errorUno, errorErrRel, errorNoAciertos] = errores(M,w)

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
errorUno = sum(sum(R));

% Norma "ErrorRel"
errorErrRel = norm(R./M, 'fro');

% Norma "No aciertos"
m = length(M);
errorNoAciertos = 0;
for i = 1:m
    for j = i:m
        if w(i) > w(j) && M(i,j) < 1
            errorNoAciertos = errorNoAciertos + 1;
        elseif (w(i) == w(j) && M(i,j) ~= 1) || (w(i) ~= w(j) && M(i,j) == 1)
            errorNoAciertos = errorNoAciertos + 0.5;
        end
    end
end

end