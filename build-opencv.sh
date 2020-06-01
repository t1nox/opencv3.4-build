apt-get update -y && apt-get install python3.6 libgtk2.0-dev pkg-config \
build-essential cmake libavcodec-dev libavformat-dev libswscale-dev python3-dev python3-numpy libtbb2 libtbb-dev libjpeg-dev \
libpng-dev libtiff-dev libdc1394-22-dev python3-pip git -y

pip3 install dlib imutils numpy

git clone https://github.com/opencv/opencv.git

git clone https://github.com/opencv/opencv_contrib.git

mkdir -p opencv/build

cd opencv/build

cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local -DOPENCV_EXTRA_MODULES_PATH=./opencv_contrib/modules -DPYTHON3_EXECUTABLE=/usr/bin/python3 \
-DPYTHON_INCLUDE_DIR=/usr/include/python3.6 -DPYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython3.6m.so -DPYTHON3_NUMPY_INCLUDE_DIRS=/usr/lib/python3/dist-packages/numpy/core/include ..


make -j16 .

sudo make install

python3 -c "import cv2;print(cv2.__version__)"
