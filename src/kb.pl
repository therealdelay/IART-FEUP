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
autor(11, 'Fernando', 'Pessoa', 1888, 1935, m, 1, 1, ['Alberto Caeiro']).
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
%************

%genero(id, nome)
genero(1,'terror').
genero(2,'acao').
genero(3,'thriller').
genero(4,'comedia').
genero(5,'sci-fi').
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

pais(1, 'portugal', 'europa', 'português', 'portuguesa').
pais(2, 'angola', 'africa', 'angolano', 'angolana').
pais(3, 'austria', 'europa', 'austríaco', 'austríaca').
pais(4, 'belgica', 'europa', 'belga', 'belga').
pais(5, 'brasil', 'america', 'brasileiro', 'brasileira').
pais(6, 'chile', 'america', 'chileno', 'chilena').
pais(7, 'colombia', 'america', 'colombiano', 'colombiana').
pais(8, 'espanha', 'europa', 'espanhol', 'espanhola').
pais(9, 'frança', 'europa', 'francês', 'francesa').
pais(10, 'reino unido', 'europa', 'inglês', 'inglesa').
pais(11, 'alemanha',  'europa', 'alemão', 'alemã').
pais(12, 'irlanda', 'europa', 'irlandês', 'irlandesa').
pais(13, 'japao', 'asia', 'japonês', 'japonesa').
pais(14, 'mocambique', 'africa', 'moçambicano', 'moçambicana').
pais(15, 'russia', 'europa', 'russo', 'russa').
pais(16, 'estados unidos', 'america', 'americano', 'americana').
pais(17, 'india', 'asia', 'indiano', 'indiana').

%ser(Suj,Ob,Adv,Adjs,Prep,Ob2):-

%---------------------------------------------------------%
% Acoes                                                   %
%---------------------------------------------------------%

ser(Suj,pseudonimo,_,_,_,Ob2):-
	write(Suj),nl, write(Ob2),nl,
	Suj == Ob2.

escrever(Suj,Ob,_,_,_,_):-
	livro(LivroId,Ob,_,_,_),
	LivroId == Suj.
	
nascer(Suj,_,_,_,=,Ob2):-
	autor(Suj,_,_,Nascimento,_,_,_,_,_),
	Nascimento == Ob2.
	
morrer(Suj,_,_,_,=,Ob2):-
	autor(Suj,_,_,_,Morte,_,_,_,_),
	Morte == Ob2.