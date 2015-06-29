close all; clear all; clc; addpath('..');

%% Pr�-processamento
dados = carregaDados('column_2C.data', 4);

%% Configura��es gerais
ptrn = 0.8;
numRodadas = 10;
numFolds = 10;


%% Criando as combina��es de par�metros para a valida��o cruzada

gammas = 0.001:0.01:0.1;


%% Avaliando o m�todo
for i = 1 : numRodadas,
    %% Embaralhando os dados
    [dadosTrein, dadosTeste] = embaralhaDados(dados, ptrn, 2);
    
    
    %% Valida��o cruzada
    fprintf('Cross validation and grid search...\n')
    [optParams{i}, Ecv{i}] = otimizadorLSSVM(dadosTrein, gammas, numFolds);
    
    
    %% Treinamento do SVM
    fprintf('Treinando o LSSVM...\nRodada %d\n', i)
    
    modelo = MyLSSVM(dadosTrein.x, dadosTrein.y, optParams{i});
    modelo.train();
    
    Yh = modelo.classify(dadosTeste.x);
        
    % Matriz de confusao e acur�cia    
    matrizesConf{i} = confusionmat(dadosTeste.y, Yh);
    acuracia(i) = trace(matrizesConf{i}) / size(Yh,1);
end

mediaAcc = mean(acuracia);

% Procurando a matriz de confus�o mais pr�xima da acur�cia m�dia
[~, posicoes] = sort( abs ( mediaAcc - acuracia ) );


desvPadr = std(acuracia);
matrizConfMedia = matrizesConf{posicoes(1)};
clear Yh dados dadosTeste dadosTrein i posicoes