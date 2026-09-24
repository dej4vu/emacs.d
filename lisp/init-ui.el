;;; init-ui.el --- Display and UI settings -*- lexical-binding: t; -*-

;;(menu-bar-mode -1)
(if window-system
    (menu-bar-mode +1)
  (menu-bar-mode -1))

;; 以下配置是处理 emacs 行尾符号问题
;; https://emacs-china.org/t/topic/20161
(set-display-table-slot standard-display-table 'truncation 32)
(set-display-table-slot standard-display-table 'wrap 32)

(defun my/display-truncation-and-wrap-indicator-as-whitespace ()
  "Display truncation and wrap indicators as whitespace."
  (when (not (char-table-p buffer-display-table))
    (setq buffer-display-table (make-display-table)))
  (set-display-table-slot buffer-display-table 'truncation 32)
  (set-display-table-slot buffer-display-table 'wrap 32))

(add-hook 'prog-mode-hook #'my/display-truncation-and-wrap-indicator-as-whitespace)
(add-hook 'text-mode-hook #'my/display-truncation-and-wrap-indicator-as-whitespace)

(when (display-graphic-p)
  (scroll-bar-mode -1))

(column-number-mode +1)

;; show the cursor when moving after big movements in the window
(use-package beacon
  :init
  (beacon-mode +1))

;; built-in tab-bar
(use-package tab-bar
  :straight nil
  :init
  (tab-bar-mode t)
  (setq tab-bar-new-tab-choice "*scratch*")
  (setq tab-bar-close-button-show nil)
  (setq tab-bar-show 1)
  (setq tab-bar-format '(tab-bar-format-tabs tab-bar-separator))

  (custom-set-faces
   '(tab-bar ((t (:inherit mode-line))))
   '(tab-bar-tab ((t (:inherit mode-line :foreground "#993644"))))
   '(tab-bar-tab-inactive ((t (:inherit mode-line-inactive :foreground "black")))))

  (defvar ct/circle-numbers-alist
    '((0 . "⓪") (1 . "①") (2 . "②") (3 . "③") (4 . "④")
      (5 . "⑤") (6 . "⑥") (7 . "⑦") (8 . "⑧") (9 . "⑨"))
    "Alist of integers to strings of circled unicode numbers.")

  (defun ct/tab-bar-tab-name-format-default (tab i)
    "Format TAB name with circle number hint I."
    (let ((current-p (eq (car tab) 'current-tab))
          (tab-num (if (and tab-bar-tab-hints (< i 10))
                       (alist-get i ct/circle-numbers-alist) "")))
      (propertize
       (concat tab-num
               " "
               (alist-get 'name tab)
               (or (and tab-bar-close-button-show
                        (not (eq tab-bar-close-button-show
                                 (if current-p 'non-selected 'selected)))
                        tab-bar-close-button)
                   "")
               " ")
       'face (funcall tab-bar-tab-face-function tab))))
  (setq tab-bar-tab-name-format-function #'ct/tab-bar-tab-name-format-default)
  (setq tab-bar-tab-hints t))

;; clipboard support in terminal
(use-package xclip)

(provide 'init-ui)
;;; init-ui.el ends here
