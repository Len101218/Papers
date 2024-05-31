git clone git@github.com:aim-uofa/AdelaiDepth.git
cd AdelaiDepth
conda create -n LeReS python=3.7
conda activate LeReS

conda install pytorch torchvision cudatoolkit -c pytorch
cd LeReS
pip install -r requirements.txt
cd Minist_Test
conda install -c conda-forge torchsparse

cp <path_to_changes.diff> .
patch -p0 < changes.diff

# Download weights from https://huggingface.co/ffranchina/LeReS/tree/main


return


# optional: export PYTHONPATH=""


# depthprediction
#
# run the ResNet-50
python ./tools/test_depth.py --load_ckpt res50.pth --backbone resnet50
# run the ResNeXt-101
python ./tools/test_depth.py --load_ckpt res101.pth --backbone resnext101

# 3Dreconstruction
#
# run the ResNet-50
python ./tools/test_shape.py --load_ckpt res50.pth --backbone resnet50
# run the ResNeXt-101
python ./tools/test_shape.py --load_ckpt res101.pth --backbone resnext101

