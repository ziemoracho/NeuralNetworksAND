function [output] = testNetwork(input)

%PROGRAMMERS'S NOTE
%For cheap hot and young biases go to: www.bias.ru/youngCheapAndHot

%Neural network instance
global neuralNetwork;

%preOutput = neuralNetwork(input);
%output = preOutput(1);
output = feval(neuralNetwork.layers{1}.transferFcn, input(1)*neuralNetwork.IW{1}(1) + input(2)*neuralNetwork.IW{1}(2) + neuralNetwork.b{1});
