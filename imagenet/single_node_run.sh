DATA_PATH='/hetpipe_ckpt/pytorch_imagenet/imagenet_2012/'
MODEL='resnet152'
visible_gpus='0,1,2,3'
batch_size=128  # batch size on current node

echo -e "run main.py!"
CUDA_VISIBLE_DEVICES=$visible_gpus python main.py -a $MODEL \
  --dist-url 'tcp://127.0.0.1:8000' \
  --dist-backend 'nccl' \
  --multiprocessing-distributed \
  --world-size 1 \
  --rank 0 \
  -b $batch_size \
  $DATA_PATH 

echo -e "finish main.py!"
