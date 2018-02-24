(when (require-package 'helm)
  (when (require-package 'helm-smex)
    (global-set-key [remap execute-extended-command] #'helm-smex)
    (global-set-key (kbd "M-X") #'helm-smex-major-mode-commands))
  (setq helm-split-window-in-side-p           t
	helm-buffers-fuzzy-matching           t
	helm-move-to-line-cycle-in-source     t
	helm-ff-search-library-in-sexp        t
	helm-ff-file-name-history-use-recentf t)
  (global-set-key (kbd "C-c h i")'helm-semantic-or-imenu)
  (global-set-key (kbd "C-x C-f")'helm-find-files)
  )

(provide 'init-helm)
