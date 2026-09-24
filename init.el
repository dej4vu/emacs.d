;;; init.el --- Dej4vu Emacs configuration -*- lexical-binding: t; -*-

(let ((minver "29.3"))
  (when (version< emacs-version minver)
    (error "This config requires Emacs v%s or higher" minver)))

(setq emacs-load-start-time (current-time))
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Constants
(require 'init-variables)

;; Package management (straight.el, must come before any use-package)
(require 'init-straight)

;; Customization (uses use-package, so after straight)
(require 'init-custom)

;; Utility functions
(require 'init-utils)
(require 'init-funcs)

;; Core editing
(require 'init-editing-utils)
(require 'init-evil)
(require 'init-exec-path)

;; UI
(require 'init-themes)
(require 'init-ui)
(require 'init-modeline)

;; Minibuffer completion
(require 'init-completion)

;; Code completion
(require 'init-company)

;; IDE
(require 'init-lsp)
(require 'init-flycheck)
(require 'init-yas)

;; Languages
(require 'init-go)
(require 'init-python)
(require 'init-protobuf)
(require 'init-markdown)
(require 'init-yaml)
(require 'init-json)
(require 'init-csv)
(require 'init-lua)
(require 'init-js)
(require 'init-web)
(require 'init-php)
(require 'init-docker)
(require 'init-thrift)
(require 'init-lisp)

;; Tools
(require 'init-dict)
(require 'init-avy)
(require 'init-vc)
(require 'init-llm)

(provide 'init)
;;; init.el ends here
