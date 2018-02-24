(require-package 'color-theme-solarized)

(set-frame-parameter nil 'background-mode 'dark)
(set-terminal-parameter nil 'background-mode 'dark)
;;(setq solarized-termcolors 256)

(load-theme 'solarized t)

(provide 'init-themes)
