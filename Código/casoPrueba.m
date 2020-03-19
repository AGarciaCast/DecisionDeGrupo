clear;
w = [0.4 0.3 0.2 0.1];

for i = 1:4
    for j = 1:4
        M(i,j) = w(i)/w(j);
    end
end

w1 = minCuadLog(M)
