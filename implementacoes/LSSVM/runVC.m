close all; clear all; clc; addpath('..');

%% Pr�-processamento
dados = carregaDados('column_2C.data', 4);

%% Configura��es gerais
ptrn = 0.8;
numRodadas = 3;
numFolds = 3;


%% Criando as combina��es de par�metros para a valida��o cruzada

% Sigma do kernel rbf
gamma = [0.001:0.01:0.1 1:60];
% sigma = 0.001:0.01:1;

i = 1;
if (exist('sigma') == 1)
    for g = gamma
        for s = sigma
            params{i}.gamma = g;
            params{i}.sigma = s;
            i = i + 1;
        end
    end
else
    for g = gamma
        params{i}.gamma = g;
        i = i + 1;
    end
end


%% Avaliando o m�todo
for i = 1 : numRodadas,
    %% Embaralhando os dados
    [dadosTrein, dadosTeste] = embaralhaDados(dados, ptrn, 2);
    
    
    %% Valida��o cruzada e busca em grade
    fprintf('Cross validation and grid search...\n')
    [optParams{i}, Ecv{i}] = otimizadorLSSVM(dadosTrein, params, numFolds);
    
    %% Treinamento o LSSVM
    fprintf('Treinando o LSSVM...\nRodada %d\n', i)
    
    modelo = MyLSSVM(dadosTrein.x, dadosTrein.y, optParams{i});
    tic
    modelo.train();
    tempoTreino(i) = toc;
    numSV(i) = length(modelo.alphas);
    
    %% Testando o LSSVM
    fprintf('Testando o LSSVM...\nRodada %d\n\n', i)
    tic
    Yh = modelo.classify(dadosTeste.x);
    tempoTeste(i) = toc/size(Yh,1);
        
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


%%
% for i = 1 : length(params)
% aux(1, i) = params{1,i};
% aux(2, i) = params{3,i};
% end
% tri = delaunay(aux(1,:), aux(2,:));
% trimesh(tri,aux(1,:), aux(2,:), Ecv{1});
% colormap('winter')