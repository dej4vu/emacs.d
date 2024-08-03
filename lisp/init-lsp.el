(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  (setq read-process-output-max (* 1024 1024)) ;; 1mb
  (setq gc-cons-threshold 100000000)
  (setq lsp-log-io t)
  (setq lsp-file-watch-threshold 5000)
  (custom-set-faces
    '(header-line ((t (:inherit mode-line :background "dim gray")))))
  :config
  ;; 配置gopls的特定设置
  ;;(setq lsp-go-build-flags '["-build-tags=wireinject"])
  ;;(setq lsp-go-gopls-args '["-build-tags=wireinject"])
  ;;(lsp-register-custom-settings
  ;; '(("gopls.completeFunctionCalls" t t)
  ;;	 ("gopls.usePlaceholders" t t)
  ;;	 ))
  ;;:custom
  ;;(setq lsp-enable-snippet t)
  ;;排除'/opt/homebrew'目录下所有文件
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]opt/homebrew")

  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (go-mode . lsp-defered)
         (python-mode . lsp-deferred)
         (c-mode . lsp-deferred)
         (c++-mode . lsp-deferred)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :bind (:map lsp-mode-map
              ("C-c C-j" . 'xref-find-definitions)
              ("C-c M-j" . 'xref-find-definitions-other-window))
  :bind (:map lsp-mode-map
              ("C-c C-t" . lsp-describe-thing-at-point))
  :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)

(provide 'init-lsp)
