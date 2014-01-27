function [weights, bias] = trainNetwork(inputMatrix, outputMatrix, numEpochs, learningRate, momentum)

%PROGRAMMER'S NOTE
%The oldest jews say, that the other method to train neural network is to
%bring it to the gym.

%Neural network instance
global neuralNetwork;

%inputVector1 [a b c d;
%inputVector2  e f g h;
%outputVector  i j k l]


neuralNetwork.trainParam.epochs = numEpochs;

if(strcmp( neuralNetwork.layers{1}.transferFcn, 'purelin') ~= 1)
    neuralNetwork.trainParam.mc = momentum;
    neuralNetwork.trainParam.lr = learningRate; 
end;

neuralNetwork = train(neuralNetwork, inputMatrix, outputMatrix);

weights = neuralNetwork.IW{1};
bias = neuralNetwork.b{1};