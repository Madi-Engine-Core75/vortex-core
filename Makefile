# Madi Engine Core - Makefile

.PHONY: all proto rust-build rust-test go-build go-test i18n-validate build test clean

PROTO_DIR := proto
RUST_DIR := core/rust-core
GO_DIR := apps/gateway

all: build

proto:
	@echo "Generating protobuf files..."
	protoc --proto_path=$(PROTO_DIR) --go_out=$(GO_DIR)/proto --go_opt=paths=source_relative \
		--go-grpc_out=$(GO_DIR)/proto --go-grpc_opt=paths=source_relative \
		$(PROTO_DIR)/*.proto || true

rust-build:
	@echo "Building Rust core..."
	cd $(RUST_DIR) && cargo build --verbose

rust-test:
	@echo "Testing Rust core..."
	cd $(RUST_DIR) && cargo test --verbose

go-build:
	@echo "Building Go gateway..."
	cd $(GO_DIR) && go mod tidy && go build ./...

go-test:
	@echo "Testing Go gateway..."
	cd $(GO_DIR) && go test ./...

i18n-validate:
	@echo "Validating i18n keys..."
	bash scripts/i18n-validate.sh

build: proto rust-build go-build

test: rust-test go-test

clean:
	@echo "Cleaning Rust artifacts..."
	cd $(RUST_DIR) && cargo clean
