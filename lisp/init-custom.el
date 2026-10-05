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

(defun dejavu--ensure-custom-file-lexical-binding ()
  "Ensure the generated `custom-file' has a lexical-binding cookie."
  (when (and custom-file (file-exists-p custom-file))
    (with-temp-buffer
      (insert-file-contents custom-file)
      (goto-char (point-min))
      (unless (looking-at-p ";;; \\*\\*\\*- lexical-binding:")
        (insert ";;; -*- lexical-binding: t -*-\n")
        (write-region nil nil custom-file nil 0)))))

(dejavu--ensure-custom-file-lexical-binding)

(when (file-exists-p custom-file)
  (load-file custom-file))

(use-package emacs
  :straight nil
  :custom
  (help-window-select t "Switch to help buffers automatically"))

(provide 'init-custom)
;;; init-custom.el ends here
