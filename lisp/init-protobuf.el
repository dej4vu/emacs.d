(require-package 'protobuf-mode)

(eval-after-load 'protobuf-mode
  '(progn
     ;; format on save
     (add-hook 'before-save-hook 'clang-format-buffer)
     )
  )

(provide 'init-protobuf)
