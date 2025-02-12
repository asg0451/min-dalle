#!/bin/bash

pip install wheel

pip install "jax[cuda11_cudnn82]" -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html

pip install -r requirements.txt

mkdir -p pretrained

# download vqgan
git lfs install
git clone https://huggingface.co/dalle-mini/vqgan_imagenet_f16_16384 ./pretrained/vqgan

# download dalle-mini and dalle mega
pip install wandb
wandb login
wandb artifact get --root=./pretrained/dalle_bart_mini dalle-mini/dalle-mini/mini-1:v0
wandb artifact get --root=./pretrained/dalle_bart_mega dalle-mini/dalle-mini/mega-1-fp16:v14 
