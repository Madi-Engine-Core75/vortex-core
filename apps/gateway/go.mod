module github.com/Madi-Engine-Core75/madi-Engine-Core/apps/gateway

go 1.26

require (
	google.golang.org/grpc v1.58.0
	google.golang.org/protobuf v1.31.0
	github.com/grpc-ecosystem/grpc-gateway/v2 v2.13.0 // indirect
	github.com/nicksnyder/go-i18n/v2 v2.2.0
)

replace github.com/Madi-Engine-Core75/madi-Engine-Core/proto/gen/core => ../../proto/gen/core
