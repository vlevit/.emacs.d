(require 'saveplace)                          ;; get the package

(setq save-place-file "~/.emacs.d/saveplace") ;; keep my ~/ clean
(setq-default save-place t)                   ;; activate it for all buffers

(save-place-mode 1)

(provide 'setup-saveplace)
