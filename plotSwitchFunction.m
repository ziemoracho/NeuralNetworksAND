%PROGRAMMER'S NOTE
%If you don't have anything creative to do with your time, write notes like i do.

%Neural network instance
global neuralNetwork;

figure();

A = - neuralNetwork.IW{1}(1) / neuralNetwork.IW{1}(2);
B = - neuralNetwork.b{1} / neuralNetwork.IW{1}(2);

x = 0:1;
y = A*x + B;

plot(x,y);
axis([0 1 0 1]);
xlabel('x1');
ylabel('x2');
title( ['x2 = ', num2str(A), ' * x1 + (', num2str(B), ')' ] );
grid on;