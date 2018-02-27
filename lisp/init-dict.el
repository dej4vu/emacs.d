(when (require-package 'bing-dict)
  (global-set-key (kbd "C-c d") 'bing-dict-brief))

(provide 'init-dict)
