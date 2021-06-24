DATA_PATH='/hetpipe_ckpt/pytorch_imagenet/imagenet_2012/'
MODEL='resnet152'
visible_gpus='0,1,2,3'
batch_size=128
epochs=1
master=tino110

rank=$1
world_size=$2  # Number of nodes

if [ -z $rank ]; then
  echo "No rank error!"
  exit 1
fi
if [ -z $world_size ]; then
  echo "No world_size error!"
  exit 1
fi

echo -e "run main.py!"
CUDA_VISIBLE_DEVICES=$visible_gpus python main.py -a $MODEL \
  --dist-url 'tcp://'${master}':8000' \
  --dist-backend 'nccl' \
  --multiprocessing-distributed \
  --world-size $world_size \
  --rank $rank \
  -b $batch_size \
  --epochs $epochs \
  $DATA_PATH 

echo -e "finish main.py!"
