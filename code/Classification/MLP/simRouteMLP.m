function [ result ] = simRouteMLP( data, param )
%SIMMLM Summary of this function goes here
%   Detailed explanation goes here

for i = 1 : size(data,1)
    
    for j = 1 : size(data,2)
        
        %% Shuffle data
        treinData = data{i,j}.train;
        testData = data{i,j}.test;
        
        %% 1-of-k
        if ( size(treinData.y, 2) == 1)
            labels = unique(treinData.y);
            
            code = zeros(length(labels), length(labels));
            for c = 1: length(labels),
                code(c, c) = 1;
            end
            for c = length(labels):-1:1,
                ind = (treinData.y == labels(c));
                ind2 = (testData.y == labels(c));
                tam = length(find(ind==1));
                tam2 = length(find(ind2==1));
                treinData_y(ind, :) = repmat(code(c, :), tam, 1);
                testData_y(ind2, :) = repmat(code(c, :), tam2, 1);
            end
            treinData.y = treinData_y;
            testData.y = testData_y;
            clear treinData_y testData_y
        end
        
        Ntest = size(testData.y, 1);
        
        
        %% Treinamento
        fprintf('Treinando a MLP.\n');
        net = patternnet(param);
        net.trainFcn =  'trainlm';
        %         net.trainFcn =  'traingd';
        net.trainParam.showWindow = 0;
        
        tic
        net = train(net, treinData.x', treinData.y');
        tempoTrein(i) = toc;
        
        
        %% Teste
        fprintf('Step %d. Testando a MLP.\n', i);
        tic
        y_ = net(testData.x');
        tempoTeste(i) = toc/Ntest;
        
        Y = vec2ind(y_);        
        hit(j) = (sum(Y == vec2ind(testData.y')) == length(Y));
        
        if (not(hit(j)))
            
            indNotHit = find((Y == vec2ind(testData.y')) == 0);
            [~, indC] = sort(y_, 'descend');
            Y(indNotHit) = indC(2, indNotHit);
            
            hitRej(j) = (sum(Y == vec2ind(testData.y')) == length(Y));
            
        else
            hitRej(j) = hit(j);
        end
        
    end
    
    % Result by route
    route{i}.hit = double(hit);
    route{i}.hitRej = double(hitRej);
    route{i}.tempoTeste = tempoTeste;
    route{i}.tempoTrein = tempoTrein;
end
result.routes = route;


end
