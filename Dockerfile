FROM alpine:latest

RUN apk add --no-cache \
              git \
              make \
              build-base

RUN git clone https://github.com/pmaillot/X32-Behringer /x32-src

WORKDIR /x32-src

RUN make clean
RUN make dirs
RUN make X32
RUN make X32_Command

RUN mkdir /x32-emulator
RUN cp build/X32 /x32-emulator/X32
RUN cp build/X32_Command /X32_Command

WORKDIR /x32-emulator

ENTRYPOINT [ "./X32", "-i", "0.0.0.0"]
