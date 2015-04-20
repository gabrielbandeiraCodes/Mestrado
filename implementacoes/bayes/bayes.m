function [results] = bayes(dados, ptrn, numRepet, conf)

for i = 1 : numRepet,
    %% Embaralhando os dados
    [trainData, testData] = embaralhaDados(dados, ptrn, 1);
    
    
    %% Treinamento do Bayes
    [modelo] = trainBayes(trainData);
    
    
    %% Testando o Bayes
    [Yh] = testeBayes(modelo, testData, conf);
    
    %% Matriz de confusao e acur�cia    
    confusionMatrices{i} = confusionmat(testData.y, Yh);
    accuracy(i) = trace(confusionMatrices{i}) / length(testData.y);
    
end

meanAccuracy = mean(accuracy);

%% Procurando a matriz de confus�o mais pr�xima da acur�cia m�dia
[~, posicoes] = sort( abs ( meanAccuracy - accuracy ) );


%%
results.accMean = meanAccuracy*100;
results.std = std(accuracy);
results.confusionMatrix = confusionMatrices{posicoes(1)};
results.confusionMatrices = confusionMatrices;
results.accuracy = accuracy*100;


end