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


\newcommand{\pttocm}{0.0352778}             % points per centimeter

\setmainfont{FreeSerif}
\newfontfamily\oreilly{IPAexGothic}         % try VL PGothic | IPAexGothic

\definecolor{linux}{HTML}{912113}           % try 912113 | 920F02
\definecolor{programming}{HTML}{B63E97}
\definecolor{data}{HTML}{E41736}


% TODO should move some of these to class options

%%% OPTIONS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%% MEASUREMENTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% renew these commands to your measurements prior to drawing
% TODO just convert everything to pt, add 'pt' suffix, update tikz calls

\newcommand{\coverwidth}{14.81 / \pttocm}    % Midori A5 is 14.81  cm
\newcommand{\coverheight}{21.01 / \pttocm}   % Midori A5 is 21.01  cm
\newcommand{\spinewidth}{1.054 / \pttocm}    % Midori A5 is  1.054 cm

\newcommand{\pagewidth}{\fpeval{\coverwidth}}  % combined cover width
\newcommand{\pageheight}{\coverheight}         % combined cover height

% banner
% NB in centimeters
\newcommand{\bcolor}{linux}           % banner color
\newcommand{\bheight}{0.4 cm}         % banner height   % TODO in cm, convert to pt
\newcommand{\bwidthpercent}{0.82}
\newcommand{\bwidth}{\fpeval{(\coverwidth * \bwidthpercent * \pttocm)}cm}
\newcommand{\bmargin}{\fpeval{(\coverwidth * (1-\bwidthpercent) * 0.5 * \pttocm)}cm}           % banner xoffset  % TODO in cm, convert to pt

% front
\newcommand{\xshift}{\fpeval{(\paperwidth - \pagewidth) * 0.5 * \pttocm}cm}
\newcommand{\yshift}{\fpeval{(\paperheight - \pageheight) * 0.5 * \pttocm}cm}

% front offset
\newcommand{\xfrontshift}{\fpeval{\xshift}pt}                 % redefine this if using in the dust cover
\newcommand{\titleoffset}{\fpeval{\coverheight * 0.55 * -1}}  % vertical offset
\newcommand{\titleheight}{\fpeval{round(\coverheight * 0.3 )}}


%%% DRAWING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

\newcommand\showframe[0]{%
    \begin{tikzpicture}[remember picture, overlay, shift={(current page.north west)}]
        \draw[draw=black] (\xshift, -\yshift) rectangle ++(\pagewidth pt,-\pageheight pt);  % front cover
        \draw[draw=black] (\xshift, -\yshift) rectangle ++(\coverwidth pt, -\coverheight pt);  % back cover
        \draw[draw=black] (\xshift + 0.5*\coverwidth pt, -\yshift) rectangle ++(0, -\pageheight pt);  % back cover, midpoint
    \end{tikzpicture}
}

\newcommand\topbanner[0]{
    \begin{tikzpicture}[remember picture, overlay, shift={(current page.north west)}, xshift=\xfrontshift, yshift=-\yshift]
        \filldraw [fill=\bcolor, draw=\bcolor] (\bmargin, 0) rectangle ++(\bwidth, -\bheight);

        \node[anchor=north west, font=\itshape] at + ($(\bwidth*0.3, -\bheight)$)
            {\large What has never worked can never be lost};
    \end{tikzpicture}
}

\newcommand\titlebanner[0]{
    \begin{tikzpicture}[remember picture, overlay, shift={(current page.north west)}, xshift=\xfrontshift, yshift=-\yshift]
        \filldraw [fill=\bcolor, draw=white] (\bmargin, \titleoffset pt) rectangle ++(\bwidth, -\titleheight pt);
    \end{tikzpicture}
}


%\newcommand{\barcodeyshift}{\fpeval{\coverwidth + \yshift - 12pt} pt}
\newcommand\backcover[2]{
    % 1:  short title above the lipsum
    % 2:  book category, e.g. 'Unix Programming'

    \begin{tikzpicture}[remember picture, overlay, shift={(current page.north west)}, xshift=\xshift, yshift=-\yshift]

        \node[anchor=north west] at + ($(\bmargin, -1*\bheight)$)
            {#2};

        \node[anchor=north west] at + ($(0.4*\coverwidth pt, -1.8*\bheight)$)
            {\huge \oreilly O'RLY\small$^\textsuperscript{\textregistered}$};

        \filldraw [fill=\bcolor, draw=\bcolor] (\bmargin, -4*\bheight) rectangle ++(\bwidth, -\bheight);

        \node[anchor=north west] at + ($(\bmargin, -5.5*\bheight)$)
            {\huge \textbf #1};

        \node[anchor=north west, text width=\bwidth] at + ($(\bmargin, -7.75*\bheight)$)
            {\lipsum[3-4]};
    \end{tikzpicture}

    % NOTE something is wrong with the coordinates of the barcode, it doesn't respect the units or location
    % placing it through trial and error
    % adjusting this position is more trouble than it's worth at the moment
    % position is not same between back cover / dust cover
%    \begin{pspicture}(0,0)
%        \psbarcode[transy=-\barcodeyshift, transx=0.4cm]{0080085}{includetext height=0.4 width=0.8}{upce}
%    \end{pspicture}
}




%%% RULERS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% used to verify scaling of print, as sometimes scale is applied to keep image within print margins

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
