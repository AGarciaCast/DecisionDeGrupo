function w = minCuadLog(M)

L= log(M);
s=size(M);
long= (s(1)*s(2))-s(1);

H = zeros([long,s(2)]);
b=zeros([long,1]);

k=1;
for i= (1:s(1))
    for j=1:s(2)
        if (i ~= j)
            % Generar H
            H(k,i)=1;
            H(k,j)=-1;
            % Generar b
            b(k)=L(i,j);
            k=k+1;
        end
    end
end

% Resolver con minimos cuadrados
v=H\b;
% Deshacer el cambio de logaritmo. 
w=exp(v);
% Normalizar
w=w/sum(w);
return 
