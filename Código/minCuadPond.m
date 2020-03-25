function w = minCuadPond(M)

s=size(M);
long= (s(1)*s(2))-s(1);

H2 = zeros([long,s(2)]);

% Generar b
b=zeros([long+1,1]);
b(long+1) = 1;

k=1;
for i= (1:s(1))
    for j=1:s(2)
        if (i ~= j)
            % Generar H
            H2(k,i)=1;
            H2(k,j)=-M(i,j);
            k=k+1;
        end
    end
end

H = [H2; ones(1, s(1))];

% Resolver con minimos cuadrados
w=H\b;

% Normalizar
w=w/sum(w);

return
