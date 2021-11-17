(eval-when-compile
  (require 'init-variables)
  (require 'init-custom))

;; Set ELPA packages
(set-package-archives dej4vu-package-archives)

;; Initialize packages
(unless (bound-and-true-p package--initialized) ; To avoid warnings in 27
  (setq package-enable-at-startup nil)          ; To prevent initializing twice
  (package-initialize))

;; Setup `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Should set before loading `use-package'
(eval-and-compile
  (setq use-package-always-ensure t)
  (setq use-package-always-defer t)
  (setq use-package-expand-minimally t)
  (setq use-package-enable-imenu-support t))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-verbose t)

;; Required by `use-package'
(use-package diminish)
(use-package bind-key)

;; Update GPG keyring for GNU ELPA
(use-package gnu-elpa-keyring-update)

;; Auto update packages
(use-package auto-package-update
  :custom
  (auto-package-update-last-update-day-filename
   (expand-file-name ".last-package-update-day" user-cache-directory))
  :init
  (setq auto-package-update-delete-old-versions t
	      auto-package-update-hide-results t)
  (defalias 'upgrade-packages #'auto-package-update-now))

(use-package auto-compile
  :init (setq load-prefer-newer t)
  :config
  (progn
    (auto-compile-on-load-mode)
    (auto-compile-on-save-mode)))

(use-package which-key
  :ensure t
  :custom
  (which-key-popup-type 'side-window)
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.3))

(provide 'init-package)
