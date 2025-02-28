\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{custom}[2025/01/01 Custom Class for Sphinx]

\LoadClass[a5paper, 12pt, showtrims, twoside,openany,x11names,svgnames]{memoir}

\newenvironment{titlepage}{
  \clearpage
  \thispagestyle{empty}
  
}{\clearpage}

% Налаштування сторінок (A5 формат)
\setstocksize{210mm}{148mm}
\settrimmedsize{\stockheight}{\stockwidth}{*}
\setlrmarginsandblock{20mm}{15mm}{*}
\setulmarginsandblock{20mm}{20mm}{*}
\setheadfoot{\baselineskip}{10mm}
\setlength\headsep{7mm}
\checkandfixthelayout

%%%%%%%%%%
%%% Re-define running headers on non-chapter odd pages
%%%%%%%%%%
\makeoddhead{headings}
%% Left header is empty but I'm using it as a hook to paint the
%% background rectangles underneath everything else
{\begin{tikzpicture}[remember picture,overlay]
\fill[MilkTea!25!white] (current page.north east) 
	rectangle (current page.south west);
\fill[white, rounded corners] 
	([xshift=-10mm,yshift=-20mm]current page.north east) rectangle 	
	([xshift=15mm,yshift=17mm]current page.south west);
\end{tikzpicture}}%
%% Blank centre header
{}%
%% Display a decorate line and the right mark (chapter title)
%% at right end
{\begin{tikzpicture}[xshift=-.75\baselineskip,yshift=.25\baselineskip,remember picture, overlay,fill=GreenTea,draw=GreenTea]\fill circle(3pt);\draw[semithick](0,0) -- (current page.west |- 0,0);\end{tikzpicture}\sffamily\itshape\small\rightmark}




