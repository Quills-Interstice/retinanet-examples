FROM nvcr.io/nvidia/pytorch:19.10-py3

COPY . retinanet/
RUN pip install gdown
RUN gdown https://drive.google.com/uc?id=1bL-vKQMv9KYtHTWlKq4fVdTvECAhPbKl
RUN unzip datacocoformat.zip
RUN pip install --no-cache-dir -e retinanet/
RUN retinanet train retina_one.pth --backbone ResNet101FPN --images datacocoformat/train/ --annotations datacocoformat/train_data.json --val-images datacocoformat/validation/ --val-annotations datacocoformat/val_data.json --classes 1 --iters 100000 --lr 0.001 --gamma 0.05
