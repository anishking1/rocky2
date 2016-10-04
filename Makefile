# thunderbolt & sung

.PHONY : lpc
lpc :
#First construct dependencies for lpc.pd, then compile lpc.pd from lpc rocky2 code.
# lpc
	cat ./example_code/audiosel~ | ./rocky2 > ./example_code/audiosel~.pd
	cat ./example_code/loadsoundfile | ./rocky2 > ./example_code/loadsoundfile.pd
	cat ./example_code/playloop | ./rocky2 > ./example_code/playloop.pd
	cat ./example_code/myenv | ./rocky2 > ./example_code/myenv.pd
	cat ./example_code/lpc | ./rocky2 > ./example_code/lpc.pd

.PHONY : helloworld
#Simple Hello, World! program
helloworld :
	cat ./example_code/helloworld | ./rocky2 > ./example_code/helloworld.pd

.PHONY : test
test :
# Negative tests which cause build-fail aren't included
# negative tests: 	test2.r, test4.r, test6.r, test9.r test10.r, test12.r
#			test15.r test21.r test28.r
# test28 connectW testing, connect to object in different canvas
	cat ./test_cases/test0.r | ./rocky2 > ./test_cases/test0.pd
	cat ./test_cases/test1.r | ./rocky2 > ./test_cases/test1.pd
	cat ./test_cases/test3.r | ./rocky2 > ./test_cases/test3.pd
	cat ./test_cases/test5.r | ./rocky2 > ./test_cases/test5.pd
	cat ./test_cases/test7.r | ./rocky2 > ./test_cases/test7.pd
	cat ./test_cases/test8.r | ./rocky2 > ./test_cases/test8.pd
	cat ./test_cases/test11.r | ./rocky2 > ./test_cases/test11.pd
	cat ./test_cases/test13.r | ./rocky2 > ./test_cases/test13.pd
	cat ./test_cases/test14.r | ./rocky2 > ./test_cases/test14.pd
	cat ./test_cases/test16.r | ./rocky2 > ./test_cases/test16.pd
	cat ./test_cases/test17.r | ./rocky2 > ./test_cases/test17.pd
	cat ./test_cases/test18.r | ./rocky2 > ./test_cases/test18.pd
	cat ./test_cases/test19.r | ./rocky2 > ./test_cases/test19.pd
	cat ./test_cases/test20.r | ./rocky2 > ./test_cases/test20.pd
	cat ./test_cases/test22.r | ./rocky2 > ./test_cases/test22.pd
	cat ./test_cases/test23.r | ./rocky2 > ./test_cases/test23.pd
	cat ./test_cases/test24.r | ./rocky2 > ./test_cases/test24.pd
	cat ./test_cases/test25.r | ./rocky2 > ./test_cases/test25.pd
	cat ./test_cases/test26.r | ./rocky2 > ./test_cases/test26.pd
	cat ./test_cases/test27.r | ./rocky2 > ./test_cases/test27.pd
	cat ./test_cases/test29.r | ./rocky2 > ./test_cases/test29.pd
	cat ./test_cases/test30.r | ./rocky2 > ./test_cases/test30.pd
	cat ./test_cases/test31.r | ./rocky2 > ./test_cases/test31.pd
	cat ./test_cases/test32.r | ./rocky2 > ./test_cases/test32.pd

.PHONY : build
build :
	ocamllex scanner.mll
	ocamlyacc parser.mly
	ocamlc -c ast.ml
	ocamlc -c parser.mli
	ocamlc -c scanner.ml
	ocamlc -c parser.ml
	ocamlc -c semant.ml
	ocamlc -c codegen.ml
	ocamlc -c connect.ml
	ocamlc -c rocky2.ml
	ocamlc -o rocky2 parser.cmo scanner.cmo ast.cmo semant.cmo codegen.cmo connect.cmo rocky2.cmo


.PHONY : clean
clean :
	ocamlbuild -clean
	rm -rf scanner.ml parser.ml parser.mli
	rm -rf *.cmx *.cmi *.cmo *.cmx *.o
	rm -rf rocky2 *.pd
	rm -rf ./test_cases/*.pd
