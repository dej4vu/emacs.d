;;; init-exec-path.el --- Shell PATH integration for GUI Emacs -*- lexical-binding: t; -*-

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns x))
  :init
  (exec-path-from-shell-copy-env "GOPATH")
  (exec-path-from-shell-copy-env "GOPROXY")
  :config
  (exec-path-from-shell-initialize)
  (message "Wellcome To Mac OS X, Have A Nice Day!!!"))

(provide 'init-exec-path)
;;; init-exec-path.el ends here
