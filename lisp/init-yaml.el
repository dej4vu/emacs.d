;; yaml mode
(use-package yaml-mode
  :mode (("\\.yml\\.erb\\'" . yaml-mode))
  :init
  (add-hook 'yaml-mode-hook #'flycheck-mode)
  (add-hook 'yaml-mode-hook #'goto-address-prog-mode))


(provide 'init-yaml)
