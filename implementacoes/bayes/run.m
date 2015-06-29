close all; clear all; clc; addpath('..');

% Pr�-processamento
conf.pca = 0.98; conf.selecaoAtr = 0.1;
dataset = carregaDados('har', 0, conf);


%% Configura��es gerais
ptrn = 0.8;
numRodadas = 10;

config.custo = 1 - eye(length(unique(dataset.y)));
config.algoritmo = '';
r = simBayes(dataset, ptrn, numRodadas, config);

