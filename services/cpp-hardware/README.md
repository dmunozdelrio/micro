# C++ Hardware Service

A simple HTTP server built with [cpp-httplib](https://github.com/yhirose/cpp-httplib). It returns `C++ Hardware Service` on port **3014**.

## Build

```
cd services/cpp-hardware
mkdir build && cd build
cmake ..
make
./cpp-hardware
```

## Docker

```
docker build -t cpp-hardware .
docker run -p 3014:3014 cpp-hardware
```
