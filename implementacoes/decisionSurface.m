function [ ] = decisionSurface( range, conf, data, atr)
%DECISIONSURFACE Summary of this function goes here
% range - intervalo do grafico, se vazio ser� calculado
% conf.algoritmo
%   DMC
%   KNN
%   bayes
%   janelaParzen
% 
% dados - base de dados
% atributos - atributos para plotar

%% Seleciona os atributos
data.x = data.x(:, atr);

%% Calcula o range
if (isempty(range)) 
    range = [min(data.x(:,1)) max(data.x(:,1)) min(data.x(:,2)) max(data.x(:,2))];
end
 
%% Gerando os dados para superf�cie de decis�o

inc = 0.01;
% gera a grade de coordenadas
[x, y] = meshgrid(range(1):inc:range(2), range(3):inc:range(4));
 
xy = [x(:) y(:)];

image_size = size(x);

testeXY.x = xy;

if (strcmp(conf.algoritmo, 'DMC') == 1)
    % Treinando o DMC
    [centroides] = trainDMC(data);
    
    % Rotulando a superf�cei de decis�o
    [classeXY] = testeDMC(centroides, testeXY);
elseif (strcmp(conf.algoritmo, 'KNN') == 1)
    
    % Rotulando a superf�cei de decis�o
    [classeXY] = testeKNN(data, testeXY, conf.K);
    
elseif (strcmp(conf.algoritmo, 'janelaParzen') == 1)
    
    [modelo] = trainPzWin(data);
    [classeXY] = testePzWin(modelo, testeXY, conf.h);
    
elseif (strcmp(conf.algoritmo, 'mixGaus') == 1)
    
    [modelo] = trainGausMix(data, conf);
    [classeXY] = testeGausMix(modelo, testeXY);

else
    
    %% Treinamento do Bayes
    [modelo] = trainBayes(data);
    
    %% Testando o DMC
    [classeXY] = testeBayes(modelo, testeXY, conf);
end

if (size(classeXY, 1) > 1)
    [~, idx] = max(classeXY');
    idx = idx';
else
    idx = classeXY';
end

decisionmap = reshape(idx, image_size);

if (sum(find(0==classeXY)) ~= 0)
    classeXY = classeXY + 1;
end
fprintf('%d\n', sum(classeXY == 1) )
fprintf('%d\n', sum(classeXY == 2) )
if (length(unique(classeXY)) == 3) 
    fprintf('%d\n', sum(classeXY == 3) )
end

% figure,

% keyboard

numClass = length(unique(classeXY));
cmap = [1 0.8 0.8; 0.8 1 0.8; 0.7 0.7 1];

cmap = spring(numClass);
cmap = rgb2hsv(cmap);

% n = brighten(cmap, .5);
% colormap(n);


plotar = [];
hold all
% for i = numClass : -1 : 1,
for i = 1 : numClass,
    
    %Seleciona apenas as amostras com a classe pretendida
    indxSD = find(classeXY == i);
    if not(isempty(indxSD))
        plot(xy(indxSD,1), xy(indxSD,2), '*', 'Color', cmap(i,:))
    end
    
end

cmap = prism(numClass*numClass);
% colormap(cmap);

for i = 1 : numClass,
        
    indTrain = find(data.y == i);
    if not(isempty(indTrain))
        plotar(i) = plot(data.x(indTrain,1), data.x(indTrain,2), 'o', 'Color', cmap(i*(numClass-1),:));
    end 
end

hold off
% legend(plotar, 'Setosa ', 'Versicolor ', 'Virg�nica', 'Location',[0.35,0.01,0.35,0.05],'Orientation','Horizontal');
% legend(plotar, 'Hernia', 'Spondylolisthesis', 'Normal', 'Location',[0.35,0.01,0.35,0.05],'Orientation','Horizontal');


end