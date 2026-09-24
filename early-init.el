;;; early-init.el --- Early initialization. -*- lexical-binding: t; -*-

;; Prevent package.el from loading before config
(setq package-enable-at-startup nil)

;; Defer garbage collection during startup for speed
(setq gc-cons-threshold most-positive-fixnum)

;; Restore GC threshold after startup completes
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold 800000)
            (message "Emacs loaded in %s with %d GCs"
                     (emacs-init-time)
                     gcs-done)))

;; Don't compact font caches during startup
(setq inhibit-compacting-font-caches t)

;; Native JSON parsing is faster
(setq native-comp-async-report-warnings-errors 'silent)

;;; early-init.el ends here
