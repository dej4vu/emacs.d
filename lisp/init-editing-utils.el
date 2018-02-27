(when (require-package 'rainbow-delimiters)
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(when (require-package 'smartparens)
  (add-hook 'prog-mode-hook 'smartparens-mode))

(require-package 'clang-format)

;; golden-ratio-mode
(require-package 'golden-ratio)
(golden-ratio-mode 1)

(setq-default
 make-backup-files nil
 auto-save-default nil
 tab-width 4)


(provide 'init-editing-utils)
