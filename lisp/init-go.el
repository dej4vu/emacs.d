(require-package 'go-mode)
(require-package 'go-eldoc)
(require-package 'company-go)
(require-package 'go-add-tags)

(add-auto-mode 'go-mode
	       "\\.go\\'")

(eval-after-load 'go-mode
  '(progn
     (add-hook 'go-mode-hook 'go-eldoc-setup)
     ;; gofmt on save
     (add-hook 'before-save-hook 'gofmt-before-save)

     ;; company mode settings
     (add-to-list 'company-backends 'company-go)

     ;; el-doc for go
     (go-eldoc-setup)

     ;; flycheck mode
     (add-hook 'go-mode-hook 'flycheck-mode)

     ;; go-add-tags mode
     (custom-set-variables '(go-add-tags-sytle 'snake-case))
     ;; go-mode key bindinigs
     (let ((map go-mode-map))
       (define-key map (kbd "C-c C-o")  'godef-jump-other-window)
       (define-key map (kbd "C-c t")  'go-add-tags)
       )
     ))

(provide 'init-go)
