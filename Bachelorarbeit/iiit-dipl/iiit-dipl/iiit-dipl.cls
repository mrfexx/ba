% -*- TeX -*- -*- DE -*-
%
% Class-File f"ur Diplom- und Studienarbeiten am IIIT
%
\NeedsTeXFormat{LaTeX2e}
\def\IIIT@version{3.8.3}
\def\IIIT@filedate{2010/11/08}
\ProvidesClass{iiit-dipl}[\IIIT@filedate\space v\IIIT@version\space LaTeX2e document class]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Notes
%%
%% See README.txt file for revision history
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\typeout{^^J%
         *******************************************************^^J%
         * document class IIIT-DIPL \space\space (\IIIT@filedate)^^J%
         * (c)  1997 Ralf Schernewski^^J%
         *      2002 Thomas Rambow^^J%
         *      2005 Michael Schwarz, Philipp Nenninger^^J%
         *      2010 Kristine Back, Vadim Frolov ^^J
         *      2011 Matthias Michelsburg^^J %
         * ^^J%
         * Institut fuer Industrielle Informationstechnik (IIIT)^^J%
         * Karlsruher Institut fuer Technologie^^J%
         * http://www.iiit.kit.edu^^J%
         *******************************************************^^J%
         }


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\ifIIIT@twoside \IIIT@twosidetrue % default: doppelseitig
\newif\ifIIIT@listings \IIIT@listingsfalse % default: Listings-Package nicht laden
\newif\ifIIIT@subfigure \IIIT@subfigurefalse

\DeclareOption{twoside}{\IIIT@twosidetrue}% (default)
\DeclareOption{oneside}{\IIIT@twosidefalse}%
\DeclareOption{lst}{\IIIT@listingstrue} %
\DeclareOption{subfigure}{\IIIT@subfiguretrue} % nur uebergangsweise, damit Studenten, die schon mit dem Schreiben angefangen haben, nicht alles umstellen muessen.

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}%

\ProcessOptions\relax


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Klassenoptionen an SCRBOOK "ubergeben
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifIIIT@twoside
    \PassOptionsToClass{twoside}{scrbook}
\else
    \PassOptionsToClass{oneside}{scrbook}
\fi

\LoadClass[12pt,a4paper,fleqn,numbers=noenddot]{scrbook}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pakete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Zeichencodierung
\RequirePackage{iiit-encoding}  

% Sprache (babel)
\RequirePackage{iiit-language}

% Bilder
\ifIIIT@subfigure
    \RequirePackage[subfigure,hang,bf,small]{iiit-graphics}
\else
    \RequirePackage{iiit-graphics} % Schriftersetzungen in Postscript-Bildern 
\fi
\RequirePackage{iiit-colors}        % KIT und IIIT Farben definiern

% Bibliographie
\RequirePackage[dipl,bibplain,caps]{iiit-biblio}

% Schriftenauswahl
\RequirePackage[times,helvet,courier,microtype]{iiit-font}

% Formelsatz
\RequirePackage{iiit-math}          % Mathematiksatz
\RequirePackage{iiit-units}         % Einheiten, wie in allen Dokumenten am IIIT

% Tabellen
\RequirePackage{iiit-table}

% Satzspiegel
\RequirePackage{geometry}

% Kopfzeilen
% \RequirePackage{fancyhdr}
% Kopfzeilen
\RequirePackage[%
    headsepline,                    % Linie unter der Kopfzeile
    automark,                       % automatische Aktualisierung der Kolumnentitel
    nouppercase,                    % Grossbuchstaben verhindern
    %markuppercase                  % Grossbuchstaben erzwingen
    %markusedcase                   % vordefinierten Stil beibehalten
    komastyle,                      % Stil von Koma Script
    %standardstyle,                 % Stil der Standardklassen
]{scrpage2}

% Hyperlinks
\RequirePackage{iiit-hyper}

% Listings
\ifIIIT@listings
    \RequirePackage{scrhack}        % unterdueckt Warnung im Zusammenhang mit listings-Paket
    \RequirePackage{iiit-listings}
\fi

% Akademischer Grad
\RequirePackage{iiit-akadgrad}      % akademischen Grad benutzen und korrekt davor oder dahinter setzen

% Theorem Umgebungen
\RequirePackage{iiit-environments}

% Verschiedenes
\RequirePackage{ifthen}
\RequirePackage{makeidx}            % <- Indexerstellung
\RequirePackage[english,ngerman,cleanlook]{isodate} % Datumsformatierung

% explizit auf schwarze Schrift schalten (wegen color-Package)
\color[rgb]{0,0,0}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sprache
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Begriffe
\newcommand{\IIIT@Master}{}
\newcommand{\IIIT@Diplom}{}
\newcommand{\IIIT@Student}{}
\newcommand{\IIIT@Bachelor}{}
\newcommand{\IIIT@ByTxt}{}
\newcommand{\IIIT@AtTxt}{}
\newcommand{\IIIT@InstituteTxt}{}
\newcommand{\IIIT@SupervisorTxt}{}
\newcommand{\IIIT@AdvisorTxt}{}
\newcommand{\IIIT@PeriodTxt}{}
\newcommand{\IIIT@Logo}{}
\newcommand{\IIIT@ClarificationHeading}{}
\newcommand{\IIIT@ClarificationTxt}{}
\newcommand{\IIIT@ClarificationAddress}{}

% deutsch
\addto\captionsngerman{\renewcommand{\IIIT@Master}{Masterarbeit}}
\addto\captionsngerman{\renewcommand{\IIIT@Diplom}{Diplomarbeit}}
\addto\captionsngerman{\renewcommand{\IIIT@Student}{Studienarbeit}}
\addto\captionsngerman{\renewcommand{\IIIT@Bachelor}{Bachelorarbeit}}
\addto\captionsngerman{\renewcommand{\IIIT@ByTxt}{von}}
\addto\captionsngerman{\renewcommand{\IIIT@AtTxt}{am}}
\addto\captionsngerman{\renewcommand{\IIIT@InstituteTxt}{Institut f\"ur Industrielle Informationstechnik}}
\addto\captionsngerman{\renewcommand{\IIIT@SupervisorTxt}{Hauptreferent}}
\addto\captionsngerman{\renewcommand{\IIIT@AdvisorTxt}{Betreuer}}
\addto\captionsngerman{\renewcommand{\IIIT@PeriodTxt}{Zeitraum}}
\addto\captionsngerman{\renewcommand{\IIIT@Logo}{bilder/KIT+IIIT-Logo}}
\addto\captionsngerman{\renewcommand{\IIIT@ClarificationHeading}{Erkl\"arung}}
\addto\captionsngerman{\renewcommand{\IIIT@ClarificationTxt}{%
    Ich versichere hiermit, dass ich meine \IIIT@arbeittyp{} selbst\"andig und unter Beachtung der Regeln zur Sicherung guter wissenschaftlicher Praxis im Karlsruher Institut f\"ur Technologie (KIT)  in der aktuellen Fassung angefertigt habe.\\%
    Ich habe keine anderen als die angegebenen Quellen und Hilfsmittel benutzt und w\"ortlich oder inhaltlich \"ubernommene Stellen als solche kenntlich gemacht.}}
\addto\captionsngerman{\renewcommand{\IIIT@ClarificationAddress}{Karlsruhe, den}}

% english
\addto\captionsenglish{\renewcommand{\IIIT@Master}{Master's thesis}}
\addto\captionsenglish{\renewcommand{\IIIT@Diplom}{Diploma thesis}}
\addto\captionsenglish{\renewcommand{\IIIT@Student}{Student research project}}
\addto\captionsenglish{\renewcommand{\IIIT@Bachelor}{Bachelor's thesis}}
\addto\captionsenglish{\renewcommand{\IIIT@ByTxt}{by}}
\addto\captionsenglish{\renewcommand{\IIIT@AtTxt}{at}}
\addto\captionsenglish{\renewcommand{\IIIT@InstituteTxt}{Institute of Industrial Information Technology}}
\addto\captionsenglish{\renewcommand{\IIIT@SupervisorTxt}{Supervisor}}
\addto\captionsenglish{\renewcommand{\IIIT@AdvisorTxt}{Advisor}}
\addto\captionsenglish{\renewcommand{\IIIT@PeriodTxt}{Time period}}
\addto\captionsenglish{\renewcommand{\IIIT@Logo}{bilder/KIT+IIIT-Logo-eng}}
\addto\captionsenglish{\renewcommand{\IIIT@ClarificationHeading}{Declaration}}
\addto\captionsenglish{\renewcommand{\IIIT@ClarificationTxt}{%
    I hereby declare that I wrote my \IIIT@arbeittyp{} on my own and that I have followed the regulations relating to good scientific practice of the Karlsruhe Institute of Technology (KIT) in its latest form. I did not use any unacknowledged sources or means and I marked all references I used literally or by content.}}
\addto\captionsenglish{\renewcommand{\IIIT@ClarificationAddress}{Karlsruhe,}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Satzspiegel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\frenchspacing
% \sloppy

\geometry{
    a4paper,
    textwidth =         160mm,
    textheight =        235mm,
    top =               20mm,
    includehead,
    headheight =        18pt,
    headsep =           6mm,
    footskip =          10mm,
    hmarginratio =      1:1,
    marginparsep =      2mm,
    marginparwidth =    16mm
}

\renewcommand{\topfraction}{2.00}%
\renewcommand{\bottomfraction}{2.00}%
\renewcommand{\textfraction}{-0.10}%
\renewcommand{\floatpagefraction}{0.10}%
\renewcommand{\baselinestretch}{1.10}%
%
% \flushbottom%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Datumsformat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Datumsformat standardm"a"sig nach Duden: 22.\,07.~1988
% F"ur Datumsformat nach DIN 5008 (22.07.1988):
% \daymonthsepgerman{}%
% \monthyearsepgerman{}{}%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Ueberschriften
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setkomafont{sectioning}{\normalfont\normalcolor\bfseries} % Ueberschriften mit Serifen
\setkomafont{descriptionlabel}{\normalfont\normalcolor\bfseries} % Descriptionlabels mit Serifen

\setcounter{secnumdepth}{2} \setcounter{tocdepth}{2}

% Definition der Kapitel"uberschrift (\chapter, \chapter*)
\def\@makechapterhead#1{%
    \vspace*{20\p@} % original: 50
    {
        \parindent \z@ \raggedright \normalfont
        \ifnum \c@secnumdepth >\m@ne
            \if@mainmatter
                \LARGE\bfseries \@chapapp\space \thechapter % original: \huge
                \par\nobreak
                \vskip 10\p@ % original: 20
            \fi
        \fi
        \interlinepenalty\@M
        \Huge \bfseries #1\par\nobreak
        \vskip 30\p@ % original: 40
    }
}

\def\@makeschapterhead#1{%
    \vspace*{20\p@}% original: 50
    {
        \parindent \z@ \raggedright
        \normalfont
        \interlinepenalty\@M
        \Huge \bfseries  #1\par\nobreak
        \vskip 30\p@% original: 40
    }
}

  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Kopfzeilen
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
\renewcommand{\chapterpagestyle}{empty}
\renewcommand*{\chaptermarkformat}{%
    \chapapp~\thechapter\autodot\enskip}
\pagestyle{scrheadings}
\ohead[\pagemark]{\pagemark}
\ihead[]{\headmark}
\chead[]{}
\ofoot[]{}
\ifoot[]{}
\cfoot[]{}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Captions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\captionsetup{
    format = hang,
    font = small,
    labelfont = bf
}

\ifIIIT@subfigure
\else
    \captionsetup[sub]{
        format = hang,
        font = small,
        labelfont = bf,
        labelformat = simple       % zun\"achst Label ohne Klammern
    }
\fi
\renewcommand\thesubfigure{(\alph{subfigure})}  % nachtr\"aglich Klammern hinzuf\"ugen f\"ur gleiches Format in Beschriftung und beim Referenzieren

\captionsetup[table]{
    position = top
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Title page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\IIIT@referent}{} %
\newcommand{\IIIT@betreuer}{} %
\newcommand{\IIIT@datevon}{} %
\newcommand{\IIIT@datebis}{} %

%\newcommand{\IIIT@TimePeriod}{Zeitraum: }

%\ifIIIT@English
%    \renewcommand{\IIIT@TimePeriod}{Time period: }
%\fi

\newcommand{\referent}[1]{\renewcommand{\IIIT@referent}{#1}}
\newcommand{\betreuer}[1]{\renewcommand{\IIIT@betreuer}{#1}}
\newcommand{\datevon}[1]{\renewcommand{\IIIT@datevon}{#1}}
\newcommand{\datebis}[1]{\renewcommand{\IIIT@datebis}{#1}}
%\newcommand{\arbeittyp}[1]{\renewcommand{\IIIT@arbeittyp}{#1}}
\newcommand{\IIIT@arbeittyp}{} %
\newcommand{\arbeittyp}[1]
{
	\ifthenelse{\equal{#1}{master}}{\renewcommand{\IIIT@arbeittyp}{\IIIT@Master}}{}
	\ifthenelse{\equal{#1}{diplom}}{\renewcommand{\IIIT@arbeittyp}{\IIIT@Diplom}}{}
	\ifthenelse{\equal{#1}{student}}{\renewcommand{\IIIT@arbeittyp}{\IIIT@Student}}{}
	\ifthenelse{\equal{#1}{bachelor}}{\renewcommand{\IIIT@arbeittyp}{\IIIT@Bachelor}}{}
}

\def\and{ \\ & }%

\newcommand*\samethanks[1][\value{footnote}]{\footnotemark[#1]}

\renewcommand{\maketitle}{
    \pagestyle{empty}
    \pagenumbering{alph}
    \begin{titlepage}%
        \newgeometry{top=25mm,headheight=0mm,headsep=0mm,hmarginratio=1:1,textwidth=160mm}
        \renewcommand{\familydefault}{\sfdefault}
        \begin{flushright}
            \includegraphics[scale=0.55]{\IIIT@Logo}
        \end{flushright}
        \begin{center}

            \vfill%

            \LARGE\bfseries\textsf{\@title}%

            \vfill

            \Large\bfseries\textsf{\IIIT@arbeittyp}\\[5ex]%
            \textsf{\IIIT@ByTxt}\\[5ex]%
            \textsf{\IIIT@fullauthor}%
            \normalsize\normalfont

            \vfill%

            \bfseries\textsf{\IIIT@AtTxt}\\[1ex]%
            \IIIT@InstituteTxt \normalfont
            \vfill%


            \begin{tabular}{@{}ll@{}}%
                \IIIT@PeriodTxt: & {\numdate\printdate{\IIIT@datevon} -- \printdate{\IIIT@datebis}}\\%
                \IIIT@SupervisorTxt: & \IIIT@referent \\%
                \IIIT@AdvisorTxt: & \IIIT@betreuer \\%
            \end{tabular}
        \end{center}%

        \vfill

        \let\footnotesize\small \let\footnoterule\relax \let\footnote\thanks%
        \@thanks%
        \restoregeometry
    \end{titlepage}%
    \cleardoublepage
    
    \vspace*{\fill}%
	{\setlength{\parindent}{0em}%
	{\Large\bfseries\IIIT@ClarificationHeading\par}\bigskip%
	\IIIT@ClarificationTxt\par\bigskip%
	\IIIT@ClarificationAddress{} \printdate{\IIIT@datebis}\par\vspace{5ex}}%
    
    \cleardoublepage
    \setcounter{footnote}{0}%
} %


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Abstract
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Abstract ist eine Umgebung, die eine Kapitel"uberschrift erstellt, ohne auf \pagestyle{plain} umzuschalten.

\newenvironment{abstract}
{
    \@afterindentfalse
    \@makeschapterhead{Abstract}
    \noindent
}
{
    \cleardoublepage
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TOC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% TOC wird so umdefiniert, dass auf \pagestyle{scrheadings} umgeschaltet wird. Die Seite zuvor soll "empty" sein,
% daher darf die Umschaltung erst NACH dem \chapter*-Befehl erfolgen (\chapter* sendet ein \clearpage bzw.
% \cleardoublepage). Das Inhaltsverzeichnis beginnt stets auf Seite 1 (bzw. "i").

\renewcommand\tableofcontents{%
    \pagenumbering{roman}
    \if@twocolumn
        \@restonecoltrue\onecolumn
    \else
        \@restonecolfalse
    \fi
    \chapter*{\contentsname}
    \pagestyle{scrheadings}
    \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}
    {
        \setlength{\parindent}{0em}
        \setlength{\parskip}{0em}
        \@starttoc{toc}%
    }
    \if@restonecol\twocolumn\fi
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Macros
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% displaymath-Umgebung und \[ ... \] umdefinieren auf equation*-Umgebung, damit fleqn wirksam wird
% Achtung: $$ ... $$ ergibt nach wie vor zentrierte Gleichungen und sollte daher vermieden werden.
\renewenvironment{displaymath}{\begin{equation*}}{\end{equation*}}
\renewcommand{\[}{\begin{equation*}}
\renewcommand{\]}{\end{equation*}}

\renewcommand{\sbe}{\stackrel{!}{=}}
\renewcommand{\entspr}{\;\widehat =\;}

\renewcommand{\vec}[1]{\boldsymbol{\mathrm{#1}}}


\newcommand{\LoadBild}[3][]{
    \begin{figure}[htb]
        \centering
        \includegraphics[#1]{#2}
        \caption{#3}
    \end{figure}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LOF, LOT, Index ins Inhaltsverzeichnis aufnehmen
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Die Umgebungen werden neu definiert (vgl. book.cls), so dass \addcontentsline an der
%% richtigen Stelle steht (=> wegen Hyperref)
%% BUG: Funktioniert bei Index nicht richtig. Hyperlink zeigt auf falsche Seite.

%% aus IRS-Klasse
\def\phantomsection{\relax} % wird in hyperref richtig definiert; f"ur idxtotoc

\renewenvironment{theindex}{%
    {
        \setlength{\parindent}{0em}
        \setlength{\parskip}{0em}
        \if@twocolumn
            \@restonecolfalse
        \else
            \@restonecoltrue
        \fi
        \clearpage%
        \if@openright\cleardoublepage\else\relax\fi%
        \phantomsection%
        \twocolumn[\@makeschapterhead{\indexname}]%
        \addcontentsline{toc}{chapter}{\indexname}
        \@mkboth{%
            \MakeUppercase\indexname%
        }{%
            \MakeUppercase\indexname%
        }%
        \thispagestyle{plain}\parindent\z@
        \parskip\z@ \@plus .3\p@\relax
        \columnseprule \z@
        \columnsep 35\p@
        \let\item\@idxitem
    }
}
{
    \if@restonecol\onecolumn\else\clearpage\fi
}

\renewcommand\listoffigures{%
    \if@twocolumn
        \@restonecoltrue\onecolumn
    \else
        \@restonecolfalse
    \fi
    \chapter*{\listfigurename}%
    \addcontentsline{toc}{chapter}{\listfigurename}%
    \@mkboth{%
        \MakeUppercase\listfigurename%
    }{%
        \MakeUppercase\listfigurename%
    }%
    {
        \setlength{\parindent}{0em}
        \setlength{\parskip}{0em}
        \@starttoc{lof}%
    }
    \if@restonecol\twocolumn\fi
}

\renewcommand\listoftables{%
    \if@twocolumn
        \@restonecoltrue\onecolumn
    \else
        \@restonecolfalse
    \fi
    \chapter*{\listtablename}%
    \addcontentsline{toc}{chapter}{\listtablename}%
    \@mkboth{%
        \MakeUppercase\listtablename%
    }{%
        \MakeUppercase\listtablename%
    }%
    {
        \setlength{\parindent}{0em}
        \setlength{\parskip}{0em}
        \@starttoc{lot}%
    }
    \if@restonecol\twocolumn\fi
}

\makeindex%
%
\endinput
