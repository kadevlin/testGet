.PHONY: models

deps:
	go get -u github.com/golang/dep/cmd/dep
	dep ensure -v


clean:
	rm -rf ./bin
	set -e && for pkg in $$(ls lambda); do \
    		rm -rf lambda/$$pkg/bin; \
    done

build: clean
	mkdir -p bin
	set -e && for pkg in $$(ls lambda); do \
		echo "\nbuilding: $$pkg\n"; \
		mkdir -p lambda/$$pkg/bin; \
        GOOS=linux CGO_ENABLED=0 go build -o ./lambda/$$pkg/bin/$(notdir $$pkg) ./lambda/$$pkg/; \
		zip -qj ./bin/$$pkg.zip ./lambda/$$pkg/bin/*; \
	done





