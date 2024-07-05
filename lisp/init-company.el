(use-package company
  :bind
  (:map company-active-map
        ("M-p" . nil)
        ("M-n" . nil)
        ("C-m" . nil)
        ("C-h" . nil)
        ("C-n" . company-select-next)
        ("C-p" . company-select-previous)
        ;;("<tab>" . company-complete-common)
		;; 选中当前候选项
        ("C-f" . 'company-complete-selection)
        ;("C-f" . company-complete-common)
        ("C-t" . company-show-doc-buffer))
  (:map evil-insert-state-map
		("<escape>" . 'evil-normal-state))
  :config
  (setq company-tooltip-flip-when-above t)
  (setq company-minimum-prefix-length 3)
  (setq company-idle-delay 0.2)
  (setq company-selection-wrap-around t)
  (setq company-show-numbers t)
  (setq company-require-match 'never)
  (setq company-tooltip-align-annotations t)

  ;; don't downcase results from company-dabbrev
  (setq company-dabbrev-downcase nil)
  ;; use only buffers with same major-mode for company-dabbrev
  (setq company-dabbrev-other-buffers t)

  ;; Suspend page-break-lines-mode while company menu is active
  ;; (see https://github.com/company-mode/company-mode/issues/416)
  (defvar sanityinc/page-break-lines-on-p nil)
  (make-variable-buffer-local 'sanityinc/page-break-lines-on-p)

  (defun sanityinc/page-break-lines-disable (&rest ignore)
    (when (setq sanityinc/page-break-lines-on-p (bound-and-true-p page-break-lines-mode))
      (page-break-lines-mode -1)))

  (defun sanityinc/page-break-lines-maybe-reenable (&rest ignore)
    (when sanityinc/page-break-lines-on-p
      (page-break-lines-mode 1)))

  (add-hook 'company-completion-started-hook 'sanityinc/page-break-lines-disable)
  (add-hook 'company-after-completion-hook 'sanityinc/page-break-lines-maybe-reenable))
  (add-hook 'after-init-hook 'company-tng-mode)

;; company-prescient: Simple but effective sorting and filtering for Emacs.
;; https://github.com/raxod502/prescient.el/tree/master
(use-package company-prescient
  :hook (company-mode . company-prescient-mode)
  :config (prescient-persist-mode +1))

;; company-quickhelp: documentation popup for company
;; https://github.com/expez/company-quickhelp/tree/master
(use-package company-quickhelp
  :after company
  :config
  (when (is-linux-p)
    (company-quickhelp-mode)))
(provide 'init-company)
