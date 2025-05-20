FROM nvidia/cuda:10.2-cudnn7-runtime-ubuntu18.04

# 必要なパッケージのインストール
RUN apt-get update && apt-get install -y \
    python3 python3-pip git build-essential \
    libopenblas-dev libomp-dev && \
    ln -s /usr/bin/python3 /usr/bin/python

# pip のアップグレード
RUN pip3 install --upgrade pip

# PyTorch と torchvision のインストール
RUN pip3 install torch==1.5.1 torchvision==0.6.1

# torch-geometric の依存パッケージのインストール
RUN pip3 install torch-scatter==2.0.5 \
                 torch-sparse==0.6.7 \
                 torch-cluster==1.5.7 \
                 torch-spline-conv==1.2.0 \
                 torch-geometric==1.5.0

# その他の依存パッケージのインストール
COPY requirements.txt /tmp/
RUN pip3 install -r /tmp/requirements.txt

# 作業ディレクトリの設定
WORKDIR /workspace/PEAGNN