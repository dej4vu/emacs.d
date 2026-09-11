;;themes
(use-package ample-theme
  :ensure t
  :init
  (load-theme 'ample t nil)
  (load-theme 'ample-flat t nil)
  (load-theme 'ample-light t nil)
  ;; choose one to enable
  ;;(enable-theme 'ample)
  :defer t
  )

(use-package solarized-theme
  :ensure t
  :defer t
  )

(use-package plan9-theme
  :ensure t
  :defer t
  )

(use-package doom-themes
  :ensure t
  :defer t
  )

(use-package doom-themes
  :ensure t
  :defer t
  )

(use-package dracula-theme
  :ensure t
  :defer t
  )

;; https://github.com/catppuccin/emacs
(use-package catppuccin-theme
  :ensure t
  :defer t
  :init
  (setq catppuccin-flavor 'mocha) ;; 'frappe or 'latte, 'macchiato, or 'mocha
  )

(defun dej4vu/today-emacs-theme ()
  "Chooses a theme based on the day."
  (interactive)
  (let* ((themes-list (list 'ample 'solarized-light 'plan9 'doom-dark+ 'dracula 'catppuccin))
         (themes-len (length themes-list))
         (today-as-number (string-to-number (format-time-string "%Y%m%d%j")))
         (theme-index (% today-as-number themes-len))
         (theme-index 5)
         (theme-sym (nth theme-index themes-list)))
  (message "Loading theme: %s" theme-sym)
  (load-theme theme-sym t)))
(dej4vu/today-emacs-theme)

(provide 'init-themes)
