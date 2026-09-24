;;; init-themes.el --- Color theme configuration -*- lexical-binding: t; -*-

;; https://github.com/catppuccin/emacs
(use-package catppuccin-theme
  :demand t
  :init
  (setq catppuccin-flavor 'mocha) ;; 'frappe or 'latte, 'macchiato, or 'mocha
  :config
  (load-theme 'catppuccin t))

(provide 'init-themes)
;;; init-themes.el ends here
