SOURCES := $(shell find src -name '*.v')
HTMLS  := $(SOURCES:src/%.v=out/%.html)

.PHONY: all doc clean

all: doc

doc: $(HTMLS)

out/%.html: src/%.v
	@mkdir -p $(dir $@)
	alectryon --frontend coq+rst --backend webpage $< -o $@

clean:
	rm -rf out
