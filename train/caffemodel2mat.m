% --------------------------------------------------------
% 提取caffemodel中 权值(weights) 和 偏置(bias)，为测试作准备用
% --------------------------------------------------------

clc;clear all;close all;
addpath '../external/caffe/matlab'

caffe.reset_all();
caffe.set_mode_gpu();
caffe.set_device(0);

% VDSR offical caffemodel
% modelpath = 'VDSR-20/VDSR_Adam.caffemodel';
% model_prototxt = 'VDSR-20/VDSR_net_deploy.prototxt';
% 
% modelsave = 'VDSR-20/convert/VDSR_Adam_zehao.mat';

% VDSR ours (Just for test VDSR)
modelpath = 'VDSR-20/caffemodel/VDSR-20_iter_1000.caffemodel';
model_prototxt = 'VDSR-20/VDSR_net_deploy.prototxt';

modelsave = 'VDSR-20/convert/VDSR_ours-1000.mat';


net = caffe.Net(model_prototxt,modelpath,'test');
for ii = 1:20
  model.weight{ii} = net.layers(['conv',num2str(ii)]).params(1).get_data();
  model.bias{ii} = net.layers(['conv',num2str(ii)]).params(2).get_data();
end

save(modelsave,'model');
caffe.reset_all();
