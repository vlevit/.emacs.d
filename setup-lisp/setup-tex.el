(setq TeX-auto-save t)   ; Enable parse on save ('auto' subdirectory)
(setq TeX-parse-self t)  ; Enable parse on load
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'TeX-PDF-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)

(provide 'setup-tex)
