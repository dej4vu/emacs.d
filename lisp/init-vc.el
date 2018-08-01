(require-package 'magit)
(require-package 'diff-hl)

(global-diff-hl-mode +1)
(diff-hl-margin-mode +1)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
(provide 'init-vc)
