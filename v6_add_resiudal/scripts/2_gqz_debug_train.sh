MASTER_PORT=$((12000 + $RANDOM % 20000))
NUM_GPU=$1
set -x

python -m torch.distributed.launch --nproc_per_node ${NUM_GPU} --master_port=${MASTER_PORT} train_deepfashion.py --batch 1 --chunk 1 --expname l300 --dataset_path /home/gqz/gqzwork/dataset/DeepFashion --depth 5 --width 128 --style_dim 512 --renderer_spatial_output_dim 512 256 --input_ch_views 3 --white_bg --r1 300 --voxhuman_name eva3d_deepfashion --random_flip --eikonal_lambda 0  --small_aug --iter 1000000 --adjust_gamma --gamma_lb 20 --min_surf_lambda 1 --deltasdf --gaussian_weighted_sampler --sampler_std 15 --N_samples 28 --glr 2e-3 --continue_training --ckpt=90000
