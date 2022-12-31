FROM openjdk:17-alpine as RUN-APPS
LABEL DEVELOPER="diyansetiyadi@gmail.com"
LABEL APPS-NAME="digital-opening-service"
USER root
WORKDIR /apps
#COPY --from=BUILD-APPS /build-apps/app/target/*.jar /apps/apps.jar
COPY ../target/*.jar /apps/app.jar
RUN ls -ltr
ENTRYPOINT [ "java","-jar","app.jar"]
