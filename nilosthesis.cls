% From OUP/Overleaf for Genetics, modified by Nilo Merino Recalde:
% https://github.com/nilomr

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nilosthesis}[2022/04/01, v1.11]
\AtEndOfClass{\RequirePackage{microtype}}

% Options for element switching
\RequirePackage{xifthen}
\newboolean{displaycopyright}
\newboolean{displaylineno}
\setboolean{displaylineno}{false}

\DeclareOption{lineno}{\setboolean{displaylineno}{true}}
% \DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
% \ProcessOptions*
% \LoadClass{extarticle}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extreport}}
\ProcessOptions*
\LoadClass{extreport}


% April 16, 2016:
% Line numbers
% v1.8 April 12, 2018: make sure line numbers are
% displayed in outer margins of columns; so
% remove "running" option somehow gets it right
\RequirePackage[]{lineno}
\renewcommand{\linenumberfont}{\selectfont\sffamily\small\color{lessLight}}
%v1.11 April 1, 2022: re-add line numbers that were accidentally removed in 1.10
\ifthenelse{\boolean{displaylineno}}{\linenumbers}{}

% Fonts and language
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}
\RequirePackage{amsmath,amsfonts,amssymb}
\RequirePackage{mathpazo}
\RequirePackage[scaled]{helvet}
\RequirePackage[T1]{fontenc}
\RequirePackage{url}
\RequirePackage[colorlinks=true, allcolors=hypercolor]{hyperref}
\addto\extrasenglish{%
  \def\chapterautorefname{Chapter}%
}

\usepackage{gensymb} % for degree symbol

\hypersetup{ 
colorlinks=true,
citecolor=hypercolor,
filecolor=hypercolor,
linkcolor=hypercolor,
urlcolor=hypercolor}

\RequirePackage{lettrine}
\RequirePackage{doi}


% Author and affiliation
\RequirePackage{authblk}
\setlength{\affilsep}{11pt}
\renewcommand\Authfont{\color{color0}\fontsize{9.5}{11}\sffamily\selectfont}
\renewcommand\Affilfont{\color{color0}\fontsize{8}{5}\normalfont\sffamily}


\newcommand{\watermarkfont}{\color{red}\normalfont\fontsize{10}{12}\selectfont}
\newcommand{\headerfont}{\normalfont\fontsize{8}{10}\selectfont}
\newcommand{\headerifont}{\normalfont\fontsize{7}{9}\selectfont}
\newcommand{\titlefont}{\color{accent_color}\normalfont\scshape\bfseries\fontsize{19}{18}\selectfont}
\newcommand\corresfont{\normalfont\sffamily\fontsize{8}{4}\selectfont}
\newcommand{\datesfont}{\normalfont\sffamily\itshape\fontsize{8}{10}\selectfont}
\renewcommand\UrlFont{\color{urlcolor}\sffamily}
\newcommand{\absfont}{\normalfont\sffamily\linespread{1}\fontsize{9}{12}\selectfont}
\newcommand{\absheadfont}{\raggedright\normalfont\fontsize{9}{10}\sffamily\bfseries\color{accent_color}\selectfont}
\newcommand{\keywordsfont}{\normalfont\sffamily\linespread{1}\fontsize{8.9}{11}\selectfont}
\newcommand{\keywordheadfont}{\normalfont\sffamily\fontsize{7.8}{9}\selectfont\bfseries}
\newcommand{\copyrightfont}{\normalfont\sffamily\fontsize{8}{9}\selectfont}

% texttt mod for code
\usepackage{xspace}
\usepackage[table]{xcolor}
\usepackage{soul}
\definecolor{Light}{gray}{.95}
\definecolor{lessLight}{gray}{.65}
\sethlcolor{Light}
\let\OldTexttt\texttt
\renewcommand{\texttt}[1]{
    \OldTexttt{\hl{#1}}
}

\RequirePackage{datetime}
\newdateformat{monthyeardate}{%
  \monthname[\THEMONTH] \THEYEAR}

\RequirePackage{enumitem}
\setlist[itemize]{noitemsep}


% Choose article type
\newcommand*{\articletype}[1]{%
  \RequirePackage{styles/#1}}


% Graphics, tables and other formatting
\RequirePackage{graphicx,xcolor}
\RequirePackage{colortbl}
\RequirePackage{booktabs}
\RequirePackage{tikz}
\RequirePackage{algorithm}
\RequirePackage[noend]{algpseudocode}
\RequirePackage{changepage}

% Page settings
\RequirePackage[
                left=78pt,%
                right=78pt,%
                top=75pt,%
                bottom=70pt,%
                headheight=23pt,%
                headsep=17pt,%
                a4paper,twoside]{geometry}%
\setlength{\columnsep}{24pt} % Distance between the two columns of text
\setlength{\parindent}{10pt} % Paragraph indent

% Figure captions
% \RequirePackage[labelfont={bf,sf},%
%                 textfont={sf},%
%                 font=small,
%                 list=no,%
%                 labelsep=space,%
%                 figurename=Figure,%
%                 singlelinecheck=off,%
%                 justification=justified]{caption}

\RequirePackage[
  labelfont={bf,sf,small,singlespacing},
textfont={sf,small,singlespacing},
% justification={justified,RaggedRight},
singlelinecheck=false,
margin=0pt,
figurewithin=chapter,
tablewithin=chapter]{caption}

\usepackage[normalem]{ulem} % for strikethrough


\newcommand\myhrulefill[1]{\leavevmode\leaders\hrule height#1\hfill\kern0pt}
\DeclareCaptionFormat{figformat}{{\color[HTML]{5e5e5e}\myhrulefill{0.05em}}\\#1#2#3}
\DeclareCaptionFormat{tableformat}{{\color[HTML]{5e5e5e}}\\#1#2#3}
\captionsetup[figure]{format=figformat}
\renewcommand{\bfdefault}{bx}


% Set document colour scheme
\definecolor{black50}{gray}{0.5} % 50% black for hrules
\definecolor{color0}{RGB}{0,0,0} % Base color
\definecolor{urlcolor}{HTML}{537c94} % Urls
\definecolor{color2}{HTML}{537c94} % ?
\definecolor{accent_color}{HTML}{3a5c61} % headers and title
\definecolor{accent_color2}{HTML}{45666b} % headers and title
\definecolor{accent_color3}{HTML}{4e6e73} % headers and title
\definecolor{hypercolor}{HTML}{4b7d7a} % references and external links
\definecolor{table_color}{HTML}{e0e0e0} % table row color
\definecolor{table_odd}{HTML}{e6e6e6}
\definecolor{table_even}{HTML}{f5f5f5}


% Bibliography

\usepackage[
backend=biber,
style=apa,
uniquename=false,
refsection=chapter
]{biblatex}
\usepackage{csquotes}
\addbibresource{zotero-library.bib}


% \usepackage{natbib} \bibpunct{(}{)}{;}{author-year}{}{,}
% \bibliographystyle{vancouver-mod}
% \addto{\captionsenglish}{\renewcommand{\refname}{Literature cited}}
\setlength{\bibhang}{11pt}% the hanging indent
\setlength{\bibitemsep}{4pt}% the separation b/w basic items
% \setlength{\bibinitsep}{\baselineskip}% insert blank line between different initial 
\renewcommand*{\bibfont}{\normalfont\small}

% Table style
\arrayrulecolor{color0} % Set the color of the horizontal rules
\renewcommand{\arraystretch}{1.5} % Increased line spacing
% Table caption setup

\captionsetup[table]{format=tableformat, position=top, skip=5pt}


% Define the command for the styled table
\usepackage{xparse}
\usepackage{siunitx}

\NewDocumentCommand{\StyledTable}{O{} m}{
  \begin{tblr}{
    colspec={XXXX},
    row{odd}={bg=table_odd},
    row{even}={bg=table_even},
    % hline{1}={4pt,accent_color}, % Thick black line on top
    % hline{Z}={1pt,accent_color}, % Bottom line
    rowsep=5pt, % Increase space before first row
    #1 % Optional customizations
  }
  #2
  \end{tblr}
}



% Algorithm style
% \makeatletter
\newcommand\fs@coloruled{\def\@fs@cfont{\bfseries}\let\@fs@capt\floatc@coloruled
  \def\@fs@pre{\kern2pt}%
  \def\@fs@post{\kern2pt{\color{color2}\hrule}\relax}%
  \def\@fs@mid{\kern2pt{\color{color2}\hrule}\kern2pt}%
  \let\@fs@iftopcapt\iftrue}
% \makeatother

\floatstyle{coloruled}
\restylefloat{algorithm}

% Headers and footers
\RequirePackage{fancyhdr}  % custom headers/footers
\RequirePackage{lastpage}  % Number of pages in the document
\pagestyle{fancy}          % Enables the custom headers/footers

\newif\ifslugprint\global\slugprintfalse


% \fancypagestyle{firststyle}{
%    \fancyhead[LO,RE,LE,RO]{}
%    \ifslugprint\fancyhead[R]{\slugline}\else\fi%
%    \fancyhead[L]{\firstpageimage}
% }

% Headers
\fancyhead[LO,RE,LE,RO]{\sffamily} % Blank headers for non-title pages.

% Footers
\lfoot{}
\cfoot{}
\rfoot{}

% \fancyhead[RO]{\sffamily\color{black50}\@runningauthor\hspace{2em}\thepage}
%\fancyhead[LE]{\sffamily\color{black50}\thepage\hspace{2em}\@runningtitle}

\fancyfoot[LO,RE]{}
\renewcommand{\headrulewidth}{0pt}% % No header rule
\renewcommand{\footrulewidth}{0pt}% % No footer rule

%% 13 July 2016: make sure sections are unnumbered
% \setcounter{secnumdepth}{0}
% \setcounter{tocdepth}{0}

% Section/subsection/paragraph set-up
% headings, header setup
\RequirePackage[explicit]{titlesec}
%\renewcommand{\thesubsection}{\Alph{subsection}}

\usepackage[titles]{tocloft} % for table of contents (right align numbers)
%\renewcommand{\cftfigpresnum}{\hfill} 
\renewcommand{\cftfigaftersnum}{ \ \ }
\renewcommand{\cftdotsep}{2} 
\renewcommand{\cftfigindent}{0em} 
\addtolength{\cftfignumwidth}{0.5em}

\newif\ifchapternumber
\chapternumbertrue % Uncomment this line to add chapter number

\titleformat{\chapter}
  {\raggedleft\titlefont}
  {\ifchapternumber \thechapter.\ \fi}
  {0.1em}
  {#1}
  []

%   \newcommand{\mytitle}[2]{%
%   \bgroup\setlength{\parindent}{0pt}
%   {%
%   \vspace*{1cm}
%     {\raggedleft \titlefont #1\vskip9pt}%
%     {\raggedleft \parbox{1\linewidth}{\raggedleft #2}
%     \vskip1pt}
%   }\egroup%
% }


\titleformat{\section}
  {\raggedright\normalfont\fontsize{9}{10}\sffamily\bfseries\color{accent_color}}
  {}
  {0em}
  {\MakeUppercase{#1}}
  []
\titleformat{name=\section,numberless}
  {\raggedright\normalfont\fontsize{9}{10}\sffamily\bfseries\color{accent_color}}
  {}
  {0em}
  {\MakeUppercase{#1}}
  []
\titleformat{\subsection}
  {\sffamily\bfseries\fontsize{10}{10}\sffamily\bfseries\color{accent_color2}}
  {}
  {0em}
  {#1}
  []
\titleformat{\subsubsection}%[runin]
  {\sffamily\bfseries\itshape\color{accent_color3}}% Add \itshape for italic
  {}
  {0em}
  {#1}
  []
\titleformat{\paragraph}[runin]
  {\sffamily\small\bfseries\sffamily\bfseries\color{accent_color3}}
  {}
  {0.2em}
  {#1}

\titlespacing*{\chapter}{0pc}{7ex \@plus2pt \@minus2.5pt}{5pt}
\titlespacing*{\section}{0pc}{3ex \@plus2pt \@minus2.5pt}{5pt}
\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{2pt}
\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{2pt}
\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{2pt}

% Article meta data additional fields
\newcommand{\runningauthor}[1]{\def\@runningauthor{#1}}
%% Backward compatibility
\newcommand{\correspondingauthor}[1]{\runningauthor{#1}}
\newcommand{\keywords}[1]{\def\@keywords{#1}}
\newcommand{\runningtitle}[1]{\def\@runningtitle{#1}}

\newcommand{\keywordname}{{\keywordheadfont Keywords:}} % Defines the keywords heading name

% Colored margin box
%\newcommand{\marginmark}{
%\begin{textblock}{2}(200,9.5)
%\begin{tikzpicture}
%\fill[color=color2] (0,0) rectangle (1.2,0.25);
%\end{tikzpicture}
%\end{textblock}
%}

\newcommand{\marginmark}{
\begin{textblock}{2}(200,9.5)
\begin{tikzpicture}
\fill[color=color2] (0,0) rectangle (1.2,0.25);
\end{tikzpicture}
\end{textblock}
}


\def\xabstract{abstract}
\long\def\abstract#1\end#2{\def\two{#2}\ifx\two\xabstract
\long\gdef\theabstract{\ignorespaces#1}
\def\go{\end{abstract}}\else
\typeout{^^J^^J PLEASE DO NOT USE ANY \string\begin\space \string\end^^J
COMMANDS WITHIN ABSTRACT^^J^^J}#1\end{#2}
\gdef\theabstract{\vskip12pt BADLY FORMED ABSTRACT: PLEASE DO
NOT USE {\tt\string\begin...\string\end} COMMANDS WITHIN
THE ABSTRACT\vskip12pt}\let\go\relax\fi
\go}

% Set environment for abstract content and styling
\newcommand{\abscontent}{
\noindent
{%
\parbox{\dimexpr\linewidth}{%
    %% v1.8: turn on line numbers
	\ifthenelse{\boolean{displaylineno}}{\internallinenumbers}{}%
    {\absheadfont\bfseries Summary}\vskip3.5pt \absfont \theabstract
}%
\vskip15.5pt%
\noindent
\parbox{\dimexpr\linewidth-2\fboxsep\relax}{%
 %% v1.8: turn on line numbers
\ifthenelse{\boolean{displaylineno}}{\internallinenumbers}{}%
{\keywordsfont\keywordname}\hspace*{0.1em} \keywordsfont \@keywords%
}%
}%
}%




% % Custom title page
% \renewcommand{\@maketitle}{\bgroup\setlength{\parindent}{0pt}
% {%
% \vskip37pt%
% {\raggedleft \titlefont \@title\vskip13pt}%
% {\raggedleft \parbox{1\linewidth}{\raggedleft \@author}\vskip3pt}
% {\raggedleft \@corres\vskip3pt}
% }\egroup%
% {%
% \vskip12pt%
% \abscontent
% }%
% \vskip25pt%
% }%




% Other packages
\RequirePackage{enumitem} % For reducing bullet list item separation

\RequirePackage{tabularx}

\RequirePackage[flushmargin, ragged]{footmisc}

\newlength{\myFootnoteWidth}%
\newlength{\myFootnoteLabel}%
\setlength{\myFootnoteLabel}{0.5em}
\renewcommand{\@makefntext}[1]{%
  \setlength{\myFootnoteWidth}{\columnwidth}%
  \addtolength{\myFootnoteWidth}{-\myFootnoteLabel}%
  \noindent\makebox[\myFootnoteLabel][r]{\@makefnmark\ }%
  \parbox[t]{\myFootnoteWidth}{#1}
  }

\newdimen\footrulechange
\footrulechange\columnwidth
% Commands to set the footnote for the front page.
\renewcommand{\footnoterule}{%
  \kern -3pt
  {\color{black50} \hrule width \footrulechange height 0.5pt}
  \kern 2.5pt
}

\newcommand{\@authfootnote}[2]{%
  \begingroup
  \setlength{\myFootnoteLabel}{0em}
  \renewcommand\thefootnote{}\footnote{\footnotelayout\copyrightfont\textsuperscript{#1}#2}%
   \endgroup%
}

\newcommand\blfootnote[1]{%
  \@authfootnote{}{#1}%
  \begingroup
  \setlength{\myFootnoteLabel}{0em}
  \renewcommand\thefootnote{}\footnote{#1}%
  \addtocounter{footnote}{-1}%
  \addtocounter{Hfootnote}{-1}%
  \endgroup%
}
\newcommand\correspondingauthoraffiliation[2][]{%
  \gdef\@corres{\corresfont\textsuperscript{#1}#2}%
}


\def\dates#1{\gdef\@dates{#1}}

\def\rec#1{\textbf{Recevied:} #1.}
\def\rev#1{\textbf{Revised:} #1}
\def\acc#1{\textbf{Accepted:} #1}

\newcommand{\equalcontrib}[1]{\@authfootnote{#1}{These authors contributed equally to this work.}}


\newenvironment{tableminipage}[1]{\begin{minipage}{#1}\renewcommand\footnoterule{ \kern -1ex}%
\setlength{\myFootnoteLabel}{0.5em}%
}{\end{minipage}}

\def\firstpagebreak{\break\newpage\noindent}

% Package to enable absolute positioning of figures
\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}
\textblockorigin{0mm}{0mm} % start everything near the top-left corner



% Added from thesis to support custom styles used here




\usepackage{tabularray}
\UseTblrLibrary{booktabs} % For using booktabs style
\usepackage{geometry} % Adjust page layout if needed



\ExplSyntaxOn
\DefTblrTemplate{conthead-text}{normal}{\medspace(Continued)}
\DefTblrTemplate{caption-sep}{default}{.\enskip}    % Change ":" to "."
\DefTblrTemplate{capcont}{default}               % Entire caption setup
{%
  \hbox_set:Nn \l__tblr_caption_box{%
    \UseTblrTemplate{caption-tag}{default}
    \UseTblrTemplate{caption-sep}{default}
    \UseTblrTemplate{caption-text}{default}
    \UseTblrTemplate{conthead-text}{normal}
  }
  \dim_compare:nNnTF{\box_wd:N \l__tblr_caption_box} > {\hsize}
  {%
    \UseTblrAlign{caption}
    \UseTblrIndent{caption}
    \hbox_set:Nn \l__tblr_caption_left_box{%
      \UseTblrTemplate{caption-tag}{default}
      \UseTblrTemplate{caption-sep}{default}
	  
    }
    \hangindent = \box_wd:N \l__tblr_caption_left_box
    \hangafter = 1
    \UseTblrHang{caption}
    \leavevmode
    \hbox_unpack:N \l__tblr_caption_box
    \par
  }{%
    \centering
    \makebox[\hsize][l]{\box_use:N \l__tblr_caption_box}    % "c" to "l"
    \par
  }
}

\DefTblrTemplate{caption}{default}               % Entire caption setup
{%
  \hbox_set:Nn \l__tblr_caption_box{%
    \UseTblrTemplate{caption-tag}{default}
    \UseTblrTemplate{caption-sep}{default}
    \UseTblrTemplate{caption-text}{default}
  }
  \dim_compare:nNnTF{\box_wd:N \l__tblr_caption_box} > {\hsize}
  {%
    \UseTblrAlign{caption}
    \UseTblrIndent{caption}
    \hbox_set:Nn \l__tblr_caption_left_box{%
      \UseTblrTemplate{caption-tag}{default}
      \UseTblrTemplate{caption-sep}{default}
	  
    }
    \hangindent = \box_wd:N \l__tblr_caption_left_box
    \hangafter = 1
    \UseTblrHang{caption}
    \leavevmode
    \hbox_unpack:N \l__tblr_caption_box
    \par
  }{%
    \centering
    \makebox[\hsize][l]{\box_use:N \l__tblr_caption_box}    % "c" to "l"
    \par
  }
}
\ExplSyntaxOff


\NewTblrTheme{ntabs}{%
\SetTblrStyle{caption-tag}{ font=\bfseries\footnotesize\sffamily}%
  \SetTblrStyle{caption-sep}{}%
  \SetTblrStyle{caption-text}{font=\footnotesize\sffamily}%
    \SetTblrStyle{conthead-text}{font=\footnotesize\sffamily}%
    \SetTblrStyle{contfoot-text}{font=\footnotesize\sffamily}%
    \SetTblrStyle{note-text}{font=\footnotesize\sffamily}%
}

\definecolor{tablegrey}{HTML}{f7f7f7} % for chapter numbers
\definecolor{tableheadgrey}{HTML}{ededed} % for chapter numbers

\makeatletter
\AtBeginEnvironment{tabularray}{%
  \def\baselinestretch{.8}\@currsize}%
\makeatother


% Figures and figure captions

% remove page numbers from float figure pages
\usepackage{floatpag}
\floatpagestyle{fancy}





% Figure reference command
\newcommand{\figref}[2][]{\hyperref[#2]{Figure \ref*{#2}\textsc{\IfValueT{#1}{#1}}}}


% Supplemetary sections

\newcommand{\supplementarysection}{%
  \setcounter{figure}{0}% Reset figure counter
  \let\oldthefigure\thefigure% Capture figure numbering scheme
  \renewcommand{\thefigure}{S\oldthefigure}% Prefix figure number with S
  \setcounter{table}{0}% Reset table counter
  \let\oldthetable\thetable% Capture table numbering scheme
  \renewcommand{\thetable}{S\oldthetable}% Prefix table number with S
  \section{Supplementary Information}% Set supplementary section
  \let\oldsection\section% Copy \section into \oldsection
  \renewcommand{\section}{% Update \section
    \let\thefigure\oldthefigure% Copy \thefigure into \oldthefigure
    \let\thetable\oldthetable% Copy \thetable into \oldthetable
    \let\section\oldsection% Restore original \section
    \oldsection% Call original \section
  }
}


\DeclareCaptionFormat{figformat}{{\color[HTML]{bfbfbf}\myhrulefill{0.05em}}\\\textbf{#1}#2#3}
\DeclareCaptionFormat{tableformat}{{\color[HTML]{bfbfbf}}\\#1#2#3}
\captionsetup[figure]{format=figformat, labelsep=period}
\captionsetup[table]{labelsep=period}
% \captionsetup[table]{format=figformat, labelsep=space}

% Add title to captions
\newcommand{\mycaption}[2]{\caption[#1]{\textbf{#1.}\\#2}}
% this has the side effect that the list of figures is also bold, and that not 
% specifying a short caption will result in an error. 


\renewcommand{\bfdefault}{bx}

\renewcommand{\thefootnote}{\fnsymbol{footnote}}




%% new abstract outside of maketitle

% \newcommand{\chapterabstract}[1]{%
%   \par\vskip10pt
%   {\absheadfont\bfseries Summary}\vskip3.5pt
%   {\absfont #1}
%   \par\vskip10pt
% }

\newcommand{\mytitle}[2]{%
  \bgroup\setlength{\parindent}{0pt}
  {%
  \vspace*{1cm}
    {\raggedleft \titlefont #1\vskip9pt}%
    {\raggedleft \parbox{1\linewidth}{\raggedleft #2}
    \vskip1pt}
  }\egroup%
}

\newcommand{\myauthors}[1]{\normalfont\sffamily #1}

\newcommand{\myabstract}[1]{%
\vspace{.5cm}
  \par\vskip10pt
  {\absheadfont\bfseries\MakeUppercase{Abstract}}\vskip3.5pt
  {\absfont #1} % Modified to use \MakeUppercase
  \par\vskip10pt
}

\newcommand{\mysummary}[1]{%
\vspace{.5cm}
  \par\vskip10pt
  {\absheadfont\bfseries\MakeUppercase{Summary}}\vskip3.5pt
  {\absfont #1} % Modified to use \MakeUppercase
  \par\vskip10pt
}


%%%% specific to report


% REFERENCES
% Internally, thebibliography environment uses \chapter*; if you want the bibliography to behave like a section, you can patch the \thebibliography command to use \section* instead of chapter*.
\usepackage{etoolbox}

\DeclareBibliographyCategory{cited}
\AtEveryCitekey{\addtocategory{cited}{\thefield{entrykey}}}

\newrobustcmd{\mklocalfilter}[1]{%
  \defbibfilter{#1}{%
    segment=0
    or
    segment=\therefsegment
  }}

\defbibheading{bibliography}[\refname]{%
  \section{#1}
}

\AtBeginDocument{%
  \renewcommand{\bibname}{References}
}

\AtBeginBibliography{\vspace{0pt}}
% do not display numbers for sections
\setcounter{secnumdepth}{2}

% Change the name of the bibliography and list of figures
\renewcommand\bibname{References}
\renewcommand\listfigurename{List of figures}



% chapter quotations
\makeatletter
\renewcommand{\@chapapp}{}% Not necessary...
\newenvironment{chapquote}[2][0em]
  {\setlength{\@tempdima}{#1}%
   \def\chapquote@author{#2}%
   \parshape 1 \@tempdima \dimexpr\textwidth-2\@tempdima\relax%
   \raggedleft\itshape}% Add \raggedleft and \raggedright
  {\par\normalfont\hfill--\ \chapquote@author\hspace*{1em}\par\bigskip}
\makeatother

% legacy - coming from previous template


% Define the green color for the background
\definecolor{chapterback}{HTML}{242424}
% Define a command to set the background color
\newcommand{\setchaptercolor}{\pagecolor{chapterback}}

% load pagecolor package - allows to change page color and back
\usepackage{pagecolor}
\usepackage{afterpage}% for "\afterpage"


\newcommand{\copyrightpage}{
	\newpage
	\thispagestyle{empty}
	\vspace*{\fill}
	\scshape \noindent \small CC BY 4.0 \small \hspace{3pt}2023\hspace{3pt}-- Nilo Merino Recalde\\
	\vspace*{\fill}
	\newpage
	\rm
}

\newcommand{\abstractpage}{
	\newpage
	\setcounter{page}{3}
	\pagestyle{fancy}
	\vspace*{-\headheight}
	\lhead{\scshape\footnotesize Thesis advisors: Professor Ben C. Sheldon \\and Dr Ella F. Cole} \rhead{\scshape\footnotesize Nilo Merino Recalde\\}
	\renewcommand{\headrulewidth}{0.0pt}
	\vspace*{35pt}
	\begin{center}
	\scshape \Large{cultural evolution in the wild:}\\
	\normalsize
	\scshape {tracking the landscape of learning in bird song} \\
	\vspace*{20pt}
	\scshape Abstract \\ \rm
	\end{center}
	\input{frontmatter/abstract}
	\vspace*{\fill}
	\newpage \lhead{} \rhead{}
	\cfoot{\thepage}
}


% Change color of page before chapter
\usepackage{pdfpages}

\usepackage{adforn}

