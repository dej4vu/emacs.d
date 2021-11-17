;; web mode
(use-package web-mode
  :mode(("\\.phtml\\'" . web-mode)
		("\\.tpl\\.php\\'" . web-mode)
		("\\.tpl\\'" . web-mode)
		("\\.blade\\.php\\'" . web-mode)
		("\\.jsp\\'" . web-mode)
		("\\.as[cp]x\\'" . web-mode)
		("\\.erb\\'" . web-mode)
		("\\.html?\\'" . web-mode)))

(provide 'init-web)
