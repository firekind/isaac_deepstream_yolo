load("@com_nvidia_isaac_sdk//bzl:module.bzl", "isaac_app")

filegroup(
    name = "configs",
    srcs = glob(["configs/*"]),
)

isaac_app(
    name = "detector",
    app_json_file = "graphs/detector.app.json",
    data = [
        "lib/libnvdsinfer_custom_impl_Yolo.so",
        ":configs",
        "//:resnet_models",
        "//:yolo_models",
    ],
    modules = [
        "@com_nvidia_isaac_sdk//packages/deepstream",
        "@com_nvidia_isaac_sdk//packages/sight",
        "@com_nvidia_isaac_sdk//packages/sensors:v4l2_camera",
        "@com_nvidia_isaac_sdk//packages/viewers",
    ],
)
