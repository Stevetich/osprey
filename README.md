### Finetune steps
**Step 1.** Download the context dataset. The training and validation set of Pascal Context could be download from [here](http://host.robots.ox.ac.uk/pascal/VOC/voc2010/VOCtrainval_03-May-2010.tar). Test set is not needed. And the data should be arranged like that:

```
data
├── constructed_osprey.json
├── VOCdevkit
│   ├── VOC2010
│   │   ├── JPEGImages
│   │   ├── SegmentationClassContext
│   │   ├── ImageSets
│   │   │   ├── SegmentationContext
│   │   │   │   ├── train.txt
│   │   │   │   ├── val.txt
│   │   ├── trainval_merged.json
```

**Step 2.** Prepara the checkpoint file.
```
ckpt
├── Osprey_7b
├── open_clip_pytorch_model.bin
```

**Step 3.** Install packages
```
pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
pip install flash_attn 
```
if failed, add `--no-build-isolation`

**Step 4.** Switch pwd directory to project directory `./osprey` (the top one) and run:
```
bash scripts/stage3.sh
```
