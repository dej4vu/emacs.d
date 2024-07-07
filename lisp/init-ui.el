(setq inhibit-compacting-font-caches t)
;; show keybindings
(use-package which-key
  :ensure t
  :init
  (setq which-key-idle-delay 2.0)
  ;;:config
  (which-key-mode +1))

;;(menu-bar-mode -1)
(if window-system
    (menu-bar-mode +1)
  ;; disable menu bar
  (menu-bar-mode -1))

(when (display-graphic-p)
  ;; disable scroll bar
  (scroll-bar-mode -1)
  )

(column-number-mode +1)


;;(electric-pair-mode +1)

;; show the cursor when moving after big movements in the window
(use-package beacon
  :ensure t
  :init
  (beacon-mode +1))

;; anzu
(use-package anzu
  :ensure t
  :hook (after-init . global-anzu-mode)
  ;;:diminish
  :init
  (setq anzu-mode-lighter "")
  (global-anzu-mode +1)
  (anzu-mode +1)
  )

(use-package evil-anzu
  :ensure t
  :after (evil anzu)
  :demand t
  :init
  (global-anzu-mode t))

(use-package minions
  :ensure t
  :init
  (minions-mode +1))

(use-package tab-bar
  :ensure nil
  :init
  (tab-bar-mode t)
  (setq tab-bar-new-tab-choice "*scratch*") ;; buffer to show in new tabs
  (setq tab-bar-close-button-show nil)      ;; hide tab close / X button
  (setq tab-bar-show 1)                     ;; hide bar if <= 1 tabs open
  (setq tab-bar-format '(tab-bar-format-tabs tab-bar-separator))

  (custom-set-faces
   '(tab-bar ((t (:inherit mode-line))))
   '(tab-bar-tab ((t (:inherit mode-line :foreground "#993644"))))
   '(tab-bar-tab-inactive ((t (:inherit mode-line-inactive :foreground "black")))))

  (defvar ct/circle-numbers-alist
    '((0 . "⓪")
      (1 . "①")
      (2 . "②")
      (3 . "③")
      (4 . "④")
      (5 . "⑤")
      (6 . "⑥")
      (7 . "⑦")
      (8 . "⑧")
      (9 . "⑨"))
    "Alist of integers to strings of circled unicode numbers.")

  (defun ct/tab-bar-tab-name-format-default (tab i)
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

(defun my/anzu-update-func (here total)
  (when anzu--state
    (let ((status (cl-case anzu--state
                    (search (format "<%d/%d>" here total))
                    (replace-query (format "(%d Replaces)" total))
                    (replace (format "<%d/%d>" here total)))))
      (propertize status 'face 'anzu-mode-line))))

(custom-set-variables
 '(anzu-mode-line-update-function #'my/anzu-update-func))

;; https://emacs-china.org/t/topic/655
(defun zilongshanren/update-persp-name ()
    (when (bound-and-true-p persp-mode)
      ;; There are multiple implementations of
      ;; persp-mode with different APIs
      (progn
             (or (not (string= persp-nil-name (safe-persp-name (get-frame-persp))))
                 "Default")
             (let ((name (safe-persp-name (get-frame-persp))))
               (propertize (concat "[" name "] ")
                           'face 'font-lock-preprocessor-face
                           'help-echo "Current Layout name.")))))


(defun spaceline--unicode-number (str)
  "Return a nice unicode representation of a single-digit number STR."
  (cond
   ((string= "1" str) "➊")
   ((string= "2" str) "➋")
   ((string= "3" str) "➌")
   ((string= "4" str) "➍")
   ((string= "5" str) "➎")
   ((string= "6" str) "➏")
   ((string= "7" str) "➐")
   ((string= "8" str) "➑")
   ((string= "9" str) "➒")
   ((string= "0" str) "➓")))

(defun window-number-mode-line ()
  "The current window number. Requires `window-numbering-mode' to be enabled."
  (when (bound-and-true-p window-numbering-mode)
    (let* ((num (window-numbering-get-number))
           (str (when num (int-to-string num))))
      (spaceline--unicode-number str))))

(defun mode-line-fill (face reserve)
  "Return empty space using FACE and leaving RESERVE space on the right."
  (unless reserve
    (setq reserve 20))
  (when (and window-system (eq 'right (get-scroll-bar-mode)))
    (setq reserve (- reserve 3)))
  (propertize " "
              'display `((space :align-to
                                (- (+ right right-fringe right-margin) ,reserve)))
              'face face))

(defun buffer-encoding-abbrev ()
  "The line ending convention used in the buffer."
  (let ((buf-coding (format "%s" buffer-file-coding-system)))
    (if (string-match "\\(dos\\|unix\\|mac\\)" buf-coding)
        (match-string 1 buf-coding)
      buf-coding)))

(setq my-flycheck-mode-line
      '(:eval
		(when (bound-and-true-p flycheck-mode)
        (pcase flycheck-last-status-change
          (`not-checked nil)
          (`no-checker (propertize " -" 'face 'warning))
          (`running (propertize " ✷" 'face 'success))
          (`errored (propertize " !" 'face 'error))
          (`finished
           (let* ((error-counts (flycheck-count-errors flycheck-current-errors))
                  (no-errors (cdr (assq 'error error-counts)))
                  (no-warnings (cdr (assq 'warning error-counts)))
                  (face (cond (no-errors 'error)
                              (no-warnings 'warning)
                              (t 'success))))
             (propertize (format "[%s/%s]" (or no-errors 0) (or no-warnings 0))
                         'face face)))
          (`interrupted " -")
          (`suspicious '(propertize " ?" 'face 'warning))))))

(setq-default mode-line-format
              (list
			   anzu--mode-line-format
               ;; " %1"
               ;; '(:eval (propertize
               ;;          (window-number-mode-line)
               ;;          'face
               ;;          'font-lock-type-face))
               ;; " "
               ;; '(:eval (zilongshanren/update-persp-name))

               "%1 "
               ;; the buffer name; the file name as a tool tip
               '(:eval (propertize "%b " 'face 'font-lock-function-name-face
                                   'help-echo (buffer-file-name)))


               " [" ;; insert vs overwrite mode, input-method in a tooltip
               '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
                                   'face 'font-lock-preprocessor-face
                                   'help-echo (concat "Buffer is in "
                                                      (if overwrite-mode
                                                          "overwrite"
                                                        "insert") " mode")))

               ;; was this buffer modified since the last save?
               '(:eval (when (buffer-modified-p)
                         (concat ","  (propertize "Mod"
                                                  'face 'font-lock-function-name-face
                                                  'help-echo "Buffer has been modified"))))

               ;; is this buffer read-only?
               '(:eval (when buffer-read-only
                         (concat ","  (propertize "RO"
                                                  'face 'font-lock-type-face
                                                  'help-echo "Buffer is read-only"))))
               "] "


               ;; relative position, size of file
               "["
               (propertize "%p" 'face 'font-lock-function-name-face) ;; % above top
               "/"
               (propertize "%I" 'face 'font-lock-function-name-face) ;; size
               "] "

               ;; the current major mode for the buffer.
               '(:eval (propertize "%m" 'face 'font-lock-string-face
                                   'help-echo buffer-file-coding-system))

               "%1 "
               my-flycheck-mode-line
               "%1 "
               ;; evil state
               '(:eval evil-mode-line-tag)

               ;; minor modes
               ;;minor-mode-alist
			   minions-mode-line-modes
               " "
               ;; git info
               `(vc-mode vc-mode)

               " "

               ;; global-mode-string goes in mode-line-misc-info
               mode-line-misc-info

               (mode-line-fill 'mode-line 20)

               ;; line and column
               "(" ;; '%02' to set to 2 chars at least; prevents flickering
               (propertize "%02l" 'face 'font-lock-function-name-face) ","
               (propertize "%02c" 'face 'font-lock-function-name-face)
               ") "

               '(:eval (buffer-encoding-abbrev))
               mode-line-end-spaces
               ;; add the time, with the date and the emacs uptime in the tooltip
               ;; '(:eval (propertize (format-time-string "%H:%M")
               ;;                     'help-echo
               ;;                     (concat (format-time-string "%c; ")
               ;;                             (emacs-uptime "Uptime:%hh"))))
               ))

(provide 'init-ui)
