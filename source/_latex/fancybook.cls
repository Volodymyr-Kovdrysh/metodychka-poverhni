% fancybook.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fancybook}[2025/06/07 Custom memoir-based class]

\LoadClass[12pt,twoside,openany,ukrainian]{memoir}
\PassOptionsToPackage{svgnames,table,x11names}{xcolor}


% --- Налаштування для формату A5 (210мм × 148мм) ---
\setstocksize{210mm}{148mm} % фізичний розмір паперу
\settrimmedsize{\stockheight}{\stockwidth}{*} % обрізаний розмір

% Поля: внутрішнє/зовнішнє 15/15мм, верхнє/нижнє 20/15мм
\setlrmarginsandblock{15mm}{15mm}{*}  % ліве/праве поле
\setulmarginsandblock{20mm}{15mm}{*}  % верхнє/нижнє поле

% Висота колонтитулів
\setheadfoot{\baselineskip}{10mm}
\setlength\headsep{7mm}  % відстань від колонтитула до тексту

% Застосування розмітки
\checkandfixthelayout




\RequirePackage[T2A]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{graphicx}
\RequirePackage[english,ukrainian]{babel}
% \RequirePackage{sphinx}

\RequirePackage{indentfirst}
\RequirePackage{paratype}
\RequirePackage{amsmath}
\RequirePackage{wallpaper}
\RequirePackage{xcolor}
\RequirePackage{tikz}
\usetikzlibrary{shapes,positioning}
\RequirePackage{lipsum}
\RequirePackage[ISBN=000-00-00000-00-0]{ean13isbn}

\tolerance=9999


\AtBeginDocument{
  \renewcommand{\contentsname}{Зміст}
  % \renewcommand{\lofname}{Список рисунків}
  % \renewcommand{\lotname}{Список таблиць}
  \renewcommand{\chaptername}{Розділ}
}


\newcommand{\sphinxhyphen}{-}
\newcommand{\sphinxAtStartPar}{}
\newenvironment{sphinxadmonition}[2]{%
  \par\medskip
  \noindent\textbf{#2.}%
  \begin{quote}
}{%
  \end{quote}\medskip
}

\newcommand{\sphinxincludegraphics}[2][]{%
  \noindent{\hspace*{\fill}\includegraphics[#1]{#2}\hspace*{\fill}}%
}

\newcommand{\sphinxstyleemphasis}[1]{\emph{#1}}


%% Command to hold chapter illustration image
\newcommand\chapterillustration{}

\makechapterstyle{FancyChap}{
  \setlength\beforechapskip{0pt}
  \setlength\midchapskip{0pt}
  \setlength\afterchapskip{25mm}
  %% Will print chapter number and title
  %% in one go ourselves
  \renewcommand*\printchaptername{}
  \renewcommand*\printchapternum{}

  \def\printchaptertitle##1{

  \tikz[overlay,remember picture]
  \fill[fill=LightSalmon1,opacity=.7]
  (current page.north west) rectangle 
  ([yshift=-3cm] current page.north east);
  %% Check if on an odd or even page
  \strictpagecheck\checkoddpage
  %% On odd pages, "logo" image at lower right
  %% corner; Chapter number printed near spine
  %% edge (near the left); chapter title printed
  %% near outer edge (near the right).
  \ifoddpage{

    \begin{tikzpicture}[overlay,remember picture]
    \node[anchor=south west,
      xshift=10mm,yshift=-15mm,
      font=\sffamily\bfseries\huge] (chap)
      at (current page.north west) 
      {\chaptername\chapternamenum\thechapter};
    \node[fill=Sienna!80!black,
      text=white,
      text width=0.6\textwidth,
      font=\Huge\bfseries, 
      inner ysep=12pt, inner xsep=20pt,
      rounded rectangle,
      anchor=north west, 
      % xshift=-20mm,
      % yshift=-30mm,
      draw] 
      at (chap.south) {##1};
    \end{tikzpicture}
  }
  %% On even pages, "logo" image at lower left
  %% corner; Chapter number printed near outer
  %% edge (near the right); chapter title printed
  %% near spine edge (near the left).
  \else {

    \begin{tikzpicture}[overlay,remember picture]
    \node[anchor=south east,
      xshift=-10mm,yshift=-15mm,
      font=\sffamily\bfseries\huge] (chap)
      at (current page.north east)
      {\chaptername\chapternamenum\thechapter};
    \node[fill=Sienna!80!black,
      text=white,
      text width=0.6\textwidth,
      font=\Huge\bfseries,
      inner sep=12pt, inner xsep=20pt,
      rounded rectangle,
      anchor=north east,
      % xshift=20mm,yshift=-30mm
      draw] 
      at ( chap.south) {##1};
    \end{tikzpicture}
  }
  \fi

  }

}





%% Define a fancy chapter style for unnumbered
%% chapters (e.g. the Table of Contents)
\makechapterstyle{FancyUnnumberedChap}{
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




\newlength\pagenumwidth
\settowidth{\pagenumwidth}{99}
%% Define style of page number colour box
\tikzset{pagefooter/.style={
anchor=base,font=\sffamily\bfseries\small,
text=white,fill=Sienna!80!black,text centered,
text depth=17mm,text width=\pagenumwidth}}

%% Concoct some colours of our own
\definecolor[named]{GreenTea}{HTML}{CAE8A2}
\definecolor[named]{MilkTea}{HTML}{C5A16F}


\makepagestyle{headings}
%% Sometimes I prefer not to upper-case my
%% running headers
\nouppercaseheads



%%%%%%%%%%
%%% Re-define running headers on non-chapter odd pages
%%%%%%%%%%
\makeoddhead{headings}
%% Left header is empty but I'm using it as a hook to paint the
%% background rectangles underneath everything else
{
  \begin{tikzpicture}[remember picture,overlay]
    \fill[MilkTea!25!white] (current page.north east) rectangle (current page.south west);
    \fill[white, rounded corners] ([xshift=-14mm,yshift=-19mm]current page.east) rectangle ([xshift=14mm,yshift=14mm]current page.south west);
  \end{tikzpicture}
}%
%% Blank centre header
{}%
%% Display a decorate line and the right mark (chapter title)
%% at right end
{
  \begin{tikzpicture}[xshift=-.75\baselineskip,yshift=.25\baselineskip,remember picture, overlay,fill=green,draw=green]
    \fill circle(3pt);
    \draw[semithick](0,0) -- (current page.west |- 0,0);
  \end{tikzpicture}
  \sffamily\itshape\small\rightmark
}

%%%%%%%%%%
%%% Re-define running footers on odd pages
%%% i.e. display the page number on the right
%%%%%%%%%%
\makeoddfoot{headings}{}{}{%
\tikz[baseline]\node[pagefooter]{\thepage};}

\makeoddfoot{plain}{}{}{\tikz[baseline]\node[pagefooter]{\thepage};}


%%%%%%%%%%
%%% Re-define running headers on non-chapter even pages
%%%%%%%%%%
\makeevenhead{headings}
{
  \begin{tikzpicture}[remember picture,overlay]
    \fill[MilkTea!25!white] (current page.north east) rectangle (current page.south west);
    \fill[white, rounded corners] ([xshift=-14mm,yshift=-19mm]current page.north east) rectangle ([xshift=14mm,yshift=14mm]current page.south west);
  \end{tikzpicture}

  \sffamily\itshape\small\leftmark\ 
  \begin{tikzpicture}[xshift=.5\baselineskip,
                      yshift=.25\baselineskip,
                      remember picture, 
                      overlay,fill=GreenTea,
                      draw=GreenTea] 
    \fill (0,0) circle (3pt); 
    \draw[semithick](0,0) -- (current page.east |- 0,0 );
  \end{tikzpicture}
}
{}
{}

\makeevenfoot{headings}{\tikz[baseline]\node[pagefooter]{\thepage};}{}{}

\makeevenfoot{plain}{\tikz[baseline]\node[pagefooter]{\thepage};}
%% Empty centre and right headers on even pages
{}{}



\nouppercaseheads
\pagestyle{headings}


\makeatletter
\let\@maketitle\relax  % скидає попереднє визначення, щоб уникнути помилки
\newcommand{\@maketitle}{
  \frontmatter
  \thispagestyle{empty}
  \null\vskip 2em%
  \tikz[remember picture,overlay]%
\node[fill=Sienna,text=white,font=\LARGE\bfseries,text=Cornsilk,%
minimum width=\paperwidth,minimum height=5em,anchor=north]%
at (current page.north){Cum reverentia lectoribus};

  \begin{center}%
    {\LARGE \bfseries \@author \par}%
    \vskip 1.5em%
    {\large \lineskip .5em%
     \begin{tabular}[t]{c}%
       %\@author
       \booktype
     \end{tabular}\par}%
     \vspace*{2\baselineskip}

     {\LARGE\color{LightGoldenrod}
     \booktitle
     }
     
    
  \end{center}%

  
  
  \tikz[remember picture,overlay]%
  \node[fill=Sienna,font=\LARGE\bfseries,text=Cornsilk,%
  minimum width=\paperwidth,minimum height=3em,anchor=south]%
   at (current page.south) {ФМІ, 2025 рік, ЧНУ};
  
 \cleartorecto
 
}
\renewcommand{\maketitle}{%
  \cleardoublepage
  \@maketitle
  \thispagestyle{empty}
  \setcounter{footnote}{0}%
  \let\thanks\relax
}
\newcommand{\sphinxstepscope}{%
  % За замовчуванням нічого не робить
  % Якщо потрібно — тут можна встановити інший стиль
}
\makeatother




\endinput


