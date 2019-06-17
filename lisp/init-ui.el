(setq inhibit-compacting-font-caches t)
;; show keybindings
(require-package 'which-key)
(setq which-key-idle-delay 2.0)
(which-key-mode +1)

(menu-bar-mode -1)
(column-number-mode +1)
(electric-pair-mode +1)

;; show the cursor when moving after big movements in the window
(require-package 'beacon)
(beacon-mode +1)

;; anzu
(require-package 'anzu)
(require-package 'evil-anzu)
(global-anzu-mode +1)
(anzu-mode +1)
(with-eval-after-load 'evil
  (require 'evil-anzu))

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
               minor-mode-alist
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
