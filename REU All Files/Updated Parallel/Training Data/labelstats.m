results= [];
[resultstemp] = percentstats(TrainLabels(1:10000,:));
results= [results; resultstemp];
[resultstemp] = percentstats(TrainLabels(1:50000,:));
results= [results; resultstemp];
% for x = 1:7
%     iterations= x*1000;
% [resultstemp] = percentstats(TrainLabels(1:iterations,:));
% results = [results; resultstemp];
% end
