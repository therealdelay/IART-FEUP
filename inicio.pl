iart

%base de conhecimento

%************
%* Autores **
%************
%autor(id, primeiro_nome, outros_nomes, data_nasc, data_mort, sexo, id_pais,n_premios, [heretonimos])

autor(1, 'Alexandre', 'Dumas', 1802, 1870, m, 9, 1, []).
autor(2, 'Alexandre', 'Dumas', 1824, 1895, m, 9, 1, []).
autor(3, 'Arthur', 'Clarke', 1917, 2008, m, 15, 1, []).
autor(4, 'Camilo', 'Castelo Branco', 1825, 1890, m, 1, 1, []).
autor(5, 'Charlotte', 'Bronte', 1816, 1855, f, 10, 1, []).
autor(6, 'Eca', 'de Queiroz', 1845, 1900, m, 1, 1, []).
autor(7, 'Eiichirou', 'Oda', 1975, -1, m, 13, 1, []).
autor(8, 'Emily', 'Brontë', 1818, 1848, f, 10, 1, []).
autor(9, 'Yuusei', 'Matsui', 1979, -1, m, 13, 1, []).
autor(10, 'Ernest', 'Hemingway', 1899, 1961, m, 15, 1, []).
autor(11, 'Fernando', 'Pessoa', 1888, 1935, m, 1, 1, []).
autor(12, 'Fiodor', 'Dostoiévski', 1821, 1881, m, 15, 1, []).
autor(13, 'Friedrich', 'Nietzsche', 1844, 1900, m, 11, 1, []).
autor(14, 'Gabriel', 'Garcia Marquez', 1927, 2014, m, 7, 1, []).
autor(15, 'Haruki', 'Murakami', 1949, -1, m, 13, 1, []).
autor(16, 'Hiroshi ', 'Fujimoto', 1933, 1996, m, 13, 1, []).
autor(17, 'Isabel', 'Allende', 1942, -1, f, 6, 1, []).
autor(18, 'Jane', 'Austen', 1775, 1817, f, 10, 1, []).
autor(19, 'Julio', 'Dinis', 1839, 1871, m, 1, 1, []).
autor(20, 'Kiyohiko', 'Azuma', 1968, -1, m, 13, 1, []).
autor(21, 'Leo', 'Tolstoi', 1828, 1910, m, 15, 1, []).
autor(22, 'Luis', 'de Camões', 1524, 1580, m, 1, 1, []).
autor(23, 'Mark', 'Twain', 1835, 1910, m, 15, 1, []).
autor(24, 'Mia', 'Couto', 1955, -1, m, 14, 1, []).
autor(25, 'Motou', 'Abiko', 1934, -1, m, 13, 1, []).
autor(26, 'Oscar', 'Wilde', 1864, 1900, m, 12, 1, []).
autor(27, 'Vergilio', 'Ferreira', 1916, 1996, m, 1, 1, []).
autor(28, 'William', 'Shakespeare', 1564, 1616, m, 10, 1, []).

%***********
%* Livros **
%**********/
%livro(id, titulo, [autor_ids], ano_pub, [generos_ids]) %mais tarde meter editora

livro(1, 'A Casa dos Espiritos', [17], 1982, [12]).
livro(2, 'A Cidade e as Estrelas', [3], 1956, [5]).
livro(3, 'A Dama das Camelias', [2], 1848, [12]).
livro(4, 'Adeus As Armas', [10], 1929, [12]).
livro(5, 'Agostinho de Ceuta', [4], 1847, [19]).
livro(6, 'A Ilustre Casa de Ramires', [6], 1900, [12]).
livro(7, 'A Mensagem', [11], 1934, [9]).
livro(8, 'Amor de Perdicao', [4], 1862, [12]).
livro(9, 'Amor de Salvacao', [4], 1864, [12]).
livro(10, 'A Morgadinha dos Canaviais', [19], 1868, [12]).
livro(11, 'A Morte de Ivan Ilitch', [21], 1886, [12]).
livro(12, 'Anfitrioes', [22], 1587, [19]).
livro(13, 'Anna Karenina', [21], 1877, [12]).
livro(14, 'Ansatsu Kyoushitsu', [9], 2012, [14]).
livro(15, 'Aparicao', [27], 1959, [12]).
livro(16, 'A Reliquia', [6], 1887, [12]).
livro(17, 'A Tempestade', [28], 1611, [4]).
livro(18, 'A Sonata Kreutzer', [21], 1889, [12]).
livro(19, 'A Wild Sheep Chase', [15], 1982, [12]).
livro(20, 'As Pupilas do Senhor Reitor', [19], 1867, [12]).
livro(21, 'Auto de Filodemo', [22], 1587, [19]).
livro(22, 'Azu14 Daioh', [20], 1999, [14]).
livro(23, 'Cem Anos de Solidao', [14], 1967, [12]).
livro(24, 'Crime e Castigo', [12], 1866, [12]).
livro(25, 'Cronicando', [24], 1988, [18]).
livro(26, 'Doraemon', [16], 1969, [14]).
livro(27, 'Emma', [18], 1815, [12]).
livro(28, 'Estorias Abensonhadas', [24], 1994, [15]).
livro(29, 'Estrela Polar', [27], 1960, [15]).
livro(30, 'Estrelas Funestas', [4], 1862, [12]).
livro(31, 'Estrelas Propícias', [4], 1863, [12]).
livro(32, 'Hamlet', [28], 1601, [13]).
livro(33, 'Henrique VIII', [28], 1612, [17]).
livro(34, 'Humilhados e Ofendidos', [12], 1861, [12]).
livro(35, 'Inspiracoes', [4], 1851, [9]).
livro(36, 'Jane Eyre', [5], 1847, [12]).
livro(37, 'Lagrimas Abencoadas', [4], 1857, [12]).
livro(38, 'Livro Negro de Padre Dinis - I', [4], 1855, [12]).
livro(39, 'Livro Negro de Padre Dinis - II', [4], 1855, [12]).
livro(40, 'Macbeth', [28], 1607, [13]).
livro(41, 'Manha Submersa', [27], 1953, [12]).
livro(42, 'Mar Me Quer', [24], 1998, [12]).
livro(43, 'Memorias do Subsolo', [12], 1864, [12]).
livro(44, 'Misterios de Lisboa - I', [4], 1854, [12]).
livro(45, 'Misterios de Lisboa - II', [4], 1854, [12]).
livro(46, 'Misterios de Lisboa - III', [4], 1854, [12]).
livro(47, 'Mudanca', [27], 1949, [12]).
livro(48, 'Ninja Hattori', [25], 1964, [14]).
livro(49, 'Nowegian Wood', [15], 1987, [12]).
livro(50, 'O Acampamento Indio', [10], 1926, [15]).
livro(51, 'O Adolescente', [12], 1875, [12]).
livro(52, 'O Amor nos Tempos de Colera', [14], 1985, [12]).
livro(53, 'O Conde de Monte Cristo', [1], 1844, [12]).
livro(54, 'O Crime do Padro Amaro', [6], 1875, [12]).
livro(55, 'O Duplo', [12], 1846, [12]).
livro(56, 'O Eterno Marido', [12], 1870, [12]).
livro(57, 'O Idiota', [12], 1869, [12]).
livro(58, 'O Jogador', [12], 1867, [12]).
livro(59, 'Vozes Anoitecidas', [24], 1986, [15]).
livro(60, 'O Mandarim', [6], 1880, novela).
livro(61, 'O Mercador de Veneza', [28], 1598, [4]).
livro(62, 'O Monte dos Vendavais', [8], 1847, [12]).
livro(63, 'O Nascimento da 13', [13], 1872, [16]).
livro(64, 'O Outono do Patriarca', [14], 1975, [12]).
livro(65, 'O Primo Basilio', [6], 1878, [12]).
livro(66, 'Orgulho e Preconceito', [18], 1813, [12]).
livro(67, 'Os Fidalgos da Casa Mourisca', [19], 1871, [12]).
livro(68, 'Os Irmaos Karamazov', [12], 1880, [12]).
livro(69, 'Os Lusiadas', [22], 1572, [9]).
livro(70, 'Os Maias', [6], 1888, [12]).
livro(71, 'Os Nove Bilioes de Nomes de Deus', [3], 1967, [15]).
livro(72, 'Os Pundonores Desagravados', [4], 1845, [9]).
livro(73, 'Os Tres Mosqueteiros', [1], 1844, [12]).
livro(74, 'One Piece', [7], 1997, [14]).
livro(75, 'Otelo', [28], 1603, [13]).
livro(76, 'O Visconde de Bragelonne', [1], 1847, [12]).
livro(77, 'Pensageiro Frequente', [24], 2010, [12]).
livro(78, '9s', [19], 1873, [9]).
livro(79, 'Por Quem Os Sinos Tocam', [10], 1940, [12]).
livro(80, 'Razao e Sensibilidade', [18], 1811, [12]).
livro(81, 'Rei Leao', [28], 1605, [13]).
livro(82, 'Romeu e Julieta', [28], 1595, [13]).
livro(83, 'Sonho de uma Noite de Verão', [28], 1596, [4]).
livro(84, 'Terra Sonâmbula', [24], 1992, [12]).
livro(85, 'Uma Família Inglesa', [19], 1868, [12]).
livro(86, 'Vinte Anos Depois', [1], 1845, [12]).

%************
%* Generos **
%***********/
%genero(id, nome)

genero(1,'terror').
genero(2,'acao').
genero(3,'thriller').
genero(4,'comedia').
genero(5,'scify').
genero(6,'suspanse').
genero(7,'policial').
genero(8,'aventura').
genero(9,'poesia').
genero(10,'novela').
genero(11,'bd').
genero(12,'romance').
genero(13,'tragedia').
genero(14,'manga').
genero(15,'conto').
genero(16,'tratado').
genero(17,'drama').
genero(18,'cronica').
genero(19,'teatro').

%***********
%* Paises **
%**********/
%pais(id, nome, continente, nacionalidade_fem, nacionalidade_masc)

pais(1, 'Portugal', europa, 'português', 'portuguesa').
pais(2, 'Angola', africa, 'angolano', 'angolana').
pais(3, 'Austria', europa, 'austríaco', 'austríaca').
pais(4, 'Bélgica', europa, 'belga', 'belga').
pais(5, 'Brasil', america, 'brasileiro', 'brasileira').
pais(6, 'Chile', america, 'chileno', 'chilena').
pais(7, 'Colômbia', america, 'colombiano', 'colombiana').
pais(8, 'Espanha', europa, 'espanhol', 'espanhola').
pais(9, 'França', europa, 'francês', 'francesa').
pais(10, 'Reino Unido', europa, 'inglês', 'inglesa').
pais(11, 'Alemanha',  europa, 'alemão', 'alemã').
pais(12, 'Irlanda', europa, 'irlandês', 'irlandesa').
pais(13, 'Japão', asia, 'japonês', 'japonesa').
pais(14, 'Moçambique', africa, 'moçambicano', 'moçambicana').
pais(15, 'Rússia', europa, 'russo', 'russa').
pais(16, 'Estados Unidos', america, 'americano', 'americana').



%***********
%* Lexico **
%***********

% consult(['~/Desktop/feup-iart-master/proj1/server/lexico.pl']).

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

preposicao(s-m) --> [ao].
% preposicao(s-f) --> [à].
preposicao(p-m) --> [aos].
% preposicao(p-f) --> [às].
preposicao(_-_) --> [de].
preposicao(s-m) --> [do].
preposicao(s-f) --> [da].
preposicao(p-m) --> [dos].
preposicao(p-f) --> [das].

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

pron_int(p-m, qn) --> [quantos].
pron_int(p-f, qn) --> [quantas].

pron_rel(_-_) --> [que].

adjetivo(s-_, recente) --> [recente].
adjetivo(p-_, recente) --> [recentes].

adjetivo(s-m, antigo) --> [antigo].
adjetivo(s-f, antigo) --> [antiga].
adjetivo(p-m, antigo) --> [antigos].
adjetivo(p-f, antigo) --> [antigas].

adjetivo_super(mais) --> [mais].
adjetivo_super(menos) --> [menos].

adj_comp(mais, recente, maisrecente).
adj_comp(menos, recente, menosrecente).
adj_comp(mais,antigo, maisantigo).
adj_comp(menos,atigo, menosantigo).
adj_comp(_,Adj,Adj).

adverbio(inclusao) --> [ainda].
adverbio(inclusao) --> [ate].
adverbio(inclusao) --> [tambem].

adverbio(antes) --> [antes].
adverbio(depois) --> [depois].

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
% antivos: Autores                                   %
%---------------------------------------------------------%

subst(s-m, autor) --> [autor].
subst(s-f, autor) --> [autora].
subst(p-m, autor) --> [autores].
subst(p-f, autor) --> [autoras].

subst(s-m, autor) --> [escritor].
subst(s-f, autor) --> [escritora].
subst(p-m, autor) --> [escritores].
subst(p-f, autor) --> [escritoras].

%---------------------------------------------------------%
% Substantivos: Colecções                                 %
%---------------------------------------------------------%

subst(s-m, colecao) --> [colecao].
subst(p-m, colecao) --> [colecoes].
subst(s-f, colecao) --> [saga].
subst(p-f, colecao) --> [sagas].
subst(s-f, colecao) --> [trilogia].
subst(p-f, colecao) --> [trilogias].
subst(s-m, colecao) --> [volume].
subst(p-m, colecao) --> [volumes].

%---------------------------------------------------------%
% Substantivos: Pseudónimos                               %
%---------------------------------------------------------%

subst(s-_, pseudonimo) --> [criptonimos].
subst(p-_, pseudonimo) --> [criptonimoss].
subst(s-_, pseudonimo) --> [heteronimo].
subst(p-_, pseudonimo) --> [heteronimos].
subst(s-_, pseudonimo) --> [ortonimo].
subst(p-_, pseudonimo) --> [ortonimos].
subst(s-_, pseudonimo) --> [pseudonimo].
subst(p-_, pseudonimo) --> [pseudonimos].

subst(s-_, morte) --> [morte].
subst(s-_, morte) --> [falecimento].
subst(s-_, nascimento) --> [nascimento].

subst(s-m, ano) --> [ano].
subst(p-m, ano) --> [anos].

subst(s-m, seculo) --> [seculo].
subst(p-m, seculo) --> [seculos].

subst(s-m, idioma) --> [idioma].
subst(p-m, idioma) --> [idiomas].
subst(s-f, idioma) --> [lingua].
subst(p-f, idioma) --> [linguas].

subst(s-f, nacionalidade) --> [nacionalidade].
subst(p-f, nacionalidade) --> [nacionalidades].

subst(s-f, idade) --> [idade].
subst(p-f, idade) --> [idades].

%---------------------------------------------------------%
% Substantivos: Géneros                                   %
%---------------------------------------------------------%

subst_gen(livro,s-m) --> [livro].
subst_gen(livro,p-m) --> [livros].

subst_gen(obra,s-f) --> [obra].
subst_gen(obra,p-f) --> [obras].

subst_gen(comedia, s-f) --> [comedia].
subst_gen(comedia, p-f) --> [comedias].

subst_gen(cronica, s-f) --> [cronica].
subst_gen(cronica, p-f) --> [cronicas].

subst_gen(conto, s-m) --> [conto].
subst_gen(conto, p-m) --> [contos].

subst_gen(drama, s-m) --> [drama].
subst_gen(drama, p-m) --> [dramas].

subst_gen(ficcao-cientifica, s-m) --> [ficcao-cientifica].
subst_gen(ficcao-cientifica, p-m) --> [ficcoes-cientificas].

subst_gen(manga, s-m) --> [manga].
subst_gen(manga, p-m) --> [mangas].

subst_gen(poesia, s-f) --> [poesia].
subst_gen(poesia, p-f) --> [poesias].

subst_gen(prosa, s-f) --> [prosa].
subst_gen(prosa, p-f) --> [prosa].

subst_gen(romance, s-m) --> [romance].
subst_gen(romance, p-m) --> [romances].

subst_gen(teatro, s-m) --> [teatro].
subst_gen(teatro, p-m) --> [teatros].

subst_gen(tragedia, s-f) --> [tragedia].
subst_gen(tragedia, p-f) --> [tragedias].

%---------------------------------------------------------%
% Substantivos: Nacionalidades                            %
%---------------------------------------------------------%

subst_nac(ger, s-m) --> [alemao].
subst_nac(ger, s-f) --> [alema].
subst_nac(ger, p-m) --> [alemaes].
subst_nac(ger, p-f) --> [alemas].

subst_nac(chi, s-m) --> [chileno].
subst_nac(chi, s-f) --> [chilena].
subst_nac(chi, p-m) --> [chilenos].
subst_nac(chi, p-f) --> [chilenas].

subst_nac(col, s-m) --> [colombiano].
subst_nac(col, s-f) --> [colombiana].
subst_nac(col, p-m) --> [colombianos].
subst_nac(col, p-f) --> [colombianas].

subst_nac(esp, s-m) --> [espanhol].
subst_nac(esp, s-f) --> [espanhola].
subst_nac(esp, p-m) --> [espanhois].
subst_nac(esp, p-f) --> [espanholas].

subst_nac(fra, s-m) --> [frances].
subst_nac(fra, s-f) --> [francesa].
subst_nac(fra, p-m) --> [franceses].
subst_nac(fra, p-f) --> [francesas].

subst_nac(gbr, s-m) --> [ingles].
subst_nac(gbr, s-f) --> [inglesa].
subst_nac(gbr, p-m) --> [ingleses].
subst_nac(gbr, p-f) --> [inglesas].

subst_nac(ind, s-m) --> [indiano].
subst_nac(ind, s-f) --> [indiana].
subst_nac(ind, p-m) --> [indianos].
subst_nac(ind, p-f) --> [indianas].

subst_nac(ire, s-m) --> [irlandes].
subst_nac(ire, s-f) --> [irlandesa].
subst_nac(ire, p-m) --> [irlandeses].
subst_nac(ire, p-f) --> [irlandesas].

subst_nac(jpn, s-m) --> [japones].
subst_nac(jpn, s-f) --> [japonesa].
subst_nac(jpn, p-m) --> [japoneses].
subst_nac(jpn, p-f) --> [japonesas].

subst_nac(moz, s-m) --> [mocambicano].
subst_nac(moz, s-f) --> [mocambicana].
subst_nac(moz, p-m) --> [mocambicanos].
subst_nac(moz, p-f) --> [mocambicanas].

subst_nac(por, s-m) --> [portugues].
subst_nac(por, s-f) --> [portuguesa].
subst_nac(por, p-m) --> [portugueses].
subst_nac(por, p-f) --> [portuguesas].

subst_nac(rus, s-m) --> [russo].
subst_nac(rus, s-f) --> [russa].
subst_nac(rus, p-m) --> [russos].
subst_nac(rus, p-f) --> [russas].

subst_nac(usa, s-m) --> [americano].
subst_nac(usa, s-f) --> [americana].
subst_nac(usa, p-m) --> [americanos].
subst_nac(usa, p-f) --> [americanas].

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
% Substantivos: Idiomas                                   %
%---------------------------------------------------------%

subst_idi(alemao, s-m) --> [alemao].
subst_idi(alemao, s-f) --> [alema].

subst_idi(espanhol, s-m) --> [espahol].
subst_idi(espanhol, s-f) --> [espanhola].

subst_idi(frances, s-m) --> [frances].
subst_idi(frances, s-f) --> [francesa].

subst_idi(ingles, s-m) --> [ingles].
subst_idi(ingles, s-f) --> [inglesa].

subst_idi(japones, s-m) --> [japones].
subst_idi(japones, s-f) --> [japonesa].

subst_idi(russo, s-m) --> [russo].
subst_idi(russo, s-f) --> [russa].

%---------------------------------------------------------%
% Substantivos: Continentes                               %
%---------------------------------------------------------%

subst_cont(s-m, africa) --> [africano].
subst_cont(s-f, africa) --> [africana].
subst_cont(p-m, africa) --> [africanos].
subst_cont(p-f, africa) --> [africanas].

subst_cont(s-m, asia) --> [asiatico].
subst_cont(s-f, asia) --> [asiatica].
subst_cont(p-m, asia) --> [asiaticos].
subst_cont(p-f, asia) --> [asiaticas].

subst_cont(s-m, europa) --> [europeu].
subst_cont(s-f, europa) --> [europeia].
subst_cont(p-m, europa) --> [europeus].
subst_cont(p-f, europa) --> [europeias].

subst_cont(s-m, america_norte) --> [norte-americano].
subst_cont(s-f, america_norte) --> [norte-americana].
subst_cont(p-m, america_norte) --> [norte-americanos].
subst_cont(p-f, america_norte) --> [norte-americanas].

subst_cont(s-m, america_sul) --> [sul-americano].
subst_cont(s-f, america_sul) --> [sul-americana].
subst_cont(p-m, america_sul) --> [sul-americanos].
subst_cont(p-f, america_sul) --> [sul-americanas].

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

verbo_passiva(s-m, morrer) --> [falecido].
verbo_passiva(s-f, morrer) --> [falecida].
verbo_passiva(p-m, morrer) --> [falecidos].
verbo_passiva(p-f, morrer) --> [falecidas].

verbo_passiva(s-m, viver) --> [vivo].
verbo_passiva(p-m, viver) --> [vivos].
verbo_passiva(s-f, viver) --> [viva].
verbo_passiva(p-f, viver) --> [vivas].

verbo_passiva(s-f, morrer) --> [morta].
verbo_passiva(p-f, morrer) --> [mortas].
verbo_passiva(s-m, morrer) --> [morto].
verbo_passiva(p-m, morrer) --> [mortos].