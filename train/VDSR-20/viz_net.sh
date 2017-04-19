python_dir="../../external/caffe/python/"
cd $python_dir

rankdir="LR"
draw_net="draw_net.py"

proto_file="../../../train/vdsr/VDSR_net.prototxt"
image_file="../../../train/vdsr/VDSR_net.png"

python $draw_net $proto_file $image_file --rankdir=$rankdir

proto_file="../../../train/vdsr/VDSR_net_deploy.prototxt"
image_file="../../../train/vdsr/VDSR_net_deploy.png"

python $draw_net $proto_file $image_file --rankdir=$rankdir
