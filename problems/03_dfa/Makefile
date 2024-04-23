test: pset02
	./pset02

pset02: testbench.v dfa_two_last_bits_are_01.v
	iverilog $^ -o $@

clean:
	rm -f pset02

help:
	@echo "  test  - Run testbench"
	@echo "  clean - Remove most generated files"
	@echo "  help  - Display this text"

.PHONY: clean test help
