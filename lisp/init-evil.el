;; evil
(use-package evil
  :ensure t
  :init 
  (evil-mode +1)
  :config
  (setcdr evil-insert-state-map nil)
  ;; @see https://bitbucket.org/lyro/evil/issue/360/possible-evil-search-symbol-forward
  ;; evil 1.0.8 search word instead of symbol
  (setq evil-symbol-word-search t)
  ;; Give us back Ctrl+U for vim emulation
  (setq evil-want-C-u-scroll t)
  )

(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode)
  :config
  (setq-default undo-tree-auto-save-history nil)
  (evil-set-undo-system 'undo-tree)
  )


(provide 'init-evil)
