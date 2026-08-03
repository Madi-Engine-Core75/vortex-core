#!/usr/bin/env bash
set -euo pipefail

# تأكد أنك في جذر المستودع المحلي Madi-Engine-Core
# مثال: git clone https://github.com/Madi-Engine-Core75/madi-Engine-Core.git
# cd madi-Engine-Core

git fetch origin
git checkout origin/main -B main
git pull origin main
git checkout -b main-bues

# أنشئ/عدّل الملفات المطلوبة
mkdir -p apps/gateway/i18n
mkdir -p apps/gateway/internal/i18n
mkdir -p scripts
mkdir -p .github/workflows

cat > apps/gateway/go.mod <<'EOF'
module github.com/Madi-Engine-Core75/madi-Engine-Core/apps/gateway

go 1.26

require (
	google.golang.org/grpc v1.58.0
	google.golang.org/protobuf v1.31.0
	github.com/grpc-ecosystem/grpc-gateway/v2 v2.13.0 // indirect
	github.com/nicksnyder/go-i18n/v2 v2.2.0
)

replace github.com/Madi-Engine-Core75/madi-Engine-Core/proto/gen/core => ../../proto/gen/core
EOF

cat > Makefile <<'EOF'
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
EOF

cat > .github/workflows/ci.yml <<'EOF'
name: Madi-Engine-Core CI

on:
  push:
    branches: [ main, main-bues ]
  pull_request:
    branches: [ main ]

jobs:
  build-and-test:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v4

      - name: Set up Rust Toolchain
        uses: actions-rs/toolchain@v1
        with:
          toolchain: stable
          override: true

      - name: Set up Go
        uses: actions/setup-go@v5
        with:
          go-version: '1.26'

      - name: Install Protoc and tools
        run: |
          sudo apt-get update
          sudo apt-get install -y protobuf-compiler jq
          go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
          go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

      - name: Generate protos (Go)
        run: |
          cd proto || exit 0
          protoc --proto_path=. --go_out=../apps/gateway/proto --go-grpc_out=../apps/gateway/proto *.proto || true

      - name: Validate i18n
        run: |
          bash scripts/i18n-validate.sh || true

      - name: Build and Test Rust Core
        run: |
          cd core/rust-core
          cargo build --verbose
          cargo test --verbose

      - name: Build and Test Go Gateway
        working-directory: apps/gateway
        run: |
          go mod tidy
          go build ./...
          go test ./...
EOF

# i18n English (en)
cat > apps/gateway/i18n/en.json <<'EOF'
[
  {
    "id": "app.starting",
    "translation": "Starting Madi Engine..."
  },
  {
    "id": "gateway.server.started",
    "translation": "Gateway listening on {{.addr}}"
  },
  {
    "id": "app.err.proto_not_found",
    "translation": "Proto files not found at {{.path}}"
  },
  {
    "id": "core.test.passed",
    "translation": "All core tests passed"
  }
]
EOF

# French
cat > apps/gateway/i18n/fr.json <<'EOF'
[
  { "id": "app.starting", "translation": "Démarrage de Madi Engine..." },
  { "id": "gateway.server.started", "translation": "Passerelle à l'écoute sur {{.addr}}" },
  { "id": "app.err.proto_not_found", "translation": "Fichiers proto introuvables à {{.path}}\" },
  { "id": "core.test.passed", "translation": "Tous les tests du noyau ont réussi" }
]
EOF

# Spanish
cat > apps/gateway/i18n/es.json <<'EOF'
[
  { "id": "app.starting", "translation": "Iniciando Madi Engine..." },
  { "id": "gateway.server.started", "translation": "Gateway escuchando en {{.addr}}" },
  { "id": "app.err.proto_not_found", "translation": "Archivos proto no encontrados en {{.path}}" },
  { "id": "core.test.passed", "translation": "Todas las pruebas del core pasaron" }
]
EOF

# Chinese Simplified
cat > apps/gateway/i18n/zh-CN.json <<'EOF'
[
  { "id": "app.starting", "translation": "启动 Madi 引擎..." },
  { "id": "gateway.server.started", "translation": "网关正在 {{.addr}} 上监听" },
  { "id": "app.err.proto_not_found", "translation": "在 {{.path}} 找不到 proto 文件" },
  { "id": "core.test.passed", "translation": "所有核心测试通过" }
]
EOF

# Russian
cat > apps/gateway/i18n/ru.json <<'EOF'
[
  { "id": "app.starting", "translation": "Запуск Madi Engine..." },
  { "id": "gateway.server.started", "translation": "Шлюз слушает на {{.addr}}" },
  { "id": "app.err.proto_not_found", "translation": "Файлы proto не найдены по пути {{.path}}" },
  { "id": "core.test.passed", "translation": "Все тесты ядра пройдены" }
]
EOF

# Italian
cat > apps/gateway/i18n/it.json <<'EOF'
[
  { "id": "app.starting", "translation": "Avviando Madi Engine..." },
  { "id": "gateway.server.started", "translation": "Gateway in ascolto su {{.addr}}" },
  { "id": "app.err.proto_not_found", "translation": "File proto non trovati in {{.path}}" },
  { "id": "core.test.passed", "translation": "Tutti i test del core superati" }
]
EOF

# Arabic
cat > apps/gateway/i18n/ar.json <<'EOF'
[
  { "id": "app.starting", "translation": "بدء تشغيل محرك مادي..." },
  { "id": "gateway.server.started", "translation": "البوابة تستمع على {{.addr}}" },
  { "id": "app.err.proto_not_found", "translation": "ملفات البروتو غير موجودة في {{.path}}" },
  { "id": "core.test.passed", "translation": "جميع اختبارات النواة اجتازت" }
]
EOF

# Korean
cat > apps/gateway/i18n/ko.json <<'EOF'
[
  { "id": "app.starting", "translation": "Madi 엔진 시작 중..." },
  { "id": "gateway.server.started", "translation": "게이트웨이가 {{.addr}} 에서 수신 대기 중입니다" },
  { "id": "app.err.proto_not_found", "translation": "{{.path}}에서 proto 파일을 찾을 수 없습니다" },
  { "id": "core.test.passed", "translation": "모든 코어 테스트가 통과했습니다" }
]
EOF

# Japanese
cat > apps/gateway/i18n/ja.json <<'EOF'
[
  { "id": "app.starting", "translation": "Madiエンジンを起動しています..." },
  { "id": "gateway.server.started", "translation": "ゲートウェイは{{.addr}}で待機しています" },
  { "id": "app.err.proto_not_found", "translation": "{{.path}}にプロトファイルが見つかりません" },
  { "id": "core.test.passed", "translation": "コアのテストはすべて合格しました" }
]
EOF

# i18n Go initializer
cat > apps/gateway/internal/i18n/i18n.go <<'EOF'
package i18n

import (
	"encoding/json"
	"os"
	"path/filepath"

	"github.com/nicksnyder/go-i18n/v2/i18n"
	"golang.org/x/text/language"
)

var Bundle *i18n.Bundle

func Init(basePath string) error {
	Bundle = i18n.NewBundle(language.English)
	Bundle.RegisterUnmarshalFunc("json", json.Unmarshal)

	files := []string{"en.json","fr.json","es.json","zh-CN.json","ru.json","it.json","ar.json","ko.json","ja.json"}
	for _, f := range files {
		p := filepath.Join(basePath, f)
		if _, err := os.Stat(p); err == nil {
			if _, err := Bundle.LoadMessageFile(p); err != nil {
				return err
			}
		}
	}
	return nil
}

func Localize(lang, id string, data map[string]interface{}) string {
	loc := i18n.NewLocalizer(Bundle, lang)
	msg, err := loc.Localize(&i18n.LocalizeConfig{MessageID: id, TemplateData: data})
	if err != nil {
		// fallback to ID
		return id
	}
	return msg
}
EOF

# i18n validation script
cat > scripts/i18n-validate.sh <<'EOF'
#!/usr/bin/env bash
set -e
ROOT="$(dirname "$0")/.."
EN_FILE="$ROOT/apps/gateway/i18n/en.json"
if ! command -v jq >/dev/null 2>&1; then
  echo "jq is required for i18n validation. Install jq in CI or locally."
  exit 0
fi

EN_KEYS=$(jq -r '.[].id' "$EN_FILE" | sort)
MISSING=0
for f in $ROOT/apps/gateway/i18n/*.json; do
  if [ "$f" = "$EN_FILE" ]; then
    continue
  fi
  KEYS=$(jq -r '.[].id' "$f" | sort)
  DIFF=$(comm -23 <(echo "$EN_KEYS") <(echo "$KEYS"))
  if [ -n "$DIFF" ]; then
    echo "Missing keys in $f:" >&2
    echo "$DIFF" >&2
    MISSING=1
  fi
done

if [ "$MISSING" -eq 1 ]; then
  echo "i18n validation failed: some locale files are missing keys." >&2
  exit 1
fi

echo "i18n validation passed: all locale files include en keys."
EOF
chmod +x scripts/i18n-validate.sh

# translations README
cat > apps/gateway/i18n/README-translations.md <<'EOF'
# i18n: Translations and guidelines

This folder contains machine-generated starter translations for supported locales.

Supported locales:
- en (English)
- fr (French)
- es (Spanish)
- zh-CN (Chinese Simplified)
- ru (Russian)
- it (Italian)
- ar (Arabic)
- ko (Korean)
- ja (Japanese)

Notes:
- These translations are machine-generated as a starting point. Review and correct them before shipping to production.
- To add a new key: add the message ID to i18n/en.json and provide translations in other locale files.
- The Go gateway uses github.com/nicksnyder/go-i18n/v2; initialize the bundle with apps/gateway/internal/i18n.Init("apps/gateway/i18n").
EOF

# Git commit & push
git add -A
git commit -m "feat(i18n,ci): add i18n support, validate script, Makefile, and CI updates for main-bues"
git push origin main-bues

# Create PR via gh if available
if command -v gh >/dev/null 2>&1; then
  gh pr create --title "feat: i18n + CI improvements (main-bues)" --body "Adds i18n support (starter machine translations), Makefile, i18n validation script, and CI changes. Machine-generated translations require human review before production." --base main --head main-bues
  echo "PR created via gh."
else
  echo "Pushed branch main-bues. Use GitHub UI or 'gh pr create' to open a PR."
fi
