FROM alpine:3.19.1
RUN	apk update && apk upgrade && apk add --no-cache nginx


#COPY    [./tools/]
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
