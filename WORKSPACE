"""
Copyright (c) 2019, NVIDIA CORPORATION. All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:
 * Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
 * Neither the name of NVIDIA CORPORATION nor the names of its
   contributors may be used to endorse or promote products derived
   from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ``AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
"""

workspace(name = "isaac_deepstream_yolo")

# Point following dependency to Isaac SDK downloaded from https://developer.nvidia.com/isaac/downloads
ISAAC_SDK_RELEASE = "/isaac"

local_repository(
    name = "com_nvidia_isaac_engine",
    path = "{}/engine".format(ISAAC_SDK_RELEASE),
)

local_repository(
    name = "com_nvidia_isaac_sdk",
    path = "{}/sdk".format(ISAAC_SDK_RELEASE),
)

load("@com_nvidia_isaac_engine//third_party:engine.bzl", "isaac_engine_workspace")
load("@com_nvidia_isaac_sdk//third_party:packages.bzl", "isaac_packages_workspace")
load("@com_nvidia_isaac_sdk//third_party:assets.bzl", "isaac_assets_workspace")
load("@com_nvidia_isaac_engine//bzl:deps.bzl", "isaac_http_archive")

isaac_engine_workspace()

isaac_packages_workspace()

isaac_assets_workspace()

# uncomment the next two lines if ros is required
# load("@com_nvidia_isaac_sdk//third_party:ros.bzl", "isaac_ros_workspace")
# isaac_ros_workspace()

# uncomment the next two lines if zed is required
# load("@com_nvidia_isaac_sdk//third_party:zed.bzl", "isaac_zed_workspace")
# isaac_zed_workspace()

# uncomment the next two lines if sensor certification is required
# load("@com_nvidia_isaac_sdk//packages/sensor_certification:sensor_certification.bzl", "sensor_certification_workspace")
# sensor_certification_workspace()

# Loads before boost to override for aarch64 specific config
isaac_http_archive(
    name = "org_lzma_lzma",
    build_file = "//third_party:lzma.BUILD",
    licenses = ["@org_lzma_lzma//:COPYING"],
    sha256 = "9717ae363760dedf573dad241420c5fea86256b65bc21d2cf71b2b12f0544f4b",
    strip_prefix = "xz-5.2.4",
    type = "tar.xz",
    url = "https://developer.nvidia.com/isaac/download/third_party/xz-5-2-4-tar-xz",
)

# Loads boost c++ library (https://www.boost.org/) and
# custom bazel build support (https://github.com/nelhage/rules_boost/)
# explicitly due to bazel bug: https://github.com/bazelbuild/bazel/issues/1550
isaac_http_archive(
    name = "com_github_nelhage_rules_boost",
    licenses = ["@com_github_nelhage_rules_boost//:LICENSE"],
    patches = ["@com_nvidia_isaac_engine//third_party:rules_boost.patch"],
    sha256 = "1479f6a46d37c415b0f803186bacb7a78f76305331c556bba20d13247622752a",
    type = "tar.gz",
    url = "https://developer.nvidia.com/isaac/download/third_party/rules_boost-82ae1790cef07f3fd618592ad227fe2d66fe0b31-tar-gz",
)

load("@com_github_nelhage_rules_boost//:boost/boost.bzl", "boost_deps")

boost_deps()

####################################################################################################

# uncomment the following if cartographer is required
# isaac_http_archive(
#     name = "com_github_googlecartographer_cartographer",
#     licenses = ["@com_github_googlecartographer_cartographer//:LICENSE"],
#     sha256 = "a52591e5f7cd2a4bb63c005addbcfaa751cd0b19a223c800b5e90afb5055d946",
#     type = "tar.gz",
#     url = "https://developer.nvidia.com/isaac/download/third_party/cartographer-bcd5486025df4f601c3977c44a5e00e9c80b4975-tar-gz",
# )

# load("@com_github_googlecartographer_cartographer//:bazel/repositories.bzl", "cartographer_repositories")

# cartographer_repositories()

# # Loads Google grpc C++ library (https://grpc.io/) explicitly for cartographer
# load("@com_github_grpc_grpc//bazel:grpc_deps.bzl", "grpc_deps")

# grpc_deps()

# bind(
#    name = "zlib",
#    actual = "@net_zlib_zlib//:zlib",
# )

####################################################################################################

# uncomment the following if prometheus is required
# # Loads Prometheus Library (https://github.com/jupp0r/prometheus-cpp/) explicitly for cartographer
# load("@com_github_jupp0r_prometheus_cpp//:repositories.bzl", "prometheus_cpp_repositories")

# prometheus_cpp_repositories()

####################################################################################################

# Configures toolchain
load("@com_nvidia_isaac_engine//toolchain:toolchain.bzl", "toolchain_configure")

toolchain_configure(name = "toolchain")

####################################################################################################
