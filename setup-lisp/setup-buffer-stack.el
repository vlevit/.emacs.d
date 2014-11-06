(require 'iflipb)

(setq iflipb-ignore-buffers ".*(Sunrise)")

;; (global-set-key (kbd "<f7>") 'buffer-stack-down)
;; (global-set-key (kbd "M-[") 'buffer-stack-down)
;; (global-set-key (kbd "M-]") 'buffer-stack-up)
;; (global-set-key (kbd "<f8>") 'buffer-stack-up)

(global-set-key (kbd "<f8>") 'iflipb-next-buffer)
(global-set-key (kbd "<f7>") 'iflipb-previous-buffer)

;; (global-set-key (kbd "<f8>") 'switch-to-next-buffer)
;; (global-set-key (kbd "<f7>") 'switch-to-prev-buffer)

(provide 'setup-buffer-stack)
