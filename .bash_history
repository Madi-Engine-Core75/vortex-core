git remote -v
git remote set-url origin https://github.com/MadiEngineCore/madi-engine-core.git
git remote show origin
cd /path/to/your/madi-engine-core
ls
cd madi-engine-core
git status
git remote set-url origin https://github.com/MadiEngineCore/madi-engine-core.git
git remote -v
origin https://github.com/MadiEngineCore/madi-engine-core.git (fetch)
origin https://github.com/MadiEngineCore/madi-engine-core.git (push)
rm -rf madi-gateway-temp/ my-project/ *.rcgu.o
git status
cd .github/workflows/
ls -la
mkdir -p .github/workflows
cd .github/workflows
pwd
touch ci.yml
name: CI for Go and Rust builds
on:
jobs:
git add .github/workflows/ci.yml
git commit -m "chore: configure reliable CI workflow for Go and Rust"
git push origin main
git status
cd ../../..
git push origin main
cd /path/to/your/project/madi-engine-core
find ~ -name "madi-engine-core" -type d 2>/dev/null
cd /data/data/com.termux/files/home/madi-engine-core
git status
git push origin main
Madi-Engine-Core75
git push origin main
git remote -v
git remote set-url origin https://github.com/Madi-Engine-Core75/madi-engine-core.git
git push origin main
git pull origin main --allow-unrelated-histories
git stash
git pull origin main --allow-unrelated-histories
git stash pop
git push origin main
mv .github/workflows/ci.yml .github/workflows/ci.yml.bak
git pull origin main --allow-unrelated-histories
rm .github/workflows/ci.yml.bak
git push origin main
git status
git log --oneline -n 5
git checkout -b fix/clean-git-history
git rebase -i HEAD~5
git push -u origin fix/clean-git-history --force-with-lease
ping -c 3 8.8.8.8
ping -c 3 github.com
git push -u origin fix/clean-git-history --force-with-lease
git remote set-url origin https://github.com/Madi-Engine-Core75/madi-engine-core.git
git remote -v
git status
cargo check --manifest-path core/rust-core/Cargo.toml
cd apps/gateway && go build -v ./...
ls -la
cd ~/madi-engine-core
ls -la
find . -name "go.mod"
cd apps/gateway
go mod init github.com/Madi-Engine-Core75/madi-engine-core/apps/gateway
go mod tidy
go mod edit -replace github.com/Madi-Engine-Core75/madi-engine-core=../..
go mod tidy
go build -v ./cmd/...
go mod edit -module github.com/Madi-Engine-Core75/madi-engine-core/apps/gateway
go mod tidy
go build -v ./cmd/...
head -n 15 cmd/server/main.go
sed -i 's|"github.com/Madi-Engine-Core75/madi-engine-core/apps/gateway/internal/router"|"./internal/router"|g' cmd/server/main.go
go build -v ./cmd/...
sed -i 's|"./internal/router"|"github.com/Madi-Engine-Core75/madi-engine-core/apps/gateway/internal/router"|g' cmd/server/main.go
go build -v ./cmd/...
go mod edit -module gateway
sed -i 's|"github.com/Madi-Engine-Core75/madi-engine-core/apps/gateway/internal/router"|"gateway/internal/router"|g' cmd/server/main.go
go build -v ./cmd/...
sed -i 's|"github.com/Madi-Engine-Core75/madi-engine-core/apps/gateway/internal/router"|"gateway/internal/router"|g' cmd/server/main.go
go build -v ./cmd/...
cat << 'EOF' > cmd/server/main.go
package main

import (
"log"
"net/http"

"gateway/internal/router"
)

func main() {
mux := router.SetupRoutes()

port := ":8080"
log.Printf("Gateway is running on port %s...", port)
if err := http.ListenAndServe(port, mux); err != nil {
log.Fatalf("Server failed to start: %v", err)
}
}
EOF

cat << 'EOF' > cmd/server/main.go
package main

import (
"log"
"net/http"

"gateway/internal/router"
)

func main() {
mux := router.SetupRoutes()

port := ":8080"
log.Printf("Gateway is running on port %s...", port)
if err := http.ListenAndServe(port, mux); err != nil {
log.Fatalf("Server failed to start: %v", err)
}
}
EOF

go build -v ./cmd/...
sed -i 's|"github.com/Madi-Engine-Core75/madi-engine-core/apps/gateway/internal/handler"|"gateway/internal/handler"|g' internal/router/routes.go
go build -v ./cmd/...
head -n 10 internal/router/routes.go
cat << 'EOF' > internal/router/routes.go
package router

import (
"net/http"

"gateway/internal/handler"
)

func SetupRoutes() *http.ServeMux {
mux := http.NewServeMux()

// Register handlers
mux.HandleFunc("/health", handler.HealthCheck)

return mux
}
EOF

go build -v ./cmd/...
go get google.golang.org/grpc
go get google.golang.org/grpc/credentials/insecure
go mod tidy
go build -v ./cmd/...
go mod edit -replace github.com/Madi-Engine-Core75/madi-engine-core=../..
go mod tidy
go build -v ./cmd/...
echo "replace github.com/Madi-Engine-Core75/madi-engine-core => ../../" >> go.mod
go mod tidy
go build -v ./cmd/...
cat << 'EOF' > go.mod
module gateway

go 1.22

require (
    google.golang.org/grpc v1.82.1
    google.golang.org/protobuf v1.36.11
)

replace github.com/Madi-Engine-Core75/madi-engine-core => ../../
EOF

go mod tidy
go build -v ./cmd/...
cat << 'EOF' > go.mod
module gateway

go 1.22

require (
    google.golang.org/grpc v1.82.1
    google.golang.org/protobuf v1.36.11
)

replace github.com/Madi-Engine-Core75/madi-engine-core => ../../
EOF

go mod tidy
go build -v ./cmd/...
sed -i 's/->/=>/g' go.mod
go mod tidy
go build -v ./cmd/...
cat << 'EOF' > go.mod
module gateway

go 1.22

require (
    google.golang.org/grpc v1.82.1
    google.golang.org/protobuf v1.36.11
)

replace github.com/Madi-Engine-Core75/madi-engine-core => ../../
EOF

sed -i '/replace/d' go.mod
echo "replace github.com/Madi-Engine-Core75/madi-engine-core => ../../" >> go.mod
go mod tidy
go build -v ./cmd/...
sed -i 's/->/=>/g' go.mod
go mod tidy
go build -v ./cmd/...
sed -i '/replace/d' go.mod
printf "replace github.com/Madi-Engine-Core75/madi-engine-core => ../../\n" >> go.mod
go mod tidy
go build -v ./cmd/...
sed -i '/replace/d' go.mod
printf "replace github.com/Madi-Engine-Core75/madi-engine-core => ../../\n" >> go.mod
go mod tidy && go build -v ./cmd/...
cd ../..
go work init . apps/gateway
cd apps/gateway
go build -v ./cmd/...
cd /data/data/com.termux/files/home/go/pkg/... # أو العودة لمجلد الـ gateway مباشرة
cd ~/madi-engine-core/apps/gateway
go mod edit -replace github.com/Madi-Engine-Core75/madi-engine-core/proto/gen/core=../../proto/gen/core
go build -v ./cmd/...
replace github.com/MadiEngine-Core75/Madi-Engine-Core => ../../
cd apps/gateway
go clean -modcache
go build -v ./cmd/...
cd /data/data/com.termux/files/home/madi-engine-core/apps/gateway
go mod edit -replace github.com/MadiEngine-Core75/Madi-Engine-Core=../../
go mod tidy
go build -v ./cmd/...
cd /data/data/com.termux/files/home/madi-engine-core
go mod init github.com/MadiEngine-Core75/Madi-Engine-Core
ls -la proto/gen/core
cd /data/data/com.termux/files/home/madi-engine-core/apps/gateway
go mod tidy
go build -v ./cmd/...
cd /data/data/com.termux/files/home/madi-engine-core
find . -name "core" -type d
cd /data/data/com.termux/files/home/madi-engine-core
mkdir -p proto/gen/core
cp -r ./core/* ./proto/gen/core/
cd apps/gateway
go mod tidy
go build -v ./cmd/...
cd /data/data/com.termux/files/home/madi-engine-core
go work init . ./apps/gateway
cd /data/data/com.termux/files/home/madi-engine-core
rm go.work
go work init . apps/gateway
cd apps/gateway
go build -v ./cmd/...
cd /data/data/com.termux/files/home/madi-engine-core/apps/gateway
go mod edit -dropreplace github.com/MadiEngine-Core75/Madi-Engine-Core
go mod edit -replace github.com/MadiEngine-Core75/Madi-Engine-Core=../../
go mod tidy
go build -v ./cmd/...
cd /data/data/com.termux/files/home/madi-engine-core
cat << 'EOF' > go.work
go 1.22

use (
    .
    ./apps/gateway
)
EOF

cd apps/gateway
go mod tidy
go build -v ./cmd/...
cd /data/data/com.termux/files/home/madi-engine-core
go work edit -go=1.26
cd apps/gateway
go build -v ./cmd/...
cd /data/data/com.termux/files/home/madi-engine-core
go work use . ./apps/gateway
cd apps/gateway
go build -v ./cmd/...
cd /data/data/com.termux/files/home/madi-engine-core
go mod init github.com/MadiEngine-Core75/Madi-Engine-Core
cd /data/data/com.termux/files/home/madi-engine-core
go mod edit -module github.com/MadiEngine-Core75/Madi-Engine-Core
cd apps/gateway
go build -v ./cmd/...
cd /data/data/com.termux/files/home/madi-engine-core/apps/gateway
go mod edit -replace github.com/MadiEngine-Core75/Madi-Engine-Core=../../
go mod tidy
go build -v ./cmd/...
cd /data/data/com.termux/files/home/madi-engine-core
find . -name "*.pb.go"
cd /data/data/com.termux/files/home/madi-engine-core
ls -la
mkdir -p proto/gen/core
cp -r core/* proto/gen/core/ 2>/dev/null || cp -r proto/* proto/gen/core/ 2>/dev/null
cd apps/gateway
go build -v ./cmd/...
cd /data/data/com.termux/files/home/madi-engine-core/apps/gateway
go mod edit -dropreplace github.com/MadiEngine-Core75/Madi-Engine-Core
go mod edit -replace github.com/MadiEngine-Core75/Madi-Engine-Core=../..
go clean -modcache
go mod tidy
go build -v ./cmd/...
cd /data/data/com.termux/files/home/madi-engine-core/apps/gateway
mkdir -p proto/gen
ln -s ../../../proto/gen/core proto/gen/core
go mod edit -replace github.com/MadiEngine-Core75/Madi-Engine-Core=../..
go mod tidy
go build -v ./cmd/...
cd /data/data/com.termux/files/home/madi-engine-core/apps/gateway
go mod edit -dropreplace github.com/MadiEngine-Core75/Madi-Engine-Core
go mod edit -replace github.com/MadiEngine-Core75/Madi-Engine-Core=./proto
go build -v ./cmd/...
cd /data/data/com.termux/files/home/madi-engine-core/apps/gateway
rm -rf proto
cp -r ../../proto ./proto
go mod edit -dropreplace github.com/MadiEngine-Core75/Madi-Engine-Core
go mod tidy
go build -v ./cmd/...
cd /data/data/com.termux/files/home/madi-engine-core/apps/gateway
go mod edit -replace github.com/MadiEngine-Core75/Madi-Engine-Core=./proto
go build -v ./cmd/...
cd /data/data/com.termux/files/home/madi-engine-core/apps/gateway/proto
go mod init github.com/MadiEngine-Core75/Madi-Engine-Core
cd ..
go mod edit -replace github.com/MadiEngine-Core75/Madi-Engine-Core=./proto
go build -v ./cmd/...
cd /data/data/com.termux/files/home/madi-engine-core/apps/gateway/proto
mkdir -p gen/core
mv *.pb.go gen/core/ 2>/dev/null || true
cd gen/core
go mod init github.com/MadiEngine-Core75/Madi-Engine-Core/proto/gen/core
cd /data/data/com.termux/files/home/madi-engine-core/apps/gateway
go mod edit -replace github.com/MadiEngine-Core75/Madi-Engine-Core/proto/gen/core=./proto/gen/core
go build -v ./cmd/...
cd /data/data/com.termux/files/home/madi-engine-core/apps/gateway
go mod edit -dropreplace github.com/MadiEngine-Core75/Madi-Engine-Core/proto/gen/core
go mod edit -replace github.com/MadiEngine-Core75/Madi-Engine-Core/proto/gen/core=./proto/gen/core
go build -v ./cmd/...
cd /data/data/com.termux/files/home/madi-engine-core
go work init
go work use .
go work use ./apps/gateway
go work use ./apps/gateway/proto/gen/core
cd apps/gateway
go build -v ./cmd/...
cd /data/data/com.termux/files/home/madi-engine-core/apps/gateway
go mod edit -dropreplace github.com/MadiEngine-Core75/Madi-Engine-Core/proto/gen/core
go build -v ./cmd/...
cd /data/data/com.termux/files/home/madi-engine-core
rm -rf go.mod go.work go.sum apps/gateway/go.mod apps/gateway/go.sum apps/gateway/proto apps/gateway/bin target .cargo
find . -name "*.pb.go" -delete
find . -name "go.work" -delete
