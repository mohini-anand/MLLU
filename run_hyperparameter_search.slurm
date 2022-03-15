#!/bin/bash
#SBATCH --job-name=roberta_hyperparameter_search
#SBATCH --open-mode=append
#SBATCH --output=/scratch/${USER}/%j_%x.out
#SBATCH --error=/scratch/${USER}/%j_%x.err
#SBATCH --export=ALL
#SBATCH --account=ds_ga_1012_2022sp
#SBATCH --partition=n1s8-v100-1
#SBATCH --time=04:00:00
#SBATCH --gres=gpu:1
#SBATCH --mem=20G
#SBATCH -c 4

## TODO: Run your hyperparameter search in a singularity container. Remember to 
## activate your Conda environment in the container before running your Python script.

#SBATCH --mail-user=<ma5266@nyu.edu>
#SBATCH --mail-type=ALL
singularity exec --nv --bind scratch/ma5266/ --overlay scratch/ma5266/overlay-25GB-500K
source /ext3/env.sh
conda activate
python /scratch/ma5266/run_hyperparameter_search.py data_dir=/scratch/ma5266