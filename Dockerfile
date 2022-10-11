# same version as Scone
FROM golang:1.19.2-alpine3.15 AS build
RUN apk add --no-cache gcc build-base gcc-go
COPY ./src /app
RUN go build -compiler=gccgo -buildmode=exe -o /app/helloworld /app/helloworld.go

# create final image from compiled golang binary
FROM alpine:3.15
RUN apk add --no-cache libgo
RUN mkdir /iexec_in /iexec_out
COPY --from=build /app/helloworld /app/helloworld
ENTRYPOINT ["/app/helloworld"]
