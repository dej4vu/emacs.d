(when (require-package 'rainbow-delimiters)
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  ;; rainbow-delimiters-mode not work if outline-minor-mode not set
  (outline-minor-mode +1)
  (outline-minor-mode -1))

(show-paren-mode +1)
(when (require-package 'smartparens)
  (add-hook 'prog-mode-hook 'smartparens-mode)
  (require 'smartparens-config))

(require-package 'clang-format)

;; golden-ratio-mode
(require-package 'golden-ratio)
(golden-ratio-mode +1)
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
(when (require-package 'evil-surround)
  (global-evil-surround-mode +1))

(setq-default
 make-backup-files nil
 auto-save-default nil
 tab-width 4)
;; global toggle commentary
(global-set-key (kbd "C-c C-c") 'comment-line)


(provide 'init-editing-utils)
