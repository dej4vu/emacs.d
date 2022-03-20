(use-package lsp-pyright
  :hook (python-mode . (lambda()
                         (require 'lsp-pyright)
                         (lsp-deferred)
                         (lsp-ui-mode)
                         (lsp-ui-doc-mode))))
(use-package python
  :hook ((python-mode . (lambda ()
                          (company-mode)
                          (flycheck-mode)))
         (python-mode . (lambda ()
                          (setq-local tab-width 4)))
         (inferior-python-mode . company-mode))
  :config
  ;; don't try to guess python indent offset
  (setq python-indent-guess-indent-offset nil)
  (setq python-shell-completion-native-enable nil))
(provide 'init-python)
