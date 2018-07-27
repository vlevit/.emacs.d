(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command "xelatex")
 '(LaTeX-verbatim-environments (quote ("verbatim" "verbatim*" "comment" "lstlisting")))
 '(TeX-output-view-style
   (quote
    (("^dvi$"
      ("^landscape$" "^pstricks$\\|^pst-\\|^psfrag$")
      "%(o?)dvips -t landscape %d -o && gv %f")
     ("^dvi$" "^pstricks$\\|^pst-\\|^psfrag$" "%(o?)dvips %d -o && gv %f")
     ("^dvi$"
      ("^\\(?:a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4\\)$" "^landscape$")
      "%(o?)xdvi %dS -paper a4r -s 0 %d")
     ("^dvi$" "^\\(?:a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4\\)$" "%(o?)xdvi %dS -paper a4 %d")
     ("^dvi$"
      ("^\\(?:a5\\(?:comb\\|paper\\)\\)$" "^landscape$")
      "%(o?)xdvi %dS -paper a5r -s 0 %d")
     ("^dvi$" "^\\(?:a5\\(?:comb\\|paper\\)\\)$" "%(o?)xdvi %dS -paper a5 %d")
     ("^dvi$" "^b5paper$" "%(o?)xdvi %dS -paper b5 %d")
     ("^dvi$" "^letterpaper$" "%(o?)xdvi %dS -paper us %d")
     ("^dvi$" "^legalpaper$" "%(o?)xdvi %dS -paper legal %d")
     ("^dvi$" "^executivepaper$" "%(o?)xdvi %dS -paper 7.25x10.5in %d")
     ("^dvi$" "." "%(o?)xdvi %dS %d")
     ("^pdf$" "." "evince %o %(outpage)")
     ("^html?$" "." "firefox %o"))))
 '(TeX-view-program-selection
   (quote
    (((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "xdg-open")
     (output-html "xdg-open"))))
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#657b83" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#fdf6e3"))
 '(desktop-path (quote ("~/.emacs.d/" "." "~")))
 '(dired-listing-switches "-lAhX --group-directories-first")
 '(ecb-tip-of-the-day nil)
 '(ediff-split-window-function (quote split-window-horizontally))
 '(flymake-gui-warnings-enabled nil)
 '(flyspell-dictionaries (quote ("english" "ru-yeyo" "uk")))
 '(gdb-many-windows t)
 '(gdb-show-main t)
 '(highlight-symbol-idle-delay 2)
 '(magit-cherry-pick-arguments (quote ("-x")))
 '(magit-merge-arguments (quote ("--no-ff")))
 '(magit-rebase-arguments (quote ("--autostash")))
 '(nxml-sexp-element-flag t)
 '(org-export-author-info nil)
 '(org-export-creator-info nil)
 '(org-export-default-language "ru")
 '(org-export-html-footnotes-section
   "<div id=\"footnotes\">
<h4 class=\"footnotes\">%s: </h4>
<div id=\"text-footnotes\">
%s
</div>
</div>")
 '(org-export-language-setup
   (quote
    (("en" "Author" "Date" "Table of Contents" "Footnotes")
     ("ca" "Autor" "Data" "&Iacute;ndex" "Peus de p&agrave;gina")
     ("cs" "Autor" "Datum" "Obsah" "Pozn\341mky pod carou")
     ("da" "Ophavsmand" "Dato" "Indhold" "Fodnoter")
     ("de" "Autor" "Datum" "Inhaltsverzeichnis" "Fu&szlig;noten")
     ("eo" "A&#365;toro" "Dato" "Enhavo" "Piednotoj")
     ("es" "Autor" "Fecha" "&Iacute;ndice" "Pies de p&aacute;gina")
     ("fi" "Tekij&auml;" "P&auml;iv&auml;m&auml;&auml;r&auml;" "Sis&auml;llysluettelo" "Alaviitteet")
     ("fr" "Auteur" "Date" "Table des mati&egrave;res" "Notes de bas de page")
     ("hu" "Szerz&otilde;" "D&aacute;tum" "Tartalomjegyz&eacute;k" "L&aacute;bjegyzet")
     ("is" "H&ouml;fundur" "Dagsetning" "Efnisyfirlit" "Aftanm&aacute;lsgreinar")
     ("it" "Autore" "Data" "Indice" "Note a pi&egrave; di pagina")
     ("nl" "Auteur" "Datum" "Inhoudsopgave" "Voetnoten")
     ("no" "Forfatter" "Dato" "Innhold" "Fotnoter")
     ("nb" "Forfatter" "Dato" "Innhold" "Fotnoter")
     ("nn" "Forfattar" "Dato" "Innhald" "Fotnotar")
     ("pl" "Autor" "Data" "Spis tre&sacute;ci" "Przypis")
     ("sv" "F&ouml;rfattare" "Datum" "Inneh&aring;ll" "Fotnoter")
     ("ru" "Автор" "Дата" "Содержание" "Сносочки"))))
 '(org-export-time-stamp-file nil)
 '(org-export-with-section-numbers nil)
 '(org-export-with-timestamps nil)
 '(org-footnote-define-inline nil)
 '(org-footnote-section nil)
 '(package-selected-packages
   (quote
    (ansible python-docstring dockerfile-mode swiper ivy pyimpsort pyimport elm-mode jade rg js2-mode rjsx-mode counsel move-dup ox-twbs yaml-mode windsize window-layout which-key wgrep weblogger web-mode vline vlf visual-regexp visual-fill-column vimgolf twittering-mode tiny sws-mode string-inflection smex smartparens scratch rainbow-mode projectile pos-tip perspective persp-mode paredit-everywhere paradox mwe-log-commands mu4e-maildirs-extension markdown-mode magit lispy less-css-mode key-seq key-combo jump-char js2-refactor jinja2-mode jedi-direx jade-mode iy-go-to-char iflipb idomenu highlight-symbol hexrgb go-mode git-gutter-fringe flymake-cursor flymake-coffee flycheck-package flx-ido find-file-in-project fill-column-indicator expand-region eproject elfeed dired-rainbow dired+ crontab-mode color-theme-solarized coffee-mode bm beacon bash-completion autopair auctex anything anti-zenburn-theme aggressive-indent)))
 '(safe-local-variable-values
   (quote
    ((js2-basic-offset . 2)
     (ispell-dictionary . english)
     (LaTeX-command-style
      ("" "xelatex %S"))
     (LaTeX-command-style
      ("" "%(latex) %(extraopts) %S%(PDFout)"))
     (LaTeX-command-style
      ("" "%latex) %(extraopts) %S%(PDFout)"))
     (LaTeX-command-style
      ("" "(latex) %(extraopts) %S%(PDFout)"))
     (sgml-basic-offset . 4)
     (vlblog-file-p . t)
     (blog-file-p . t)
     (ispell-dictionary . "ukrainian"))))
 '(send-mail-function nil)
 '(show-paren-mode t)
 '(sr-avfs-root "~/.avfs")
 '(sr-listing-switches "--time-style=locale --group-directories-first -AlDhgGX")
 '(sr-loop-use-popups nil)
 '(sr-virtual-listing-switches "-al --group-directories-first")
 '(use-dialog-box nil)
 '(vc-annotate-background "white"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-added ((t (:background "#DDFFDD" :inverse-video nil :foreground "#657b83" :weight normal))))
 '(diff-file-header ((t (:weight bold :background "#DDDDFF"))))
 '(diff-header ((t (:background "#F8E9AE"))))
 '(diff-refine-changed ((t (:foreground "#657b83" :weight normal))))
 '(diff-removed ((t (:background "#FFDDDD" :inverse-video nil :foreground "#657b83" :weight normal))))
 '(flycheck-fringe-warning ((t (:inherit warning :foreground "#729fcf"))))
 '(flycheck-warning ((t (:underline (:color "#729fcf" :style wave)))))
 '(flymake-errline ((((class color) (background light)) (:underline "pink"))))
 '(flymake-warnline ((((class color) (background light)) (:underline "LightBlue3"))))
 '(flyspell-duplicate ((t (:underline "goldenrod"))))
 '(flyspell-incorrect ((t (:underline "goldenrod"))))
 '(header-line ((t (:foreground "#657b83" :weight bold))))
 '(highlight-symbol-face ((t (:weight semi-bold))))
 '(sr-directory-face ((t (:foreground "blue1" :weight thin))) nil "not bold")
 '(variable-pitch ((t (:family "Monospace")))))
