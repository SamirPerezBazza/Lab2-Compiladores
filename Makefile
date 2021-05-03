gram:
	clear
	yacc -d gram.y
	lex ./gram.l
	gcc lex.yy.c y.tab.c gram.c
	@echo "======================"
	./a.out config.in

gram-debug:
	clear
	yacc -d gram.y
	lex gram.l
	gcc lex.yy.c y.tab.c gram.c -DYYDEBUG
	@echo "======================"
	./a.out config.in

lex:
	clear
	yacc -d gram.y
	lex ./gram.l
	gcc ./lex.yy.c ./lex.c -o myscanner
	@echo "======================"
	@./myscanner < config.in

release:
	clear
	yacc -d LAB02_PucheGuevara_PerezBazza.y
	lex ./LAB01_PucheGuevara_PerezBazza.l
	gcc lex.yy.c y.tab.c LAB02_PucheGuevara_PerezBazza.c -o LAB02_PucheGuevara_PerezBazza
	gcc ./lex.yy.c ./LAB01_PucheGuevara_PerezBazza.c -o LAB01_PucheGuevara_PerezBazza
