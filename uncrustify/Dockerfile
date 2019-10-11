FROM alpine:latest

RUN apk add --no-cache python3 git gcc g++ cmake make libstdc++ \
    && git clone https://github.com/uncrustify/uncrustify.git uncrustify-code \
    && cd uncrustify-code && mkdir build && cd build \
    && cmake .. && cmake --build . \
    && cp uncrustify / \
    && cd / && rm -rf uncrustify-code \
    && apk del python3 git gcc g++ cmake make

COPY run_uncrustify.sh /
RUN chmod u+x run_uncrustify.sh

ENTRYPOINT [ "/run_uncrustify.sh" ]