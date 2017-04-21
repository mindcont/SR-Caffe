## SR-Caffe
Image Super-Resolution use caffe.

![](http://mmlab.ie.cuhk.edu.hk/projects/SRCNN/img/figure1.png)

This project implements two articles，["Image Super-Resolution Using Deep Convolutional Networks"](http://mmlab.ie.cuhk.edu.hk/projects/SRCNN.html)(ECCV 2014) and ["Accurate Image Super-Resolution Using Very Deep Convolutional Networks"](http://cv.snu.ac.kr/research/VDSR/) (CVPR 2016 Oral Paper).

### 工程组织结构

```java
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

### How to use

#### 1 数据准备

下载数据集 [zip(train)](http://cv.snu.ac.kr/research/VDSR/train_data.zip)
[zip(test)](http://cv.snu.ac.kr/research/VDSR/test_data.zip)

```java
mkdir dataset
wget http://cv.snu.ac.kr/research/VDSR/train_data.zip
wget http://cv.snu.ac.kr/research/VDSR/test_data.zip

unzip train_data.zip images/

use matlab run train/data_aug.m
```

#### 2 生成HDF5 格式，供caffe 训练
```java
generate_train.m
generate_test.m
```

#### 3 训练
```java
run train_VDSR-20.sh or train_SRCNN-5.sh
```

#### 4 测试评估
```java
run demo_SR.m
```
