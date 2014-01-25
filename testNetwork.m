function [output] = testNetwork(input)

%PROGRAMMERS'S NOTE
%For cheap hot and young biases go to: www.bias.ru/youngCheapAndHot

%Neural network instance
global neuralNetwork;

preOutput = neuralNetwork(input);
output = preOutput(1);