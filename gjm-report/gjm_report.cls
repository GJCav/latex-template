%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gjm_report}
              [2022/03/02 v1.0 Report template of GJM]
\typeout{Document Class `gjm_report' v1.0 by Mingjia Gu (2022/04)}

\LoadClass[a4paper, UTF8]{ctexart}

% Github: https://github.com/GJCav/latex-template
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% useful packages
\usepackage{graphicx}   % 支持图片, graphics包较老，不使用
\usepackage{subfigure}  % 支持多图片
\usepackage{float}      % 图片位置设置
\usepackage{booktabs}   % /bottomrule 系列，支持三线表等
\usepackage{color}
\usepackage{scrextend}  % 调整整体左移右移 

\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{amsthm}      % 使用定理
\usepackage{siunitx}     % 各种SI单位
\usepackage{bm}          % 公式中的粗体字符(用命令\boldsymbol）

\usepackage{ccaption}    % \captiondelim 指令
\usepackage{calc}        % \widthof 指令
\usepackage{multicol}

\usepackage{lipsum}

%%%%%%%%%% customization %%%%%%%%%

%%%% 中文习惯字体、段落格式、名称
\setmainfont{Times New Roman}
\newcommand{\erhao}{\fontsize{22pt}{\baselineskip}\selectfont}      % 字号设置
\newcommand{\sihao}{\fontsize{14pt}{\baselineskip}\selectfont}      % 字号设置
\newcommand{\xiaosihao}{\fontsize{12pt}{\baselineskip}\selectfont}  % 字号设置
\newcommand{\wuhao}{\fontsize{10.5pt}{\baselineskip}\selectfont}    % 字号设置
\newcommand{\xiaowuhao}{\fontsize{9pt}{\baselineskip}\selectfont}   % 字号设置
\newcommand{\liuhao}{\fontsize{7.875pt}{\baselineskip}\selectfont}  % 字号设置
\newcommand{\myxiaoliuhao}{\fontsize{6.5pt}{\baselineskip}\selectfont}  % 字号设置
\newcommand{\qihao}{\fontsize{5.25pt}{\baselineskip}\selectfont}    % 字号设置
\usepackage{indentfirst} % 中文段落首行缩进

\renewcommand{\tablename}{表}
\renewcommand{\figurename}{图}
\captiondelim{~~}
\setlength{\abovecaptionskip}{2pt}
\setlength{\belowcaptionskip}{2pt}

\DeclareRobustCommand{\ttfamily}{\fontencoding{T1}\fontfamily{lmtt}\selectfont}

%%%% 重定义页面边距，使其符合中文刊物习惯。
\usepackage{lettrine}
\setlength{\parindent}{2em}
\setlength{\voffset}{-4mm}
\setlength{\parskip}{1pt}
\renewcommand{\baselinestretch}{1.15} %定义行间距1.15
\setcounter{page}{1} \makeatletter
\renewcommand\section{\vspace{2em} \@startsection {section}{1}{\z@}%
                                   {1.5ex }%
                                   {1.5ex}%
                                   {\normalfont\bfseries\sihao}}
\renewcommand\subsection{\vspace{1em} \@startsection {subsection}{1}{\z@}%
                                   {-1pt }%
                                   {1pt}%
                                   {\normalfont\bfseries\wuhao}}
\renewcommand\subsubsection{\@startsection {subsubsection}{1}{\z@}%
                                   {-1pt }%
                                   {1pt}%
                                   {\normalfont\wuhao}}

\usepackage{geometry}
\newgeometry{
  top=25.4mm, bottom=22.5mm, left=20mm, right=20mm,
  headsep=5mm, headheight=10mm, footskip=10mm,
}
\savegeometry{mastergeometry}
\loadgeometry{mastergeometry}

\setlength{\columnsep}{10mm}

%%%%% 自定义变量
\newcommand\course{Empty Course Name}
\newcommand\schoolId{2020018888}
\newcommand{\contactInfo}{gjm20@mails.tsinghua.edu.cn}
\renewcommand{\abstract}{Empty Abstract here}
\newcommand{\keywords}{关键词， 很关键的词， 十分关键的词， 有一些关键的词， 大关键词}
\newcommand{\assignment}{Assignment 1}

\newcommand\setCourse[1]{\renewcommand\course{#1}}
\newcommand{\setContactInfo}[1]{
  \renewcommand{\contactInfo}{#1}
}
\newcommand\setSchoolId[1]{\renewcommand\schoolId{#1}}
\newcommand{\setAbstract}[1]{
  \renewcommand{\abstract}{#1}
}
\newcommand{\setKeywords}[1]{
  \renewcommand{\keywords}{#1}
}
\newcommand{\setAssignment}[1]{
  \renewcommand{\assignment}{#1}
}

%%%% header and footer
\usepackage{lastpage} % 支持页脚的总页面显示
\usepackage{fancyhdr}

\pagestyle{fancy}
\newcommand\footstyle{ % 定义页脚样式
    \renewcommand\footrulewidth{.5pt}
	\fancyfoot[C]{\thepage / \pageref{LastPage}}
	\fancyfoot[L]{\raisebox{-3ex}{\includegraphics[width=0.3\textwidth]{./images/logo_thu_wy_name.pdf}}}
    \fancyfoot[R]{\@author,\quad \schoolId \\ \contactInfo{}}
}
\fancypagestyle{masterContent} % 主要页面的页眉页脚
{
    \fancyhead{}
    \fancyhead[L]{\course}
	\fancyhead[C]{\assignment}
	\fancyhead[R]{\@date}
    \renewcommand\headrulewidth{.5pt}
    
	\footstyle
}
\pagestyle{masterContent}

\fancypagestyle{frontPageStyle}{
    \fancyhf{}
    \renewcommand\headrulewidth{0pt}
    
    \footstyle
}


%%%% 首页格式
\renewcommand{\maketitle}{
  \begin{center}
    \mbox{\ } \\
    \vspace{1cm}
    {\huge \@title } \par
    
    \vspace{1em}
    {\sihao\kaishu \@author}
    
    \schoolId
  \end{center}
  
  {\heiti\wuhao \makebox[\widthof{【关键词】}][s]{【摘要】}} {\wuhao \abstract}
  
  \vspace{0.7em}
  {\heiti\wuhao \makebox[\widthof{【关键词】}][s]{【关键词】} \keywords}
  
  \vspace{1.2cm}
}

%%%%% 目录可以跳转、生成PDF书签
\usepackage{hyperref}
\hypersetup{hidelinks,
  colorlinks=true,
  allcolors=black,
  pdfstartview=Fit,
  breaklinks=true
}

%%%%% 替换为好看的数学符号
\renewcommand{\le}{\leqslant}
\renewcommand{\ge}{\geqslant}
\renewcommand{\emptyset}{\varnothing}


%%%%% 代码块模块
\usepackage{algorithm}
\usepackage[noend]{algpseudocode}
\newcommand{\refalg}[1]{\textit{Algorithm \ref{#1}}}

\makeatletter
\newenvironment{breakablealgorithm}
{
    \begin{center}
        \refstepcounter{algorithm}
        \renewcommand{\caption}[1]
        {
            \addcontentsline{loa}{algorithm}{\protect\numberline{\thealgorithm}##1}
            \parbox{\textwidth}
            % Makes a unbreakable block and can also be done by `minipage`.
            {
                \hrule height.8pt depth0pt \kern2pt
                {\raggedright\textbf{\fname@algorithm~\thealgorithm} ##1\par}
                \kern2pt\hrule\kern2pt
            }
        }
}
{
        \kern2pt\hrule\relax
    \end{center}
}
\makeatother