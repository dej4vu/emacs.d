;;; init-js.el --- JavaScript mode configuration -*- lexical-binding: t; -*-

(use-package js2-mode
  :mode(("\\.js\\'" . js2-mode)
		("\\.pac\\'" . web-mode)))
(provide 'init-js)

;;; init-js.el ends here
