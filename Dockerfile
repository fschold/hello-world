FROM golang:1.23-alpine AS build
WORKDIR /src
COPY go.mod main.go ./
RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o /hello .

FROM scratch
COPY --from=build /hello /hello
EXPOSE 8080
ENTRYPOINT ["/hello"]
