% Author: Aaro Koinsaari
% License: MIT License

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{academic_cover_letter}[2024/12/26 Class for an academic cover letter]

\LoadClass[a4paper,11pt]{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[vmargin=1.5cm, hmargin=2cm]{geometry}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{xcolor}
\RequirePackage{xstring}
\RequirePackage{graphicx}
\RequirePackage{fontawesome5}
\RequirePackage[document]{ragged2e}
\RequirePackage{setspace}
\usepackage[default]{lato}
\usepackage{titlesec}

\setstretch{1.1}
\pagestyle{empty}

\titleformat{\section}
  {\bfseries\Large}
  {}
  {0pt}
  {}

% Personal information
\newcommand{\personalinfo}[4]{
\begin{flushleft}
    {\large\bfseries #1}\\  % name
    \begin{minipage}[t]{0.6\textwidth}
    #2  % location
    \end{minipage}%
    \begin{minipage}[t]{0.4\textwidth}  % date ragged right
    \raggedleft
    \itshape \today
    \end{minipage}\\
    \ifx&#3&  % phone
    \else
    \StrDel{#3}{ }[\cleanphone]
    \href{tel:\cleanphone}{#3}\\
    \fi
    \ifx&#4&  % email
    \else
    \href{mailto:#4}{#4}
    \fi
\end{flushleft}
\vspace{1.5em}
}

% Addressee information
\newcommand{\addressee}[3]{
  \begin{flushright}
    {\large\bfseries #1}\\  % name
    #2\\  % city/state
    #3  % country
  \end{flushright}
  \vspace{1.5em}
}

% Title
\newcommand{\heading}[1]{
  \noindent
  \begin{flushleft}
    \normalsize \bfseries #1
  \end{flushleft}
  \vspace{2em}
}

% Paragraph content
\newcommand{\content}[1]{
  \emergencystretch=2em
  \justifying
  \noindent #1\par
  \vspace{1.5em}
}

% Signature.
% Ensure the signature image file (#2) is carefully cropped so that
% there is no extra padding or margins around the signature.
\newcommand{\signature}[3]{
  \vspace{1em}
  \begin{flushleft}
    {\normalsize #1}\\
    \vspace{1em}
    \ifx&#2&
    \else
      \includegraphics[width=4cm]{#2}\\[0.5em]  % adjust the width if needed
    \fi
    {\normalsize #3}
  \end{flushleft}
}