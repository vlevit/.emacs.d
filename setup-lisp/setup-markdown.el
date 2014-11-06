(require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)

(defconst markdown-regex-header
  "#+\\|/title: \\|\\S-.*\n\\(?:\\(===+\\)\\|\\(---+\\)\\)$"
  "Regexp identifying Markdown headers.")

(defconst markdown-regex-header-1-atx
  "^\\(# \\|/title: \\)\\(.*?\\)\\($\\| #+$\\)"
  "Regular expression for level 1 atx-style (hash mark) headers.")

(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(provide 'setup-markdown)
