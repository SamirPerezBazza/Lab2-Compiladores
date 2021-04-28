gram:
	clear
	yacc -d gram.y
	lex gram.l
	gcc lex.yy.c y.tab.c gram.c
	@echo "======================"
	./a.out config.in