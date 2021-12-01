#!/bin/bash

if test $# -lt 1
then
 echo "usage: year [yyyy[-mm-dd]]"
 exit
fi

year=$1

sfile=batch_$(date +%N).slurm
copies=5

echo "#!/bin/bash">$sfile
echo "#SBATCH -A windfall --partition=windfall">>$sfile
echo "#SBATCH -J batch_$(whoami)_job" >>$sfile
echo "#SBATCH --nodes=$copies --ntasks-per-node=2 --mem=5gb">>$sfile  #-N
echo "#SBATCH -t 4:00:00">>$sfile

echo "cd \$SLURM_SUBMIT_DIR">>$sfile
echo "echo $SLURM_SUBMIT_DIR\$SLURM_NNODES">>$sfile
#echo "module load intel/mpi">>$sfile
#echo "module load spark">>$sfile
echo "module load R python/3.6">>$sfile
#echo "module load perl">>$sfile
#echo "mpirun -np $copies $cmd $args" >>$sfile
echo "srun -n $copies --ntasks-per-node=1 --cpus-per-task=1 grep -i '$year.*Good' tucson_rain.txt | awk -F'\t' '{sum+=\$9}; END {print sum}'" >>$sfile
sbatch $sfile
