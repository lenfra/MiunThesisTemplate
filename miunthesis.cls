%%Identification
%%The class identifies itself and the LaTeX version needed
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{miunthesis}

%% Required packages

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[]{babel}


\RequirePackage[]{translator}
\usedictionary{miunthesis}

\RequirePackage{algorithm}
\RequirePackage{etoolbox}

%Font packages to follow Miun Template
\RequirePackage{helvet}
\RequirePackage{tikz}
\RequirePackage{mathpazo}
\RequirePackage{verbatimbox}
\RequirePackage{setspace}


%Set timeformat
\RequirePackage[yyyymmdd]{datetime}

%%This parts handles the options passed to the class.
%% Define variables to use for generating title page
\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility\else
  \DeclareOption{notitlepage}{\@titlepagefalse}
\fi

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax

\LoadClass[a4paper,titlepage,12pt]{article}

%Load in class, ensure that tocloft is loaded before parskip
\RequirePackage[]{tocloft}
\RequirePackage[]{parskip}

\RequirePackage[a4paper,
                left=35mm,
                right=45mm,
                top=38mm,
                bottom=12mm,
                includehead,
                includefoot]
                {geometry}
\RequirePackage{fancyhdr}

\RequirePackage{amsmath,amssymb,amsthm, amsfonts}
\RequirePackage[hyphens]{url}
\RequirePackage{varioref, prettyref}
\RequirePackage{hyperref}
\RequirePackage{cleveref}
\RequirePackage[backend=biber,citestyle=ieee, backref]{biblatex}

\setlength\bibitemsep{0.5\baselineskip}

\pdfstringdefDisableCommands{%
  \def\\{}%
  \def\translate#1{<#1>}%
}

\AtBeginDocument{

\@ifpackageloaded{babel}
    {%TRUE
        \addto\captionsenglish{
            \renewcommand{\contentsname}%
            {\sffamily{Table of Contents}}%
        }
        \addto\captionsswedish{
            \renewcommand{\contentsname}%
            {\sffamily{Innehållsförteckning}}%
        }
    }
    {
        %FALSE
    }


}

\newcommand{\subtitle}[1]{
  \newcommand{\@miunthesis@subtitle}{{#1}}
}

\newcommand{\coursecode}[1]{
  \newcommand{\@miunthesis@coursecode}{{#1}}
}

\newcommand{\registrationnr}[1]{
  \newcommand{\@miunthesis@registrationnr}{{#1}}
}

\newcommand{\@miunthesis@projecttype}{%
}
\DeclareRobustCommand*{\projecttype}[1]{%
      \renewcommand{\@miunthesis@projecttype}{#1}
	    \let\projecttype\relax
}

\newcommand{\@miunthesis@coursecredits}{%
}
\DeclareRobustCommand*{\coursecredits}[1]{%
	\renewcommand{\@miunthesis@coursecredits}{#1}
	\let\coursecredits\relax
}

\newcommand{\@miunthesis@fieldofstudy}{%
}
\DeclareRobustCommand*{\fieldofstudy}[1]{%
	\renewcommand{\@miunthesis@fieldofstudy}{#1}
	\let\fieldofstudy\relax
}

\newcommand{\studyprogramme}[1]{%
  \newcommand{\@miunthesis@studyprogramme}{{#1}}
}

\newcommand{\@miunthesis@examiner}{%
}
\DeclareRobustCommand*{\examiner}[1]{%
	\renewcommand{\@miunthesis@examiner}{#1}
	\let\examiner\relax
}

\newcommand{\@miunthesis@supervisor}{%
}
\DeclareRobustCommand*{\supervisor}[1]{%
	\renewcommand{\@miunthesis@supervisor}{#1}
	\let\supervisor\relax
}

\newcommand{\@miunthesis@semester}{
    \ifnum\month<9%
            \translate{Spring}\@
        \else
            \translate{Fall}\@
        \fi
    }

\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}

\renewcommand{\dateseparator}{--}

\renewcommand{\headrulewidth}{0pt}


\newcommand{\printsubtitle}{%
\ifdefined\@miunthesis@subtitle{%
  \large{ \@miunthesis@subtitle }\\
  }
  \else{%
  }
  \fi
}

\newcommand*{\printcourseandreg}{%
  \ifdefined\@miunthesis@coursecode{
    \ifdefined\@miunthesis@registrationnr{
      \footnotesize{\textbf{\translate{Course code}/\translate{Registration number}:} \@miunthesis@coursecode /
              \@miunthesis@registrationnr}\\
    }
    \else{
      \footnotesize{\textbf{\translate{Course code}:} \@miunthesis@coursecode}\\
    }
    \fi
  }
  \else{
    \ifdefined\@miunthesis@registrationnr{
      \footnotesize{\textbf{\translate{Registration number}:} \@miunthesis@registrationnr}\\
    }
    \fi
  }
  \fi
}

\newcommand{\printprogramme}{%
\ifdefined\@miunthesis@studyprogramme{%
  \footnotesize{\textbf{\translate{Programme}:} \@miunthesis@studyprogramme}\\
  }
  \else{%
  }
  \fi
}



\newif\if@titlepage
\@titlepagetrue

\if@titlepage
  \renewcommand\maketitle{\begin{titlepage}%
  \newgeometry{headsep=30pt,
                left=35mm,
                right=45mm,
                top=16mm,
                bottom=12mm,
                includehead,
                includefoot}
  \thispagestyle{fancy}
  \setlength{\headheight}{59pt}
  \fancyhf{}
  \rhead{\includegraphics[width=41mm]{Figures/miun_logo.png}}
  \fancyfoot{}
    \vspace*{0.5cm}
    \fontfamily{phv}
    \LARGE{\textbf{\@title}}
    \\
    \\
    \printsubtitle
    \\
    \\
    \large \@author \par
    \vspace*{115mm}


    \begin{spacing}{1.2}
    \footnotesize{\@miunthesis@projecttype}\\
    \footnotesize{\textbf{\translate{Main field of study}:} \@miunthesis@fieldofstudy}\\
    \footnotesize{\textbf{\translate{Credits}:} \@miunthesis@coursecredits}\\
    \footnotesize{\textbf{\translate{Semester}, \translate{Year}:} \@miunthesis@semester, \the\year{}}\\
    \footnotesize{\textbf{\translate{Supervisor}:} \@miunthesis@supervisor}\\
    \footnotesize{\textbf{\translate{Examiner}:} 
        \@miunthesis@examiner}\\
    \printcourseandreg
    \printprogramme
    \end{spacing}
    
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\maketitle\relax
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  \restoregeometry
}
  \pagestyle{fancy}
  \fancyhf{}
  \fancyfoot[C]{\thepage}

\renewcommand\section{\@startsection{section}{1}
                                    {\z@}% indent
                                    {2.85pt \@plus -1ex \@minus -.2ex}% beforeskip
                                    {1pt \@plus.2ex}% afterskip
                                    {\sffamily\LARGE\bfseries}}
                                    
\renewcommand\subsection{\@startsection{subsection}{2}
                                    {\z@}% indent
                                    {2.85pt  \@plus 0.1ex \@minus -0.05ex}%
                                    {1pt \@plus 0.2em}%
                                    {\sffamily\Large\bfseries}}
                                    
\renewcommand\subsubsection{\@startsection{subsubsection}{3}
                                    {\z@}% indent
                                    {2.85pt \@plus -1ex \@minus -.2ex}%
                                    {1pt \@plus -1ex \@minus -.2ex}%
                                    {\sffamily\large\bfseries}}
                                     
\renewcommand\paragraph{\@startsection{paragraph}{4}
                                    {\z@}% indent
                                    {2.85pt}%
                                    {1pt}%
                                    {\sffamily\normalsize\bfseries}}
                                    
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {2.85pt \@plus -1ex \@minus -.2ex}%
                                       {1pt \@plus -1ex \@minus -.2ex}%
                                      {\ssfamily\normalsize\bfseries}}

%% Table of Contents
\renewcommand{\listalgorithmname}{\translate{List of Algorithms}}

\renewcommand{\cftsecfont}{\bfseries\sffamily}
\renewcommand{\cftsubsecfont}{\sffamily}
\renewcommand{\cftsubsubsecfont}{\sffamily}
\renewcommand{\cftsecpagefont}{\sffamily}
\renewcommand{\cftsubsecpagefont}{\sffamily}
\renewcommand{\cftsubsubsecpagefont}{\sffamily}
