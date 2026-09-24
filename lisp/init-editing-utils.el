;;; init-editing-utils.el --- Core editing utilities -*- lexical-binding: t; -*-

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode)
  :init
  (outline-minor-mode +1)
  (outline-minor-mode -1))

(show-paren-mode +1)

;; smartparens
(use-package smartparens
  :hook (prog-mode text-mode markdown-mode) ;; add `smartparens-mode` to these hooks
  :config
  ;; load default config
  (require 'smartparens-config))

;; clang-format
(use-package clang-format
  :defer t
  )

(add-hook 'prog-mode-hook 'hs-minor-mode)

;; golden-ratio-mode
(use-package golden-ratio
  :defer t
  :init
  (golden-ratio-mode +1)
  :config
  (setq golden-ratio-extra-commands
	  (append golden-ratio-extra-commands
			  '(evil-window-left
				evil-window-right
				evil-window-up
				evil-window-down
				evil-window-next
				evil-window-prev
				buf-move-left
				buf-move-right
				buf-move-up
				buf-move-down
				window-number-select
				select-window
				select-window-1
				select-window-2
				select-window-3
				select-window-4
				select-window-5
				select-window-6
				select-window-7
				select-window-8
				select-window-9)))
  (add-to-list 'window-size-change-functions 'golden-ratio)
)

;; evil-surround
(use-package evil-surround
  :init
  (global-evil-surround-mode +1))

;; evil-numbers
;; Increment / Decrement binary, octal, decimal and hex literals
(use-package evil-numbers
  :bind(
  ("C-c +" . evil-numbers/inc-at-pt)
  ("C-c -" . evil-numbers/dec-at-pt)))

(setq-default
 ; no share system clipboard
 x-select-enable-clipboard nil

 ;; disable backup files
 make-backup-files nil
 auto-save-default nil
 tab-width 4)
;; global toggle commentary
(global-set-key (kbd "C-c C-c") 'comment-line)

;; insert newline below and jumpt to it
(global-set-key (kbd "<C-return>") (kbd "C-e C-m"))

;; multiple-cursors
(use-package multiple-cursors
  :bind(
    ("C->" . mc/mark-next-like-this)
	("C-<" . mc/mark-previous-like-this)
	("C-c C-<" . mc/mark-all-like-this))
  )


(provide 'init-editing-utils)
;;; init-editing-utils.el ends here
