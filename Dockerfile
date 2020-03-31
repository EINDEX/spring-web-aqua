FROM gradle:5.6.4-jdk8 AS BUILD_ENV

RUN apt update
RUN apt install -y make g++ libssl-dev openssl

WORKDIR /work
ADD . .
RUN gradle clean build -x test

FROM openjdk:8-jre-alpine
RUN apk --no-cache update && apk --no-cache upgrade
WORKDIR /work
COPY --from=BUILD_ENV /work/build/libs/work.jar .
CMD ["sh", "-c", "java -Djava.security.egd=file:/dev/./urandom -jar work.jar"]
