function [ model ] = trainGausMix( data, conf )
%TRAINGAUSMIX Summary of this function goes here
%   Detailed explanation goes here

numClass = length(unique(data.y));
if (numClass ~= length(conf.Ks) )
    error('N�mero de componentes inv�lido');
end

for i = 1 : numClass
    conf.k = conf.Ks(i);
    
    ind = find(data.y == i);
    params{i} = gausMixEM(data.x(ind, :), conf);
    
    model.aprioriClass(i) = length(ind) / size(data.y,1);
end

model.params = params;
end

