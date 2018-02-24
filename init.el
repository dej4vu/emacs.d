
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq debug-on-error t)
(let ((minver "24.3"))
  (when (version< emacs-version minver)
    (error "This config requires Emacs v%s or higher" minver)))
(setq emacs-load-start-time (current-time))
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-elpa)
(require 'init-utils)
(require 'init-editing-utils)
(require 'init-evil)
(require 'init-themes)
(require 'init-company)
(require 'init-flycheck)
(require 'init-helm)
(require 'init-yaml)
(require 'init-go)
(require 'init-protobuf)
(require 'init-markdown)
(require 'init-docker)

(when (file-exists-p custom-file)
  (load custom-file))

(provide 'init)
