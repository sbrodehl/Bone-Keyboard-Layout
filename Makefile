pdf: 
	mkdir -p dist
	for loopi in {1..6}; do \
		chromium --headless --disable-gpu --print-to-pdf=dist/bone_e$$loopi.pdf bone_e$$loopi.svg; \
		pdfcrop --margins '-1 -10 -154 -610' dist/bone_e$$loopi.pdf dist/bone_e$$loopi.pdf; \
	done
	pdfunite dist/bone_e*.pdf bone_layout.pdf

png: pdf
	for loopi in {1..6}; do \
		convert -density 300 dist/bone_e$$loopi.pdf dist/bone_e$$loopi.png; \
	done

all: png

clean:
	rm dist/*.png
	rm dist/*.pdf

.PHONY: all pdf png clean
