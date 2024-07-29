.PHONY: c-dev

c-dev:
	cd client && yarn dev

s-dev:
	cd server && go run cmd/main.go