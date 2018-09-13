(require-package 'color-theme-solarized)

;;(set-frame-parameter nil 'background-mode 'dark)
;;(set-terminal-parameter nil 'background-mode 'dark)
(setq solarized-termcolors 256)
(load-theme 'solarized t)
;;(enable-theme 'solarized)
(custom-set-faces (if (not window-system) '(default ((t (:background "nil"))))))
(provide 'init-themes)
