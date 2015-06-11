close all; clear all; clc; addpath('..');

% Pr�-processamento
conf.pca = 0.98; conf.selecaoAtr = 0.1;
dataset = carregaDados('har', 1, conf);


%% Configura��es gerais
ptrn = 0.8;
numRodadas = 10;

%% MLM
% config.method = 'knn'; % lsqnonlin knn ''
% for dist = {'mahalanobis', 'cityblock', ''}
%     
%     for k = [0.1 0.5 1]
%         config.k = k;
%         config.NN = 9;
%         config.distance = dist{1}; % mahalanobis cityblock ''
%         r = simMLM(dataset, ptrn, numRodadas, config);
%         
%         save(sprintf('mlm_%s_%d_D-%s_%.0f_sel', config.method, config.NN,...
%             config.distance, config.k*100))
%         
%         fprintf(sprintf('mlm_%s_%d_D-%s_%.0f_sel\n', config.method, config.NN,...
%             config.distance, config.k*100))
%     end    
% end

clear config
config.method = ''; % lsqnonlin knn ''
for dist = {'mahalanobis', 'cityblock', ''}

    for k = [0.1 0.5 1]
        config.k = k;
        config.distance = dist{1}; % mahalanobis cityblock ''
        r = simMLM(dataset, ptrn, numRodadas, config);
        
        save(sprintf('mlm_%s_%s_D-%s_%.0f_sel', config.method, 'fsolve', ...
            config.distance, config.k*100))
        
        fprintf(sprintf('mlm_%s_%s_D-%s_%.0f_sel\n', config.method, 'fsolve', ...
            config.distance, config.k*100))
    end
    
end

clear config
config.method = 'lsqnonlin'; % lsqnonlin knn ''
for dist = {'mahalanobis', 'cityblock', ''}

    for k = [0.1 0.5 1]
        config.k = k;
        config.distance = dist{1}; % mahalanobis cityblock ''
        r = simMLM(dataset, ptrn, numRodadas, config);
        
        save(sprintf('mlm_%s_%s_D-%s_%.0f_sel', config.method, 'lsqnonlin', ...
            config.distance, config.k*100))
        
        fprintf(sprintf('mlm_%s_%s_D-%s_%.0f_sel\n', config.method, 'lsqnonlin', ...
            config.distance, config.k*100))
    end
    
end