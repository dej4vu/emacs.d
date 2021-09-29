(require-package 'lsp-mode)
(require-package 'lsp-ui)

(add-hook 'go-mode-hook #'lsp-deferred)
(setq lsp-enable-file-watchers nil)
(setq lsp-keymap-prefix "C-c l")

(provide 'init-lsp)
