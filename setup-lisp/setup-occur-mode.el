(global-set-key (kbd "M-g M-]") 'occur-next-error)
(global-set-key (kbd "M-g M-[") '(lambda () (interactive) (occur-next-error -1)))

(define-key occur-mode-map (kbd "n") 'occur-next)
(define-key occur-mode-map (kbd "p") 'occur-prev)

(provide 'setup-occur-mode)
