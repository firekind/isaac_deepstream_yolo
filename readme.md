# Object Detection using Yolo V3, Deepstream and Isaac.

As it says on the tin.

## Dependencies

Make sure you have Nvidia Isaac version 2020.2 and Deepstream version 5.1 installed.

## Run

Clone the repo into the `sdk/apps` directory

```
isaac/sdk/apps$ git clone https://github.com/firekind/isaac_deepstream_yolo
```

then, download the models.

```
$ ./download-models.sh
```

This will download the models into the `models/yolo` directory. Then, compile the custom deepstream yolo plugin.

```
$ cd lib
$ export CUDA_VER=<cuda version>
$ make
```

Attach a V4L2 compatible camera and note its device id. Edit the `device_id` under the `config` section of [`graphs/detector.app.json`](https://github.com/firekind/isaac_deepstream_yolo/blob/master/graphs/detector.app.json#L74) file. Then, in the `sdk` directory, run:

```
~/isaac/sdk$ bazel run //apps/isaac_deepstream_yolo:detector
```

and open `localhost:3000` on the browser to see the results.

> Note: By default, the graph uses yoloV3 tiny. To use yoloV3, edit the `config-file-path` property of the `nvinfer` element in [`graphs/detector.app.json`](https://github.com/firekind/isaac_deepstream_yolo/blob/master/graphs/detector.app.json#L82) to `apps/isaac_deepstream_yolo/configs/yolov3-config.txt`
