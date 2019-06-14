(require-package 'exec-path-from-shell)
(when (and window-system
		   (memq window-system '(mac ns))
	  (exec-path-from-shell-initialize))
 )	

(provide 'init-exec-path)
