clear;

w = [0.4 0.3 0.2 0.1];

for i = 1:4
    for j = 1:4
        M(i,j) = w(i)/w(j);
    end
end

M

w0 = funciones(M, 0) % potencia(M)
[errorInf, errorFro, errorUno, errorErrRel] = errores(M,w0);

w1 = funciones(M, 1) % minCuadLog(M)
[errorInf, errorFro, errorUno, errorErrRel] = errores(M,w1);

w2 = funciones(M, 2) % minCuadPond(M)
[errorInf, errorFro, errorUno, errorErrRel] = errores(M,w2);