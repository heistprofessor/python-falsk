FROM python:3.7-alpine as base
FROM base as builder

RUN mkdir /install
WORKDIR /install

FROM base

COPY --from=builder /install /usr/local
COPY src /app

WORKDIR /app

ENTRYPOINT [ "python" ]
CMD [ "hello.py" ]
