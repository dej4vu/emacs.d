(eval-when-compile
  (require 'init-variables))

(defgroup dej4vu nil
  "Dej4vu Emacs customization."
  :prefix "dej4vu-"
  :group 'convenience)

(defcustom dej4vu-package-archives-alist
  (let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                      (not (gnutls-available-p))))
         (proto (if no-ssl "http" "https")))
    `(,(cons 'official
             `(,(cons "gnu"          (concat proto "://elpa.gnu.org/packages/"))
               ,(cons "melpa"        (concat proto "://melpa.org/packages/"))))
      ,(cons 'emacs-china
             `(,(cons "gnu"          (concat proto "://elpa.emacs-china.org/gnu/"))
               ,(cons "melpa"        (concat proto "://elpa.emacs-china.org/melpa/"))))
      ,(cons 'netease
             `(,(cons "gnu"          (concat proto "://mirrors.163.com/elpa/gnu/"))
               ,(cons "melpa"        (concat proto "://mirrors.163.com/elpa/melpa/"))))
      ,(cons 'tencent
             `(,(cons "gnu"          (concat proto "://mirrors.cloud.tencent.com/elpa/gnu/"))
               ,(cons "melpa"        (concat proto "://mirrors.cloud.tencent.com/elpa/melpa/"))))
      ,(cons 'tuna
             `(,(cons "gnu"          (concat proto "://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/"))
               ,(cons "melpa"        (concat proto "://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))))
      ,(cons 'ustc
             `(,(cons "gnu"          (concat proto "://mirrors.ustc.edu.cn/elpa/gnu/"))
               ,(cons "melpa"        (concat proto "://mirrors.ustc.edu.cn/elpa/melpa/"))))
      ,(cons 'hit
             `(,(cons "gnu"          (concat proto "://mirrors.hit.edu.cn/elpa/gnu/"))
               ,(cons "melpa"        (concat proto "://mirrors.hit.edu.cn/elpa/melpa/"))))))
  "The package archives group list."
  :type '(alist :key-type (symbol :tag "Archive group name")
                :value-type (alist :key-type (string :tag "Archive name")
                                   :value-type (string :tag "URL or directory name")))
  :group 'dej4vu)

(defcustom dej4vu-package-archives 'tuna
  "Set package archives from which to fetch."
  :set (lambda (symbol value)
         (set symbol value)
         (setq package-archives
               (or (alist-get value dej4vu-package-archives-alist)
                   (error "Unknown package archives: `%s'" value))))
  :type `(choice ,@(mapcar
                    (lambda (item)
                      (let ((name (car item)))
                        (list 'const
                              :tag (capitalize (symbol-name name))
                              name)))
                    dej4vu-package-archives-alist))
  :group 'dej4vu)

(defcustom dej4vu-theme 'ample
  "The default color theme."
  :group 'dej4vu
  :type 'symbol)

(setq custom-file (expand-file-name "custom.el" user-cache-directory))

(when (file-exists-p custom-file)
    (load-file custom-file))

(provide 'init-custom)
