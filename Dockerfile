FROM nvcr.io/nvidia/pytorch:19.10-py3

COPY . retinanet/
RUN pip install gdown
RUN gdown https://drive.google.com/uc?id=1bL-vKQMv9KYtHTWlKq4fVdTvECAhPbKl
RUN unzip datacocoformat.zip
RUN pip install --no-cache-dir -e retinanet/
