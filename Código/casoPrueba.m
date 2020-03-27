clc;
clear;
fprintf("-------------Consistente-------------\n");
w = [0.4 0.3 0.2 0.1]
M= zeros(4);
for i = 1:4
    for j = 1:4
        M(i,j) = w(i)/w(j);
    end
end

M
ic(M)
fprintf("-------------Metodo de la potencia-------------\n");
w0 = funciones(M, 0) % potencia(M)
[errorInf, IndexMaxErr, errorFro, errorUno, errorErrRel] = errores(M,w0)

fprintf("-------------Metodo de Minimos Cuadrados [Log]-------------\n");
w1 = funciones(M, 1) % minCuadLog(M)
[errorInf, IndexMaxErr, errorFro, errorUno, errorErrRel] = errores(M,w1)

fprintf("-------------Metodo de Minimos Cuadrados [Ponderado]-------------\n");
w2 = funciones(M, 2) % minCuadPond(M)
[errorInf, IndexMaxErr, errorFro, errorUno, errorErrRel] = errores(M,w2)

%Dibujar pesos
figure();
bar([w0';w1';w2']);
l=compose("A%d",(1:length(M)));
legend(l);

clear;
fprintf("-------------NO Consistente-------------\n");
M=[1 2,2,4;1,1,1.5,3;0.5,0.6,1,2;0.25,0.3,0.5,1]
ic(M)
fprintf("-------------Metodo de la potencia-------------\n");
w0 = funciones(M, 0) % potencia(M)
[errorInf, IndexMaxErr, errorFro, errorUno, errorErrRel] = errores(M,w0)

fprintf("-------------Metodo de Minimos Cuadrados [Log]-------------\n");
w1 = funciones(M, 1) % minCuadLog(M)
[errorInf, IndexMaxErr, errorFro, errorUno, errorErrRel] = errores(M,w1)
fprintf("-------------Metodo de Minimos Cuadrados [Ponderado]-------------\n");
w2 = funciones(M, 2) % minCuadPond(M)
[errorInf, IndexMaxErr, errorFro, errorUno, errorErrRel] = errores(M,w2)

%Dibujar pesos
figure();
bar([w0';w1';w2']);
l=compose("A%d",(1:length(M)));
legend(l);

