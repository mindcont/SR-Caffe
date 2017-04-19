% --------------------------------------------------------
% 提取caffemodel中 权值(weights) 和 偏置(bias)，为测试作准备用
% --------------------------------------------------------

clc;
clear;
close all;

addpath '../../external/caffe/matlab'
caffe.reset_all();
fprintf('Setting to CPU mode.\n');
caffe.set_mode_cpu();


%% settings
model =  'SRCNN_deploy.prototxt';
weights = 'caffemodel/SRCNN-5_iter_10000.caffemodel';
savepath = 'convert/x3.mat';
layers = 3;

%% load model using mat_caffe
net = caffe.Net(model,weights,'test');

%% reshap parameters
weights_conv = cell(layers,1);

for idx = 1 : layers
    conv_filters = net.layers(['conv' num2str(idx)]).params(1).get_data();
    [~,fsize,channel,fnum] = size(conv_filters);
    
    if channel == 1
        weights = double(ones(fsize^2, fnum));
    else
        weights = double(ones(channel, fsize^2, fnum));
    end
    
    for i = 1 : channel
        for j = 1 : fnum
            temp = conv_filters(:,:,i,j);
            if channel == 1
                weights(:,j) = temp(:);
            else
                weights(i,:,j) = temp(:);
            end
        end
    end
    
    weights_conv{idx} = weights;
end

%% save parameters
weights_conv1 = weights_conv{1};
weights_conv2 = weights_conv{2};
weights_conv3 = weights_conv{3};
biases_conv1 = double(net.layers('conv1').params(2).get_data());
biases_conv2 = double(net.layers('conv2').params(2).get_data());
biases_conv3 = double(net.layers('conv3').params(2).get_data());

save(savepath,'weights_conv1','biases_conv1','weights_conv2','biases_conv2','weights_conv3','biases_conv3');

