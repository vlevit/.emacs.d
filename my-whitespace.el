(require 'fill-column-indicator)

(setq whitespace-style (quote
  (face newline tabs newline-mark)))

;; make whitespace-mode use “¶” for newline and “▷” for tab.
;; together with the rest of its defaults
(setq whitespace-display-mappings
 '(
   (space-mark 32 [183] [46]) ; normal space
   (space-mark 160 [164] [95])
   (space-mark 2208 [2212] [95])
   (space-mark 2336 [2340] [95])
   (space-mark 3616 [3620] [95])
   (space-mark 3872 [3876] [95])
   (newline-mark 10 [182 10]) ; newlne
   (tab-mark 9 [9655 9] [92 9]) ; tab
))
(setq whitespace-line-column 79)
;; (global-whitespace-mode 1)

(defun whitespace-post-command-hook() nil) ; workaround for cursor slowdown

(provide 'my-whitespace)
