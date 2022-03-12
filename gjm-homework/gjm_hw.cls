%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gjm_hw}
              [2022/02/24 v1.0 Homework template of GJM]
\typeout{Document Class `gjm_hw' v1.0 by Mingjia Gu (2022/02)}

\LoadClass[a4paper, UTF8]{ctexart}

% Github: https://github.com/GJCav/latex-template
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% packages & customization
\usepackage{graphicx}   % 支持图片, graphics包较老，不使用
\usepackage{subfigure}  % 支持多图片
\usepackage{float}      % 图片位置设置
\usepackage{color}
\usepackage{scrextend}  % 调整整体左移右移 
% \begin{addmargin}[左侧]{右侧}  xxxx \end{addmargin}

%%%%%% 标题左对齐
\ctexset{section/format=\Large\bfseries}
\ctexset{subsection/format=\large\bfseries}
\ctexset{subsubsection/format=\bfseries}

%%%%%% 设置纸张大小
\usepackage{geometry}   
\newgeometry{
  top=25.4mm, bottom=22.5mm, left=20mm, right=20mm,
  headsep=5mm, headheight=10mm, footskip=10mm,
}
\savegeometry{mastergeometry}
\loadgeometry{mastergeometry}

%%%%%% 自定义页眉、页脚
\newcommand\course{Empty Course Name}
\newcommand\assignment{Hw 00}
\newcommand\schoolId{2020018888}
\newcommand\contactInfo{gjm20@mails.tsinghua.edu.cn}
\newcommand\semaster{Spring/Autumn 20xx}

\newcommand\setCourse[1]{\renewcommand\course{#1}}
\newcommand\setAssignment[1]{\renewcommand\assignment{#1}}
\newcommand\setSchoolId[1]{\renewcommand\schoolId{#1}}
\newcommand\setContactInfo[1]{\renewcommand\contactInfo{#1}}
\newcommand\setSemaster[1]{\renewcommand\semaster{#1}}

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
	\fancyhead[R]{\@author,\quad \@date,\ \semaster}
    \renewcommand\headrulewidth{.5pt}
    
	\footstyle
}
\pagestyle{masterContent}

\fancypagestyle{frontPageStyle}{
    \fancyhf{}
    \renewcommand\headrulewidth{0pt}
    
    \footstyle
}

% 自定义封面
\renewcommand\maketitle{
    \thispagestyle{frontPageStyle}
    \begin{center}
        \noindent\rule{\textwidth}{1pt}
        {\bfseries
        {\huge \course \\}
        } % 加粗结束
        \vspace{1.5em} % 标题下只有 0.5 em 缩进
        {\large \assignment \hfill  \@date,\ \semaster \\}
        \vspace{1 em}
        {\large \@author, \schoolId \hfill \contactInfo \\}
        \noindent\rule{\textwidth}{1pt}
        \vspace{2em}
    \end{center}
    \pagestyle{masterContent}
}

%%%%% 自定义“问题列表”
\newcounter{ProblemCounter}
\setcounter{ProblemCounter}{1} 

\newenvironment{problem}
{ % 开始定义
    \begin{samepage} % 保证同页
    \newcommand\ptitle[2]{
        \noindent {\bfseries {\color{blue} Problem \theProblemCounter} \quad ##1 } \hfill ##2 \par\nopagebreak % 保证标题和问题描述在同一页
    }
    \newcommand\psolution{
        \noindent {\color{blue} \textit{Solution: }}
    }
    \newenvironment{solution}{
        \psolution
        \begin{addmargin}[1em]{0em}
    }{
        \end{addmargin}
    }
    \setlength{\abovedisplayskip}{0pt}
    \setlength{\belowdisplayskip}{0pt}
    \setlength{\abovedisplayshortskip}{0pt}
    \setlength{\belowdisplayshortskip}{0pt} % 公式与文字无垂直间距
}
{ % 结束定义
    \stepcounter{ProblemCounter}
    \let\ptitle\undef
    \let\psolution\undef
    \let\solution\undef
    \vspace{2em}
    \end{samepage}
}

%%%%% 分栏
\usepackage{multicol}

%%%%% 数学公式相关
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}


%%%%% 自定义 hook
\usepackage{etoolbox}
\let\firstsection\section
\renewcommand{\section}{\clearpage\firstsection}

%%%%% 支持图的绘制
\usepackage{tikz}
\usetikzlibrary{graphs,graphdrawing,arrows}
\usegdlibrary{trees,layered}

%%%%% 支持带圈字符
\usepackage{circledsteps}
\renewcommand{\textcircled}{\Circled}
\newcommand{\circled}{\Circled}
% 之后可以直接 \circled{xxx} 来绘制带圈的东西了

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