(require-package 'flycheck)
;;(setq flycheck-error-list-minimum-level 'warning)
(setq flycheck-idle-change-delay 1)
(setq flycheck-idle-buffer-switch-delay 5)
(setq flycheck-check-syntax-automatically '(idle-change save))

(provide 'init-flycheck)
