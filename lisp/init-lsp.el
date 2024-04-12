(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  (setq read-process-output-max (* 1024 1024)) ;; 1mb
  (setq gc-cons-threshold 100000000)
  (setq lsp-log-io t)
  (custom-set-faces
    '(header-line ((t (:inherit mode-line :background "dim gray")))))
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (go-mode . lsp-defered)
         (python-mode . lsp-deferred)
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
