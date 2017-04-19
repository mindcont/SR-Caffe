function im_h_y = VDSR_Matconvnet(im_l_y,model,scale,use_cascade)
if use_cascade
    model_scale = 2;
else
    model_scale = scale;
end
iter_all = ceil(log(scale)/log(model_scale));
[lh,lw] = size(im_l_y);
weight = model.weight;
bias = model.bias;
layer_num = size(weight,2);
for iter = 1:iter_all
    fprintf('iter:%d\n',iter);
    im_y = single(imresize(im_l_y,model_scale,'bicubic'));
    convfea = vl_nnconv(im_y,weight{2}(:,:,1,:),bias{2},'Pad',1);
    
    %可视化第一个卷积层 64个卷积核与低分辨率的卷积结果
    for m = 1:size(weight{1},4)
        subplot(8,8,m),imshow(convfea(:,:,m));
    end
    pause;
    
    %     for i = 2:layer_num
    %         convfea = vl_nnrelu(convfea);
    %         convfea = vl_nnconv(convfea,weight{i},bias{i},'Pad',1);
    %     end
    im_h_y = convfea(:,:,1) + im_y;
    im_l_y = im_h_y;
end
if size(im_h_y,1) > lh * scale
    im_h_y = gather(im_h_y);
    im_h_y = imresize(im_h_y,[lh * scale,lw * scale],'bicubic');
end
end