;;; init-straight.el --- Package management via straight.el -*- lexical-binding: t; -*-

(defconst dej4vu-github-proxy "https://gh-proxy.com"
  "GitHub accelerator used only by straight.el network operations.")

(defconst dej4vu-github-proxy-git-url
  (concat dej4vu-github-proxy "/https://github.com/")
  "Git URL prefix used to accelerate GitHub repositories.")

;; A local HTTP proxy must not proxy the accelerator again.  Keep this
;; exception local to Emacs's URL library; do not alter shell/profile
;; proxy variables.
(require 'url-vars)
(add-to-list 'url-proxy-services
             (cons "no_proxy" "\\`gh-proxy\\.com\\'"))

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
         (concat dej4vu-github-proxy
                 "/https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el")
         'silent 'inhibit-cookies)
      ;; `install.el' itself downloads `straight.el' from
      ;; raw.githubusercontent.com.  Rewrite that URL in the downloaded
      ;; source before evaluating it so the whole bootstrap stays on the
      ;; accelerator.
      (delete-region (point-min) url-http-end-of-headers)
      (goto-char (point-min))
      (while (search-forward "https://raw.githubusercontent.com/" nil t)
        (replace-match
         (concat dej4vu-github-proxy "/https://raw.githubusercontent.com/")
         'fixedcase 'literal))
      (eval-buffer)))
  (load bootstrap-file nil 'nomessage))

;; Install use-package via straight
;; All use-package declarations default to straight.el
(setq straight-use-package-by-default t)

;; Install and load use-package via straight
(straight-use-package 'use-package)

;; Keep the accelerator scoped to straight.el's Git subprocesses.  Git
;; URL rewriting is injected into `process-environment' rather than
;; written to the user's global or repository Git configuration.
(defun dej4vu/straight-vc-git-with-github-proxy (oldfn &rest args)
  "Call OLDFN with GitHub requests routed through `dej4vu-github-proxy'."
  (let ((process-environment (copy-sequence process-environment))
        (index (string-to-number (or (getenv "GIT_CONFIG_COUNT") "0"))))
    ;; Likewise, let Git connect directly to the accelerator instead of
    ;; sending the accelerator URL through an inherited local proxy.
    (let ((no-proxy (mapconcat
                     #'identity
                     (delq nil (list (getenv "NO_PROXY")
                                     (getenv "no_proxy")
                                     "gh-proxy.com"))
                     ",")))
      (setenv "NO_PROXY" no-proxy)
      (setenv "no_proxy" no-proxy))
    (setenv "GIT_CONFIG_COUNT" (number-to-string (1+ index)))
    (setenv (format "GIT_CONFIG_KEY_%d" index)
            (format "url.%s.insteadOf" dej4vu-github-proxy-git-url))
    (setenv (format "GIT_CONFIG_VALUE_%d" index) "https://github.com/")
    (apply oldfn args)))

(dolist (function '(straight-vc-git-clone
                    straight-vc-git-fetch-from-remote
                    straight-vc-git-merge-from-remote))
  (advice-add function :around
              #'dej4vu/straight-vc-git-with-github-proxy))

;; Ensure deferred loading by default
(eval-and-compile
  (setq use-package-always-defer t
        use-package-expand-minimally t
        use-package-enable-imenu-support t))

(provide 'init-straight)
;;; init-straight.el ends here
