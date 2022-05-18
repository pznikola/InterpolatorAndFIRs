.SUFFIXES:
.SILENT: clean all

PATTERNS = FIR0 FIR1 FIR2

all:  ${PATTERNS}
	for i in ${PATTERNS}; do \
		( cd $$i && make -f Makefile $${i}.vcd &> verify.log && grep Monitor verify.log) ; \
	done

clean:  ${PATTERNS}
	for i in ${PATTERNS}; do \
		rm -f verify.log; \
		( cd $$i && make clean ) ; \
	done

.PHONY: clean all