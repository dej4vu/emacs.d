;;; init-straight.el --- Package management via straight.el -*- lexical-binding: t; -*-

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Install use-package via straight
;; All use-package declarations default to straight.el
(setq straight-use-package-by-default t)

;; Install and load use-package via straight
(straight-use-package 'use-package)

;; Ensure deferred loading by default
(eval-and-compile
  (setq use-package-always-defer t
        use-package-expand-minimally t
        use-package-enable-imenu-support t))

(provide 'init-straight)
;;; init-straight.el ends here
