%***********
%* Lexico **
%***********

% consult(lexico.pl']).

seculo('I', 1).
seculo('II', 2).
seculo('III', 3).
seculo('IV', 4).
seculo('V', 5).
seculo('VI', 6).
seculo('VII', 7).
seculo('VIII', 8).
seculo('IX', 9).
seculo('X', 10).
seculo('XI', 11).
seculo('XII', 12).
seculo('XIII', 13).
seculo('XIV', 14).
seculo('XV', 15).
seculo('XVI', 16).
seculo('XVII', 17).
seculo('XVIII', 18).
seculo('XIX', 19).
seculo('XX', 20).
seculo('XXI', 21).

seculo_lim('XXI', 2001, 2100).
seculo_lim('XX', 1901,2000).
seculo_lim('XIX', 1801, 1900).
seculo_lim('XVIII', 1701, 1800).
seculo_lim('XVII', 1601, 1700).
seculo_lim('XVI', 1501, 1600).
seculo_lim('XV', 1401, 1500).
seculo_lim('XIV', 1301, 1400).
seculo_lim('XIII', 1201, 1300).
seculo_lim('XII', 1101, 1200).
seculo_lim('XI', 1001, 1100).
seculo_lim('XX', 901, 1000).
seculo_lim('IX', 801, 900).
seculo_lim('VIII', 701, 800).
seculo_lim('VII', 601, 700).
seculo_lim('VI', 501, 600).
seculo_lim('V', 401, 500).
seculo_lim('IV', 301, 400).
seculo_lim('III', 201, 300).
seculo_lim('II', 101, 200).
seculo_lim('I', 1, 100).

numero_ordinal(s-m, 1) --> [primeiro].
numero_ordinal(s-f, 1) --> [primeira].
numero_ordinal(p-m, 1) --> [primeiros].
numero_ordinal(p-f, 1) --> [primeiras].

numero_ordinal(s-m, 2) --> [segundo].
numero_ordinal(s-f, 2) --> [segunda].
numero_ordinal(p-m, 2) --> [segundos].
numero_ordinal(p-f, 2) --> [segundas].

numero_ordinal(s-m, 3) --> [terceiro].
numero_ordinal(s-f, 3) --> [terceira].
numero_ordinal(p-m, 3) --> [terceiros].
numero_ordinal(p-f, 3) --> [terceiras].

numero_ordinal(s-m, -1) --> [ultimo].
numero_ordinal(s-f, -1) --> [ultima].
numero_ordinal(p-m, -1) --> [ultimos].
numero_ordinal(p-f, -1) --> [ultimas].

numero_ordinal(s-m, -2) --> [penultimo].
numero_ordinal(s-f, -2) --> [penultima].
numero_ordinal(p-m, -2) --> [penultimos].
numero_ordinal(p-f, -2) --> [penultimas].

%---------------------------------------------------------%
% Determinantes Artigos                                   %
%---------------------------------------------------------%

art_def(s-m) --> [o].
art_def(s-f) --> [a].
art_def(p-m) --> [os].
art_def(p-f) --> [as].

art_indef(s-m) --> [um].
art_indef(s-f) --> [uma].
art_indef(p-m) --> [uns].
art_indef(p-f) --> [umas].

%---------------------------------------------------------%
% Preposições                                             %
%---------------------------------------------------------%

% preposicao(s-m) --> [ao].
% preposicao(s-f) --> [à].
% preposicao(p-m) --> [aos].
% preposicao(p-f) --> [às].

preposicao(s-_,=) --> [de].
preposicao(s-m,=) --> [do].
preposicao(s-f,=) --> [da].
preposicao(p-m,=) --> [dos].
preposicao(p-f,=) --> [das].

preposicao(_-_,=) --> [em].
preposicao(s-m,=) --> [no].
preposicao(s-f,=) --> [na].
preposicao(p-m,=) --> [nos].
preposicao(p-f,=) --> [nas].

preposicao(_-_,>) --> [apos].
preposicao(_-_,<) --> [antes].

%---------------------------------------------------------%
% Pronomes Pessoais                                       %
%---------------------------------------------------------%

pronome_pessoal(s-m) --> [seu].
pronome_pessoal(s-f) --> [sua].
pronome_pessoal(p-m) --> [seus].
pronome_pessoal(p-f) --> [suas].

%---------------------------------------------------------%
% Pronomes Interrogativos                                 %
%---------------------------------------------------------%

pron_int(s-m, ql) --> [quem].
pron_int(s-f, ql) --> [qual].
pron_int(p-m, ql) --> [quais].
pron_int(p-m, qn) --> [quantos].
pron_int(p-f, qn) --> [quantas].

%---------------------------------------------------------%
% Adjetivos                                               %
%---------------------------------------------------------%

adjetivo(s-m, 1) --> ['I'].
adjetivo(s-m, 2) --> ['II'].
adjetivo(s-m, 3) --> ['III'].
adjetivo(s-m, 4) --> ['IV'].
adjetivo(s-m, 5) --> ['V'].
adjetivo(s-m, 6) --> ['VI'].
adjetivo(s-m, 7) --> ['VII'].
adjetivo(s-m, 8) --> ['VIII'].
adjetivo(s-m, 9) --> ['IX'].
adjetivo(s-m, 10) --> ['X'].
adjetivo(s-m, 11) --> ['XI'].
adjetivo(s-m, 12) --> ['XII'].
adjetivo(s-m, 13) --> ['XIII'].
adjetivo(s-m, 14) --> ['XIV'].
adjetivo(s-m, 15) --> ['XV'].
adjetivo(s-m, 16) --> ['XVI'].
adjetivo(s-m, 17) --> ['XVII'].
adjetivo(s-m, 18) --> ['XVIII'].
adjetivo(s-m, 19) --> ['XIX'].
adjetivo(s-m, 20) --> ['XX'].
adjetivo(s-m, 21) --> ['XXI'].

adjetivo(s-m, Nr) --> 
	{between(0,2050,Nr)},
	{atom_number(NrAtom,Nr)},
	[NrAtom].

adjetivo(s-_, recente) --> [recente].
adjetivo(p-_, recente) --> [recentes].

adjetivo(s-m, antigo) --> [antigo].
adjetivo(s-f, antigo) --> [antiga].
adjetivo(p-m, antigo) --> [antigos].
adjetivo(p-f, antigo) --> [antigas].

adjetivo(s-m, 11) --> [alemao].
adjetivo(s-f, 11) --> [alema].
adjetivo(p-m, 11) --> [alemaes].
adjetivo(p-f, 11) --> [alemas].

adjetivo(s-m, 6) --> [chileno].
adjetivo(s-f, 6) --> [chilena].
adjetivo(p-m, 6) --> [chilenos].
adjetivo(p-f, 6) --> [chilenas].

adjetivo(s-m, 7) --> [colombiano].
adjetivo(s-f, 7) --> [colombiana].
adjetivo(p-m, 7) --> [colombianos].
adjetivo(p-f, 7) --> [colombianas].

adjetivo(s-m, 8) --> [espanhol].
adjetivo(s-f, 8) --> [espanhola].
adjetivo(p-m, 8) --> [espanhois].
adjetivo(p-f, 8) --> [espanholas].

adjetivo(s-m, 9) --> [frances].
adjetivo(s-f, 9) --> [francesa].
adjetivo(p-m, 9) --> [franceses].
adjetivo(p-f, 9) --> [francesas].

adjetivo(s-m, 10) --> [ingles].
adjetivo(s-f, 10) --> [inglesa].
adjetivo(p-m, 10) --> [ingleses].
adjetivo(p-f, 10) --> [inglesas].

adjetivo(s-m, 17) --> [indiano].
adjetivo(s-f, 17) --> [indiana].
adjetivo(p-m, 17) --> [indianos].
adjetivo(p-f, 17) --> [indianas].

adjetivo(s-m, 12) --> [irlandes].
adjetivo(s-f, 12) --> [irlandesa].
adjetivo(p-m, 12) --> [irlandeses].
adjetivo(p-f, 12) --> [irlandesas].

adjetivo(s-m, 13) --> [japones].
adjetivo(s-f, 13) --> [japonesa].
adjetivo(p-m, 13) --> [japoneses].
adjetivo(p-f, 13) --> [japonesas].

adjetivo(s-m, 14) --> [mocambicano].
adjetivo(s-f, 14) --> [mocambicana].
adjetivo(p-m, 14) --> [mocambicanos].
adjetivo(p-f, 14) --> [mocambicanas].

adjetivo(s-m, 1) --> [portugues].
adjetivo(s-f, 1) --> [portuguesa].
adjetivo(p-m, 1) --> [portugueses].
adjetivo(p-f, 1) --> [portuguesas].

adjetivo(s-m, 15) --> [russo].
adjetivo(s-f, 15) --> [russa].
adjetivo(p-m, 15) --> [russos].
adjetivo(p-f, 15) --> [russas].

adjetivo(s-m, 16) --> [americano].
adjetivo(s-f, 16) --> [americana].
adjetivo(p-m, 16) --> [americanos].
adjetivo(p-f, 16) --> [americanas].

adjetivo(s-m, africa) --> [africano].
adjetivo(s-f, africa) --> [africana].
adjetivo(p-m, africa) --> [africanos].
adjetivo(p-f, africa) --> [africanas].

adjetivo(s-m, asia) --> [asiatico].
adjetivo(s-f, asia) --> [asiatica].
adjetivo(p-m, asia) --> [asiaticos].
adjetivo(p-f, asia) --> [asiaticas].

adjetivo(s-m, europa) --> [europeu].
adjetivo(s-f, europa) --> [europeia].
adjetivo(p-m, europa) --> [europeus].
adjetivo(p-f, europa) --> [europeias].

adjetivo(s-m, america) --> [americano].
adjetivo(s-f, america) --> [americana].
adjetivo(p-m, america) --> [americanos].
adjetivo(p-f, america) --> [americanas].

adjetivo(s-m, vivo) --> [vivo].
adjetivo(p-m, vivo) --> [vivos].
adjetivo(s-f, vivo) --> [viva].
adjetivo(p-f, vivo) --> [vivas].

adjetivo(s-m, morto) --> [falecido].
adjetivo(s-f, morto) --> [falecida].
adjetivo(p-m, morto) --> [falecidos].
adjetivo(p-f, morto) --> [falecidas].

adjetivo(s-f, morto) --> [morta].
adjetivo(p-f, morto) --> [mortas].
adjetivo(s-m, morto) --> [morto].
adjetivo(p-m, morto) --> [mortos].

adj_comp(mais, recente, maisrecente).
adj_comp(menos, recente, menosrecente).
adj_comp(mais,antigo, maisantigo).
adj_comp(menos,atigo, menosantigo).
adj_comp(_,Adj,Adj).

adverbio(mais) --> [mais].
adverbio(menos) --> [menos].

adverbio(depois) --> [depois].

adverbio(inclusao) --> [ainda].
adverbio(inclusao) --> [ate].
adverbio(inclusao) --> [tambem].

adverbio(s-f, antes) --> [antes].

adverbio(s-m, algum) --> [algum].
adverbio(s-f, algum) --> [alguma].
adverbio(p-m, algum) --> [alguns].
adverbio(p-f, algum) --> [algumas].

adverbio(s-m, muito) --> [muito].
adverbio(s-f, muito) --> [muita].
adverbio(p-m, muito) --> [muitos].
adverbio(p-f, muito) --> [muitas].

adverbio(s-m, pouco) --> [pouco].
adverbio(s-f, pouco) --> [pouca].
adverbio(p-m, pouco) --> [poucos].
adverbio(p-f, pouco) --> [poucas].

%---------------------------------------------------------%
% antivos: Autores                                        %
%---------------------------------------------------------%

nome(s-m, autor) --> [autor].
nome(s-f, autor) --> [autora].
nome(p-m, autor) --> [autores].
nome(p-f, autor) --> [autoras].

nome(s-m, autor) --> [escritor].
nome(s-f, autor) --> [escritora].
nome(p-m, autor) --> [escritores].
nome(p-f, autor) --> [escritoras].

%---------------------------------------------------------%
% Substantivos: Colecções                                 %
%---------------------------------------------------------%

nome(s-m, colecao) --> [colecao].
nome(p-m, colecao) --> [colecoes].
nome(s-f, colecao) --> [saga].
nome(p-f, colecao) --> [sagas].
nome(s-f, colecao) --> [trilogia].
nome(p-f, colecao) --> [trilogias].
nome(s-m, colecao) --> [volume].
nome(p-m, colecao) --> [volumes].

%---------------------------------------------------------%
% Substantivos: Pseudónimos                               %
%---------------------------------------------------------%

nome(s-_, pseudonimo) --> [criptonimos].
nome(p-_, pseudonimo) --> [criptonimoss].
nome(s-_, pseudonimo) --> [heteronimo].
nome(p-_, pseudonimo) --> [heteronimos].
nome(s-_, pseudonimo) --> [ortonimo].
nome(p-_, pseudonimo) --> [ortonimos].
nome(s-_, pseudonimo) --> [pseudonimo].
nome(p-_, pseudonimo) --> [pseudonimos].

nome(s-_, morte) --> [morte].
nome(s-_, morte) --> [falecimento].
nome(s-_, nascimento) --> [nascimento].

nome(s-m, ano) --> [ano].
nome(p-m, ano) --> [anos].

nome(s-m, seculo) --> [seculo].
nome(p-m, seculo) --> [seculos].

nome(s-m, idioma) --> [idioma].
nome(p-m, idioma) --> [idiomas].
nome(s-f, idioma) --> [lingua].
nome(p-f, idioma) --> [linguas].

nome(s-f, nacionalidade) --> [nacionalidade].
nome(p-f, nacionalidade) --> [nacionalidades].

nome(s-f, idade) --> [idade].
nome(p-f, idade) --> [idades].

%---------------------------------------------------------%
% Substantivos: Géneros                                   %
%---------------------------------------------------------%

nome(s-m, livro) --> [livro].
nome(p-m, livro) --> [livros].

nome(s-f, obra) --> [obra].
nome(p-f, obra) --> [obras].

nome(s-f, comedia) --> [comedia].
nome(p-f, comedia) --> [comedias].

nome(s-f, cronica) --> [cronica].
nome(p-f, cronica) --> [cronicas].

nome(s-m, conto) --> [conto].
nome(p-m, conto) --> [contos].

nome(s-m, drama) --> [drama].
nome(p-m, drama) --> [dramas].

nome(s-m, sci-fi) --> [ficcao-cientifica].
nome(s-m, sci-fi) --> [ficcoes-cientificas].

nome(s-m, manga) --> [manga].
nome(p-m, manga) --> [mangas].

nome(s-f, poesia) --> [poesia].
nome(p-f, poesia) --> [poesias].

nome(s-f, prosa) --> [prosa].
nome(p-f, prosa) --> [prosa].

nome(s-m, romance) --> [romance].
nome(p-m, romance) --> [romances].

nome(s-m, teatro) --> [teatro].
nome(p-m, teatro) --> [teatros].

nome(s-f, tragedia) --> [tragedia].
nome(p-f, tragedia) --> [tragedias].

nome(_-_, Nr) -->
	{between(0,2050,Nr)},
	{atom_number(NrAtom,Nr)},
	[NrAtom].

%---------------------------------------------------------%
% Substantivos: Nacionalidades                            %
%---------------------------------------------------------%

nac_to_cont(ger, europa).
nac_to_cont(chi, america_sul).
nac_to_cont(col, america_sul).
nac_to_cont(esp, espanha).
nac_to_cont(fra, europa).
nac_to_cont(gbr, europa).
nac_to_cont(ind, asia).
nac_to_cont(ire, europa).
nac_to_cont(jpn, asia).
nac_to_cont(moz, africa).
nac_to_cont(por, europa).
nac_to_cont(rus, europa).
nac_to_cont(usa, america_norte).

%---------------------------------------------------------%
% Substantivos: Continentes                               %
%---------------------------------------------------------%

nome_cont(s-m, africa) --> [africano].
nome_cont(s-f, africa) --> [africana].
nome_cont(p-m, africa) --> [africanos].
nome_cont(p-f, africa) --> [africanas].

nome_cont(s-m, asia) --> [asiatico].
nome_cont(s-f, asia) --> [asiatica].
nome_cont(p-m, asia) --> [asiaticos].
nome_cont(p-f, asia) --> [asiaticas].

nome_cont(s-m, europa) --> [europeu].
nome_cont(s-f, europa) --> [europeia].
nome_cont(p-m, europa) --> [europeus].
nome_cont(p-f, europa) --> [europeias].

nome_cont(s-m, america_norte) --> [norte-americano].
nome_cont(s-f, america_norte) --> [norte-americana].
nome_cont(p-m, america_norte) --> [norte-americanos].
nome_cont(p-f, america_norte) --> [norte-americanas].

nome_cont(s-m, america_sul) --> [sul-americano].
nome_cont(s-f, america_sul) --> [sul-americana].
nome_cont(p-m, america_sul) --> [sul-americanos].
nome_cont(p-f, america_sul) --> [sul-americanas].

%---------------------------------------------------------%
% Verbos: Presente                                        %
%---------------------------------------------------------%

verbo(s, ser, presente) --> [e].
verbo(p, ser, presente) --> [sao].

verbo(s, viver, presente) --> [vive].
verbo(p, viver, presente) --> [vivem].

verbo(s, estar, presente) --> [esta].
verbo(p, estar, presente) --> [estao].

verbo(s, existir, presente) --> [existe].
verbo(p, existir, presente) --> [existem].

%---------------------------------------------------------%
% Verbos: Pretérito Perfeito / Pretérito Imperfeito       %
%---------------------------------------------------------%

verbo(p, ser, passado) --> [era].
verbo(s, ser, passado) --> [eram].
verbo(s, ser, passado) --> [foi].
verbo(p, ser, passado) --> [foram].

verbo(s, viver, passado) --> [viveu].
verbo(p, viver, passado) --> [viveram].
verbo(s, viver, passado) --> [vivia].
verbo(p, viver, passado) --> [viviam].

verbo(s, escrever, passado) --> [escreveu].
verbo(p, escrever, passado) --> [escreveram].
verbo(s, escrever, passado) --> [publicou].
verbo(p, escrever, passado) --> [publicaram].
verbo(s, escrever, passado) --> [redigiu].
verbo(p, escrever, passado) --> [redigiram].

verbo(s, morrer, passado) --> [morreu].
verbo(p, morrer, passado) --> [morreram].
verbo(s, morrer, passado) --> [faleceu].
verbo(p, morrer, passado) --> [faleceram].

verbo(s, nascer, passado) --> [nasceu].
verbo(s, nascer, passado) --> [nascia].
verbo(p, nascer, passado) --> [nasceram].
verbo(p, nascer, passado) --> [nasciam].

%---------------------------------------------------------%
% Verbos: Particípio Passado                              %
%---------------------------------------------------------%

verbo_passiva(s-m, escrever) --> [escrito].
verbo_passiva(s-f, escrever) --> [escrita].
verbo_passiva(p-m, escrever) --> [escritos].
verbo_passiva(p-f, escrever) --> [escritas].

verbo_passiva(s-m, escrever) --> [publicado].
verbo_passiva(s-f, escrever) --> [publicada].
verbo_passiva(p-m, escrever) --> [publicados].
verbo_passiva(s-f, escrever) --> [publicadas].

verbo_passiva(s-m, escrever) --> [redigido].
verbo_passiva(s-f, escrever) --> [redigida].
verbo_passiva(p-m, escrever) --> [redigidos].
verbo_passiva(p-f, escrever) --> [redigidas].

verbo_passiva(s-m, nascer) --> [nascido].
verbo_passiva(s-f, nascer) --> [nascida].
verbo_passiva(p-m, nascer) --> [nascidos].
verbo_passiva(p-f, nascer) --> [nascidas].