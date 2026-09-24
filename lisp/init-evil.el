;;; init-evil.el --- Evil mode configuration -*- lexical-binding: t; -*-

(use-package evil
  :init
  (evil-mode +1)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-integration t)
  :config
  (setcdr evil-insert-state-map nil)
  ;; @see https://bitbucket.org/lyro/evil/issue/360/possible-evil-search-symbol-forward
  ;; evil 1.0.8 search word instead of symbol
  (setq evil-symbol-word-search t)
  ;; Give us back Ctrl+U for vim emulation
  (setq evil-want-C-u-scroll t)
  (evil-set-initial-state 'gptel-context-buffer-mode 'emacs)
  )

(use-package undo-tree
  :init
  (global-undo-tree-mode)
  :config
  (setq-default undo-tree-auto-save-history nil)
  (evil-set-undo-system 'undo-tree)
  )


(provide 'init-evil)
;;; init-evil.el ends here
