## SR-Caffe
Image Super-Resolution use caffe.

![](http://mmlab.ie.cuhk.edu.hk/projects/SRCNN/img/figure1.png)

This project implements two articles，["Image Super-Resolution Using Deep Convolutional Networks"](http://mmlab.ie.cuhk.edu.hk/projects/SRCNN.html)(ECCV 2014) and ["Accurate Image Super-Resolution Using Very Deep Convolutional Networks"](http://cv.snu.ac.kr/research/VDSR/) (CVPR 2016 Oral Paper).

### 工程组织结构

```css
├── dataset       (数据集)
│   ├── hdf5
│   │   ├── SRCNN-5
│   │   ├── SRCNN-Pool
│   │   └── VDSR-20
│   └── images
│       ├── 291
│       ├── 91
│       ├── 91-aug
│       └── test
├── external
│   └── caffe
├── pdf
├── test	（测试评估）
│   ├── images
│   │   ├── Set14
│   │   └── Set5
│   ├── matconvnet
│   ├── results
│   │   ├── SRCNN-5
│   │   ├── SRCNN-Pool
│   │   └── VDSR-20
│   │       ├── official
│   │       └── ours
│   └── utils
└── train	（训练）
    ├── SRCNN-5
    │   ├── caffemodel
    │   ├── convert
    │   ├── demo
    │   │   └── utils
    │   └── logs
    ├── SRCNN-Pool
    │   ├── caffemodel
    │   ├── convert
    │   ├── logs
    │   └── prototxt
    │       └── data_pool
    │           └── logs
    └── VDSR-20
        ├── caffemodel
        ├── convert
        └── logs

```

### 运行

#### 1 数据准备

下载数据集 [zip(train)](http://cv.snu.ac.kr/research/VDSR/train_data.zip)
[zip(test)](http://cv.snu.ac.kr/research/VDSR/test_data.zip)

```css
git clone https://github.com/mindcont/SR-Caffe.git
cd SR-Caffe && mkdir dataset
wget http://cv.snu.ac.kr/research/VDSR/train_data.zip
wget http://cv.snu.ac.kr/research/VDSR/test_data.zip
unzip train_data.zip images/

# use matlab 
run train/data_aug.m
```

#### 2 生成HDF5 格式，供caffe 训练
```css
generate_train.m
generate_test.m
```

#### 3 训练
```css
run train_VDSR-20.sh or train_SRCNN-5.sh
```

#### 4 测试评估
```css
run demo_SR.m
```

### 博客

- [深度学习在图像超分辨率重建中的应用](https://zhuanlan.zhihu.com/p/25532538)


- [图像超分辨率重构（一）原理及方法总结](https://blog.csdn.net/piaoxuezhong/article/details/78503416)

### 类似项目


- ["Image super-resolution as sparse representation of raw image patches"](https://github.com/tingfengainiaini/sparseCodingSuperResolution)(CVPR2008)

- [Single Image Super-Resolution from Transformed Self-Exemplars](https://github.com/jbhuang0604/SelfExSR)(CVPR2015)

- ["Real-Time
Single Image and Video Super-Resolution Using an Efficient Sub-Pixel
Convolutional Neural Network"](https://github.com/Tetrachrome/subpixel)(CVPR 2016)


- ["Photo-Realistic Single Image Super-Resolution Using a Generative Adversarial Network"](https://github.com/tensorlayer/srgan)(arxiv, 21 Nov, 2016)

- ["Deep Laplacian Pyramid Networks for Fast and Accurate Super-Resolution"](https://github.com/phoenix104104/LapSRN)(CVPR 2017)

- [Video-Super-Resolution](https://github.com/flyywh/Video-Super-Resolution)
