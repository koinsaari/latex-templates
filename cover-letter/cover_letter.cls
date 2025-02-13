% Author: Aaro Koinsaari
% License: MIT License

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cover_letter}[2024/12/28 Class for cover letters]

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

% Color definitions
\definecolor{primary}{HTML}{000000}
\definecolor{secondary}{HTML}{515151}
\definecolor{firstname}{HTML}{555555}
\definecolor{lastname}{HTML}{444444}

% Personal information in title format.
% More towards job applications highlighting your name and
% contact information
\newcommand{\nametitle}[6]{
  \vspace{15pt}
  \centering{
    \fontsize{40pt}{50pt}\selectfont
    \color{firstname}{\fontseries{l}\selectfont #1}
    \color{lastname}{\fontseries{m}\selectfont #2}
  } \\[5pt]
  \centering{
    \color{secondary}
    \fontsize{11pt}{14pt}\selectfont
    \href{mailto:#3}{\faEnvelope\ #3} \hspace{0.5em} | \hspace{0.5em}
    \ifx&#4&  % phone
    \else
      \StrDel{#4}{ }[\cleanphone]  % cleans possible spaces from the link
      \faPhone\ \href{tel:\cleanphone}{#4} \hspace{0.5em} | \hspace{0.5em}
    \fi
    \href{#5}{\faLinkedin\ LinkedIn} \hspace{0.5em} | \hspace{0.5em}
    \href{#6}{\faGithub\ GitHub}
  }
  \color{secondary}\rule{\linewidth}{0.4pt}
  \vspace{-10pt}
}

% Personal information dragged left with date on right.
% Suited more towards academic and admission letters where
% huge titles are not ideal
\newcommand{\personalinfo}[4]{
\begin{flushleft}
    {\large\bfseries #1}\\  % name
    \begin{minipage}[t]{0.6\textwidth}
    #2  % location
    \end{minipage}%
    \begin{minipage}[t]{0.4\textwidth}  % date ragged right
    \raggedleft
    {\itshape \textcolor{secondary}{\today}}
    \end{minipage}\\
    \ifx&#3&  % phone
    \else
    \StrDel{#3}{ }[\cleanphone]  % cleans possible spaces from the link
    \href{tel:\cleanphone}{#3}\\
    \fi
    \ifx&#4&  % email
    \else
    \href{mailto:#4}{#4}
    \fi
\end{flushleft}
\vspace{1.5em}
}

% Addressee information on right
\newcommand{\addresseeright}[3]{
  \begin{flushright}
    {\large\bfseries #1}\\  % name
    #2\\  % city/state
    #3  % country
  \end{flushright}
  \vspace{1.5em}
}

% Addressee information on left with optional date
% on the same line on the right on city/state level
\newcommand{\addresseeleft}[4][]{
  \begin{flushleft}
    {\large\bfseries #2}\\  % name
    \begin{minipage}[t]{0.6\textwidth}
      #3  % city/state
    \end{minipage}%
    \ifx&#1&
    \else
      \begin{minipage}[t]{0.4\textwidth}
        \raggedleft
        \itshape \textcolor{secondary}{#1}  % current date if provided
      \end{minipage}%
    \fi\\
    #4  % country
  \end{flushleft}
  \vspace{1em}
}

% Content title stating the purpose of the letter
\newcommand{\contenttitle}[1]{
  \noindent
  \begin{flushleft}
    {\color{primary}\normalsize \bfseries #1}
  \end{flushleft}
  \vspace{1em}
}

% Paragraph content
\newcommand{\content}[1]{
  \emergencystretch=2em
  \justifying
  {\color{primary}\noindent #1\par}
  \vspace{1.5em}
}

% Signature.
% Ensure the signature image file (#2) is carefully cropped so that
% there is no extra padding or margins around the signature.
\newcommand{\signature}[3]{
  \begin{flushleft}
    {\color{primary}\normalsize #1}\\
    \vspace{1em}
    \ifx&#2&
    \else
      \includegraphics[width=4cm]{#2}\\[0.5em]  % adjust the width if needed
    \fi
    {\color{primary}\normalsize #3}
  \end{flushleft}
}
