(when (require-package 'rainbow-delimiters)
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  ;; rainbow-delimiters-mode not work if outline-minor-mode not set
  (outline-minor-mode +1)
  (outline-minor-mode -1))

(show-paren-mode +1)
(when (require-package 'smartparens)
  (add-hook 'prog-mode-hook 'smartparens-mode)
  (require 'smartparens-config))

(require-package 'clang-format)

;; golden-ratio-mode
(require-package 'golden-ratio)
(golden-ratio-mode +1)

(setq-default
 make-backup-files nil
 auto-save-default nil
 tab-width 4)


(provide 'init-editing-utils)
