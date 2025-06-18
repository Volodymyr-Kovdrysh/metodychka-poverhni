\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sphinxmanual}[2025/01/01 Custom Sphinx Manual with FancyChap]

\LoadClass{memoir}

\RequirePackage{tikz}
\RequirePackage{xcolor}
\definecolor{Sienna}{rgb}{0.627, 0.322, 0.176}
\definecolor{Cornsilk}{rgb}{1.0, 0.972, 0.862}
\definecolor{LightGoldenrod}{rgb}{0.933, 0.867, 0.51}
\definecolor{LightSalmon1}{rgb}{1.0, 0.627, 0.478}

\usetikzlibrary{shapes,positioning}

\makechapterstyle{FancyChap}{
    \setlength\beforechapskip{0pt}
    \setlength\midchapskip{0pt}
    \setlength\afterchapskip{137mm}

    \renewcommand*\printchaptername{}
    \renewcommand*\printchapternum{}

    \def\printchaptertitle##1{
        \begin{tikzpicture}[remember picture,overlay]
            \fill[fill=LightSalmon1,opacity=.7]
            (current page.north west) rectangle
            ([yshift=-3cm]current page.north east);
        \end{tikzpicture}

        \strictpagecheck\checkoddpage
        \ifoddpage
            \begin{tikzpicture}[remember picture,overlay]
                \draw[fill=blue!40!white,draw=blue!80!black]
                    ([yshift=1cm,xshift=-2cm]current page.south east)
                    circle[radius=1cm] node {\sffamily\bfseries\thechapter};
            \end{tikzpicture}

            \begin{tikzpicture}[remember picture,overlay]
                \node[anchor=south west, xshift=20mm, yshift=-30mm,
                      font=\sffamily\bfseries\huge]
                at (current page.north west) {Розділ \thechapter};

                \node[fill=Sienna!80!black,text=white,
                      font=\Huge\bfseries,
                      inner ysep=12pt, inner xsep=20pt,
                      shape=rectangle, rounded corners=5pt,anchor=east,
                      xshift=-20mm,yshift=-30mm]
                at (current page.north east) {##1};
            \end{tikzpicture}
        \else
            \begin{tikzpicture}[remember picture,overlay]
                \draw[fill=blue!40!white,draw=blue!80!black]
                    ([yshift=1cm,xshift=2cm]current page.south west)
                    circle[radius=1cm] node {\sffamily\bfseries\thechapter};
            \end{tikzpicture}

            \begin{tikzpicture}[remember picture,overlay]
                \node[anchor=south east, xshift=-20mm, yshift=-30mm,
                      font=\sffamily\bfseries\huge]
                at (current page.north east) {Розділ \thechapter};

                \node[fill=Sienna!80!black,text=white,
                      font=\Huge\bfseries,
                      inner sep=12pt, inner xsep=20pt,
                      shape=rectangle, rounded corners=5pt,anchor=west,
                      xshift=20mm,yshift=-30mm]
                at (current page.north west) {##1};
            \end{tikzpicture}
        \fi
    }
}

\AtBeginDocument{\chapterstyle{FancyChap}}
