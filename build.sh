export CRAY_ACCEL_TARGET=nvidia80
export MPICH_GPU_SUPPORT_ENABLED=1

NCCL_PATH=/global/common/software/nersc9/nccl/2.21.5
CUDA_PATH=/opt/nvidia/hpc_sdk/Linux_x86_64/24.5/cuda/12.4
MPI_PATH=/opt/cray/pe/mpich/8.1.30/ofi/gnu/12.3

make -j 128 src.build MPI=1 \
     NCCL_HOME=${NCCL_PATH} \
     CUDA_HOME=${CUDA_PATH} \
     MPI_HOME=${MPI_PATH}
