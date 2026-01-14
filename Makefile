-include .env
export

OAPIGEN?=$(shell go env GOPATH)/bin/ogen

OUT_DIR=pkg

ogen-install:
	go install -v github.com/ogen-go/ogen/cmd/ogen@latest

apigen:
	${OAPIGEN} --target ./pkg/api ./internal/api/openapi.yml

partnerapi-gen:
	${OAPIGEN} --target ./pkg/partnerapi ./internal/partnerapi/openapi.yml

clean:
	rm -rf $(OUT_DIR)

.PHONY: all generate clean