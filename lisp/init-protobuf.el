;;; init-protobuf.el --- Protobuf mode configuration -*- lexical-binding: t; -*-

(use-package protobuf-mode
  :defer t
  :config
  (defconst my-protobuf-style
    '((c-basic-offset . 4)
      (indent-tabs-mode . nil)))
  (add-hook 'protobuf-mode-hook 'flycheck-mode)
  (add-hook 'protobuf-mode-hook
            (lambda () (c-add-style "my-style" my-protobuf-style t))))

(provide 'init-protobuf)
;;; init-protobuf.el ends here
