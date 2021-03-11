#!/usr/bin/env bash

mkdir -p models/yolo

# For yolo v3,
echo "Downloading yolov3 config and weights files ... "
wget https://raw.githubusercontent.com/pjreddie/darknet/master/cfg/yolov3.cfg -q --show-progress -P models/yolo
wget https://pjreddie.com/media/files/yolov3.weights -q --show-progress -P models/yolo

# For yolo v3 tiny,
echo "Downloading yolov3-tiny config and weights files ... "
wget https://raw.githubusercontent.com/pjreddie/darknet/master/cfg/yolov3-tiny.cfg -q --show-progress -P models/yolo
wget https://pjreddie.com/media/files/yolov3-tiny.weights -q --show-progress -P models/yolo