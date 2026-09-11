(use-package gptel
  :ensure t
  :defer t
  :init
  (setq
  gptel-model "qwen2.5:7b"
  gptel-backend (gptel-make-ollama "Ollama"
                 :host "localhost:11434"
                 :stream t
                 :models '("qwen2.5:7b")))
  :config
  (setq gptel-api-key "your key")
  (setq gptel-log-level 'debug)
  (add-hook 'gptel-post-response-functions 'gptel-end-of-response)
  (add-hook 'gptel-post-stream-hook 'gptel-auto-scroll)
  )

(use-package aider
  :straight (:host github :repo "tninja/aider.el" :files ("aider.el"))
  :init
  (let ((api-key (getenv "OPENAI_API_KEY")))
    (setq aider-args
          (append
           '("--model" "openai/Qwen/Qwen2.5-Coder-32B-Instruct"
             "--openai-api-base" "https://api-inference.modelscope.cn/v1")
           (if api-key
               (list "--openai-api-key" api-key)
             '()))))
  :config
  ;; Set OPENAI_API_KEY in the environment instead of committing secrets.
  (global-set-key (kbd "C-c a") 'aider-transient-menu))

(provide 'init-llm)
