(use-package magit)

(use-package diff-hl
  :hook (
	     (prog-mode . diff-hl-mode)
	     (prog-mode . diff-hl-margin-mode)
	     (prog-mode . diff-hl-flydiff-mode)
	     (magit-post-refresh . diff-hl-magit-post-refresh))
  :init
  (global-diff-hl-mode))

(provide 'init-vc)
