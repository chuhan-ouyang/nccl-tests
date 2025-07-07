#!/bin/bash

# Set environment variables for GPU-aware MPI
export CRAY_ACCEL_TARGET=nvidia80
export MPICH_GPU_SUPPORT_ENABLED=1
export CUDA_VISIBLE_DEVICES=0,1,2,3

# mpirun -np 1 -N 1 ./build/sendrecv_perf -b 8 -e 1G -f 2 -g 4 2>&1 | tee sr_1_node.log

# Run sendrecv_perf on 1 node with 4 GPUs (one rank per GPU)
srun \
  --nodes=1 \
  --ntasks=1 \
  --gpus-per-node=4 \
  --export=ALL \
  ./build/all_reduce_perf -b 8 -e 8192M -f 2 -g 4 2>&1 | tee ar_1_node.log
