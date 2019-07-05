(require-package 'company)

(add-hook 'after-init-hook 'global-company-mode)

(if (fboundp 'evil-declare-change-repeat)
    (mapc #'evil-declare-change-repeat
	  '(company-complete-common
	    company-select-next
	    company-select-previous
	    company-complete-selection
	    company-complete-number
	                )))

(eval-after-load 'company
  '(progn
     (require-package  'company-statistics)
     (company-statistics-mode)
     (setq company-idle-delay 0.2
	   company-tooltip-limit 10
	   company-minimum-prefix-length 2
	   company-show-numbers t)
	  (define-key company-active-map (kbd "M-n") nil)
      (define-key company-active-map (kbd "M-p") nil)
	  (define-key company-active-map (kbd "C-n") #'company-select-next)
      (define-key company-active-map (kbd "C-p") #'company-select-previous)
	  (define-key evil-insert-state-map [escape] 'evil-normal-state)
     ))

(provide 'init-company)
