;;https://github.com/CSRaghunandan/.emacs.d/blob/master/setup-files/setup-go.el
(use-package go-mode
  :hook ((go-mode . (lambda ()
                      (lsp-deferred)
                      (lsp-ui-doc-mode)
                      (wh/set-go-tab-width)
                      (my-go-mode-hook)
                      (company-mode))))
  :config

  (defun my-go-mode-hook()
      (set (make-local-variable 'company-backends)
           '((company-capf company-files :with company-yasnippet)
             (company-dabbrev-code company-dabbrev))))

  ;; Go is indented with tabs, so set the tab size in those buffers.
  (defun wh/set-go-tab-width ()
    (setq-local indent-tabs-mode t)
    (setq tab-width 4))

  ;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks))

(provide 'init-go)
