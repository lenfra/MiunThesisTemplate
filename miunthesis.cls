%%Identification
%%The class identifies itself and the LaTeX version needed
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{miunthesis}

%% Required packages

\RequirePackage[a4paper,
                left=35mm,
                right=40mm,
                top=37mm,
                bottom=35mm]
                {geometry}

\RequirePackage[]{translator}
\usedictionary{miunthesis}

\RequirePackage{algorithm}

%Font packages to follow Miun Template
\RequirePackage{helvet}
\RequirePackage{tikz}
\RequirePackage{mathpazo}
\RequirePackage{verbatimbox}
\RequirePackage{fancyhdr}


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
\RequirePackage{amsmath,amssymb,amsthm, amsfonts}
\RequirePackage[hyphens]{url}
\RequirePackage{varioref, prettyref}
\RequirePackage{hyperref}
\RequirePackage{cleveref}


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
\newcommand{\@miunthesis@subtitle}{%
	\ClassError{miunthesis}
		{Missing `\noexpand\subtitle'}
		{You need a '\noexpand\subtitle' in the preamble of the document}
}
\DeclareRobustCommand*{\subtitle}[1]{%
	\renewcommand{\@miunthesis@subtitle}{#1}
	\let\subtitle\relax
}

\newcommand{\@miunthesis@courseid}{%
	\ClassError{miunthesis}
		{Missing `\noexpand\courseid'}
		{You need a '\noexpand\course' in the preamble of the document}
}
\DeclareRobustCommand*{\courseid}[1]{%
	\renewcommand{\@miunthesis@courseid}{#1}
	\let\courseid\relax
}

\newcommand{\@miunthesis@coursename}{%
	\ClassError{miunthesis}
		{Missing `\noexpand\coursename'}
		{You need a '\noexpand\course' in the preamble of the document}
}
\DeclareRobustCommand*{\coursename}[1]{%
	\renewcommand{\@miunthesis@coursename}{#1}
	\let\coursename\relax
}

\newcommand{\@miunthesis@coursecredits}{%
	\ClassError{miunthesis}
		{Missing `\noexpand\coursecredits'}
		{You need a '\noexpand\coursecredits' in the preamble of the document}
}
\DeclareRobustCommand*{\coursecredits}[1]{%
	\renewcommand{\@miunthesis@coursecredits}{#1}
	\let\coursecredits\relax
}

\newcommand{\@miunthesis@fieldofstudy}{%
	\ClassError{miunthesis}
		{Missing `\noexpand\fieldofstudy'}
		{You need a '\noexpand\fieldofstudy' in the preamble of the document}
}
\DeclareRobustCommand*{\fieldofstudy}[1]{%
	\renewcommand{\@miunthesis@fieldofstudy}{#1}
	\let\fieldofstudy\relax
}

\newcommand{\@miunthesis@studyprogramme}{%
	\ClassError{miunthesis}
		{Missing `\noexpand\studyprogramme'}
		{You need a '\noexpand\studyprogramme' in the preamble of the document}
}
\DeclareRobustCommand*{\studyprogramme}[1]{%
	\renewcommand{\@miunthesis@studyprogramme}{#1}
	\let\studyprogramme\relax
}

\newcommand{\@miunthesis@studyprogrammecredits}{%
	\ClassError{miunthesis}
		{Missing `\noexpand\studyprogrammecredits'}
		{You need a '\noexpand\studyprogrammecredits' in the preamble of the document}
}
\DeclareRobustCommand*{\studyprogrammecredits}[1]{%
	\renewcommand{\@miunthesis@studyprogrammecredits}{#1}
	\let\studyprogrammecredits\relax
}

\newcommand{\@miunthesis@examiner}{%
	\ClassError{miunthesis}
		{Missing `\noexpand\examiner'}
		{You need a '\noexpand\examiner' in the preamble of the document}
}
\DeclareRobustCommand*{\examiner}[1]{%
	\renewcommand{\@miunthesis@examiner}{#1}
	\let\examiner\relax
}

\newcommand{\@miunthesis@supervisor}{%
	\ClassError{miunthesis}
		{Missing `\noexpand\supervisor'}
		{You need a '\noexpand\supervisor' in the preamble of the document}
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

\newif\if@titlepage
\@titlepagetrue

\if@titlepage
  \renewcommand\maketitle{\begin{titlepage}%
  \setlength\headheight{59pt}
  \renewcommand{\headrulewidth}{0pt}
  \thispagestyle{fancy}
  \fancyhf{}
  %\rhead{\includegraphics[width=41mm]{Pictures/miun_logo.png}}
  \fancyfoot{}
    \vspace*{0.5cm}
    \fontfamily{phv}\selectfont{%
      \Large{\textbf{\@title}}}
      \\
      \\
      \large{ \@miunthesis@subtitle }
    \\
    \\
    \\
    \large \@author \par
    \vspace*{13cm}

    \fontfamily{phv}
    \renewcommand{\arraystretch}{0.5}
    \begin{tabular}{l}
      \footnotesize{Type of Document --- \@miunthesis@coursename}\\
      \footnotesize{\textbf{\translate{Main field of study}:} \@miunthesis@fieldofstudy}\\
      \footnotesize{\textbf{\translate{Credits}:} \@miunthesis@coursecredits}\\
      \footnotesize{\textbf{\translate{Semester}, \translate{Year}:} \@miunthesis@semester, \the\year{}}\\
      \footnotesize{\textbf{\translate{Supervisor}:} \@miunthesis@supervisor}\\
      \footnotesize{\textbf{\translate{Examiner}:} 
          \@miunthesis@examiner}\\
      \footnotesize{\textbf{\translate{Degree programme}:} \@miunthesis@studyprogramme, \@miunthesis@studyprogrammecredits}\\
    \end{tabular}
    
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
}

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
