%PROGRAMMER'S NOTE
%If you are afraid of neural networks, don't worry. It's a good thing.

%Neural network instance
global neuralNetwork;

step = 0.1;

x = 0:step:1;
y = 0:step:1;

m = length(x);
n = length(y);

z = zeros(length(x),length(y));

for i = 1:m
    for j = 1:n
        preZ = neuralNetwork([x(i) y(j)]);
        z(i,j) = preZ(1);
    end;
end;

surf(x, y, z);

title('Powierzchnia odpowiedzi');
xlabel('Wejúcie 1');
ylabel('Wejúcie 2');
zlabel('Odpowiedü');


