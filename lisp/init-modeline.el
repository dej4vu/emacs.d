;;; init-modeline.el --- Mode line configuration -*- lexical-binding: t; -*-

;; which-key: show available keybindings (built-in in Emacs 30+)
(use-package which-key
  :straight nil
  :custom
  (which-key-idle-delay 0.3)
  (which-key-popup-type 'side-window)
  :config
  (which-key-mode))

;; anzu: show search/replace match count
(use-package anzu
  :init
  (setq anzu-mode-lighter "")
  (global-anzu-mode +1))

(use-package evil-anzu
  :after (evil anzu)
  :demand t)

;; minions: compact minor mode display
(use-package minions
  :init
  (minions-mode +1))

;; nerd-icons: font icons (dependency of doom-modeline)
(use-package nerd-icons)

;; doom-modeline
(use-package doom-modeline
  :init
  (setq nerd-icons-color-icons nil)
  (doom-modeline-mode 1))

(provide 'init-modeline)
;;; init-modeline.el ends here
