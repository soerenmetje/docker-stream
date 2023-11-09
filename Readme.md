# STREAM Memory Benchmark in Docker

[STREAM](https://www.cs.virginia.edu/stream/) is a relevant Benchmark to measure the memory performance.
In this repository, we describe an approach to run STREAM in a Docker container, as well as directly without any containers.
We use the Docker image soerenmetje/stream that was build from the sources included in this repository.

Unfortunately, STREAM is kinda old - it does not even have a GitHub repository. 
Therefore, the latest source code of STREAM is included here as well. See [STREAM FTP server](https://www.cs.virginia.edu/stream/FTP/Code/) for the original sources.

## Getting Started
Run in Docker:
```shell
docker run soerenmetje/stream
```

Run without Container:

```shell
/bin/sh stream.sh
```
There are prerequisites for running without a container.
Following packages need to be installed:
- `gcc`


## Parameters
You can set following parameters by using environment variables:
 - `ARRAYSIZE`
 - `NTIMES`
 - `THREADS`

Examples:

```shell
docker run -e ARRAYSIZE=100000000 soerenmetje/stream
```

```shell
export ARRAYSIZE=100000000 && /bin/sh stream.sh
```

## License
For STREAM source code, the original license [LICENSE.txt](src/LICENSE.txt) applies that was provided by the original STREAM authors.

## Sources
- https://www.cs.virginia.edu/stream/
- https://www.cs.virginia.edu/stream/ref.html
- http://khmel.org/stream-memory-benchmark-on-centos-8-with-gcc-and-intel-compiler.html
- https://hub.docker.com/r/benchmarks/centos-gcc-stream