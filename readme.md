# Object Detection using Yolo V3, Deepstream and Isaac.

As it says on the tin.

## Run

Make sure you have docker and nvidia-docker installed and attach a V4L2 compatible camera and note its device id. Start a docker container using

```
$ docker run --mount source=isaac-sdk-build-cache,target=/root -v <path to project directory>:/workspace -w /workspace --gpus=all --device <path to camera eg: /dev/video2> --net=host -it firekind/isaac:2020.2-deepstream-5.0.1-devel /bin/bash
```

then, download the models.

```
/workspace$ ./download-models.sh
```

This will download the models into the `models/yolo` directory. Then, compile the custom deepstream yolo plugin.

```
$ cd lib
$ export CUDA_VER=10.2
$ make
```
Edit the `device_id` under the `config` section of [`app/graphs/detector.app.json`](https://github.com/firekind/isaac_deepstream_yolo/blob/master/app/graphs/detector.app.json#L74) file. Then, in the `sdk` directory, run:

```
$ bazel run //apps:detector
```

and open `localhost:3000` on the browser to see the results.

> Note: By default, the graph uses yoloV3 tiny. To use yoloV3, edit the `config-file-path` property of the `nvinfer` element in [`app/graphs/detector.app.json`](https://github.com/firekind/isaac_deepstream_yolo/blob/master/app/graphs/detector.app.json#L82) to `app/configs/yolov3-config.txt`
