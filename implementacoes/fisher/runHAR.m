close all; clear all; clc; addpath('..');

%% Pr�-processamento
conf.pca = 0.98; conf.selecaoAtr = 0.03;
dados = carregaDados('har', 0, conf);

%dados = carregaDados('iris.data', 0);


%% Configura��es gerais
ptrn = 0.8;
numRepet = 10;

bayes(dados, ptrn, numRepet)