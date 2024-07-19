(use-package gptel
  :ensure t
  :defer t
  :init
  (setq
  gptel-model "qwen2:7b"
  gptel-backend (gptel-make-ollama "Ollama"
                 :host "localhost:11434"
                 :stream t
                 :models '("qwen2:7b")))
  :config
  (setq gptel-api-key "your key")
  (add-hook 'gptel-post-response-functions 'gptel-end-of-response)
  (add-hook 'gptel-post-stream-hook 'gptel-auto-scroll)
  )

(provide 'init-llm)
