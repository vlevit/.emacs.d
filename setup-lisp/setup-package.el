;; (load "package")
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(defun packages-install (packages)
  (--each packages
    (when (not (package-installed-p it))
      (package-install it)))
  (delete-other-windows))

(defun init--install-packages ()
  (packages-install '(aggressive-indent
                      anti-zenburn-theme
                      anything
                      auctex
                      auto-complete
                      autopair
                      bash-completion
                      bm
                      coffee-mode
                      color-theme
                      color-theme-solarized
                      concurrent
                      ctable
                      dash
                      deferred
                      dired+
                      dired-hacks-utils
                      dired-rainbow
                      elfeed
                      epc
                      epl
                      eproject
                      expand-region
                      fill-column-indicator
                      find-file-in-repository
                      flx
                      flx-ido
                      flymake-coffee
                      flymake-cursor
                      flymake-easy
                      fringe-helper
                      git-commit-mode
                      git-gutter
                      git-gutter-fringe
                      git-rebase-mode
                      hexrgb
                      highlight-symbol
                      idomenu
                      iflipb
                      iy-go-to-char
                      jade-mode
                      jedi
                      jinja2-mode
                      js2-mode
                      js2-refactor
                      jump-char
                      key-chord
                      magit
                      markdown-mode
                      mu4e-maildirs-extension
                      multiple-cursors
                      mwe-log-commands
                      names
                      paredit
                      paredit-everywhere
                      perspective
                      pkg-info
                      popup
                      pos-tip
                      projectile
                      python-environment
                      rainbow-mode
                      s
                      scratch
                      smartparens
                      smex
                      sws-mode
                      visual-regexp
                      vline
                      web-mode
                      weblogger
                      wgrep
                      window-layout
                      windsize
                      xml-rpc
                      yaml-mode
                      yasnippet)))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

(provide 'setup-package)
