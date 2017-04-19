python_dir="../../external/caffe/python/"
cd $python_dir

rankdir="LR"
draw_net="draw_net.py"

proto_file="../../../train/SRCNN-5/SRCNN_train.prototxt"
image_file="../../../train/SRCNN-5/SRCNN_train.png"

python $draw_net $proto_file $image_file --rankdir=$rankdir

proto_file="../../../train/SRCNN-5/SRCNN_deploy.prototxt"
image_file="../../../train/SRCNN-5/SRCNN_deploy.png"

python $draw_net $proto_file $image_file --rankdir=$rankdir
