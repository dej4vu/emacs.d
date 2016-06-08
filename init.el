;;  __        __             __   ___
;; |__)  /\  /  ` |__/  /\  / _` |__
;; |    /~~\ \__, |  \ /~~\ \__> |___
;;                      __   ___        ___      ___
;; |\/|  /\  |\ |  /\  / _` |__   |\/| |__  |\ |  |
;; |  | /~~\ | \| /~~\ \__> |___  |  | |___ | \|  |
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
			 '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
	(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(add-to-list 'load-path "~/.emacs.d/lisp/")

;;disable menu-bar-mode
(menu-bar-mode 0)
(setq default-tab-width 4);;set tab size
(show-paren-mode t);;显示括号匹配

;;Give us back Ctrl+U for vim emulation
(setq evil-want-C-u-scroll t)
;;evil mode
(require 'evil)
(evil-mode 1)

;;yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;;bind f8 to neotree
(global-set-key [f8] 'neotree-toggle)
;;(add-hook 'after-init-hook #'neotree-toggle);;open neotree
;;use in evil mode config
(add-hook 'neotree-mode-hook
	  (lambda ()
	    (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
	    (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
	    (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
	    (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

;;set monokai theme
(load-theme 'monokai t)

;;set electric-pair-mode on
(electric-pair-mode 1)


;;turn off inhabit-splash-screen
(setq inhabit-splash-screen 1)

(setenv "GOPATH" "/data/workspace")
(add-hook 'go-mode-hook 'go-eldoc-setup)

(require 'company) ; load company mode
(add-hook 'after-init-hook 'global-company-mode)
(require 'company-go) ;load company-go mode
(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook (lambda ()
						    (set (make-local-variable 'company-backends) '(company-go))
							  (company-mode)))
;;enalble flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;;smex setting
(global-set-key [(meta x)] (lambda ()
                             (interactive)
                             (or (boundp 'smex-cache)
                                 (smex-initialize))
                             (global-set-key [(meta x)] 'smex)
                             (smex)))

(global-set-key [(shift meta x)] (lambda ()
                                   (interactive)
                                   (or (boundp 'smex-cache)
                                       (smex-initialize))
                                   (global-set-key [(shift meta x)] 'smex-major-mode-commands)
                                   (smex-major-mode-commands)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("e56ee322c8907feab796a1fb808ceadaab5caba5494a50ee83a13091d5b1a10c" "6df30cfb75df80e5808ac1557d5cc728746c8dbc9bc726de35b15180fa6e0ad9" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
