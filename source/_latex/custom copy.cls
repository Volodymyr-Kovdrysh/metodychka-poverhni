\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{custom}[2025/01/01 Custom Class for Sphinx]

\LoadClass[a5paper, 12pt, showtrims, twoside,openany,x11names,svgnames]{memoir}

\RequirePackage[T2A]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[ukrainian]{babel}

\RequirePackage{geometry}
\RequirePackage{xcolor}
\definecolor{Sienna}{rgb}{0.627, 0.322, 0.176}
\definecolor{Cornsilk}{rgb}{1.0, 0.972, 0.862}
\definecolor{LightGoldenrod}{rgb}{0.933, 0.867, 0.51}
\definecolor{LightSalmon1}{rgb}{1.0, 0.627, 0.478}


\RequirePackage{tikz}
\RequirePackage{eso-pic}
\RequirePackage{everypage}

\usetikzlibrary{shapes,positioning}

%  \RequirePackage{titlesec}

\geometry{
  a5paper,
  left=20mm,
  right=15mm,
  top=20mm,
  bottom=20mm
}
% \checkandfixthelayout
% \makechapterstyle{FancyChap}{
%     \setlength\beforechapskip{0pt}
%     \setlength\midchapskip{0pt}
%     \setlength\afterchapskip{137mm}

%     \renewcommand*\printchaptername{}
%     \renewcommand*\printchapternum{}

%     \def\printchaptertitle##1{
%         % Малюємо верхній фон як TikZ-малюнок (замість картинки)
%         \begin{tikzpicture}[remember picture,overlay]
%             \fill[fill={rgb,255:red,255;green,200;blue,150},opacity=.7]
%             (current page.north west) rectangle
%             ([yshift=-3cm]current page.north east);
%         \end{tikzpicture}

%         \strictpagecheck\checkoddpage
%         \ifoddpage
%             % Лого в нижньому правому куті (теж TikZ, можеш додати свою геометрію)
%             \begin{tikzpicture}[remember picture,overlay]
%                 \draw[fill=blue!40!white,draw=blue!80!black] 
%                     ([yshift=1cm,xshift=-2cm]current page.south east) 
%                     circle[radius=1cm] node {\sffamily\bfseries\thechapter};
%             \end{tikzpicture}

%             % Заголовок розділу
%             \begin{tikzpicture}[remember picture,overlay]
%                 \node[anchor=south west, xshift=20mm, yshift=-30mm,
%                       font=\sffamily\bfseries\huge]
%                 at (current page.north west) {Розділ \thechapter};

%                 \node[fill=Sienna!80!black,text=white,
%                       font=\Huge\bfseries,
%                       inner ysep=12pt, inner xsep=20pt,
%                       shape=rectangle, rounded corners=5pt,anchor=east,
%                       xshift=-20mm,yshift=-30mm]
%                 at (current page.north east) {##1};
%             \end{tikzpicture}
%         \else
%             % Лого в нижньому лівому куті
%             \begin{tikzpicture}[remember picture,overlay]
%                 \draw[fill=blue!40!white,draw=blue!80!black] 
%                     ([yshift=1cm,xshift=2cm]current page.south west) 
%                     circle[radius=1cm] node {\sffamily\bfseries\thechapter};
%             \end{tikzpicture}

%             % Заголовок розділу для парної сторінки
%             \begin{tikzpicture}[remember picture,overlay]
%                 \node[anchor=south east, xshift=-20mm, yshift=-30mm,
%                       font=\sffamily\bfseries\huge]
%                 at (current page.north east) {Розділ \thechapter};

%                 \node[fill=Sienna!80!black,text=white,
%                       font=\Huge\bfseries,
%                       inner sep=12pt, inner xsep=20pt,
%                       shape=rectangle, rounded corners=5pt,anchor=west,
%                       xshift=20mm,yshift=-30mm]
%                 at (current page.north west) {##1};
%             \end{tikzpicture}
%         \fi
%     }
% }


%% Define a fancy chapter style for unnumbered
%% chapters (e.g. the Table of Contents)
\makechapterstyle{FancyChap}{
%% Vertical Space before main text starts
\setlength\beforechapskip{0pt}
\setlength\midchapskip{0pt}
\setlength\afterchapskip{47mm}
%% Will print chapter number and title
%% in one go ourselves
\renewcommand*\printchaptername{}
\renewcommand*\printchapternum{}
%%% Re-define how the chapter title is printed
\def\printchaptertitle##1{
%% Draw a semi-transparent rectangle across the top
\tikz[overlay,remember picture]
  \fill[fill=LightSalmon1,opacity=.7]
  (current page.north west) rectangle 
  ([yshift=-3cm] current page.north east);
  %% Check if on an odd or even page
  \strictpagecheck\checkoddpage
  \ifoddpage{
    \begin{tikzpicture}[remember picture, overlay]
    \node[fill=Sienna!80!black,text=white,
      font=\Huge\bfseries, 
      inner ysep=12pt, inner xsep=20pt,
      rounded rectangle,anchor=east, 
      xshift=-20mm,yshift=-30mm] 
      at (current page.north east) {##1};
    \end{tikzpicture}
  }
  \else {
    \begin{tikzpicture}[remember picture, overlay]
    \node[fill=Sienna!80!black,text=white,
      font=\Huge\bfseries,
      inner sep=12pt, inner xsep=20pt,
      rounded rectangle,anchor=west,
      xshift=20mm,yshift=-30mm] 
      at ( current page.north west) {##1};
    \end{tikzpicture}
  }
  \fi
}
}


% Відключаємо дефолтні стилі сторінок
\AtBeginDocument{\pagestyle{empty}}
\AtBeginDocument{\chapterstyle{FancyChap}}


% Перевизначення вигляду заголовків розділів та секцій
% \titleformat{\chapter}[block]{\Large\bfseries}{\S \thechapter}{1em}{}
% \titleformat{\section}[hang]{\large\bfseries}{\thesection}{1em}{}
% \renewcommand{\chaptername}{Розділ}
% \renewcommand{\thesection}{\arabic{section}}


% Хук для рамок та номерів сторінок
\AddEverypageHook{%
\begingroup
    \begin{tikzpicture}[remember picture,overlay]
        \fill[fill={rgb,255:red,200;green,200;blue,200}]
            (current page.south west) rectangle (current page.north east);
        \ifodd\value{page}
            \fill[white,rounded corners=10pt]
                (current page.south west) ++(20mm,20mm)
                rectangle
                ([xshift=-15mm,yshift=-20mm]current page.north east);
            \draw[thick,blue,rounded corners=10pt]
                (current page.south west) ++(20mm,20mm)
                rectangle
                ([xshift=-15mm,yshift=-20mm]current page.north east);
            \filldraw[fill=white, draw=blue, thick]
                ([xshift=-15mm, yshift=10mm]current page.south east) circle (7mm);
            \node at ([xshift=-15mm, yshift=10mm]current page.south east) {\sffamily\bfseries\thepage};
        \else
            \fill[white,rounded corners=10pt]
                (current page.south west) ++(15mm,20mm)
                rectangle
                ([xshift=-20mm,yshift=-20mm]current page.north east);
            \draw[thick,red,rounded corners=10pt]
                (current page.south west) ++(15mm,20mm)
                rectangle
                ([xshift=-20mm,yshift=-20mm]current page.north east);
            \filldraw[fill=white, draw=red, thick]
                ([xshift=15mm, yshift=10mm]current page.south west) circle (7mm);
            \node at ([xshift=15mm, yshift=10mm]current page.south west) {\sffamily\bfseries\thepage};
        \fi
    \end{tikzpicture}
\endgroup
}



% Кастомна обкладинка
\newcommand{\CustomCoverPage}{%

\clearpage
\thispagestyle{empty}
\begin{tikzpicture}[remember picture,overlay]
    \fill[gray!20] (current page.south west) rectangle (current page.north east);
    \node[fill={rgb,255:red,160;green,82;blue,45},text=white,font=\LARGE\bfseries,
    minimum width=\paperwidth,minimum height=5em,anchor=north] 
    at (current page.north) {Методичні вказівки};

    \node[anchor=center] at (current page.center) {\bfseries\itshape\color[rgb]{0.933, 0.867, 0.51}\fontsize{36pt}{46pt}\selectfont Поверхні другого порядку};

    \node[fill={rgb,255:red,160;green,82;blue,45},text=white,font=\LARGE\bfseries,
    minimum width=\paperwidth,minimum height=3em,anchor=south]
    at (current page.south) {2025 рік, ЧНУ};
\end{tikzpicture}
\clearpage  

\cleartorecto 
\thispagestyle{empty}
}

\AtBeginDocument{\CustomCoverPage}

