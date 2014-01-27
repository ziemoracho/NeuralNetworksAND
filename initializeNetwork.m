function [weights, bias] = initializeNetwork(activationFunction, inputMatrix, outputMatrix)

%PROGRAMMER'S NOTE
%To trully understand the problem one must know, that the BIAS is often
%being misspelled and, in fact, should be called BIATCH.


%Neural network instance
global neuralNetwork;
global theta;

%assign to theta (hard sigmoid parameter), change if you like
theta = 50;

if(strcmp(activationFunction, 'purelin')) %Linear function
    neuralNetwork = newlin(inputMatrix, outputMatrix);
    neuralNetwork = init(neuralNetwork);
elseif((strcmp(activationFunction, 'logsig'))||(strcmp(activationFunction,'logsig_hard'))) %sigmoid function
    neuralNetwork = newff(inputMatrix, outputMatrix);
    neuralNetwork.trainFcn = 'traingdm';
    neuralNetwork.layers{1}.transferFcn = activationFunction;
    neuralNetwork.outputs{1}.processFcns = {};
    neuralNetwork.inputs{1}.processFcns = {};
    neuralNetwork.divideFcn = '';
    neuralNetwork.trainParam.min_grad = 0;
    
    neuralNetwork.IW{1}(1) = rand(1);
    neuralNetwork.IW{1}(2) = rand(1);
    neuralNetwork.b{1} = -rand(1);
else
    err = MException('activationFunction - wrong arguments');
    throw(err);
end;
   
weights = neuralNetwork.IW{1};
bias = neuralNetwork.b{1};