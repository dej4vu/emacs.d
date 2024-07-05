;; helm
(use-package helm
  :ensure t
  :config
  (setq
    helm-split-window-in-side-p           t
	helm-buffers-fuzzy-matching           t
	helm-move-to-line-cycle-in-source     t
	helm-ff-search-library-in-sexp        t
	helm-ff-file-name-history-use-recentf t)
  :bind
  (
	("C-c h i" . helm-semantic-or-imenu)
	("C-x C-f" . helm-find-files)
	("C-x b" . helm-mini))
  )

;; helm-smex
(use-package helm-smex
  :ensure t
  ;;:init
  ;;(global-set-key [remap execute-extended-command] #'helm-smex)
  :bind ([remap execute-extended-command] . helm-smex)
  :bind (("M-X" . helm-smex-major-mode-commands)))

(provide 'init-helm)
