;; @see https://bitbucket.org/lyro/evil/issue/360/possible-evil-search-symbol-forward
;; evil 1.0.8 search word instead of symbol
;;(setq evil-symbol-word-search t)
;; Give us back Ctrl+U for vim emulation
;;(setq evil-want-C-u-scroll t)
;;(require-package 'evil)
;; enable evil-mode
;;(evil-mode 1)
;;(setcdr evil-insert-state-map nil)
(use-package undo-tree
  :ensure t
  ;;:init
  ;;(global-undo-tree-mode)
  )
(use-package evil
  :ensure t
  :init 
  (evil-mode +1)
  :config
  (setcdr evil-insert-state-map nil)
  (setq evil-symbol-word-search t)
  (setq evil-want-C-u-scroll t)
  (global-undo-tree-mode)
  (setq evil-undo-system 'undo-tree)
  ;;(evil-set-undo-system 'undo-tree)
  )

(provide 'init-evil)
