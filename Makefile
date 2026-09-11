SRC = $(wildcard *.tex)

PDFS = $(SRC:.tex=.pdf)

all: clean pdf

en: clean
	mkdir -p build
	xelatex -output-directory=build resume.tex 

zh_CN: zh-industry

zh-industry: clean
	mkdir -p build
	xelatex -output-directory=build resume-zh_CN.tex
	xelatex -output-directory=build resume-zh_CN.tex
	mv build/resume-zh_CN.pdf "build/王虎林-简历-公司.pdf"

zh-academic: clean
	mkdir -p build
	xelatex -output-directory=build resume-zh_CN-academic.tex
	xelatex -output-directory=build resume-zh_CN-academic.tex
	mv build/resume-zh_CN-academic.pdf "build/王虎林-简历-教职.pdf"

zh-all: clean
	mkdir -p build
	xelatex -output-directory=build resume-zh_CN.tex && xelatex -output-directory=build resume-zh_CN.tex
	xelatex -output-directory=build resume-zh_CN-academic.tex && xelatex -output-directory=build resume-zh_CN-academic.tex
	mv build/resume-zh_CN.pdf "build/王虎林-简历-公司.pdf"
	mv build/resume-zh_CN-academic.pdf "build/王虎林-简历-教职.pdf"

pdf: clean $(PDFS)

%.pdf:  %.tex
	xelatex $<

ifeq ($(OS),Windows_NT)
# on Windows
RM = cmd //C del
else
# on Unix/Linux
RM = rm -f
endif

clean:
	# $(RM) *.log *.aux *.bbl *.blg *.synctex.gz *.out *.toc *.lof *.idx *.ilg *.ind *.pdf
	$(RM) build/*
