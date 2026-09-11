;; 1. 锁定依赖包 transient 至稳定版 (v0.7.8)
(straight-use-package
 '(transient :type git :host github :repo "magit/transient" :commit "5054eb5e6"))

;; 2. 锁定主包 magit 至稳定版 (v4.1.3)
(straight-use-package
 '(magit :type git :host github :repo "magit/magit" :commit "82ef89d8d"))

;; 3. 正常加载 Magit
(use-package magit
  :straight t)

(use-package diff-hl
  :hook (
	     (prog-mode . diff-hl-mode)
	     (prog-mode . diff-hl-margin-mode)
	     (prog-mode . diff-hl-flydiff-mode)
	     (magit-post-refresh . diff-hl-magit-post-refresh))
  :init
  (global-diff-hl-mode))

(provide 'init-vc)
