#!/bin/bash --login
#SBATCH --nodes=1                # Request 1 node
#SBATCH --ntasks-per-node=10     # Number of tasks per node
#SBATCH --cpus-per-task=4        # Number of CPUs per task
#SBATCH --mem=10G                # Memory per node
#SBATCH --job-name=download        # Job name
#SBATCH --time=90:00:00           # Maximum runtime
#SBATCH --partition=general       # Partition to submit to
#SBATCH --account=        # Account to charge the job
#SBATCH -o slurm-%j.output  # Standard output file
#SBATCH -e slurm-%j.error   # Standard error file

module load python

pip install nda-tools

pip install nda-tools --user

pip install secretstorage --upgrade keyrings.alt

echo -e "name\npassword" |  downloadcmd -dp 1235636 -u name -d output_path

wait