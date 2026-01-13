-include .env
export

OAPIGEN?=$(shell go env GOPATH)/bin/oapi-codegen

OUT_DIR=pkg

oapi-codegen-install:
	go install github.com/oapi-codegen/oapi-codegen/v2/cmd/oapi-codegen@latest

apigen:
	mkdir -p ${OUT_DIR}
	${OAPIGEN} --config=internal/api/oapi-codegen-config.yaml internal/api/openapi.yml

partnerapi-gen:
	mkdir -p ${OUT_DIR}
	${OAPIGEN} --config=internal/partnerapi/oapi-codegen-config.yaml internal/partnerapi/openapi.yml

clean:
	rm -rf $(OUT_DIR)

.PHONY: all generate clean