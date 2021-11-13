#!/bin/bash

bazel build -c opt --strip=ALWAYS \
  --host_crosstool_top=@bazel_tools//tools/cpp:toolchain \
  --fat_apk_cpu=arm64-v8a,armeabi-v7a  \
  //mediapipe/examples/android/src/java/com/google/mediapipe/apps/object_tracking_aar:mediapipe_object_tracking.aar

bazel build -c opt mediapipe/graphs/tracking:mobile_gpu_binary_graph

cp bazel-bin/mediapipe/graphs/tracking/mobile_gpu.binarypb export/

cp bazel-bin/mediapipe/examples/android/src/java/com/google/mediapipe/apps/object_tracking_aar/mediapipe_object_tracking.aar \
  export/

cp mediapipe/models/trash_can_model.tflite export/
cp mediapipe/models/trash_can_labelmap.txt export/
