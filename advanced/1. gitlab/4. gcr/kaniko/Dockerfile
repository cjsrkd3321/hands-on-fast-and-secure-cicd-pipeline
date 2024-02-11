# docker build -t NAME --platform linux/amd64 .
FROM alpine

COPY --from=gcr.io/kaniko-project/executor:debug /kaniko/executor /kaniko/executor

RUN apk add aws-cli --no-cache