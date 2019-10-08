(require 'find-project)

(setq find-project-patterns
      '((:pattern "~/.config" :action find-file-in-repository)
        (:pattern "~/bin" :action find-file-in-repository)
        "~/.emacs.d"
        "~/.oh-my-zsh"
        "~/.emacs.d/site-lisp/*"
        "~/projects/*"
        ;; (:function (find-project-traverse "~/projects" 1 ".git") :action magit-status)
        (:pattern "~/work/*/*")))

(setq find-project-completing-read-projects 'ivy-completing-read)
(setq find-project-completing-read-actions 'ido-completing-read)
(setq find-project-default-action 'find-file-in-repository)
(setq find-project-default-action
      '(magit-status find-file-in-repository find-file find-project-dired))


(provide 'setup-find-project)
