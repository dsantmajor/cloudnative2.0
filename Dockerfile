FROM alpine:latest as STAGEONE
RUN apk update && apk add hugo
# build site
COPY ./site /site
RUN hugo --source=/site/ --destination=/public/

FROM nginx:stable-alpine
COPY --from=STAGEONE /public/ /usr/share/nginx/html/
EXPOSE 80
