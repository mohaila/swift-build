FROM ubuntu:18.04

ARG port=8080

ENV PATH=$PATH:/usr/local/swift/usr/bin

ADD --chown=0:0 swift-5.0.1-RELEASE-ubuntu18.04.tar.gz /usr/local

RUN apt-get update && \
    apt-get install -y --no-install-recommends clang libicu-dev libcurl4-openssl-dev libssl-dev libbsd0 libxml2 libpython2.7 git ca-certificates && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* && \
    cd /usr/local && \
    mv  swift-5.0.1-RELEASE-ubuntu18.04 swift && \
    mkdir /build

VOLUME [ "/build" ]
CMD ["bash", "-c", "cd /build && swift package clean && swift build && swift test && swift run"]