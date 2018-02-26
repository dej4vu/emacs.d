(require-package 'yaml-mode)
(add-auto-mode 'yaml-mode "\\.yml\\.erb\\'")
(add-hook 'yaml-mode-hook 'goto-address-prog-mode)

(eval-after-load 'yaml-mode
  '(progn
     ;; flycheck mode
     (add-hook 'yaml-mode-hook 'flycheck-mode)))

(provide 'init-yaml)
