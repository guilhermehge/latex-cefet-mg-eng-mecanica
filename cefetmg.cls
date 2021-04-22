% -----------------------------------------------------------------------------
%       Centro Federal de Educação Tecnológica de Minas Gerais - CEFET-MG
%
%   Modelo de trabalho acadêmico monográfico de acordo com as normas da ABNT
%   (Tese de Doutorado, Dissertação de Mestrado ou Projeto de Qualificação)
%
%     Projeto hospedado em: https://github.com/cfgnunes/latex-cefetmg
%
%    Autores: Cristiano Fraga G. Nunes <cfgnunes@gmail.com>
%             Henrique E. Borges <henrique@lsi.cefetmg.br>
%             Denise de Souza <densouza@gmail.com>
%             Lauro César <https://code.google.com/p/abntex2/>
%
% -----------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cefetmg}[2016/12/25 v6.1]

% Repassa os parâmetros ao abntex2
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abntex2}}

\PassOptionsToClass{%
% Opções da classe memoir
    12pt,                     % Tamanho da fonte
    openright,                % Capítulos começam sempre em páginas ímpares (insere página vazia caso necessário)
    a4paper,                  % Tamanho do papel.
    sumario=tradicional,      % Seleciona o sumário tradicional
% Opções do pacote babel
    brazil,                   % Idioma do documento
}{abntex2}

\ProcessOptions\relax
\LoadClass{abntex2}

\RequirePackage[brazilian, hyperpageref]{backref}       % Produzir índice nas referências
\RequirePackage{makeidx}                                % Produzir índice remissivo de palavras
\RequirePackage{chngcntr}
% -----------------------------------------------------------------------------
% Configurações gerais
% -----------------------------------------------------------------------------

% Retira o espaço extra desnecessário nas frases
\frenchspacing

% Configurações do pacote backref usado sem a opção hyperpageref de backref
\renewcommand{\backrefpagesname}{Citado na(s) p\'agina(s):~}

% Texto padrão antes do número das páginas
\renewcommand{\backref}{}

% Define as listas de item compactas (sem espaçamento entre os itens)
\setlist{noitemsep, topsep=0pt, parsep=0pt, partopsep=0pt}

% Define os textos da citação
\renewcommand*{\backrefalt}[4]{%
    \ifcase #1
        Nenhuma cita\c{c}\~ao no texto.
    \or
        Citado na p\'agina #2.
    \else
        Citado #1 vezes nas p\'aginas #2.
    \fi
}

% Define a numeração das equações de forma sequencial
\counterwithout{equation}{chapter}

% -----------------------------------------------------------------------------
% Comandos de dados
% -----------------------------------------------------------------------------

% Comandos de dados - Programa
\providecommand{\imprimirprograma}{}
\newcommand{\programa}[1]{\renewcommand{\imprimirprograma}{#1}}

% Comandos de dados - Subtítulo do trabalho
\providecommand{\imprimirsubtitulo}{}
\newcommand{\subtitulo}[1]{\renewcommand{\imprimirsubtitulo}{#1}}

% Comandos de dados - Instituição do orientador
\providecommand{\imprimirinstOrientador}{}
\newcommand{\instOrientador}[1]{\renewcommand{\imprimirinstOrientador}{#1}}

% Comandos de dados - Instituição do coorientador
\providecommand{\imprimirinstCoorientador}{}
\newcommand{\instCoorientador}[1]{\renewcommand{\imprimirinstCoorientador}{#1}}

% Comandos de dados -  Tipo de trabalho acadêmico (tese, dissertação ou projeto de qualificação)
\providecommand{\imprimirprojeto}{}
\newcommand{\projeto}[1]{\renewcommand{\imprimirprojeto}{#1}}

% Comandos de dados - Título Acadêmico a ser alcançado (Doutor ou Mestre)
\providecommand{\imprimirtituloAcademico}{}
\newcommand{\tituloAcademico}[1]{\renewcommand{\imprimirtituloAcademico}{#1}}

% Comandos de dados - Área de concentração do Programa
\newcommand{\imprimirareaconcentracaoRotulo}{\'Area de concentra\c{c}\~ao: }
\providecommand{\imprimirareaconcentracao}{}
\newcommand{\areaconcentracao}[1]{\renewcommand{\imprimirareaconcentracao}{#1}}

% Comandos de dados - linha de pesquisa do Programa
\newcommand{\imprimirlinhapesquisaRotulo}{Linha de pesquisa: }
\providecommand{\imprimirlinhapesquisa}{}
\newcommand{\linhapesquisa}[1]{\renewcommand{\imprimirlinhapesquisa}{#1}}

% Comandos de dados - Texto da folha de aprovação
\providecommand{\imprimirtextopadraofolhadeaprovacao}{}
\newcommand{\textopadraofolhadeaprovacao}[1]{\renewcommand{\imprimirtextopadraofolhadeaprovacao}{#1}}

% Comandos de dados - Logomarca da instituição
\providecommand{\imprimirlogoinstituicao}{}
\newcommand{\logoinstituicao}[2]{\renewcommand{\imprimirlogoinstituicao}{\includegraphics[width={#1}\textwidth]{#2}}}

% -----------------------------------------------------------------------------
% Estilo de elementos
% -----------------------------------------------------------------------------

% Elementos pré-textuais
\renewcommand{\pretextual}{%
    \pagenumbering{gobble} % Sem números nas páginas antes do texto %Caso queira inserir números romanos, utilizar \pagenumbering{roman}
    \aliaspagestyle{chapter}{plain}
    \pagestyle{plain}
    \aliaspagestyle{cleared}{empty}
    \aliaspagestyle{part}{empty}
}
\newcommand\pagenumberingignorereset[1]{\gdef\thepage{\csname @#1\endcsname\c@page}} %Comando para não ignorar as páginas anteriores

% Configura layout para elementos textuais
\renewcommand{\textual}{%
    \pagenumberingignorereset{arabic} % A numeração das páginas é em algarismos arábicos, contando as páginas anteriores (Para iniciar em 1, utilizar \pagenumbering{arabic}
    \pagestyle{abntheadings}
    \aliaspagestyle{chapter}{abntchapfirst}
    %\nouppercaseheads
    \bookmarksetup{startatroot}
}

% Configura layout para elementos pós-textuais
\renewcommand{\postextual}{%
    \chapterstyle{abnt}
    \phantompart
}

% -----------------------------------------------------------------------------
% Objetos flutuantes
% -----------------------------------------------------------------------------

% Comando que trata a fonte nos objetos flutuantes
\renewcommand{\fonte}[1]{%
    \begin{SingleSpacing}\par\end{SingleSpacing}
    \centering\small{\textbf{Fonte}: #1}
}

% Comando que trata as notas nos objetos flutuantes
\renewcommand{\nota}[1]{%
    \begin{SingleSpacing}\par\end{SingleSpacing}
    \begin{tabular}{l p{.85\textwidth}}%
        Nota: & #1
    \end{tabular}
}

% -----------------------------------------------------------------------------
% Parágrafos
% -----------------------------------------------------------------------------

% Tamanho da indentação do parágrafo
\setlength{\parindent}{1.3cm}

% Espaçamento entre um parágrafo e outro
\setlength{\parskip}{0.2cm}

% -----------------------------------------------------------------------------
% Fontes
% -----------------------------------------------------------------------------

% Redefinição de fontes
\renewcommand{\ABNTEXchapterfont}{\normalfont\scshape\bfseries}
\renewcommand{\ABNTEXchapterfontsize}{\Large}

\renewcommand{\ABNTEXpartfont}{\normalfont}
\renewcommand{\ABNTEXpartfontsize}{\ABNTEXchapterfontsize}

\renewcommand{\ABNTEXsectionfont}{\hspace{1mm}\normalfont}
\renewcommand{\ABNTEXsectionfontsize}{\Large}

{\renewcommand{\ABNTEXsubsectionfont}{\hspace{7mm}\normalfont} %fonte de subseção em itálico
\renewcommand{\ABNTEXsubsectionfontsize}{\large}

\renewcommand{\ABNTEXsubsubsectionfont}{\hspace{13mm}\normalfont\itshape}
\renewcommand{\ABNTEXsubsubsectionfontsize}{\normalsize}

\renewcommand{\ABNTEXsubsubsubsectionfont}{\normalfont\itshape}
\renewcommand{\ABNTEXsubsubsubsectionfontsize}{\normalsize}

% -----------------------------------------------------------------------------
% Sumário
% -----------------------------------------------------------------------------

% Travessão no sumário para apêndices e anexos
\renewcommand{\cftchapteraftersnum}{\hfill\textendash\hfill}

% Insere espaço entre os itens do sumário de diferentes capítulos
\setlength{\cftbeforechapterskip}{1.0em \@plus\p@}

% Insere o estilo itálico para as subseções no sumário
\renewcommand{\cftsubsectionfont}{\normalfont}

% Insere o estilo itálico + negrito para as subsubseções no sumário
\renewcommand{\cftsubsubsectionfont}{\normalfont\itshape}
% Insere estilo com underline nas sub sub sub seções
\renewcommand{\cftsubsubsubsectionfont}{\normalfont\underline}

% -----------------------------------------------------------------------------
% Listas
% -----------------------------------------------------------------------------

% Define os títulos das listas
\addto\captionsbrazil{%
% Ajusta nomes padrões do babel
    \renewcommand{\tablename}{\bfseries{Tabela}}
    \renewcommand{\figurename}{\bfseries{Figura}}
    \renewcommand{\listadesiglasname}{Lista de Abreviaturas e Siglas}
    \renewcommand{\listadesimbolosname}{Lista de S\'{i}mbolos}
    \renewcommand{\listfigurename}{Lista de Figuras}
    \renewcommand{\listtablename}{Lista de Tabelas}
    \renewcommand{\indexname}{\'{I}ndice Remissivo}
% Ajusta nomes usados com a macro \autoref
    \renewcommand{\tableautorefname}{Tabela}
    \renewcommand{\chapterautorefname}{Cap\'itulo}
    \renewcommand{\figureautorefname}{Figura}
    \renewcommand{\pageautorefname}{p\'agina}
    \renewcommand{\sectionautorefname}{Subcap\'itulo}
    \renewcommand{\subsectionautorefname}{Item}
    \renewcommand{\subsubsectionautorefname}{Subitem}
    \renewcommand{\paragraphautorefname}{Subcap\'itulo}
}

%Muda nome das Referências
%\renewcommand\refname{REFER{\^E}NCIAS}

% Cria a lista de quadros
\newcommand{\listofquadrosname}{Lista de Quadros}
\newcommand{\quadroname}{Quadro}
\newfloat[chapter]{quadro}{loq}{\quadroname}
\newlistof{listofquadros}{loq}{\listofquadrosname}
\newlistentry{quadro}{loq}{0}
\counterwithout{quadro}{chapter}
\renewcommand{\cftquadroname}{\quadroname\space}
\renewcommand*{\cftquadroaftersnum}{\hfill--\hfill}
% -----------------------------------------------------------------------------
% Capa
% -----------------------------------------------------------------------------
\makeatletter
\renewcommand{\imprimircapa}{%
    \begin{capa}
        \begin{center}
            \imprimirlogoinstituicao{} \\\vspace*{20pt}
            \scshape\imprimirtitulo %editei esse campo, estava embaixo e foi pra cima
            %\normalfont\scshape{\imprimirinstituicao} \\
            %\normalfont\scshape{\imprimirprograma} \\
        \end{center}

        \vspace*{\fill}

        \begin{center}
          
            \abntex@ifnotempty{\imprimirsubtitulo}{%
                {}{\imprimirsubtitulo} %EDITEI dois pontos acima
            }
        \end{center}

        \vspace*{95pt}

        \begin{flushleft}
            \large\textbf{Autor: }\imprimirautor
        \end{flushleft}

        %\vspace*{10pt}

        \begin{flushleft}
            \abntex@ifnotempty{\imprimirorientador}{%
                \large\textbf{Orientador: }\imprimirorientador 
           %Editei para retirar a instituição do orientador     
            }
            \abntex@ifnotempty{\imprimircoorientador}{%
                \begin{SingleSpacing}\par\end{SingleSpacing}
                \small\imprimircoorientadorRotulo{} \imprimircoorientador \\
                \small\imprimirinstCoorientador
            }
        \end{flushleft}

        \vspace*{\fill}

        \begin{center}
        \fontsize{14}{16}\normalfont\textbf{\imprimirdata} -- \normalfont\textbf{\imprimirlocal}
        \end{center}

    \end{capa}
}
\makeatother

% -----------------------------------------------------------------------------
% Folha de rosto
% -----------------------------------------------------------------------------
\makeatletter
\renewcommand{\folhaderostocontent}{%

    \begin{flushleft}
        \includegraphics[width=1\textwidth]{./04-figuras/logo-instituicao} %Adicionado para colocar figura do DEM
    \end{flushleft}

    \vspace*{5pt}

    \begin{center}
        %\ABNTEXchapterfont\LARGE\scshape\imprimirtitulo
        \abntex@ifnotempty{\imprimirsubtitulo}{%
            {}{\imprimirsubtitulo}
        }
    \end{center}

    \vspace*{45pt}

    \abntex@ifnotempty{\imprimirpreambulo}
    {\imprimirpreambulo}
    \vspace*{20pt}

%\begin{minipage}[t]{7cm} %Comandos adicionados para dividir página e adicionar linha de assinatura
	\normalsize\flushleft
	Prof. Dr. Fulano 1\\ %pula linha
	Departamento de Engenharia Mec{\^a}nica -- CEFET-MG\\
	\vspace*{30pt}
	Prof. Me. Fulano 2\\
	Departamento de Engenharia Mec{\^a}nica -- CEFET-MG\\
	\vspace*{30pt}
	Prof. Me. Fulano 3\\
	Departamento de Engenharia Mec{\^a}nica -- CEFET-MG
%\end{minipage}
%\hfill
%\begin{minipage}[t]{7cm}
	%\centering
	%\hrulefill\\
    %Assinatura
%\end{minipage}

        \vspace*{10pt}

%\begin{minipage}[t]{7cm} %Comandos adicionados para dividir página e adicionar linha de assinatura
	%\flushleft
	\abntex@ifnotempty{}{%
                \normalfont{} 
           %Editei para retirar a instituição do orientador     
            }
%\end{minipage}
%\hfill
%\begin{minipage}[t]{7cm}
	%\centering
%	\hrulefill\\
%    Assinatura
%\end{minipage}
            
%             \abntex@ifnotempty{\imprimircoorientador}{%
%                 \begin{SingleSpacing}\par\end{SingleSpacing}
%                 \small\imprimircoorientadorRotulo{} \imprimircoorientador \\
%                 \small\imprimirinstCoorientador
%             }


    \vspace*{\fill}

    \begin{center}
        %\normalfont\scshape{\imprimirinstituicao}\\
        %\normalfont\scshape{\imprimirprograma}\\
        %\normalfont\scshape\\
        \fontsize{14}{16}\normalfont\textbf{\imprimirdata} -- \normalfont\textbf{\imprimirlocal} %Editado para aparecer a data diferente, igual a folha da ivanilza
    \end{center}
    \PRIVATEclearpageifneeded
}
\makeatother

% -----------------------------------------------------------------------------
% Folha de aprovação
% -----------------------------------------------------------------------------
\makeatletter
\newcommand{\imprimirfolhadeaprovacao}{%
    \begin{folhadeaprovacao}
        \vspace*{\fill}

        \begin{tabular}{p{.45\textwidth}p{.45\textwidth}}
            & \imprimirtextopadraofolhadeaprovacao \\
        \end{tabular}

        \vspace*{\fill}
    \end{folhadeaprovacao}
    \PRIVATEclearpageifneeded
}
\makeatother

% -----------------------------------------------------------------------------
% Dedicatória
% -----------------------------------------------------------------------------
\renewenvironment{dedicatoria}[1][]{%
    \ifthenelse{\equal{#1}{}}{%
        \PRIVATEbookmarkthis{\dedicatorianame}
    }{\pretextualchapter{#1}}

    \vspace*{\fill}

    \begin{flushright}
        \begin{minipage}{.5\textwidth}
            \begin{SingleSpacing}
                \setlength\parindent{0pt}
                \setlength\parskip{12pt}
}{%
            \end{SingleSpacing}
        \end{minipage}
    \end{flushright}
    \PRIVATEclearpageifneeded
}

% -----------------------------------------------------------------------------
% Epígrafe
% -----------------------------------------------------------------------------
\renewenvironment{epigrafe}[1][]{%
    \ifthenelse{\equal{#1}{}}{%
        \PRIVATEbookmarkthis{\epigraphname}
    }{\pretextualchapter{#1}}

    \vspace*{\fill}

    \begin{flushright}
        \begin{minipage}{.5\textwidth}
            \begin{SingleSpacing}
                \setlength\parindent{0pt}
                \setlength\parskip{12pt}
}{%
            \end{SingleSpacing}
        \end{minipage}
    \end{flushright}
    \PRIVATEclearpageifneeded
}
