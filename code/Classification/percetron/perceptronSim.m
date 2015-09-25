function [ result ] = perceptronSim( data, ptrn, numRep, params, numFolds )
%PERCEPTRON Summary of this function goes here
%   Detailed explanation goes here

%% Avaliando o m�todo
for i = 1 : numRep,
    %% Embaralhando os dados
    [learningData, testData] = embaralhaDados(data, ptrn, 2);
    
    
    %% Valida��o cruzada
    fprintf('Cross validation and grid search...\n')
    [optParams{i}, Ecv{i}] = optimizePerceptron(learningData, params, numFolds);
    
    %% Perceptron Learning
    fprintf('Step %d. Training Perceptron\n', i)
    tic
    [model] = treinoPerceptron(learningData, optParams{i});
    tempoTreino(i) = toc;

        
    %% Perceptron Test
    fprintf('Step %d. Perceptron Test\n\n', i)
    tic
    [Yh, ~] = testePerceptron(model, testData);
    tempoTeste(i) = toc/size(Yh,1);
    
    % Matriz de confusao e acur�cia    
    matrizesConf{i} = confusionmat(vec2ind(testData.y'), Yh);
    acuracia(i) = trace(matrizesConf{i}) / length(Yh);
end

mediaAcc = mean(acuracia);

% Procurando a matriz de confus�o mais pr�xima da acur�cia m�dia
[~, posicoes] = sort( abs ( mediaAcc - acuracia ) );


result.desvPadr = std(acuracia);
result.matrizConfMedia = matrizesConf{posicoes(1)};
result.mediaAcc = mediaAcc;

end

