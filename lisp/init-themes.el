;;themes
(use-package ample-theme
  :ensure t
  :init
  (load-theme 'ample t t)
  (load-theme 'ample-flat t t)
  (load-theme 'ample-light t t)
  ;; choose one to enable
  (enable-theme 'ample)
  :defer t
  )
(provide 'init-themes)
