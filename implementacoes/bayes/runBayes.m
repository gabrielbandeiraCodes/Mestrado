close all; clear all; clc
addpath('..');

%% Pr�-processamento
dataset = carregaDados('iris.data', 0);


%% Configura��es gerais
ptrn = 0.8;
numRepet = 10;
conf.custo = 1 - eye(length(unique(dataset.y)));
conf.algoritmo = '';

% resultCOMP = bayes(dataset, ptrn, numRepet, conf)
% 
% conf.algoritmo = 'sameVar';
% resultMVAR = bayes(dataset, ptrn, numRepet, conf)
% 
% conf.algoritmo = 'euclidean';
% resultEUCLI = bayes(dataset, ptrn, numRepet, conf)
% 
% conf.algoritmo = 'mahalanobis1';
% resultMAHALA1 = bayes(dataset, ptrn, numRepet, conf)
% 
% conf.algoritmo = 'mahalanobis2';
% resultMAHALA2 = bayes(dataset, ptrn, numRepet, conf)
% 
% conf.algoritmo = 'mahalanobis3';
% resultMAHALA3 = bayes(dataset, ptrn, numRepet, conf)




%% Superf�cie de decis�o

% lin = 2; col = 3;
% range = [-1 1 -1 1];
% conf.algoritmo = 'euclidean';
% 
% subplot(lin, col, 1)
% decisionSurface(range, conf, dataset, [2 1])
% ylabel('C. S�pala', 'FontSize', 14);
% xlabel('L. S�pala', 'FontSize', 14);
% 
% subplot(lin, col, 2)
% decisionSurface(range, conf, dataset, [3 1])
% ylabel('C. S�pala', 'FontSize', 14);
% xlabel('C. P�tala', 'FontSize', 14);
% 
% subplot(lin, col, 3)
% decisionSurface(range, conf, dataset, [4 1])
% ylabel('C. S�pala', 'FontSize', 14);
% xlabel('L. P�tala', 'FontSize', 14);
% 
% subplot(lin, col, 4)
% decisionSurface(range, conf, dataset, [3 2])
% ylabel('L. S�pala', 'FontSize', 14);
% xlabel('C. P�tala', 'FontSize', 14);
% 
% subplot(lin, col, 5)
% decisionSurface(range, conf, dataset, [4 2])
% ylabel('L. S�pala', 'FontSize', 14);
% xlabel('L. P�tala', 'FontSize', 14);
% 
% subplot(lin, col, 6)
% decisionSurface(range, conf, dataset, [4 3])
% ylabel('C. P�tala', 'FontSize', 14);
% xlabel('L. P�tala', 'FontSize', 14);