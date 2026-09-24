;;; init-completion.el --- Minibuffer completion (Vertico + Orderless + Marginalia) -*- lexical-binding: t; -*-

;; Enable rich annotations using the Marginalia package
(use-package marginalia
  :init
  (marginalia-mode))

;; Enable vertico
(use-package vertico
  :init
  (vertico-mode))

;; 补全风格
(use-package orderless
  :custom
  (completion-styles '(orderless flex))
  (completion-category-overrides '((file (styles basic partial-completion)))))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :straight nil
  :init
  (savehist-mode))

;; fzf integration
(use-package fzf
  :config
  (setq fzf/args "-x --color bw --print-query --margin=1,0 --no-hscroll"
        fzf/executable "fzf"
        fzf/git-grep-args "-i --line-number %s"
        fzf/grep-command "grep -inrH"
        fzf/position-bottom t
        fzf/window-height 15))

(provide 'init-completion)
;;; init-completion.el ends here
