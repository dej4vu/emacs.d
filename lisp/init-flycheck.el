;; flycheck
(use-package flycheck
  :config
  (setq flycheck-error-list-minimum-level 'error)
  (setq flycheck-idle-change-delay 1)
  (setq flycheck-idle-buffer-switch-delay 5)
  (setq flycheck-check-syntax-automatically '(idle-change save)))

(provide 'init-flycheck)
