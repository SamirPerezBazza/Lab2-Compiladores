gram:
	clear
	yacc -d gram.y
	lex gram.l
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