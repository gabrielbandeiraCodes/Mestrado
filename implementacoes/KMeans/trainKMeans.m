function [model] = trainKMeans(data, conf )
% TRAINKMEANS
%   dados - Dados para treinamento.
%   k - n�mero de clusters

%Seleciona os pr�tipos
inds = randperm(size(data,1));
prototype = data(inds(1:conf.k), :);

y = zeros(1, size(data,1));
% enquanto n�o estabilizar
for epoca = 1 : conf.epocas
    
    % Rotulando as amostras (Etapa E)
    [~, clusters] = sort(pdist2(prototype, data));
    yNew = clusters(1,:);
        
    if ( sum(y==yNew) == size(data,1) )
        fprintf('K-Means estabilizou na �poca %d\n', epoca);
        break
    end    
    y = yNew;
    
    % Posicionado os prototipos (Etapa M)
    for i=1: conf.k
        prototype(i, :) = mean(data(y==i, :));
    end
    

end

model.prototypes = prototype;
dataset.x = data;
dataset.y = y;
model.data = dataset;

end

