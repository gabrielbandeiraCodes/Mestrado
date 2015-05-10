close all; clear all; clc; addpath('..');

%% Pr�-processamento
conf.pca = 0.98; conf.selecaoAtr = 0.03;
dataset = carregaDados('har', 0, conf);


%% Configura��es gerais
ptrn = 0.75;
numRepet = 20;

conf.custo = 1 - eye(length(unique(dataset.y)));
conf.algoritmo = '';
resultCOMP = bayes(dataset, ptrn, numRepet, conf);