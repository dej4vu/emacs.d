;;  __        __             __   ___
;; |__)  /\  /  ` |__/  /\  / _` |__
;; |    /~~\ \__, |  \ /~~\ \__> |___
;;                      __   ___        ___      ___
;; |\/|  /\  |\ |  /\  / _` |__   |\/| |__  |\ |  |
;; |  | /~~\ | \| /~~\ \__> |___  |  | |___ | \|  |
(require 'package) ;; You might already have this line
;;(add-to-list 'package-archives
;;'("melpa" . "https://melpa.org/packages/"))
(setq package-archives '(("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  ;;(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
  (add-to-list 'package-archives '("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))
(package-initialize) ;; You might already have this line

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'cl)
(defvar init-packages-list 
  '(evil go-mode go-eldoc flycheck company company-go yasnippet which-key helm-core helm helm-smex
		 monokai-theme color-theme-solarized smex protobuf-mode yaml-mode elisp-format) 
  "default packages")

(defun init-packages-installed-p () 
  "Check if all packages in `init-package-list' are installed."
  (every #'package-installed-p init-packages-list))
(defun install-init-packages () 
  (unless (init-packages-installed-p) 
	(package-refresh-contents) 
	(dolist (package init-packages-list) 
	  (when (not (package-installed-p package)) 
		(package-install package)))))
(install-init-packages)
;;disable menu-bar-mode
(menu-bar-mode 0)
(column-number-mode 1)
(setq default-tab-width 4)	 ;;set tab size
(show-paren-mode t)			 ;;显示括号匹配
(setq make-backup-files nil) ;; disable auto back files.
(setq auto-save-default nil) ;; diable auto save files.
;;Give us back Ctrl+U for vim emulation
(setq evil-want-C-u-scroll t)
;;evil mode
(require 'evil)
(evil-mode 1)


;;yasnippet
(require 'yasnippet)
(yas-global-mode 1)


;;set monokai theme
;;(load-theme 'monokai t)

;;set solarized theme
(set-frame-parameter nil 'background-mode 'dark)
(set-terminal-parameter nil 'background-mode 'dark)
;;(setq solarized-termcolors 256)
(load-theme 'solarized t)

;;set electric-pair-mode on
(electric-pair-mode 1)


;;turn off inhabit-splash-screen
(setq inhabit-splash-screen 1)

;;(setenv "GOPATH" "/data/workspace")
(add-hook 'go-mode-hook 'go-eldoc-setup)

(require 'which-key)
(which-key-mode 1)
(require 'company)						; load company mode
(setq company-idle-delay 0.1)
(setq company-tooltip-limit 10)
(setq company-minimum-prefix-length 2)
(add-hook 'after-init-hook 'global-company-mode)
(require 'company-go)					;load company-go mode
(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook (lambda () 
						  (set (make-local-variable 'company-backends) 
							   '(company-go)) 
						  (local-set-key (kbd "C-c C-o") 'godef-jump-other-window) 
						  (company-mode 1) 
						  (flycheck-mode 1)
										;(linum-mode 1)
						  ))
;;run gofmt on the current buffer when saving:
(add-hook 'before-save-hook 'gofmt-before-save)
;;enalble flycheck
;;(add-hook 'after-init-hook #'global-flycheck-mode)

;;smex setting
(global-set-key [(meta x)] 
				(lambda () 
				  (interactive) 
				  (or (boundp 'smex-cache) 
					  (smex-initialize)) 
				  (global-set-key [(meta x)] 'smex) 
				  (smex)))

(global-set-key [(shift meta x)] 
				(lambda () 
				  (interactive) 
				  (or (boundp 'smex-cache) 
					  (smex-initialize)) 
				  (global-set-key [(shift meta x)] 'smex-major-mode-commands) 
				  (smex-major-mode-commands)))

(global-set-key (kbd "C-c h i") 'helm-semantic-or-imenu)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

(require 'elisp-format)

(defun find-user-init-file () 
  "Edit the `user-init-file', in another window." 
  (interactive) 
  (find-file-other-window user-init-file))

;;(global-set-key [f2] 'find-user-init-file)
(global-set-key (kbd "C-x c") 'find-user-init-file)

;; Add yasnippet support for all company backends
;; https://github.com/syl20bnr/spacemacs/pull/179
;;(defvar company-mode/enable-yas t
;;  "Enable yasnippet for all backends.")
;;
;;(defun company-mode/backend-with-yas (backend)
;;  (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
;;      backend
;;    (append (if (consp backend) backend (list backend))
;;            '(:with company-yasnippet))))
;;
;;(setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))

(defun check-expansion () 
  (save-excursion (if (looking-at "\\_>") t (backward-char 1) 
					  (if (looking-at "\\.") t (backward-char 1) 
						  (if (looking-at "->") t nil)))))

(defun do-yas-expand () 
  (let ((yas/fallback-behavior 'return-nil)) 
	(yas/expand)))

(defun tab-indent-or-complete () 
  (interactive) 
  (cond ((minibufferp) 
		 (minibuffer-complete)) 
		(t (indent-for-tab-command) 
		   (if (or (not yas/minor-mode) 
				   (null (do-yas-expand))) 
			   (if (check-expansion) 
				   (progn (company-manual-begin) 
						  (if (null company-candidates) 
							  (progn (company-abort) 
									 (indent-for-tab-command)))))))))

(defun tab-complete-or-next-field () 
  (interactive) 
  (if (or (not yas/minor-mode) 
		  (null (do-yas-expand))) 
	  (if company-candidates (company-complete-selection) 
		(if (check-expansion) 
			(progn (company-manual-begin) 
				   (if (null company-candidates) 
					   (progn (company-abort) 
							  (yas-next-field)))) 
		  (yas-next-field)))))

(defun expand-snippet-or-complete-selection () 
  (interactive) 
  (if (or (not yas/minor-mode) 
		  (null (do-yas-expand)) 
		  (company-abort)) 
	  (company-complete-selection)))

(defun abort-company-or-yas () 
  (interactive) 
  (if (null company-candidates) 
	  (yas-abort-snippet) 
	(company-abort)))

(global-set-key [tab] 'tab-indent-or-complete)
(global-set-key (kbd "TAB") 'tab-indent-or-complete)
(global-set-key [(control return)] 'company-complete-common)

(define-key company-active-map [tab] 'expand-snippet-or-complete-selection)
(define-key company-active-map (kbd "TAB") 'expand-snippet-or-complete-selection)

(define-key yas-minor-mode-map [tab] nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)

(define-key yas-keymap [tab] 'tab-complete-or-next-field)
(define-key yas-keymap (kbd "TAB") 'tab-complete-or-next-field)
(define-key yas-keymap [(control tab)] 'yas-next-field)
(define-key yas-keymap (kbd "C-g") 'abort-company-or-yas)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
