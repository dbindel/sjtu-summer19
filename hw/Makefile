TEXINPUTS:=.

HW= \
	pdf/2019-05-21.pdf \
	pdf/2019-05-22.pdf \
	pdf/2019-05-23.pdf \
	pdf/2019-05-24.pdf \
	pdf/2019-05-29.pdf \
	pdf/2019-05-30.pdf \
	pdf/2019-05-31.pdf \
	pdf/2019-06-04.pdf \
	pdf/2019-06-05.pdf \
	pdf/2019-06-12.pdf \
	pdf/2019-06-13.pdf \
	pdf/2019-06-14.pdf 

.PHONY: all copy
all: $(HW)

pdf/%.pdf: tex/%.tex
	xelatex -output-dir pdf $<
	xelatex -output-dir pdf $<

clean:
	rm -f pdf/*.aux pdf/*.log pdf/*.out
	rm -f pdf/*.nav pdf/*.snm pdf/*.toc
	rm -f pdf/*.vrb

distclean: clean
	rm -f pdf/*.pdf

copy: $(HW)
	mkdir -p ../web/hw
	cp $(HW) ../web/hw
