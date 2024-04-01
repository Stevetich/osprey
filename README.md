### Finetune steps
#### Pascal Context
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

#### Cityscapes
**Step 1.** Download the context dataset. The data could be found [here](https://www.cityscapes-dataset.com/downloads/) after registration. We need the gtFine_trainvaltest.zip (241MB) and leftImg8bit_trainvaltest.zip (11GB). And the data should be arranged like that:

```
data
├── constructed_cityscapes.json
├── cityscapes
│   ├── leftImg8bit
│   │   ├── train
│   │   ├── val
│   ├── gtFine
│   │   ├── train
│   │   ├── val
```

**Step 2.** Install `mmengine`, `mmcv` and `cityscapesscripts`
```
pip install -U openmim
mim install mmengine
mim install "mmcv>=2.0.0"

pip install cityscapesscripts
```

**Step 3.** Convert cityscapes by (In project directory):
```
python convert_cityscapes.py ./data/cityscapes --nproc 8

# If you can not install openmim, directly run this bash file.
# !!! Before you run, copy the ./data/cityscapes/leftImg8bit/train directory first
bash convert.sh ./data/cityscapes/leftImg8bit/train
```

**Step 4.** Switch pwd directory to project directory `./osprey` (the top one) and run:
```
bash scripts/stage3.sh ./osprey/configs/cityscapes.json
```
