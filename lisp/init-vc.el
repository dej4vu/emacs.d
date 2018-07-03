(require-package 'magit)
(require-package 'diff-hl)

(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
(provide 'init-vc)
