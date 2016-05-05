(require 'twittering-mode)

(setq twittering-use-master-password t
      twittering-private-info-file (expand-file-name "~/.emacs.d/.twittering-mode")
      twittering-icon-mode t
      twittering-status-format "%i %s,  %@: %FACE[font-lock-comment-face]{// from %f%L%r%R}\n\n%FOLD[         ]{%t}\n\n"
      twittering-fill-column 80)

(add-hook 'twittering-mode-hook '(lambda() (setq truncate-lines t)))

(provide 'setup-twitter)
