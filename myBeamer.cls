% ==================================================================
% FILE     basicPresentationStyle.sty
% MACHINE  all
% INFO     Documentclass for all LatTex Presentations
%          Vorlage unter:
%          ~/Documents/Studium/Lehramt/Fachdidaktik_III/Klassische-Probleme-der-Antike/
%
% DATE     13.04.2016
% OWNER    Bischofberger
% ==================================================================

\ProvidesClass{myBeamer}
\NeedsTeXFormat{LaTeX2e}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax

\LoadClass{beamer}

% theme
\usetheme{default}
\usecolortheme{default}
\usefonttheme{professionalfonts}
\beamertemplatenavigationsymbolsempty

% colors
\definecolor{title}{RGB}{35,90,20}
\setbeamercolor{titlelike}{fg=title}
\setbeamercolor{block title}{fg=title}
\setbeamercolor{block title example}{fg=title}
\setbeamercolor{enumerate item}{fg=title}
\setbeamercolor{itemize item}{fg=title}

% fonts
\RequirePackage[ngerman]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8x]{inputenc}
\RequirePackage{lmodern}

% typography
\RequirePackage{microtype}
\RequirePackage{nicefrac}
\RequirePackage{siunitx}
\RequirePackage{eurosym}

% math packages
\RequirePackage{basicMathDocStyle}

% tables, lists...
% don't load enumitem for beamer!
\RequirePackage{array}
\RequirePackage{tabularx}

% floats, figures, boxes...
\RequirePackage{float}
