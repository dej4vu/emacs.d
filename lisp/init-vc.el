(when (require-package 'magit)
  (when (require-package 'diff-hl)
	(add-hook 'prog-mode-hook 'diff-hl-mode)
	(add-hook 'prog-mode-hook 'diff-hl-margin-mode)
	(add-hook 'prog-mode-hook 'diff-hl-flydiff-mode)
	(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))
  (global-set-key (kbd "C-x g") 'magit-status))
(provide 'init-vc)
