;; (load "package")
(require 'package)

(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

(setq package-enable-at-startup nil)
(package-initialize)

(defun packages-install (packages)
  (dolist (package packages)
    (when (not (package-installed-p package))
      (package-install package)))
  (delete-other-windows))

(defun init--install-packages ()
  (packages-install '(aggressive-indent
                      anti-zenburn-theme
                      anything
                      auctex
                      auto-complete
                      autopair
                      bash-completion
                      beacon
                      bm
                      coffee-mode
                      color-theme
                      color-theme-solarized
                      concurrent
                      counsel
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
                      flycheck
                      flymake-coffee
                      flymake-cursor
                      flymake-easy
                      fringe-helper
                      git-gutter
                      git-gutter-fringe
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
                      key-seq
                      magit
                      markdown-mode
                      lispy
                      mu4e-maildirs-extension
                      multiple-cursors
                      mwe-log-commands
                      names
                      paradox
                      paredit
                      paredit-everywhere
                      perspective
                      pkg-info
                      popup
                      pos-tip
                      projectile
                      python-environment
                      rainbow-mode
                      ripgrep
                      s
                      scratch
                      smartparens
                      smex
                      swiper
                      sws-mode
                      visual-regexp
                      vline
                      visual-fill-column
                      web-mode
                      weblogger
                      wgrep
                      window-layout
                      windsize
                      vlf
                      xml-rpc
                      yaml-mode
                      yasnippet)))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

(provide 'setup-package)
