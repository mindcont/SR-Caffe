% --------------------------------------------------------
% 提取caffemodel中 权值(weights) 和 偏置(bias)，为测试作准备用
% --------------------------------------------------------

clc;clear all;close all;
addpath '../external/caffe/matlab'

caffe.reset_all();
caffe.set_mode_gpu();
caffe.set_device(0);

% SRCNN-5 offical method cvpr16
% modelpath = 'SRCNN-5/caffemodel/SRCNN-5_iter_10000.caffemodel';
% model_prototxt = 'SRCNN-5/SRCNN_deploy.prototxt';
% 
% modelsave = 'SRCNN-5/convert/SRCNN-5_ours-10000.mat';

% SRCNN-Pool ours model
modelpath = 'SRCNN-Pool/caffemodel/SRCNN-Pool_iter_1000.caffemodel';
model_prototxt = 'SRCNN-Pool/SRCNN_deploy.prototxt';

modelsave = 'SRCNN-Pool/convert/SRCNN-Pool_ours-1000.mat';


net = caffe.Net(model_prototxt,modelpath,'test');
for ii = 1:3
  model.weight{ii} = net.layers(['conv',num2str(ii)]).params(1).get_data();
  model.bias{ii} = net.layers(['conv',num2str(ii)]).params(2).get_data();
end

save(modelsave,'model');
caffe.reset_all();
