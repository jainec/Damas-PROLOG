%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%  JOGO DE DAMAS EM PROLOG %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-style_check(-discontiguous).
:-style_check(-singleton).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%  PREDICADOS PARA REALIZAR JOGADAS %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

adicionar(X,Y,[Y|X]).

%checa se o elemento N pertence a lista
checarLista(PF,[]).
checarLista(PF,[X|Xs]) :- PF \== X, checarLista(PF,Xs).

%remove elemento da lista
remover(X,[X|C],C).
remover(X,[Y|C],[Y|D]):-remover(X,C,D).

%move peça
mover('Branco',LI,LI2,PI,PF,LI2,LF) :- PF-PI =:= 7, checarLista(PF,LI),checarLista(PF,LI2),
remover(PI,LI,LF1), adicionar(LF1,PF,LF).
mover('Branco',LI,LI2,PI,PF,LI2,LF) :- PF-PI =:= 9, checarLista(PF,LI),checarLista(PF,LI2),
remover(PI,LI,LF1), adicionar(LF1,PF,LF).
mover('Preto',LI,LI2,PI,PF,LI2,LF) :- PI-PF =:= 7, checarLista(PF,LI),checarLista(PF,LI2),
remover(PI,LI,LF1), adicionar(LF1,PF,LF).
mover('Preto',LI,LI2,PI,PF,LI2,LF) :- PI-PF =:= 9, checarLista(PF,LI),checarLista(PF,LI2),
remover(PI,LI,LF1), adicionar(LF1,PF,LF).

%Come para frente
comer(LI,LI2,PI,PF,LF2,LF):- PF-PI =:= 14,checarLista(PF,LI),P3 is PF-7, member(P3,LI2),
checarLista(PF,LI2),is(P,-(PF,7)),remover(P,LI2,LF2),
remover(PI,LI,LF1),adicionar(LF1,PF,LF).

comer(LI,LI2,PI,PF,LF2,LF):- PF-PI =:= 18,checarLista(PF,LI),P3 is PF-9, member(P3,LI2),
checarLista(PF,LI2),is(P,-(PF,9)),remover(P,LI2,LF2),
remover(PI,LI,LF1),adicionar(LF1,PF,LF).

%Come para trás
comer(LI,LI2,PI,PF,LF2,LF) :- PI-PF =:= 14, checarLista(PF,LI), P3 is PF+7, member(P3,LI2),
checarLista(PF,LI2),is(P,-(PI,7)),remover(P,LI2,LF2),
remover(PI,LI,LF1),adicionar(LF1,PF,LF).

comer(LI,LI2,PI,PF,LF2,LF) :- PI-PF =:= 18, checarLista(PF,LI), P3 is PF+9, member(P3,LI2),
checarLista(PF,LI2),is(P,-(PI,9)),remover(P,LI2,LF2),
remover(PI,LI,LF1),adicionar(LF1,PF,LF).


%Mover dama para frente
moverDama(LI,LI2,PI,PF,LI2,LF) :- diagonal(LI,LI2,PI,PF),is(0,mod(-(PF,PI),7)), checarLista(PF,LI),checarLista(PF,LI2),
remover(PI,LI,LF1), adicionar(LF1,PF,LF).

moverDama(LI,LI2,PI,PF,LI2,LF) :-diagonal(LI,LI2,PI,PF), is(0,mod(-(PF,PI),9)), checarLista(PF,LI),checarLista(PF,LI2),
remover(PI,LI,LF1), adicionar(LF1,PF,LF).

%Mover dama para trás
moverDama(LI,LI2,PI,PF,LI2,LF) :-diagonal(LI,LI2,PI,PF), is(0,mod(-(PI,PF),7)), checarLista(PF,LI),checarLista(PF,LI2),
remover(PI,LI,LF1), adicionar(LF1,PF,LF).

moverDama(LI,LI2,PI,PF,LI2,LF) :-diagonal(LI,LI2,PI,PF), is(0,mod(-(PI,PF),9)), checarLista(PF,LI),checarLista(PF,LI2),
remover(PI,LI,LF1), adicionar(LF1,PF,LF).

%Comer com a dama
comerD(LI,LI2,PI,PF,LF2,LF):- PF>PI,P3 is PF-14,diagonal(LI,LI2,PI,P3),checarLista(PF,LI), PN is PF-7, member(PN,LI2),
checarLista(PF,LI2),is(P,-(PF,7)),remover(P,LI2,LF2),
remover(PI,LI,LF1),adicionar(LF1,PF,LF).

comerD(LI,LI2,PI,PF,LF2,LF):- PF>PI,P3 is PF-18,diagonal(LI,LI2,PI,P3),checarLista(PF,LI), PN is PF -9 , member(PN,LI2),
checarLista(PF,LI2),is(P,-(PF,9)),remover(P,LI2,LF2),
remover(PI,LI,LF1),adicionar(LF1,PF,LF).

comerD(LI,LI2,PI,PF,LF2,LF) :- PI>PF, P3 is PF+14,diagonal(LI,LI2,PI,P3), checarLista(PF,LI), PN is PF+7, member(PN,LI2),
checarLista(PF,LI2),is(P,+(PF,7)),remover(P,LI2,LF2),
remover(PI,LI,LF1),adicionar(LF1,PF,LF).

comerD(LI,LI2,PI,PF,LF2,LF) :- PI>PF,P3 is PF+18,diagonal(LI,LI2,PI,P3), checarLista(PF,LI), PN is PF+9, member(PN,LI2),
checarLista(PF,LI2),is(P,+(PF,9)),remover(P,LI2,LF2),
remover(PI,LI,LF1),adicionar(LF1,PF,LF).

%funções auxiliares para o comer com a dama
diagonal(L1,L2,P,P).
diagonal(L1,L2,PI,PF):-is(0,mod(-(PI,PF),7)),Y is PF//7, X is PI//7, Z is X-Y-1, checarE2(L1,L2,PF,Z).
diagonal(L1,L2,PI,PF):-is(0,mod(-(PI,PF),9)),Y is PF//9, X is PI//9, Z is X-Y-1, checarD2(L1,L2,PF,Z).
diagonal(L1,L2,PI,PF):-is(0,mod(-(PF,PI),7)),X is PF//7, Y is PI//7, Z is X-Y-1, checarE(L1,L2,PF,Z).
diagonal(L1,L2,PI,PF):-is(0,mod(-(PF,PI),9)),X is PF//9, Y is PI//9, Z is X-Y-1, checarD(L1,L2,PF,Z).

checarE(L1,L2,PF,0).
checarE(L1,L2,PF,1):- P is PF-7, not(member(P,L1)),not(member(P,L2)),checarE(L1,L2,P,0).
checarE(L1,L2,PF,2):- P is PF-7, not(member(P,L1)),not(member(P,L2)),checarE(L1,L2,P,1).
checarE(L1,L2,PF,3):- P is PF-7, not(member(P,L1)),not(member(P,L2)),checarE(L1,L2,P,2).
checarE(L1,L2,PF,4):- P is PF-7, not(member(P,L1)),not(member(P,L2)),checarE(L1,L2,P,3).
checarE(L1,L2,PF,5):- P is PF-7, not(member(P,L1)),not(member(P,L2)),checarE(L1,L2,P,4).
checarE(L1,L2,PF,6):- P is PF-7, not(member(P,L1)),not(member(P,L2)),checarE(L1,L2,P,5).
checarE2(L1,L2,PF,0).
checarE2(L1,L2,PF,1):- P is PF+7, not(member(P,L1)),not(member(P,L2)),checarE2(L1,L2,P,0).
checarE2(L1,L2,PF,2):- P is PF+7, not(member(P,L1)),not(member(P,L2)),checarE2(L1,L2,P,1).
checarE2(L1,L2,PF,3):- P is PF+7, not(member(P,L1)),not(member(P,L2)),checarE2(L1,L2,P,2).
checarE2(L1,L2,PF,4):- P is PF+7, not(member(P,L1)),not(member(P,L2)),checarE2(L1,L2,P,3).
checarE2(L1,L2,PF,5):- P is PF+7, not(member(P,L1)),not(member(P,L2)),checarE2(L1,L2,P,4).
checarE2(L1,L2,PF,6):- P is PF+7, not(member(P,L1)),not(member(P,L2)),checarE2(L1,L2,P,5).
checarD(L1,L2,PF,0).
checarD(L1,L2,PF,1):- P is PF-9, not(member(P,L1)),not(member(P,L2)),checarD(L1,L2,P,0).
checarD(L1,L2,PF,2):- P is PF-9, not(member(P,L1)),not(member(P,L2)),checarD(L1,L2,P,1).
checarD(L1,L2,PF,3):- P is PF-9, not(member(P,L1)),not(member(P,L2)),checarD(L1,L2,P,2).
checarD(L1,L2,PF,4):- P is PF-9, not(member(P,L1)),not(member(P,L2)),checarD(L1,L2,P,3).
checarD(L1,L2,PF,5):- P is PF-9, not(member(P,L1)),not(member(P,L2)),checarD(L1,L2,P,4).
checarD(L1,L2,PF,6):- P is PF-9, not(member(P,L1)),not(member(P,L2)),checarD(L1,L2,P,5).
checarD2(L1,L2,PF,0).
checarD2(L1,L2,PF,1):- P is PF+9, not(member(P,L1)),not(member(P,L2)),checarD2(L1,L2,P,0).
checarD2(L1,L2,PF,2):- P is PF+9, not(member(P,L1)),not(member(P,L2)),checarD2(L1,L2,P,1).
checarD2(L1,L2,PF,3):- P is PF+9, not(member(P,L1)),not(member(P,L2)),checarD2(L1,L2,P,2).
checarD2(L1,L2,PF,4):- P is PF+9, not(member(P,L1)),not(member(P,L2)),checarD2(L1,L2,P,3).
checarD2(L1,L2,PF,5):- P is PF+9, not(member(P,L1)),not(member(P,L2)),checarD2(L1,L2,P,4).
checarD2(L1,L2,PF,6):- P is PF+9, not(member(P,L1)),not(member(P,L2)),checarD2(L1,L2,P,5).

%checa se a peça virou dama.
viraDama(35,_,L,L).
viraDama(35,_,L,L).
viraDama(10,_,L,L).
viraDama(12,_,L,L).
viraDama(14,_,L,L).
viraDama(16,_,L,L).
viraDama(17,_,L,L).
viraDama(19,_,L,L).
viraDama(21,_,L,L).
viraDama(23,_,L,L).
viraDama(26,_,L,L).
viraDama(28,_,L,L).
viraDama(30,_,L,L).
viraDama(32,_,L,L).
viraDama(33,_,L,L).
viraDama(35,_,L,L).
viraDama(37,_,L,L).
viraDama(39,_,L,L).
viraDama(42,_,L,L).
viraDama(44,_,L,L).
viraDama(46,_,L,L).
viraDama(48,_,L,L).
viraDama(49,_,L,L).
viraDama(51,_,L,L).
viraDama(53,_,L,L).
viraDama(55,_,L,L).
viraDama(58,'Branco',L,L2):- adicionar(L,58,L2).
viraDama(60,'Branco',L,L2):- adicionar(L,60,L2).
viraDama(62,'Branco',L,L2):- adicionar(L,62,L2).
viraDama(64,'Branco',L,L2):- adicionar(L,64,L2).
viraDama(1,'Preto',L,L2):- adicionar(L,1,L2).
viraDama(3,'Preto',L,L2):- adicionar(L,3,L2).
viraDama(5,'Preto',L,L2):- adicionar(L,5,L2).
viraDama(7,'Preto',L,L2):- adicionar(L,7,L2).

%remove da lista de damas.
removerDama(PF,LD,LD):-X is PF-7, not(member(X,LD)).
removerDama(PF,LD,LD):-X is PF-9, not(member(X,LD)).
removerDama(PF,LD,LD):-X is PF+7, not(member(X,LD)).
removerDama(PF,LD,LD):-X is PF+9, not(member(X,LD)).
removerDama(PF,LD,LDF):-X is PF-7, member(X,LD),remover(X,LD,LDF).
removerDama(PF,LD,LDF):-X is PF-9, member(X,LD),remover(X,LD,LDF).
removerDama(PF,LD,LDF):-X is PF+7, member(X,LD),remover(X,LD,LDF).
removerDama(PF,LD,LDF):-X is PF+9, member(X,LD),remover(X,LD,LDF).

%checa se a peça pertence a lista de damas.
ehDama(L,P,p):-not(member(P,L)).
ehDama(L,P,d):-member(P,L).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%  INTERAÇÃO COM O USUÁRIO   %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%predicados para ler a entrada do usuario.
lerPI(PI):-
jpl_new( 'javax.swing.JFrame', ['frame with dialog'], F),
jpl_call( F, setLocation, [400,300], _),
jpl_call( F, setSize, [400,300], _),
jpl_call( F, setVisible, [@(false)], _),
jpl_call( F, toFront, [], _),
jpl_call( 'javax.swing.JOptionPane', showInputDialog, [F,'Digite a posicao inicial'], PI),
jpl_call( F, dispose, [], _).

lerPI2(PI):-
jpl_new( 'javax.swing.JFrame', ['frame with dialog'], F),
jpl_call( F, setLocation, [400,300], _),
jpl_call( F, setSize, [400,300], _),
jpl_call( F, setVisible, [@(false)], _),
jpl_call( F, toFront, [], _),
jpl_call( 'javax.swing.JOptionPane', showInputDialog, [F,'Digite uma posicao inicial correta'], PI),
jpl_call( F, dispose, [], _).

lerPF(PF):-
jpl_new( 'javax.swing.JFrame', ['frame with dialog'], F),
jpl_call( F, setLocation, [400,300], _),
jpl_call( F, setSize, [400,300], _),
jpl_call( F, setVisible, [@(false)], _),
jpl_call( F, toFront, [], _),
jpl_call( 'javax.swing.JOptionPane', showInputDialog, [F,'Digite a posicao para a qual voce deseja mover a peca'], PF),
jpl_call( F, dispose, [], _).

lerPF2(PF):-
jpl_new( 'javax.swing.JFrame', ['frame with dialog'], F),
jpl_call( F, setLocation, [400,300], _),
jpl_call( F, setSize, [400,300], _),
jpl_call( F, setVisible, [@(false)], _),
jpl_call( F, toFront, [], _),
jpl_call( 'javax.swing.JOptionPane', showInputDialog, [F,'Digite a posicao para a qual voce deseja mover a peca valida'], PF),
jpl_call( F, dispose, [], _).

comerC(C):-
jpl_new( 'javax.swing.JFrame', ['frame with dialog'], F),
jpl_call( F, setLocation, [400,300], _),
jpl_call( F, setSize, [400,300], _),
jpl_call( F, setVisible, [@(false)], _),
jpl_call( F, toFront, [], _),
jpl_call( 'javax.swing.JOptionPane', showMessageDialog, [F,'Aperte ok para comer'], C),
jpl_call( F, dispose, [], _).

comerCMaquina(C):-
jpl_new( 'javax.swing.JFrame', ['frame with dialog'], F),
jpl_call( F, setLocation, [400,300], _),
jpl_call( F, setSize, [400,300], _),
jpl_call( F, setVisible, [@(false)], _),
jpl_call( F, toFront, [], _),
jpl_call( 'javax.swing.JOptionPane', showMessageDialog, [F,'A maquina comeu'], C),
jpl_call( F, dispose, [], _).

%trata a entrada do usuário: transforma uma string de entrada em um inteiro.
str_int('2',2).
str_int('0',0).
str_int('1',1).
str_int('3',3).
str_int('5',5).
str_int('7',7).
str_int('10',10).
str_int('12',12).
str_int('14',14).
str_int('16',16).
str_int('17',17).
str_int('19',19).
str_int('21',21).
str_int('23',23).
str_int('26',26).
str_int('28',28).
str_int('30',30).
str_int('32',32).
str_int('33',33).
str_int('35',35).
str_int('37',37).
str_int('39',39).
str_int('42',42).
str_int('44',44).
str_int('46',46).
str_int('48',48).
str_int('49',49).
str_int('51',51).
str_int('53',53).
str_int('55',55).
str_int('58',58).
str_int('60',60).
str_int('62',62).
str_int('64',64).
str_int(_,99).

%predicado para trocar o turno do jogador informando de quem é a vez de jogar.
turno('Branco').
turno('Preto').
trocarTurno('Branco','Preto'):-jpl_call('javax.swing.JOptionPane',showMessageDialog,[@null,'Jogador Azul Joga'],_).
trocarTurno('Preto','Branco'):-jpl_call('javax.swing.JOptionPane',showMessageDialog,[@null,'Jogador Amarelo Joga'],_).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% VISUALIZACAO DO ESTADO DO JOGO - INTERFACE JAVA %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%tabuleiros pre definidos, compostos por 3 listas: Lista peças brancas,
%Lista das peças pretas e Lista das peças que são damas.
novoTabuleiro([[1,3,5,7,10,12,14,16,17,19,21,23],[42,44,46,48,49,51,53,55,58,60,62,64],[]]).
novoTabuleiro2([[],[1],[]]).
novoTabuleiro3([[1,3,7,55],[51,44,28,12],[1]]).

%imprime o tabuleiro com as peças
interface([LB,LP,LD]):-
atomic_list_concat(LB,',',B),
atomic_list_concat(LP,',',P),
atomic_list_concat(LD,',',D),
jpl_new('damas.Tabuleiro',[],T),
jpl_call(T,show,[B,P,D],_).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%  PREDICADOS CENTRAIS DO JOGO  %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%inicio do programa.
inicio:-
jpl_new('damas.Imagem',[],I),novoTabuleiro([LB,LP,LD]),
lerEntrada(E),
jpl_call('javax.swing.JOptionPane',showMessageDialog,[@null,'Jogador Amarelo Comeca'],_),
processa([LB,LP,LD],'Branco',_,E,0).


%ler a opção do usuario para jogar contra a máquina ou contra outro humano.
lerEntrada(E):-
jpl_new( 'javax.swing.JFrame', ['frame with dialog'], F),
jpl_call( F, setLocation, [400,300], _),
jpl_call( F, setSize, [400,300], _),
jpl_call( F, setVisible, [@(false)], _),
jpl_call( F, toFront, [], _),
jpl_call( 'javax.swing.JOptionPane', showInputDialog, [F,'Pressione 1 para jogar contra a maquina e 2 para jogar contra outra pessoa'], E),
jpl_call( F, dispose, [], _).


%processa eh o loop principal do programa.
processa([[],LP,LD],_,_,_):-interface([[],LP,LD]),jpl_call('javax.swing.JOptionPane',showMessageDialog,[@null,'Jogador Azul Ganhou'],_).
processa([LB,[],LD],_,_,_):- interface([LB,[],LD]),jpl_call('javax.swing.JOptionPane',showMessageDialog,[@null,'Jogador Amarelo Ganhou'],_).

processa([LB,LP,LD],'Branco',_,'2',0):-      	 %jogada humano1 (na opcao humano x humano)
	interface([LB,LP,LD]),
	lerPI(PI1),str_int(PI1,PI),
	lerPF(PF1),str_int(PF1,PF),
	ehDama(LD,PI,D),ehJogadaValida(D,E,[LB,LP,LD],Turno,X,PI,PF),
	estado(E,X,Y,Turno,PF),C is PF,
	trocarTurno(Turno,Turno2),processa(Y,Turno2,_,'2',C).

processa([LB,LP,LD],'Preto',_,'2',0):-	     	 %jogada humano2 (na opcao humano x humano)
	interface([LB,LP,LD]),
	lerPI(PI1),str_int(PI1,PI),
	lerPF(PF1),str_int(PF1,PF),
	ehDama(LD,PI,D),ehJogadaValida(D,E,[LB,LP,LD],Turno,X,PI,PF),
	estado(E,X,Y,Turno,PF),C is PF,
	trocarTurno(Turno,Turno2),processa(Y,Turno2,_,'2',C).

processa([LB,LP,LD],'Branco',_,'1',0):-		%jogada humano (na opcao humano x maquina)
	interface([LB,LP,LD]),nl,
	lerPI(PI1),str_int(PI1,PI),
	lerPF(PF1),str_int(PF1,PF),
	ehDama(LD,PI,D),ehJogadaValida(D,E,[LB,LP,LD],Turno,X,PI,PF),
	estado(E,X,Y,Turno,PF),C is PF,
	trocarTurno(Turno,Turno2),processa(Y,Turno2,_,'1',C).

processa([LB,LP,LD],'Preto',_,'1',0):-  	 %jogada da maquina
	interface([LB,LP,LD]),nl,
	pick_nums(PI1,LP,AUX,PF1),            	 %lógica da maquina(aleatoria)
	ehDama(LD,PI1,D),
	ehJogadaValidaMaquina(D,E,[LB,LP,LD],Turno,X,PI1,PF1,C),
	estadoMaquina(E,X,Y,Turno,PF1),
	jpl_call('javax.swing.JOptionPane',showMessageDialog,[@null,'A maquina Jogou'],_),
	trocarTurno(Turno,Turno2),
	processa(Y,Turno2,_,'1',C).


processa([LB,LP,LD],'Branco',_,'2',C):-   	%checa se da pra comer na vez do humano1 (se sim, come obrigatoriamente)
	interface([LB,LP,LD]),
	checaPossibilidadeDeComer(1,C,LB,PF,PI),
	ehDama(LD,PI,D),ehJogadaValida2(D,E,[LB,LP,LD],Turno,X,PI,PF,C),	
	estado(E,X,Y,Turno,PF),
	trocarTurno(Turno,Turno2),processa(Y,Turno2,_,'2',PF),!;
	checaPossibilidadeDeComer(2,C,LB,PF,PI),
	ehDama(LD,PI,D),ehJogadaValida2(D,E,[LB,LP,LD],Turno,X,PI,PF,C),	
	estado(E,X,Y,Turno,PF),
	trocarTurno(Turno,Turno2),processa(Y,Turno2,_,'2',PF),!;
	checaPossibilidadeDeComer(3,C,LB,PF,PI),
	ehDama(LD,PI,D),ehJogadaValida2(D,E,[LB,LP,LD],Turno,X,PI,PF,C),	
	estado(E,X,Y,Turno,PF),
	trocarTurno(Turno,Turno2),processa(Y,Turno2,_,'2',PF),!;
	checaPossibilidadeDeComer(4,C,LB,PF,PI),
	ehDama(LD,PI,D),ehJogadaValida2(D,E,[LB,LP,LD],Turno,X,PI,PF,C),	
	estado(E,X,Y,Turno,PF),
	trocarTurno(Turno,Turno2),processa(Y,Turno2,_,'2',PF),!;
	processa([LB,LP,LD],'Branco',_,'2',0),!.


processa([LB,LP,LD],'Preto',_,'2',C):-		%checa se da pra comer na vez do humano2 (se sim, come obrigatoriamente)
	interface([LB,LP,LD]),
	checaPossibilidadeDeComer(1,C,LP,PF,PI),
	ehDama(LD,PI,D),ehJogadaValida2(D,E,[LB,LP,LD],Turno,X,PI,PF,C),	
	estado(E,X,Y,Turno,PF),
	trocarTurno(Turno,Turno2),processa(Y,Turno2,_,'2',PF),!;
	checaPossibilidadeDeComer(2,C,LP,PF,PI),
	ehDama(LD,PI,D),ehJogadaValida2(D,E,[LB,LP,LD],Turno,X,PI,PF,C),	
	estado(E,X,Y,Turno,PF),
	trocarTurno(Turno,Turno2),processa(Y,Turno2,_,'2',PF),!;
	checaPossibilidadeDeComer(3,C,LP,PF,PI),
	ehDama(LD,PI,D),ehJogadaValida2(D,E,[LB,LP,LD],Turno,X,PI,PF,C),	
	estado(E,X,Y,Turno,PF),
	trocarTurno(Turno,Turno2),processa(Y,Turno2,_,'2',PF),!;
	checaPossibilidadeDeComer(4,C,LP,PF,PI),
	ehDama(LD,PI,D),ehJogadaValida2(D,E,[LB,LP,LD],Turno,X,PI,PF,C),	
	estado(E,X,Y,Turno,PF),
	trocarTurno(Turno,Turno2),processa(Y,Turno2,_,'2',PF),!;
	processa([LB,LP,LD],'Preto',_,'2',0),!.


processa([LB,LP,LD],'Branco',_,'1',C):-		%checa se da pra comer na vez do humano(x maquina) (se sim, come obrigatoriamente)
	interface([LB,LP,LD]),
	checaPossibilidadeDeComer(1,C,LB,PF,PI),
	ehDama(LD,PI,D),ehJogadaValida2(D,E,[LB,LP,LD],Turno,X,PI,PF,C),	
	estado(E,X,Y,Turno,PF),
	trocarTurno(Turno,Turno2),processa(Y,Turno2,_,'1',PF),!;
	checaPossibilidadeDeComer(2,C,LB,PF,PI),
	ehDama(LD,PI,D),ehJogadaValida2(D,E,[LB,LP,LD],Turno,X,PI,PF,C),	
	estado(E,X,Y,Turno,PF),
	trocarTurno(Turno,Turno2),processa(Y,Turno2,_,'1',PF),!;
	checaPossibilidadeDeComer(3,C,LB,PF,PI),
	ehDama(LD,PI,D),ehJogadaValida2(D,E,[LB,LP,LD],Turno,X,PI,PF,C),	
	estado(E,X,Y,Turno,PF),
	trocarTurno(Turno,Turno2),processa(Y,Turno2,_,'1',PF),!;
	checaPossibilidadeDeComer(4,C,LB,PF,PI),
	ehDama(LD,PI,D),ehJogadaValida2(D,E,[LB,LP,LD],Turno,X,PI,PF,C),	
	estado(E,X,Y,Turno,PF),
	trocarTurno(Turno,Turno2),processa(Y,Turno2,_,'1',PF),!;
	processa([LB,LP,LD],'Branco',_,'1',0),!.


processa([LB,LP,LD],'Preto',_,'1',C):-		%checa se da pra comer na vez da maquina (se sim, come obrigatoriamente)
	interface([LB,LP,LD]),
	checaPossibilidadeDeComer(1,C,LP,PF,PI),
	ehDama(LD,PI,D),ehJogadaValidaMaquina2(D,E,[LB,LP,LD],Turno,X,PI,PF,C),	
	estadoMaquina(E,X,Y,Turno,PF),
	trocarTurno(Turno,Turno2),processa(Y,Turno2,_,'1',PF),!;
	checaPossibilidadeDeComer(2,C,LP,PF,PI),
	ehDama(LD,PI,D),ehJogadaValidaMaquina2(D,E,[LB,LP,LD],Turno,X,PI,PF,C),	
	estadoMaquina(E,X,Y,Turno,PF),
	trocarTurno(Turno,Turno2),processa(Y,Turno2,_,'1',PF),!;
	checaPossibilidadeDeComer(3,C,LP,PF,PI),
	ehDama(LD,PI,D),ehJogadaValidaMaquina2(D,E,[LB,LP,LD],Turno,X,PI,PF,C),	
	estadoMaquina(E,X,Y,Turno,PF),
	trocarTurno(Turno,Turno2),processa(Y,Turno2,_,'1',PF),!;
	checaPossibilidadeDeComer(4,C,LP,PF,PI),
	ehDama(LD,PI,D),ehJogadaValidaMaquina2(D,E,[LB,LP,LD],Turno,X,PI,PF,C),	
	estadoMaquina(E,X,Y,Turno,PF),
	trocarTurno(Turno,Turno2),processa(Y,Turno2,_,'1',PF),!;
	processa([LB,LP,LD],'Preto',_,'1',0),!.


%se a ultima posicao do adversario -7 for uma peca do jogador tento comer com a peça PF1+7
checaPossibilidadeDeComer(1,PF1,LB,S,PI):- PI is PF1-7,write(PI),member(PI,LB),S is PF1+7.  

%se a ultima posicao do adversario -9 for uma peca do jogador tento comer com a peça PF1+9
checaPossibilidadeDeComer(2,PF1,LB,S,PI):- PI is PF1-9,write(PI),member(PI,LB),S is PF1+9.

%se a ultima posicao do adversario +7 for uma peca do jogador tento comer com a peça PF1-7
checaPossibilidadeDeComer(3,PF1,LB,S,PI):- PI is PF1+7,write(PI),member(PI,LB),S is PF1-7.

%se a ultima posicao do adversario +9 for uma peca do jogador tento comer com a peça PF1-9
checaPossibilidadeDeComer(4,PF1,LB,S,PI):- PI is PF1+9,write(PI),member(PI,LB),S is PF1-9.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%  VALIDACAO E EXECUCAO DE MOVIMENTOS  %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%processa a jogada realizada.
jogada(p,0,[LB,LP,LD],'Branco',[LBF,LP,LDF],PI,PF):- mover('Branco',LB,LP,PI,PF,LP,LBF),viraDama(PF,'Branco',LD,LDF).
jogada(p,0,[LB,LP,LD],'Preto',[LB,LPF,LDF],PI,PF):-  mover('Preto',LP,LB,PI,PF,LB,LPF),viraDama(PF,'Preto',LD,LDF).
jogada(p,1,[LB,LP,LD],'Branco',[LBF,LPF,LDF],PI,PF):- comer(LB,LP,PI,PF,LPF,LBF),viraDama(PF,'Branco',LD,LDF1),removerDama(PF,LDF1,LDF).
jogada(p,1,[LB,LP,LD],'Preto',[LBF,LPF,LDF],PI,PF):-  comer(LP,LB,PI,PF,LBF,LPF),viraDama(PF,'Preto',LD,LDF1),removerDama(PF,LDF1,LDF).
jogada(d,0,[LB,LP,LD],'Branco',[LBF,LP,LDF],PI,PF):- moverDama(LB,LP,PI,PF,LP,LBF),remover(PI,LD,LD1),adicionar(LD1,PF,LDF).
jogada(d,0,[LB,LP,LD],'Preto',[LB,LPF,LDF],PI,PF):-  moverDama(LP,LB,PI,PF,LB,LPF),remover(PI,LD,LD1),adicionar(LD1,PF,LDF).
jogada(d,1,[LB,LP,LD],'Branco',[LBF,LPF,LDF],PI,PF):- comerD(LB,LP,PI,PF,LPF,LBF),remover(PI,LD,LD1),removerDama(PF,LD1,LDF1),adicionar(LDF1,PF,LDF).
jogada(d,1,[LB,LP,LD],'Preto',[LBF,LPF,LDF],PI,PF):- comerD(LP,LB,PI,PF,LBF,LPF),remover(PI,LD,LD1),removerDama(PF,LD1,LDF1),adicionar(LDF1,PF,LDF).

%checa se a jogada a ser realizada é valida
ehJogadaValida(D,E,[LB,LP,LD],Turno,X,PI,PF):-jogada(D,E,[LB,LP,LD],Turno,X,PI,PF).
ehJogadaValida(D1,E1,[LB,LP,LD],Turno,Y,_,_):-
    jpl_call('javax.swing.JOptionPane',showMessageDialog,[@null,'Jogada invalida'],_),
    lerPI2(PI1),
	str_int(PI1,PI),
	lerPF2(PF1),
	str_int(PF1,PF),
	nl,
	ehDama(LD,PI,D),
	ehJogadaValida(D,E,[LB,LP,LD],Turno,X,PI,PF),
	estado(E,X,Y,Turno,PF).

ehJogadaValida2(D,E,[LB,LP,LD],Turno,X,PI,PF,C):-jogada(D,E,[LB,LP,LD],Turno,X,PI,PF),
jpl_call('javax.swing.JOptionPane',showMessageDialog,[@null,'Obrigado a comer'],_).


ehJogadaValidaMaquina(D,E,[LB,LP,LD],Turno,X,PI,PF,C):-jogada(D,E,[LB,LP,LD],Turno,X,PI,PF),C is PF.
ehJogadaValidaMaquina(D1,E1,[LB,LP,LD],Turno,Y,_,_,C):-
	pick_nums(PI1,LP,AUX,PF1),
	nl,
	ehDama(LD,PI1,D),
	ehJogadaValidaMaquina(D,E,[LB,LP,LD],Turno,X,PI1,PF1,C),
	estadoMaquina(E,X,Y,Turno,PF1).

ehJogadaValidaMaquina2(D,E,[LB,LP,LD],Turno,X,PI,PF,C):-jogada(D,E,[LB,LP,LD],Turno,X,PI,PF),
jpl_call('javax.swing.JOptionPane',showMessageDialog,[@null,'A Maquina eh obrigada a comer'],_),write('C LASTZAO').


%predicado para que possa comer.
estado(0,Y,Y,Turno,_).
estado(1,Y,Y1,Turno,P):-comerC(C),aux(C,Y,Turno,Y1,P).
estadoMaquina(0,Y,Y,Turno,_).
estadoMaquina(1,Y,Y1,Turno,P):-comerCMaquina(C),aux(C,Y,Turno,Y1,P).

aux('y',[LB,LP,LD],Turno,Y,PI):-interface([LB,LP,LD]).
aux(_,Y,Turno,Y,P).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%  CALCULO DA JOGADA DO COMPUTADOR  %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	

chute(N,S):-repeat, S is random(N).            %jogada atual é aleatória
selecionaPF(1,PI1,PF1):- PF1 is PI1-7.
selecionaPF(2,PI1,PF1):- PF1 is PI1-9.
selecionaPF(3,PI1,PF1):- PF1 is PI1-18.
selecionaPF(4,PI1,PF1):- PF1 is PI1-14.
selecionaPF(5,PI1,PF1):- PF1 is PI1+7.
selecionaPF(6,PI1,PF1):- PF1 is PI1+9.
selecionaPF(7,PI1,PF1):- PF1 is PI1+18.
selecionaPF(8,PI1,PF1):- PF1 is PI1+14.

pick_nums(PI1,LP,AUX,PF1):-
	repeat, random_member(PI1,LP),chute(9,AUX),selecionaPF(AUX,PI1,PF1).



%LD_LIBRARY_PATH=/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/amd64/server:/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/amd64/ swipl


