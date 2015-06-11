close all; clear all; clc; addpath('../');

%% Pr�-processamento
conf.pca = 0.98;
conf.selecaoAtr = 0.1;
dados = carregaDados('har', 1, conf);


%% Configura��es gerais
ptrn = 0.8;
numRodadas = 10;

r = simKNN( dados, ptrn, numRodadas, 1)
