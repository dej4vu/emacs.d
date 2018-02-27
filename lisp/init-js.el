(when (require-package 'js2-mode)
  (require-package 'json-mode)
  (add-auto-mode 'js2-mode "\\.js\\'")
  (add-auto-mode 'web-mode "\\.pac\\'"))

(provide 'init-js)
