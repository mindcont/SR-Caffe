% --------------------------------------------------------
% 对数据集进行扩增（Data Augumentation）
% --------------------------------------------------------

clc;
clear all;
close all;

%% settings
folder = '../dataset/images/91';% 原数据集
savepath = '../dataset/images/91-aug/';% 扩增后数据集

filepaths = [dir(fullfile(folder, '*.jpg'));dir(fullfile(folder, '*.bmp'))];

for i = 1 : length(filepaths)
    filename = filepaths(i).name;
    [add, im_name, type] = fileparts(filepaths(i).name);
    image = imread(fullfile(folder, filename));

    for angle = 0: 1 : 3
        im_rot = rot90(image, angle);
        imwrite(im_rot, [savepath im_name, '_rot' num2str(angle*90) '.bmp']);

        for scale = 0.6 : 0.1 :0.9
            im_down = imresize(im_rot, scale, 'bicubic');
            imwrite(im_down, [savepath im_name, '_rot' num2str(angle*90) '_s' num2str(scale*10) '.bmp']);
        end

    end
end
