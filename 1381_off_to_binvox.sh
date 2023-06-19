#!/bin/bash

curl -O https://3dvision.princeton.edu/projects/2014/3DShapeNets/ModelNet10.zip
unzip -q ModelNet10.zip
du -sh ModelNet10
ls -l ModelNet10
curl -O https://raw.githubusercontent.com/ChristianEspirituCueva/ML_RestorationGAN/main/binvox
chmod +x binvox
mkdir -p test
mkdir -p train
cd train
for directory in ../ModelNet10/*; do
    if [[ -d $directory ]]; then
        for f in $directory/train/*; do
            mv $f .
        done
    fi
done

cd ../test
for directory in ../ModelNet10/*; do
    if [[ -d $directory ]]; then
        for f in $directory/test/*; do
            mv $f .
        done
    fi
done

for f in *; do
		echo "Processing $f"
    ../binvox -pb -d 32 $f &> /dev/null
done
cd ../train
for f in *; do
		echo "Processing $f"
    ../binvox -pb -d 32 $f &> /dev/null
done
