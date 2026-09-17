SRC = $(wildcard *.tex)

PDFS = $(addprefix build/,$(SRC:.tex=.pdf))
GENERATED_EXTENSIONS = pdf aux log bbl blg synctex.gz synctex.gz\(busy\) out toc lof lot idx ilg ind fls fdb_latexmk dvi xdv
ROOT_GENERATED = $(foreach ext,$(GENERATED_EXTENSIONS),$(SRC:.tex=.$(ext)))

all: pdf

.PHONY: all en zh_CN zh-industry zh-academic zh-all pdf clean

en: build/english_resume.pdf

zh_CN: zh-industry

zh-industry: build/resume-zh_CN.pdf
	cp $< "build/王虎林-简历-公司.pdf"

zh-academic: build/resume-zh_CN-academic.pdf
	cp $< "build/王虎林-简历-教职.pdf"

zh-all: zh-industry zh-academic

pdf: $(PDFS)

build/%.pdf: %.tex resume.cls $(wildcard texs/*.tex stys/*.sty)
	mkdir -p build
	xelatex -interaction=nonstopmode -halt-on-error -output-directory=build $<
	xelatex -interaction=nonstopmode -halt-on-error -output-directory=build $<

ifeq ($(OS),Windows_NT)
# on Windows
RM = cmd //C del
else
# on Unix/Linux
RM = rm -f
endif

clean:
	$(RM) $(ROOT_GENERATED)
	$(RM) build/*
