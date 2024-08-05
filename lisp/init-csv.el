(use-package csv-mode
  ;;:config
  ;;(setq csv-header-lines +1)
  :hook
  (csv-mode . csv-align-mode)
  )

(provide 'init-csv)
