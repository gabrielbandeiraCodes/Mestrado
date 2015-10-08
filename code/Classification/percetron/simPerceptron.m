function [ results ] = simPerceptron( dados, ptrn, numRepet, config )
%PERCEPTRON Summary of this function goes here
%   Detailed explanation goes here

for i = 1 : numRepet,
    %% Embaralhando os dados
    [trainData, testData] = embaralhaDados(dados, ptrn, 2);
    
    %% Treinamento o Perceptron
    tic
    [modelo{i}] = treinoPerceptron(trainData, config);
    tempoTrein(i) = toc;
        
    
    %% Testando o Perceptron
    tic
    [Yh] = testePerceptron(modelo{i}, testData);
    tempoTeste(i) = toc;
    
    keyboard

    
    
%     [~, target] = max(testData.y');
%     
%     %% Matriz de confusao e acuracia
%     confusionMatricesTeste{i} = confusionmat(target, Yh);
%     accuracyTeste(i) = trace(confusionMatricesTeste{i}) / length(target);
%     accuracyTeste(i)
end

meanAccuracy = mean(accuracyTeste);
meanAccuracyTrain = mean(accuracyTrain);


%% Procurando a matriz de confus?o mais pr?xima da acur?cia m?dia
[~, posicoes] = sort( abs ( meanAccuracy - accuracyTeste ) );
[~, posicoesTrain] = sort( abs ( meanAccuracyTrain - accuracyTrain ) );


%%
results.accMean = meanAccuracy*100;
results.std = std(accuracyTeste);
results.confusionMatrix = confusionMatricesTeste{posicoes(1)};
results.confusionMatrices = confusionMatricesTeste;
results.accuracy = accuracyTeste*100;
results.modelos = modelo;

results.accMeanTrain = meanAccuracyTrain*100;
results.stdTrain = std(accuracyTrain);
results.confusionMatrixTrain = confusionMatricesTrain{posicoesTrain(1)};
results.confusionMatricesTrain = confusionMatricesTrain;
results.accuracyTrain = accuracyTrain*100;

results.tempoTrein = tempoTrein;
results.tempoTeste = tempoTeste;


end

