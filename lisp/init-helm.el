;; helm
(use-package helm
  :ensure t
  :config
  (setq
    helm-split-window-in-side-p           t
	helm-buffers-fuzzy-matching           t
	helm-move-to-line-cycle-in-source     t
	helm-ff-search-library-in-sexp        t
	helm-ff-file-name-history-use-recentf t)
  :bind
  (
	("C-c h i" . helm-semantic-or-imenu)
	("C-x C-f" . helm-find-files)
	("C-x C-r" . helm-recentf)
	("C-x b" . helm-mini)
	;;("M-x" . helm-M-x)
	)
  )

;; helm-smex
;;(use-package helm-smex
;;  :ensure t
;;  ;;:init
;;  ;;(global-set-key [remap execute-extended-command] #'helm-smex)
;;  :bind ([remap execute-extended-command] . helm-smex)
;;  :bind (("M-X" . helm-smex-major-mode-commands)))

;; Enable rich annotations using the Marginalia package
(use-package marginalia
  :ensure t
  ;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
  ;; available in the *Completions* buffer, add it to the
  ;; `completion-list-mode-map'.
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init section is always executed.
  :init

  ;; Marginalia must be activated in the :init section of use-package such that
  ;; the mode gets enabled right away. Note that this forces loading the
  ;; package.
  (marginalia-mode))

;; Enable vertico
(use-package vertico
  :init
  (vertico-mode)

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  ;; (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  ;; (setq vertico-cycle t)
  )

;; 补全
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless flex))
  (completion-category-overrides '((file (styles basic partial-completion)))))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

(use-package fzf
  :bind
    ;; Don't forget to set keybinds!
  :config
  (setq fzf/args "-x --color bw --print-query --margin=1,0 --no-hscroll"
        fzf/executable "fzf"
        fzf/git-grep-args "-i --line-number %s"
        ;; command used for `fzf-grep-*` functions
        ;; example usage for ripgrep:
        ;; fzf/grep-command "rg --no-heading -nH"
        fzf/grep-command "grep -nrH"
        ;; If nil, the fzf buffer will appear at the top of the window
        fzf/position-bottom t
        fzf/window-height 15))

(provide 'init-helm)
