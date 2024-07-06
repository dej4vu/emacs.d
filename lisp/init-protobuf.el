;; protobuf
;;(require-package 'protobuf-mode)
(use-package protobuf-mode
  :ensure t
  :config
  (defconst my-protobuf-style
  '((c-basic-offset . 4)
    (indent-tabs-mode . nil)))
  (eval-after-load 'protobuf-mode
  '(progn
     ;; format on save
     ;;(add-hook 'before-save-hook 'clang-format-buffer)

     ;; flycheck mode
     (add-hook 'protobuf-mode-hook 'flycheck-mode)
	 (add-hook 'protobuf-mode-hook
			   (lambda () (c-add-style "my-style" my-protobuf-style t)))
     )
  )
  )

;; use 4-space indentation:
;;(defconst my-protobuf-style
;;  '((c-basic-offset . 4)
;;    (indent-tabs-mode . nil)))

(eval-after-load 'protobuf-mode
  '(progn
     ;; format on save
     ;;(add-hook 'before-save-hook 'clang-format-buffer)

     ;; flycheck mode
     (add-hook 'protobuf-mode-hook 'flycheck-mode)
	 (add-hook 'protobuf-mode-hook
			   (lambda () (c-add-style "my-style" my-protobuf-style t)))
     )
  )

(provide 'init-protobuf)
