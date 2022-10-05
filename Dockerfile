FROM ubuntu:latest
COPY . .
RUN apt-get update && apt-get -y --no-install-recommends install \
    build-essential \
    clang \
    cmake \
    gdb \
    wget \
    utils
RUN g++ main.cpp -o hello
ENTRYPOINT ["./hello"]
