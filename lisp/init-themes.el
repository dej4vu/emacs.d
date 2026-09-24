;;; init-themes.el --- Color theme configuration -*- lexical-binding: t; -*-

;; https://github.com/catppuccin/emacs
(use-package catppuccin-theme
  :demand t
  :init
  (setq catppuccin-flavor 'mocha) ;; 'frappe or 'latte, 'macchiato, or 'mocha
  :config
  (load-theme 'catppuccin t))

(defun dej4vu/today-emacs-theme ()
  "Load the catppuccin theme."
  (interactive)
  (load-theme 'catppuccin t))
(dej4vu/today-emacs-theme)

(provide 'init-themes)
;;; init-themes.el ends here
