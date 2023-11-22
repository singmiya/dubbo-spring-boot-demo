FROM openjdk:8-jdk-alpine

ARG DEPENDENCY=/dubbo-spring-boot-demo-provider/target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app

# 添加时区环境变量，亚洲，上海
ENV TimeZone=Asia/Shanghai
# 使用软连接，并且将时区配置覆盖/etc/timezone
RUN apk add tzdata && cp /usr/share/zoneinfo/${TimeZone} /etc/localtime \
    && echo ${TimeZone} > /etc/timezone \
    && apk del tzdata

ENTRYPOINT ["java","-cp","app:app/lib/*","com.singsmiya.provider.ProviderApplication"]