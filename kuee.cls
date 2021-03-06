%\ProvidesClass{kuee}[2005/01/31]
\ProvidesClass{kuee}[2005/02/04] % Modified by Tsutomu Hoshino
\newif\if@NTT
\ifx\pfmtname\undefined
  \@NTTtrue
  \NeedsTeXFormat{LaTeX2e}
\else
  \@NTTfalse
  \NeedsTeXFormat{pLaTeX2e}
\fi
\newif\if@sotsuron
\newif\if@figuretitle
\DeclareOption{sotsuron}{\@sotsurontrue}
\DeclareOption{shuuron}{\@sotsuronfalse}
\DeclareOption{figuretitle}{\@figuretitletrue}%             by G. Morita
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{jreport}}
\ProcessOptions\relax
\LoadClass[12pt]{jreport}

\if@sotsuron
  \gdef\@maintitle{$B3X(J\hfil $B;N(J\hfil $BO@(J\hfil $BJ8(J}
  \gdef\@course{$B5~ETBg3X9)3XIt(J}
  \gdef\@department{$BEE5$EE;R9)3X2J(J}
\else
  \gdef\@maintitle{$B=$(J\hfil $B;N(J\hfil $BO@(J\hfil $BJ8(J}
  \gdef\@course{$B5~ETBg3XBg3X1!9)3X8&5f2J(J}
  \gdef\@department{$BEE5$9)3X@l96(J}
\fi

%%%%%%%%%%%%%%
%%% Layout %%%
%%%%%%%%%%%%%%
% $B%l%$%"%&%H!%(J
\oddsidemargin  = 0.5cm
\evensidemargin = 0.5cm
\marginparwidth = 68pt
\topmargin      = 0pt
\headheight     = 12pt
\headsep        = 25pt
\footskip       = 30pt

\textheight     = 604pt
\textwidth      = 424pt

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Chars in Line and Lines in Page %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $B#19T$NJ8;z?t$H#1%Z!<%8$N9T?t$+$i(J
% \jintercharskip, \baselineskip $B$r<+F0@_Dj$9$k!%(J

% default values.
\gdef\@charsinline{34}
\gdef\@linesinpage{32}

\def\charsinline#1{\gdef\@charsinline{#1}}
\def\linesinpage#1{\gdef\@linesinpage{#1}}

\let\kuee@document=\document
\def\kuee@adjuestmathskips{%
  \abovedisplayskip .6\baselineskip plus .15\baselineskip minus .3\baselineskip
  \belowdisplayskip \abovedisplayskip
  \abovedisplayshortskip \z@ plus .15\baselineskip
  \belowdisplayshortskip .3\baselineskip plus .15\baselineskip minus .15\baselineskip}
\if@NTT
  \def\document{%
    \kuee@document
    \@tempcnta = \@charsinline \advance\@tempcnta \m@ne
    \@tempdima = \textwidth
    \advance\@tempdima - \@charsinline zw \divide\@tempdima by \@tempcnta
    \jintercharskip = \@tempdima plus 0.5\@tempdima minus 0.33333\@tempdima
    \jasciikanjiskip = .24zw plus .12zw minus .08zw
    \jmathkanjiskip = .24zw plus .12zw minus .08zw
    \parindent = 1zw \advance\parindent + \jintercharskip
    \baselineskip = \textheight \divide\baselineskip by \@linesinpage
    \kuee@adjuestmathskips}
\else
  \def\document{%
    \kuee@document
    \@tempcnta = \@charsinline \advance\@tempcnta \m@ne
    \@tempdima = \textwidth
    \advance\@tempdima - \@charsinline zw \divide\@tempdima by \@tempcnta
    \kanjiskip = \@tempdima plus 0.5\@tempdima minus 0.33333\@tempdima
    \xkanjiskip = .25zw plus .15zw minus .1zw
    \parindent = 1zw \advance\parindent + \kanjiskip
    \baselineskip = \textheight \divide\baselineskip by \@linesinpage
    \kuee@adjuestmathskips}
\fi



%%%%%%%%%%%%%%%%%
%%% Maketitle %%%
%%%%%%%%%%%%%%%%%
% $BI=;f!%(J
\def\professor#1{\gdef\@professor{#1}}
\def\course#1{\gdef\@course{#1}}
\def\department#1{\gdef\@department{#1}}

\def\offset{0.5}
\def\maketitle{%
  \begin{titlepage}%
    \let\footnoterule\relax \setcounter{page}{0}%
    \thispagestyle{empty}%
    \let\figure\kuee@figure
    \begin{figure}
      \center
      \unitlength = 1cm
      \hspace*{0mm}\\
      \begin{picture}(0,0)(\offset,0)
        \put(2.5,8){\makebox(0,0)[b]{\makebox[8cm]{\Huge \@maintitle}}}%
        \put(-2.5,5.5){\makebox(0,0)[r]{\makebox[2cm]{$BBj(J\hfil $BL\(J}}}%
        \put(2.5,5.5){\makebox(0,0){\parbox{10cm}{\center \LARGE \@title}}}%
        \ifx\@professor\undefined\else
          \put(-2.5,3){\makebox(0,0)[r]{\makebox[2cm]{$B;X(J\hfil $BF3(J\hfil $B65(J\hfil $B0w(J}}}% Modified by Tsutomu Hoshino 050204
          \put(2.5,3){\makebox(0,0){\parbox{8cm}{\center \LARGE \@professor}}}%
        \fi
        \put(2.5,-6.5){\makebox(0,0)[t]{\@course\ \@department}}%
        \put(-0.5,-8.5){\makebox(0,0)[rb]{\makebox[1.5cm]{$B;a(J\hfil $BL>(J}}}%
        \put(2.5,-8.7){\makebox(0,0)[b]{\LARGE \underline{\@author}}}%
        \put(2.5,-10){\makebox(0,0)[t]{\large \@date}}%
      \end{picture}
    \end{figure}
    \setcounter{footnote}{0}\let\thanks\relax
    \gdef\@thanks{}\gdef\@author{}\gdef\@title{}%
    \gdef\@professor{}\gdef\@course{}\gdef\department{}%
    \let\maketitle\relax
  \end{titlepage}}

%%%%%%%%%%%%%%%%%%%%%%%%%
%%%     Abstract      %%%
%%%%%%%%%%%%%%%%%%%%%%%%%
\def\eabstract{%
\setcounter{page}{0}
\thispagestyle{empty}
\chapter*{\ename\@mkboth{\ename}{\ename}}%
}
\def\ename{Abstract}

%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Table of Contents %%%
%%%%%%%%%%%%%%%%%%%%%%%%%
% $BL\<!!%(J
% $BL\<!%Z!<%8$N(J pagestyle $B$O(J roman$B!%(J
\def\tableofcontents{%
  \setcounter{page}{0}
  \bgroup
    \def\thepage{\roman{page}}%
    \lineskip = \normallineskip
    \@restonecolfalse
    \if@twocolumn\@restonecoltrue\onecolumn\fi
    \chapter*{\contentsname\@mkboth{\contentsname}{\contentsname}}%
    \@starttoc{toc}\if@restonecol\twocolumn\fi
    \newpage
  \egroup
  \global\c@page = \@ne}

\def\contentsname{$BL\(J $B<!(J}

\def\ptex@l@chapter#1#2{%
  \pagebreak[3]
  \setlength\@lnumwidth{4zw}%
  \vskip 1.0em plus 1pt
  \@tempdima 4em
  \begingroup
    \parindent \z@ \rightskip \@pnumwidth \parfillskip -\@pnumwidth
    \bf \leavevmode
    \advance\leftskip\@tempdima \hskip -\leftskip
    #1\nobreak \hfil\nobreak \hbox to\@pnumwidth{\hss #2}\par
  \endgroup}
\def\jtex@l@chapter#1#2{%
  \pagebreak[3]
  \vskip 1.0em plus 1pt
  \@tempdima 4em
  \begingroup
    \parindent \z@ \rightskip \@pnumwidth \parfillskip -\@pnumwidth
    \bf \leavevmode
    \advance\leftskip\@tempdima \hskip -\leftskip
    #1\nobreak \hfil\nobreak \hbox to\@pnumwidth{\hss #2}\par
  \endgroup}
\if@NTT
  \let\l@chapter\jtex@l@chapter
\else
  \let\l@chapter\ptex@l@chapter
\fi

\def\l@section{\@dottedtocline{1}{1.7em}{2.3em}}
\def\l@subsection{\@dottedtocline{2}{4em}{3.2em}}
\def\l@subsubsection{\@dottedtocline{3}{7.2em}{4.1em}}
\def\l@paragraph{\@dottedtocline{4}{10.2em}{5em}}
\def\l@subparagraph{\@dottedtocline{5}{12.2em}{6em}}

%%%%%%%%%%%%%%%
%%% Chapter %%%
%%%%%%%%%%%%%%%
% $B>O!%(J
% $B>OBj$O(J `$BBh#1>O(J $B=xO@(J' $B$N$h$&$K!%(J
% $BL\<!$N>OBj$bF1MM$K!%(J
\def\ptex@makechapterhead#1{%
  \vspace*{20pt}%
  { \parindent 0pt \raggedright
    \ifnum \c@secnumdepth >\m@ne
      \LARGE \bf
      \setbox\@tempboxa\hbox{\@chapapp{\thechapter}\@chappos\hskip 10pt}%
      \begin{list}{}{%
        \topsep = 0pt \parsep = 0pt
        \labelwidth = \wd\@tempboxa \labelsep = 0pt
        \leftmargin = \labelwidth
      }\item[\box\@tempboxa] #1
      \end{list}%
    \else
      \LARGE \bf #1\par
    \fi
    \nobreak
    \vskip 10pt }}
\def\jtex@makechapterhead#1{%
  \vspace*{20pt}%
  { \parindent 0pt \raggedright
    \ifnum \c@secnumdepth >\m@ne
      \LARGE \bf
      \setbox\@tempboxa\hbox{\@chapapp{\thechapter}\hskip 10pt}%
      \begin{list}{}{%
        \topsep = 0pt \parsep = 0pt
        \labelwidth = \wd\@tempboxa \labelsep = 0pt
        \leftmargin = \labelwidth
      }\item[\box\@tempboxa] #1
      \end{list}%
    \else
      \LARGE \bf #1\par
    \fi
    \nobreak
    \vskip 10pt }}
\if@NTT
  \let\@makechapterhead\jtex@makechapterhead
\else
  \let\@makechapterhead\ptex@makechapterhead
\fi
\def\@makeschapterhead#1{%
  \vspace*{20pt}%
  { \parindent 0pt
    \raggedright
    \LARGE \bf #1\par
    \nobreak
    \vskip 20pt }}

\def\clearfigurepage{%
  \kuee@iwrite{\string\clearpage}}

\def\chapter{%
  \clearpage
  \clearfigurepage
  \global\@topnum\z@ \@afterindenttrue
  \secdef\@chapter\@schapter}
\def\ptex@chapter[#1]#2{%
  \ifnum \c@secnumdepth >\m@ne
    \refstepcounter{chapter}%
    \typeout{\@chapapp{\thechapter}\@chappos.}%
     \addcontentsline{toc}{chapter}{%
      \protect\numberline{\@chapapp{\thechapter}\@chappos}#1
    }%
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi
  \chaptermark{#1}%
  \addtocontents{lof}{\protect\addvspace{10pt}}%
  \addtocontents{lot}{\protect\addvspace{10pt}}%
  \if@twocolumn
    \@topnewpage[\@makechapterhead{#2}]
  \else
    \@makechapterhead{#2}%
    \@afterheading
  \fi}
\def\jtex@chapter[#1]#2{%
  \ifnum \c@secnumdepth >\m@ne
    \refstepcounter{chapter}%
    \typeout{\@chapapp{\thechapter}.}%
    \addcontentsline{toc}{chapter}{%
      \protect\numberline{\@chapapp{\thechapter}}#1
    }%
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi
  \chaptermark{#1}%
  \addtocontents{lof}{\protect\addvspace{10pt}}%
  \addtocontents{lot}{\protect\addvspace{10pt}}%
  \if@twocolumn
    \@topnewpage[\@makechapterhead{#2}]
  \else
    \@makechapterhead{#2}%
    \@afterheading
  \fi}
\if@NTT
  \let\@chapter\jtex@chapter
\else
  \let\@chapter\ptex@chapter
\fi
\def\@schapter#1{%
  \if@twocolumn
    \@topnewpage[\@makeschapterhead{#1}]
  \else
    \@makeschapterhead{#1}%
    \@afterheading
  \fi
}

\if@NTT
\else
\renewcommand\section{%
  \@startsection{section}{1}{\z@}%
		{3.5ex \@plus 1ex \@minus .2ex}%
		{2.3ex \@plus.2ex}%
		{\normalfont\Large\bfseries}}
\renewcommand\subsection{%
  \@startsection{subsection}{2}{\z@}%
                {3.25ex\@plus 1ex \@minus .2ex}%
                {1.5ex \@plus .2ex}%
                {\normalfont\large\bfseries}}
\renewcommand\subsubsection{%
  \@startsection{subsubsection}{3}{\z@}%
                {3.25ex\@plus 1ex \@minus .2ex}%
                {1.5ex \@plus .2ex}%
                {\normalfont\normalsize\bfseries}}
\fi

%%%%%%%%%%%%%%%%
%%% Footnote %%%
%%%%%%%%%%%%%%%%
% $B5SCm!%(J
% $B#29T0J>e$K$J$C$F$b:8$K$O$_=P$5$J$$!%(J
% $B%^!<%/$O(J \newfnsymbol $B$G!%(J
%\def\newfnsymbol#1{\@newfnsymbol{\@nameuse{c@#1}}}
%\def\@newfnsymbol#1{%
%  \ifcase #1
%    \or *\or        **\or               ***%
%   \or \dagger \or  \dagger\dagger\or   \dagger\dagger\dagger
%    \or \ddagger\or \ddagger\ddagger\or \ddagger\ddagger\ddagger
%    \else \@ctrerr
%  \fi
%  \relax
%}

\long\def\@makefntext#1{%
  \begin{list}{}{%
    \topsep = 0pt \partopsep = 0pt \itemsep = 0pt \parsep = 0pt
    \labelwidth = 1.2em \labelsep = 5pt
    \leftmargin = \labelwidth \advance\leftmargin + \labelsep
  }%
    \item[\hss$^{\@thefnmark}$] #1%
  \end{list}%
}
%\def\thefootnote{\newfnsymbol{footnote}}
\def\thefootnote{\fnsymbol{footnote}}

%%%%%%%%%%%%
%%% List %%%
%%%%%%%%%%%%
% $B%j%9%H!&%Q%i%a%?!%(J
\def\@listI{%
  \leftmargin \leftmargini
  \topsep .5\baselineskip plus .2\baselineskip minus .3\baselineskip
  \parsep .25\baselineskip plus .125\baselineskip minus .05\baselineskip
  \itemsep \parsep
}
\let\@listi\@listI
\@listi
\def\@listii{%
  \leftmargin \leftmarginii
  \labelwidth \leftmarginii  \advance\labelwidth - \labelsep
  \topsep .25\baselineskip plus .1\baselineskip minus .15\baselineskip
  \parsep .125\baselineskip plus .0625\baselineskip minus .025\baselineskip
  \itemsep \parsep
}
\def\@listiii{%
  \leftmargin \leftmarginiii
  \labelwidth \leftmarginiii  \advance\labelwidth - \labelsep
  \topsep .125\baselineskip plus .0625\baselineskip minus .025\baselineskip
  \parsep \z@
  \partopsep 1pt plus 0pt minus 1pt
  \itemsep \topsep
}
\def\@listiv{\leftmargin\leftmarginiv
  \labelwidth\leftmarginiv\advance\labelwidth-\labelsep}
\def\@listv{\leftmargin\leftmarginv
  \labelwidth\leftmarginv\advance\labelwidth-\labelsep}
\def\@listvi{\leftmargin\leftmarginvi
  \labelwidth\leftmarginvi\advance\labelwidth-\labelsep}

%%%%%%%%%%%%%%%%%%%%%%%%
%%% Acknowledgements %%%
%%%%%%%%%%%%%%%%%%%%%%%%
% $B<U<-!%(J
% $BL\<!$K:\$;$k!%(J
\def\acknowledgements{%
  \bgroup
    \c@secnumdepth = \m@ne
    \chapter{\ackname\@mkboth{\ackname}{\ackname}}%
  \egroup
  \relax
}

\def\ackname{$B<U(J $B<-(J}

%%%%%%%%%%%%%%%%%%%%
%%% Bibliography %%%
%%%%%%%%%%%%%%%%%%%%
% $B;29MJ88%!%(J
% $BL\<!$K:\$;$k!%(J
% \bibitem $B$N%i%Y%k$O(J `1)' $B$N$h$&$K!%(J
% \cite $B$N=PNO$O>eIU$-(J `1)' $B$N$h$&$K!%(J
\def\thebibliography#1{%
  \bgroup
    \c@secnumdepth = \m@ne
    \chapter{\refname\@mkboth{\refname}{\refname}}%
  \egroup
  \list{\arabic{enumi})}{%
    \settowidth\labelwidth{#1)}%
    \leftmargin\labelwidth \advance\leftmargin\labelsep
    \usecounter{enumi}%
  }%
  \def\newblock{\hskip .11em plus .33em minus .07em}%
  \sloppy\sfcode`\.=1000
  \relax
}
\let\endthebibliography=\endlist

\def\@cite#1#2{%
  \nobreak$^{\mbox{\scriptsize #1\if@tempswa , #2\fi})}$%
}

\def\refname{$B;2(J $B9M(J $BJ8(J $B8%(J}

%%%%%%%%%%%%%%%%
%%% Appendix %%%
%%%%%%%%%%%%%%%%
%\newcount\@kuee@appseq
%  commented by G. Morita
\let\kuee@appendix\appendix
\def\appendix{%
%    \@kuee@appseq=\@kuee@seq
%    \global\advance\@kuee@appseq 1\relax
%  commented by G. Morita
  \kuee@iwrite{\string\kueefigureappendix}%  by G. Morita
  \kuee@iwrite{ }%                           by G. Morita
  \kuee@appendix%
}

\def\kueefigureappendix{\global\let\thechapter\kuee@theappendix}


%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Figures and Tables %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\kuee@figureandtable{%
  \advance\textwidth + 2\oddsidemargin
  \advance\textheight + \headheight
  \advance\textheight + \headsep
  \oddsidemargin  = 0pt
  \evensidemargin = 0pt
  \headheight     = 0pt
  \headsep        = 0pt
  \@colht         = \textheight
}

\newcommand{\kueeseparator}{\goodbreak}%{\clearpage}
\newwrite\kuee@post
\newcount\@kuee@open
\def\kuee@openpost{%
    \immediate\openout\kuee@post=\jobname.fff\relax
    \global\@kuee@open=1\relax
    \message{(\jobname.fff)}}
\def\kuee@condopen{%
    \ifnum\@kuee@open>0\relax\else\kuee@openpost\fi}
\def\kuee@iwrite#1{%
    \immediate\write\kuee@post{#1}}
\newcommand*{\kuee@makeinnocent}[1]{\catcode`#1=12 }
\let\kuee@figure\figure
\let\kuee@table\table
\let\kuee@float\relax

%\newcount\@kuee@seq
%\def\kuee@savevalue#1{%
%    \expandafter\newcount\csname @kuee\number\@kuee@seq#1\endcsname
%    \expandafter\global\csname @kuee\number\@kuee@seq#1\endcsname=\value{#1}\relax}
%  comment by G. Morita
%\def\kuee@store#1{%
%    \global\advance\@kuee@seq 1\relax%
%    \kuee@savevalue{chapter}
%    \kuee@savevalue{#1}}
%  comment by G. Morita

\let\kuee@chapter\@chapter%  by G. Morita
\def\@chapter[#1]#2{%        by G. Morita
  \kuee@chapter[#1]{#2}%
  \kuee@condopen%
  \kuee@iwrite{\string\setcounter{chapter}{\@arabic\value{chapter}}}%
  \kuee@iwrite{\string\addtocounter{chapter}{-1}}%
  \kuee@iwrite{\string\stepcounter{chapter}}%
  \kuee@iwrite{ }%
}

\let\kuee@thechapter\thechapter
\let\kuee@theappendix\relax
%\def\kuee@restorevalue#1{%
%    \setcounter{#1}{\csname @kuee\number\@kuee@seq#1\endcsname}}
%  commented by G. Morita
%\def\kuee@restore#1{%
%    \global\advance\@kuee@seq 1\relax
%    \@tempcnta=\c@chapter
%    \kuee@restorevalue{chapter}
%    \kuee@restorevalue{#1}
%    \ifnum\@kuee@seq=\@kuee@appseq
%      \global\let\thechapter\kuee@theappendix
%    \fi}
%  commented by G. Morita

\def\figure{%
%    \kuee@store{figure}
%    \refstepcounter{figure}
%  commented by G. Morita
    \edef\kuee@envname{\@currenvir}%
    \def\kuee@externalenvname{figure*}%
    \kuee@condopen%
    \kuee@iwrite{\string\begin{figure*}}%
    \def\@currenvir{kuee@float}%
    \begingroup%
    \let\do\kuee@makeinnocent \dospecials%
    \kuee@makeinnocent\^^L% and whatever other special cases
    \endlinechar`\^^M \catcode`\^^M=12
    \kuee@setup
    \kuee@xfloat}%
\def\table{%
%    \kuee@store{table}
%    \refstepcounter{table}
%  commented by G. Morita
    \edef\kuee@envname{\@currenvir}%
    \def\kuee@externalenvname{table*}%
    \kuee@condopen%
    \kuee@iwrite{\string\begin{table*}}%
    \def\@currenvir{kuee@float}%
    \begingroup
    \let\do\kuee@makeinnocent \dospecials
    \kuee@makeinnocent\^^L% and whatever other special cases
    \endlinechar`\^^M \catcode`\^^M=12
    \kuee@setup
    \kuee@xfloat}
\def\kuee@foundend#1{\def\next{\endgroup\end{kuee@float}%
    \kuee@iwrite{\string\end{#1}}%
    \kuee@iwrite{\string\kueeseparator}%
    \kuee@iwrite{ }}}%
\begingroup
\catcode`\^^M=12\relax%
\gdef\kuee@xfloat#1^^M{%
    \edef\@tempa{#1\kuee@xfloat@to@be@detected}%
    \expandafter\kuee@xfloat@linecheck\@tempa\@nil%
    \ifx\@tempa\@empty%
        \kuee@iwrite{#1}%
        \let\next\kuee@xfloat%
    \else%
        \edef\@tempa{\noexpand\kuee@foundend{\kuee@externalenvname}}%
        \@tempa%
    \fi%
    \next}%
\endgroup%
\begingroup
\catcode`\{=12 \catcode`\[=1
\catcode`\}=12 \catcode`\]=2
\catcode`\|=0 \catcode`\\=12
|gdef|kuee@setup[%
    |edef|kuee@xfloat@to@be@detected[\end{|kuee@envname}]%
    |def|@tempa[|def|kuee@xfloat@linecheck####1]%
    |expandafter|@tempa|kuee@xfloat@to@be@detected##2|@nil[|def|@tempa[##2]]]
|endgroup

\@namedef{figure*}{\figure}
\@namedef{table*}{\table}

\newcommand{\processdelayedfloats@hook}{\@empty}
\def\AtBeginDelayedFloats{\g@addto@macro\processdelayedfloats@hook}

\newcommand{\processotherdelayedfloats}{\@empty}
\renewcommand{\bottomfraction}{1.0}
\renewcommand{\topfraction}{1.0}
\renewcommand{\textfraction}{0.0}
\newcommand{\processdelayedfloats}{{%
  \let\kuee@theappendix\thechapter
  \def\baselinestretch{1}\normalsize
%   \global\@kuee@seq=0
%  commented by G. Morita
   \global\let\thechapter\kuee@thechapter
   \def\figure{\kuee@figure}
   \def\table{\kuee@table}
   \kuee@figureandtable
   \if@figuretitle%   by G. Morita
     \clearpage
     \thispagestyle{empty}
     \vbox to \textheight{%
     \vfil%
     \hbox to \textwidth{\Huge\bf\hfil $B?^(J $BI=(J \hfil}%
     \vfil}
     \clearpage
   \fi
   \processdelayedfloats@hook
   \ifnum\@kuee@open>0
     \immediate\closeout\kuee@post
     \global\@kuee@open=0
     %\markboth{\uppercase{\figuresection}}{\uppercase{\figuresection}}
     \@input{\jobname.fff}
   \fi}}
\AtEndDocument{
   \message{AED kuee: Processing end Figures and Tables}
   \onecolumn
   \processdelayedfloats }


%%% $B=>Mh$N(J kueethesis.sty $B$H$N8eJ}8_49@-$rJ]$D$?$a$N%3%^%s%I(J
\def\figureandtable{%
  \@warning{This command `figureandtable' is obsolete.  Don't use it.}
  \def\figure{\kuee@figure}
  \def\table{\kuee@table}}

\def\figureandtableof#1{%
  \@warning{This command `figureandtableof' is obsolete.  Don't use it.}
  \clearpage
  \@ifundefined{r@#1}
    {\@warning{Chapter refered by `#1' undefined}}
    {\edef\@tempa{\@nameuse{r@#1}}
     \xdef\thechapter{\expandafter\@firstoftwo\@tempa}
     \kuee@refcounter{chapter}}
  \setcounter{figure}{0}%
  \setcounter{table}{0}}

\def\kuee@refcounter#1{%
  \protected@edef\@currentlabel
    {\csname p@#1\endcsname\csname the#1\endcsname}}
