#!/bin/bash
# Sources:
# - https://www.cs.virginia.edu/stream/ref.html
# - http://khmel.org/stream-memory-benchmark-on-centos-8-with-gcc-and-intel-compiler.html
# - https://hub.docker.com/r/benchmarks/centos-gcc-stream

# Parameters (set by environment variable):
# - ARRAYSIZE
# - NTIMES
# - THREADS
#
# Run: /bin/bash stream.sh

export LC_ALL=C # force output to english language (fix not working grep)

ARRAYSIZE="${ARRAYSIZE:-10000000}" # Default is 10M
NTIMES="${NTIMES:-10}"             # Default is 10

# Unfortunately, STREAM needs these parameters at compile time
gcc -fstrict-aliasing -mcmodel=large -Ofast -mtune=native -march=native -fopenmp src/stream.c \
  -DSTREAM_ARRAY_SIZE=$ARRAYSIZE \
  -DNTIMES=$NTIMES \
  -o stream

CORESPERSOCKET=$(lscpu | grep "per socket" | tr -s ' ' | cut -d ' ' -f4)
SOCKETS=$(lscpu | grep Socket | tr -s ' ' | cut -d ' ' -f2)
GOOD_NUM_THREADS=$(($CORESPERSOCKET * $SOCKETS))

export OMP_NUM_THREADS="${THREADS:-$GOOD_NUM_THREADS}"
export GOMP_CPU_AFFINITY="0-$(($OMP_NUM_THREADS - 1))"
./stream
