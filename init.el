
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;(setq debug-on-error t)
(let ((minver "29.3"))
  (when (version< emacs-version minver)
    (error "This config requires Emacs v%s or higher" minver)))
(setq emacs-load-start-time (current-time))
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;;(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; Constants
(require 'init-variables)

;; Customization
(require 'init-custom)

;; Functions
(require 'init-funcs)

;; Packages
(require 'init-package)

;;(require 'init-elpa)
(require 'init-utils)
(require 'init-editing-utils)
(require 'init-evil)
(require 'init-themes)
(require 'init-lsp)
(require 'init-ui)
(require 'init-company)
(require 'init-flycheck)
(require 'init-helm)
(require 'init-dict)
(require 'init-yaml)
(require 'init-go)
(require 'init-python)
(require 'init-protobuf)
(require 'init-markdown)
(require 'init-docker)
(require 'init-web)
(require 'init-php)
(require 'init-lisp)
(require 'init-js)
(require 'init-avy)
(require 'init-thrift)
(require 'init-vc)
(require 'init-exec-path)
(require 'init-yas)
(require 'init-llm)
(require 'init-csv)
(require 'init-lua)
(require 'init-json)

(when (file-exists-p custom-file)
  (load custom-file))

(provide 'init)
