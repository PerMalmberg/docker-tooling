FROM alpine:latest

RUN apk add --no-cache python3 git gcc g++ cmake make libstdc++ \
    && git clone https://github.com/uncrustify/uncrustify.git uncrustify-code \
    && cd uncrustify-code \
    && git checkout uncrustify-0.70.0 \
    && mkdir build && cd build \
    && cmake .. && cmake --build . \
    && cp uncrustify / \
    && cd / && rm -rf uncrustify-code \
    && apk del python3 git gcc g++ cmake make

COPY check_formatting.sh /
COPY do_formatting.sh /
RUN chmod u+x check_formatting.sh
RUN chmod u+x do_formatting.sh

CMD [ "/check_formatting.sh" ]