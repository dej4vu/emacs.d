;;(require-package 'color-theme-solarized)

;;(set-frame-parameter nil 'background-mode 'dark)
;;(set-terminal-parameter nil 'background-mode 'dark)
;;(setq solarized-termcolors 256)
;;(load-theme 'solarized t)
;;(custom-set-faces (if (not window-system) '(default ((t (:background "#024353"))))))
;;(provide 'init-themes)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(require-package 'solarized-theme)
;;;; make the fringe stand out from the background
;;(setq solarized-distinct-fringe-background t)
;;
;;;; Don't change the font for some headings and titles
;;(setq solarized-use-variable-pitch nil)
;;
;;;; make the modeline high contrast
;;(setq solarized-high-contrast-mode-line t)
;;
;;;; Use less bolding
;;(setq solarized-use-less-bold t)
;;
;;;; Use more italics
;;(setq solarized-use-more-italic t)
;;
;;;; Use less colors for indicators such as git:gutter, flycheck and similar
;;(setq solarized-emphasize-indicators nil)
;;
;;;; Don't change size of org-mode headlines (but keep other size-changes)
;;(setq solarized-scale-org-headlines nil)
;;
;;;; Avoid all font-size changes
;;(setq solarized-height-minus-1 1.0)
;;(setq solarized-height-plus-1 1.0)
;;(setq solarized-height-plus-2 1.0)
;;(setq solarized-height-plus-3 1.0)
;;(setq solarized-height-plus-4 1.0)
;;;;(load-theme 'solarized-dark t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; then in your init you can load all of the themes
;; without enabling theme (or just load one)
(require-package 'ample-theme)
(load-theme 'ample t t)
(load-theme 'ample-flat t t)
(load-theme 'ample-light t t)
;; choose one to enable
(enable-theme 'ample)
;; (enable-theme 'ample-flat)
;; (enable-theme 'ample-light)
;;(require-package 'dracula-theme)
;;(load-theme 'dracula t)
;;(enable-theme 'dracula)
(provide 'init-themes)
