(when (require-package 'rainbow-delimiters)
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  ;; rainbow-delimiters-mode not work if outline-minor-mode not set
  (outline-minor-mode +1)
  (outline-minor-mode -1))

(show-paren-mode +1)
;;(when (require-package 'smartparens)
;;  (add-hook 'prog-mode-hook 'smartparens-mode)
;;  (require 'smartparens-config))
(use-package smartparens-mode
  :ensure smartparens  ;; install the package
  :hook (prog-mode text-mode markdown-mode) ;; add `smartparens-mode` to these hooks
  :config
  ;; load default config
  (require 'smartparens-config))

(require-package 'clang-format)

(add-hook 'prog-mode-hook 'hs-minor-mode)

;; golden-ratio-mode
;;(require-package 'golden-ratio)
;;(golden-ratio-mode +1)

(use-package golden-ratio
  :ensure t
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
(when (require-package 'evil-surround)
  (global-evil-surround-mode +1))

;; Increment / Decrement binary, octal, decimal and hex literals
(when (require-package 'evil-numbers)
  (global-set-key (kbd "C-c +") 'evil-numbers/inc-at-pt)
  (global-set-key (kbd "C-c -") 'evil-numbers/dec-at-pt))

(setq-default
 make-backup-files nil
 auto-save-default nil
 tab-width 4)
;; global toggle commentary
(global-set-key (kbd "C-c C-c") 'comment-line)

;; multiple-cursors
(require-package 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


(provide 'init-editing-utils)
