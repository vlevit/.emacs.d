(require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)

(defconst markdown-regex-multimarkdown-metadata
  "^/?\\([[:alpha:]][[:alpha:] _-]*?\\):[ \t]*\\(.*\\)$"
  "Regular expression for matching MultiMarkdown metadata.")

(defconst markdown-regex-header
  "^\\(?:\\(/title:\\)\\s-*\\(.*\\)\\|\\(.+\\)\n\\(=+\\)\\|\\(.+\\)\n\\(-+\\)\\|\\(#+\\)\\s-*\\(.*?\\)\\s-*?\\(#*\\)\\)$"
  "Regexp identifying Markdown headers.")

(defconst markdown-regex-title
  "^\\(/title:\\)[ \t]*\\(.*\\)$"
  "Regular expression for generic /title:-style headers.")

(add-to-list 'markdown-mode-font-lock-keywords-basic
             (cons markdown-regex-title '((1 markdown-header-delimiter-face)
                                          (2 markdown-header-face-1))))
(markdown-reload-extensions)

(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(provide 'setup-markdown)
