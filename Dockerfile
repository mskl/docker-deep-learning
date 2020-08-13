FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04

RUN apt-get update && apt-get install --no-install-recommends -y libpq-dev build-essential curl htop vim git wget \
 python3-dev python3-pip python3-setuptools python3-numpy cython cython3 libblas-dev libatlas-base-dev task-spooler \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# Folder where the code will be
WORKDIR /app

COPY ./requirements.txt /app/requirements.txt

RUN pip3 install --upgrade pip && pip3 install -r requirements.txt

# Copy the contents of the app into target folder
COPY ${PROJECTFOLDER}/ /app/

# For CUDA profiling, TensorFlow requires CUPTI.
ENV LD_LIBRARY_PATH /usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH
