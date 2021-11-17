(defconst user-cache-directory
  (file-name-as-directory (concat user-emacs-directory ".cache"))
  "My Emacs storage area for persistent files.")
;; create the `user-cache-directory' if not exists
(make-directory user-cache-directory t)

(provide 'init-variables)
