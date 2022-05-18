.SUFFIXES:

PATTERN = FIR0

all:  ${PATTERN:=.vcd}

%.vvp: %_tb.v
	iverilog -I ./../../rtl/${PATTERN} \
	$< -o $@

%.vcd: %.vvp
	vvp $<

clean:
	rm -f *.vvp *.vcd output.txt

.PHONY: clean all