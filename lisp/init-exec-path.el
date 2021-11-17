(when (and window-system
		   (memq window-system '(mac ns)))
  (use-package exec-path-from-shell
	:init
	(exec-path-from-shell-initialize)))


(provide 'init-exec-path)
