FROM nvcr.io/nvidia/tritonserver:25.08-py3

# 1) OpenCV from PyPI
RUN python3 -m pip install --no-cache-dir \
    opencv-python-headless==4.10.0.84

# 2) Torch CPU wheels from the PyTorch CPU index
RUN python3 -m pip install --no-cache-dir \
    --extra-index-url https://download.pytorch.org/whl/cpu \
    torch==2.5.1 torchvision==0.20.1 torchaudio==2.5.1
