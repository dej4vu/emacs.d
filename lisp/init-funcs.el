(eval-when-compile
  (require 'init-variables)
  (require 'init-custom))

;; Pakcage archives
(defun set-package-archives (archives)
  "Set specific package ARCHIVES repository."
  (interactive
   (list
    (intern (completing-read
             "Choose package archives: "
             (mapcar #'car dej4vu)))))
  (customize-set-variable 'dej4vu-package-archives archives)
  (message "Set package archives to `%s'" archives))

(provide 'init-funcs)
