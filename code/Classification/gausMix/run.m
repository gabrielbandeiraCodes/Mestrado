close all; clear all; clc; addpath('..'); addpath('../KMeans');

%% Pr�-processamento
dados = carregaDados('iris2D.data', 0);

%% Configura��es gerais
ptrn = 0.75;
numRodadas = 30;

conf.epocas = 200;
conf.threshold = 10;
conf.Ks = [2 1];

%% Mistura de Gausssianas
gausMixSim(dados, ptrn, numRodadas, conf)
