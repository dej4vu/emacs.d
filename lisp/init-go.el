(require-package 'go-mode)
;;(require-package 'go-eldoc)
;;(require-package 'company-go)
;;(require-package 'go-add-tags)
;;(require-package 'go-guru)
;;(require-package 'go-tag)
;;(require-package 'go-fill-struct)
;;(require-package 'go-impl)
;;(require-package 'go-rename)
(require-package 'lsp-mode)
(require-package 'lsp-ui)
;;(require-package 'company-lsp)

;;(add-auto-mode 'go-mode "\\.go\\'")

(eval-after-load 'go-mode
  '(progn
     ;;(add-hook 'go-mode-hook 'go-eldoc-setup)
     ;; gofmt on save
     (add-hook 'before-save-hook 'gofmt-before-save)

	 (add-hook 'go-mode-hook 'lsp-deferred)

     ;; company mode settings
     ;;(add-to-list 'company-backends 'company-go)

     ;; el-doc for go
     ;;(go-eldoc-setup)

     ;; flycheck mode
     ;;(add-hook 'go-mode-hook 'flycheck-mode)
	 ;;(push 'company-lsp company-backends)
	 (setq lsp-enable-file-watchers nil)
	 (setq lsp-keymap-prefix "C-c l")
	 (add-hook 'go-mode-hook (lambda ()
                                  (flycheck-mode 1);;))
                                  (lsp-ui-mode 1)
                                  ;;(setq flycheck-checker 'go-golint)
								  ))

	 ;; go-guru
	 ;;(add-hook 'go-mode-hook 'go-guru-unhighlight-identifiers)

     ;; go-add-tags mode
     ;;(custom-set-variables '(go-add-tags-sytle 'lower-camel-case))
     ;; go-mode key bindinigs
     (let ((map go-mode-map))
       (define-key map (kbd "C-c M-j")  'godef-jump-other-window)
       ;;(define-key map (kbd "C-c t")  'go-tag-add)
       ;;(define-key map (kbd "C-c T")  'go-tag-remove)
       )
     ))

(provide 'init-go)
