;; @see https://bitbucket.org/lyro/evil/issue/360/possible-evil-search-symbol-forward
;; evil 1.0.8 search word instead of symbol
(setq evil-symbol-word-search t)
;; Give us back Ctrl+U for vim emulation
(setq evil-want-C-u-scroll t)
(require-package 'evil)
;; enable evil-mode
(evil-mode 1)

(provide 'init-evil)
