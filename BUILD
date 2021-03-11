load("//bzl:module.bzl", "isaac_app")

isaac_app(
    name = "detector",
    app_json_file = "graphs/detector.app.json",
    data = glob([
        "configs/*",
        "models/*",
    ]),
    modules = [
        "deepstream",
        "sight",
        "sensors:v4l2_camera",
        "viewers",
    ],
)
