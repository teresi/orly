% !TEX TS-program = XeLaTeX      Must use XeLaTeX to compile
% !TEX encoding = UTF-8 Unicode  File must be encoded at UTF-8

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{orly}[meme orly book cover]


\LoadClass[]{article}
\frenchspacing                  % one space after period
\pagenumbering{gobble}          % no page numbers

\PassOptionsToPackage{papersize}{geometry}
\RequirePackageWithOptions{geometry}

\RequirePackage{graphicx}
\RequirePackage{fontspec}
\RequirePackage{tikz}
\RequirePackage{pst-barcode}
\usetikzlibrary{calc}
\RequirePackage{lipsum}
\RequirePackage{xfp}
\RequirePackage[rgb]{xcolor}


\setmainfont{FreeSerif}
%\definecolor{linux}{HTML}{920F02}
\definecolor{linux}{HTML}{912113}
\definecolor{programming}{HTML}{B63E97}
\definecolor{data}{HTML}{E41736}

\newcommand{\backsubtitle}{Unix Programming}

% TODO just convert everything to pt, add 'pt' suffix, update tikz calls

% Midori A5 notebook is 14.81 x 21.01 x 1.054 cm
\newcommand{\pttocm}{0.0352778}             % points per centimeter
\newcommand{\coverwidth}{14.8 / \pttocm}    % bookcover width
\newcommand{\coverheight}{21.0 / \pttocm}   % bookcover height
\newcommand{\spinewidth}{1.054 / \pttocm}   % bookcover spine width

\newcommand{\pagewidth}{\fpeval{\coverwidth}}  % combined cover width
\newcommand{\pageheight}{\coverheight}                           % combined cover height

%\newfontfamily\oreilly{VL PGothic}
\newfontfamily\oreilly{IPAexGothic}

% banner
% NB in centimeters
\newcommand{\bcolor}{linux}           % banner color
\newcommand{\bheight}{0.4 cm}         % banner height   % TODO in cm, convert to pt
\newcommand{\bwidthpercent}{0.85}
\newcommand{\bwidth}{\fpeval{(\coverwidth * \bwidthpercent * \pttocm)}cm}
\newcommand{\bmargin}{\fpeval{(\coverwidth * (1-\bwidthpercent) * 0.5 * \pttocm)}cm}           % banner xoffset  % TODO in cm, convert to pt

\newcommand{\xshift}{\fpeval{(\paperwidth - \pagewidth) * 0.5 * \pttocm}cm}
\newcommand{\yshift}{\fpeval{(\paperheight - \pageheight) * 0.5 * \pttocm}cm}

% for the print lines, delta from the edge of the cover
\newcommand{\cutoff}{24pt}

\newcommand\cutlines[0]{%
    % cut lines, vertical
    \begin{tikzpicture}[remember picture, overlay, shift={(current page.north west)}, xshift=\xshift]
        \draw[draw=black] (0, -\yshift + \cutoff)--(0, 0);
        \draw[draw=black] (\pagewidth pt, -\yshift + \cutoff)--(\pagewidth pt, 0);

        \draw[draw=black] (0, -\yshift-\coverheight pt -\cutoff)  --(0, -\paperheight);
        \draw[draw=black] (\pagewidth pt, -\yshift-\coverheight pt -\cutoff)  --(\pagewidth pt, -\paperheight);
    \end{tikzpicture}

    % cut lines, horizontal
    \begin{tikzpicture}[remember picture, overlay, shift={(current page.north west)}, yshift=-\yshift]
        \draw[draw=black] (\xshift -\cutoff, 0)--(0, 0);
        \draw[draw=black] (\xshift + \pagewidth + \cutoff, 0)--(\paperwidth, 0);

        \draw[draw=black] (\xshift -\cutoff, -\pageheight pt)--(0, -\pageheight pt);
        \draw[draw=black] (\xshift + \pagewidth + \cutoff, -\pageheight pt)--(\paperwidth, -\pageheight pt);
    \end{tikzpicture}
}



% rulers to verify scaling
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
\newcommand{\hrulercentimeter}[2]{
\begin{tikzpicture}[remember picture, overlay, shift={(current page.north west)}, xshift=#1, yshift=#2]
    \filldraw [fill=black, draw=black] (0cm, 0) rectangle ++(1cm, -0.2 cm);
    \filldraw [fill=white, draw=black] (1cm, 0) rectangle ++(1cm, -0.2 cm);
    \filldraw [fill=black, draw=black] (2cm, 0) rectangle ++(1cm, -0.2 cm);
    \filldraw [fill=white, draw=black] (3cm, 0) rectangle ++(1cm, -0.2 cm);
    \filldraw [fill=black, draw=black] (4cm, 0) rectangle ++(1cm, -0.2 cm);
    \node at +(0cm,-0.5cm) {$cm$};
    \node at +(5cm,-0.5cm) {5};
\end{tikzpicture}
}

\newcommand{\rulercircle}[2]{
\begin{tikzpicture}[remember picture, overlay, shift={(current page.north west)}, xshift=#1, yshift=#2]
\filldraw[fill=none] (0,0) -- (0.5in,0) arc (0:360:0.5in) -- cycle;
\filldraw[fill=black] (0,0) -- (0.5in,0) arc (0:90:0.5in) -- cycle;
\filldraw[fill=black] (0,0) -- (-0.5in,0) arc (0:90:-0.5in) -- cycle;
\end{tikzpicture}
}

\newcommand{\rulerhorz}[2]{
\begin{tikzpicture}[remember picture, overlay, shift={(current page.north west)}, xshift=#1, yshift=#2]
    \filldraw [fill=black, draw=black] (0.0in, 0) rectangle ++(0.1in, -0.1in);
    \filldraw [fill=white, draw=black] (0.1in, 0) rectangle ++(0.1in, -0.1in);
    \filldraw [fill=black, draw=black] (0.2in, 0) rectangle ++(0.1in, -0.1in);
    \filldraw [fill=white, draw=black] (0.3in, 0) rectangle ++(0.1in, -0.1in);
    \filldraw [fill=black, draw=black] (0.4in, 0) rectangle ++(0.1in, -0.1in);
    \filldraw [fill=white, draw=black] (0.5in, 0) rectangle ++(0.1in, -0.1in);
    \filldraw [fill=black, draw=black] (0.6in, 0) rectangle ++(0.1in, -0.1in);
    \filldraw [fill=white, draw=black] (0.7in, 0) rectangle ++(0.1in, -0.1in);
    \filldraw [fill=black, draw=black] (0.8in, 0) rectangle ++(0.1in, -0.1in);
    \filldraw [fill=white, draw=black] (0.9in, 0) rectangle ++(0.1in, -0.1in);
    \node at +(0.0in,-0.5cm) {$in$};
    \node at +(1.0in,-0.5cm) {1.0};
\end{tikzpicture}
}

\newcommand{\rulervert}[2]{
\begin{tikzpicture}[remember picture, overlay, shift={(current page.north west)}, xshift=#1, yshift=#2]
    \filldraw [fill=black, draw=black] (0, -0.0in) rectangle ++(0.1in, -0.1in);
    \filldraw [fill=white, draw=black] (0, -0.1in) rectangle ++(0.1in, -0.1in);
    \filldraw [fill=black, draw=black] (0, -0.2in) rectangle ++(0.1in, -0.1in);
    \filldraw [fill=white, draw=black] (0, -0.3in) rectangle ++(0.1in, -0.1in);
    \filldraw [fill=black, draw=black] (0, -0.4in) rectangle ++(0.1in, -0.1in);
    \filldraw [fill=white, draw=black] (0, -0.5in) rectangle ++(0.1in, -0.1in);
    \filldraw [fill=black, draw=black] (0, -0.6in) rectangle ++(0.1in, -0.1in);
    \filldraw [fill=white, draw=black] (0, -0.7in) rectangle ++(0.1in, -0.1in);
    \filldraw [fill=black, draw=black] (0, -0.8in) rectangle ++(0.1in, -0.1in);
    \filldraw [fill=white, draw=black] (0, -0.9in) rectangle ++(0.1in, -0.1in);
    \node at +(-0.2in,-0.0in) {$in$};
    \node at +(-0.2in,-1.0in) {1.0};
\end{tikzpicture}
}
