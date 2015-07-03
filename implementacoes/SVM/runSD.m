close all; clear all; clc
addpath('..');

%% Pr�-processamento
dados = carregaDados('column_2C.data', 0);

%% Superf�cie de decis�o
% Configura��es
lin = 1; col = 2;
range = [-1 1 -1 1];

conf.algoritmo = 'SVM';
conf.metodo = 'SMO';
conf.fkernel = 'rbf';
conf.sigma = 4;
conf.paraC = 4;

subplot(lin, col, 1)
decisionSurface(range, conf, dados, [2 1])
% ylabel('C. S�pala', 'FontSize', 14);
% xlabel('L. S�pala', 'FontSize', 14);