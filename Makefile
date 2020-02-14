pdf:
	for loopi in {1..6}; do \
		chromium --headless --disable-gpu --print-to-pdf=bone_e$$loopi.pdf bone_e$$loopi.svg; \
		pdfcrop --margins '-1 -10 -154 -610' bone_e$$loopi.pdf bone_e$$loopi.pdf; \
	done
	pdfunite bone_e*.pdf bone-layout.pdf

png: pdf
	for loopi in {1..6}; do \
		convert -density 300 bone_e$$loopi.pdf bone_e$$loopi.png; \
	done

all: png

.PHONY: all pdf png
