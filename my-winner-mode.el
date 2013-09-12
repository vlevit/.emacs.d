(winner-mode 1)
(define-key winner-mode-map (kbd "<S-f7>") 'winner-undo)
(define-key winner-mode-map (kbd "<S-f8>") 'winner-redo)
(provide 'my-winner-mode)