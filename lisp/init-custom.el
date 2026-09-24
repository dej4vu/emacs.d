;;; init-custom.el --- Customization group and variables -*- lexical-binding: t; -*-

(defgroup dej4vu nil
  "Dej4vu Emacs customization."
  :prefix "dej4vu-"
  :group 'convenience)

(defcustom dej4vu-theme 'ample
  "The default color theme."
  :group 'dej4vu
  :type 'symbol)

(setq custom-file (expand-file-name "custom.el" user-cache-directory))

(when (file-exists-p custom-file)
  (load-file custom-file))

(use-package emacs
  :straight nil
  :custom
  (help-window-select t "Switch to help buffers automatically"))

(provide 'init-custom)
;;; init-custom.el ends here
