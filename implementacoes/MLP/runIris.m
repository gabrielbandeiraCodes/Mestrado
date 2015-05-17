close all; clear all; clc; addpath('..');

%% Pr�-processamento
dataset = carregaDados('iris.data', 1);

%% Configura��es gerais
ptrn = 0.75;
numRepet = 5;

% Topologia da rede
config.L = 9; %numero de neuronios na camada oculta
config.maxIterations = 300;
config.lRate = 0.05 ;

result = mlp(dataset, ptrn, numRepet, config)

