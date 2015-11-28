all:
	mkdir -p bin/
	ocamlfind ocamlopt -package batteries -linkpkg markov.ml -o bin/markov
	rm {markov.cmi,markov.cmx,markov.o}

everything:
	mkdir -p bin/
	ocamlfind ocamlopt -package batteries -linkpkg markov.ml -o bin/markov
