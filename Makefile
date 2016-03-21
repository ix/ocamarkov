all:
	mkdir -p bin/
	ocamlfind ocamlopt -a\
		-package core\
		-package str\
		-thread\
		markov.mli markov.ml -o markov.cmxa
	ocamlfind ocamlopt\
		-package core\
 		-package str\
	 	-thread\
		-linkpkg\
		markov.cmxa main.ml -o bin/main
