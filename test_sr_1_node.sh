#!/bin/bash

# Set environment variables for GPU-aware MPI
export CRAY_ACCEL_TARGET=nvidia80
export MPICH_GPU_SUPPORT_ENABLED=1
export CUDA_VISIBLE_DEVICES=0,1,2,3

# Run sendrecv_perf on 1 node with 4 GPUs (one rank per GPU)
srun \
  --nodes=1 \
  --ntasks=4 \
  --ntasks-per-node=4 \
  --gpus-per-node=4 \
  --export=ALL \
  ./build/sendrecv_perf \
    -b 8 \        # start buffer size: 8 bytes
    -e 4096M \     # end buffer size: 128 MiB
    -f 2 \        # scale factor per step
    -g 4          # total number of GPUs/ranks
