(add-hook 'yaml-mode-hook '(lambda () (ansible 1) (auto-complete-mode 1)))
(add-hook 'ansible-hook 'ansible::auto-decrypt-encrypt)

(provide 'setup-ansible)
