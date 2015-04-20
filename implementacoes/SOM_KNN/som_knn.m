function [ results ] = som_knn( dados, ptrn, numRepet, config)

for i = 1 : numRepet,
    %% Embaralhando os dados
    [trainData, testData] = embaralhaDados(dados, ptrn, 2);
    
    %% Treinamento da SOM
    fprintf('Treinando a SOM_K-NN...\nRodada %d\n', i)
    [modelo, ~] = trainSOM_KNN(trainData, config);
    
    
    %% Testando a SOM
    fprintf('Testando a SOM...\nRodada %d\n\n', i)
    [Yh] = testeSOM_KNN(modelo, testData);
    
    %% Matriz de confusao e acur�cia    
    confusionMatrices{i} = confusionmat(testData.y, Yh);
    accuracy(i) = trace(confusionMatrices{i}) / length(find(Yh ~= 0));
    
end

meanAccuracy = mean(accuracy);

%% Procurando a matriz de confus�o mais pr�xima da acur�cia m�dia
[~, posicoes] = sort( abs ( meanAccuracy - accuracy ) );


%%
results.mean = meanAccuracy;
results.std = std(accuracy);
results.confusionMatrix = confusionMatrices{posicoes(1)};
results.confusionMatrices = confusionMatrices;

results.accuracy = accuracy;

end

