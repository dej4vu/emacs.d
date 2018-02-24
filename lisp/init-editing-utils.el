(when (require-package 'rainbow-delimiters)
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(require-package 'clang-format)

;; golden-ratio-mode
(require-package 'golden-ratio)
(golden-ratio-mode 1)

(setq-default
 make-backup-files nil
 auto-save-default nil)

(menu-bar-mode 0)
(column-number-mode 1)
(electric-pair-mode 1)

(provide 'init-editing-utils)
