pytorch=`pwd`

./scpall.sh ./kill_pytorch.sh $pytorch
./scpall.sh ./multi_node_run.sh $pytorch
./scpall.sh ./main.py $pytorch
./scpall.sh ./filecopy.sh $pytorch
./scpall.sh ./scpall.sh $pytorch
./scpall.sh ./single_node_run.sh $pytorch
