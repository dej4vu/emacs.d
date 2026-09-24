;;; init-yas.el --- YASnippet configuration -*- lexical-binding: t; -*-

(use-package yasnippet
  :commands yas-minor-mode
  :hook (go-mode . yas-minor-mode))

(use-package yasnippet-snippets)

(provide 'init-yas)
;;; init-yas.el ends here
