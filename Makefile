-include .env
export

OAPIGEN?=$(shell go env GOPATH)/bin/oapi-codegen

OUT_DIR=pkg/api

oapi-codegen-install:
	go install github.com/oapi-codegen/oapi-codegen/v2/cmd/oapi-codegen@latest

apigen:
	@if [ -z "$(OAPIGEN)" ]; then \
			echo "oapi-codegen не найден"; \
			exit 1; \
		fi
	mkdir -p ${OUT_DIR}
	${OAPIGEN} --config=internal/api/oapi-codegen-config.yaml internal/api/openapi.yml

clean:
	rm -rf $(OUT_DIR)

.PHONY: all generate clean