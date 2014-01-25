function [weights, bias] = initializeNetwork(activationFunction, dataMatrix)

%PROGRAMMER'S NOTE
%To trully understand the problem one must know, that the BIAS is often
%being misspelled and, in fact, should be called BIATCH.


%Neural network instance
global neuralNetwork;

%Input data (dataMatrix):

%inputVector1 [a b c d;
%inputVector2  e f g h;
%outputVector  i j k l]

inputMatrix = dataMatrix(1:2, 1:4);
outputVector = dataMatrix(3, 1:4);

if(strcmp(activationFunction, 'purelin')) %Linear function
    neuralNetwork = newlin(inputMatrix, outputVector);
    neuralNetwork = init(neuralNetwork);
elseif((strcmp(activationFunction, 'logsig'))||(strcmp(activationFunction,'logsig_hard'))) %sigmoid function
    neuralNetwork = newff(inputMatrix, outputVector);
    neuralNetwork.layers{1}.transferFcn = activationFunction;
    neuralNetwork.outputs{1}.processFcns = {};
    neuralNetwork.inputs{1}.processFcns = {};
    neuralNetwork.divideFcn = '';
    neuralNetwork.trainParam.min_grad = 0;
    neuralNetwork = init(neuralNetwork);
else
    err = MException('activationFunction - wrong arguments');
    throw(err);
end;
   
weights = neuralNetwork.IW{1};
bias = neuralNetwork.b{1};