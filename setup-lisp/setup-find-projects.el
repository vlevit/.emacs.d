(require 'find-projects)

(setq find-projects-dirs '("~/projects" "~/work/josh" "~/work/dominic"))
(setq find-projects-patterns
      '("~/.emacs.d"
        "~/projects/*"
        "~/work/*/*"
        "~/workspace/*"))

(provide 'setup-find-projects)
