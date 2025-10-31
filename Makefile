SOURCES := $(shell find src -name '*.v')
HTMLS  := $(SOURCES:src/%.v=out/%.html)

.PHONY: all init doc server clean

all: init doc

init:
	cp -R css/ out/css
	cp -R js/ out/js

doc: $(HTMLS)

server:
	npx http-server out/

out/%.html: src/%.v
	@mkdir -p $(dir $@)
	alectryon --frontend coq+rst --backend webpage $< -o $@

watch: init
	@echo "Watching for changes in src/*.v files..."
	@fswatch -0 --include='.*\.v$$' --exclude='.*' src | xargs -0 -n1 -I{} make doc

clean:
	rm -rf out
