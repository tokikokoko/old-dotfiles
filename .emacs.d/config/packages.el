
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> theme
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load-theme 'zenburn t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> ivy
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package ivy)
;; ivy-rich
(use-package ivy-rich
  :config
  (ivy-set-display-transformer 'ivy-switch-buffer 'ivy-rich-switch-buffer-transformer)
  ;; swiper
  (global-set-key "\C-s" 'swiper)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "<f6>") 'ivy-resume)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-x b") 'ivy-switch-buffer)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> company
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package company
  :init
  (global-company-mode)
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  (setq company-selection-wrap-around t)
  ;; color settings
  (set-face-attribute 'company-tooltip nil
		      :foreground "black" :background "lightgrey")
  (set-face-attribute 'company-tooltip-common nil
		      :foreground "black" :background "lightgrey")
  (set-face-attribute 'company-tooltip-common-selection nil
		      :foreground "white" :background "steelblue")
  (set-face-attribute 'company-tooltip-selection nil
		      :foreground "black" :background "steelblue")
  (set-face-attribute 'company-preview-common nil
		      :background nil :foreground "lightgrey" :underline t)
  (set-face-attribute 'company-scrollbar-fg nil
		      :background "orange")
  (set-face-attribute 'company-scrollbar-bg nil
		      :background "gray40")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> flycheck
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package flycheck
  :init
  (add-hook 'after-init-hook #'global-flycheck-mode)
  :bind
  ("\C-cn" . flycheck-next-error)
  ("\C-cp" . flycheck-previous-error)
  ("\C-cd" . flycheck-list-errors)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> python
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; python-mode
(use-package python-mode
  :mode (("\\.py\\'" . python-mode))
  )
;; jedi
(use-package jedi
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  :config
  (setq jedi:complete-on-dot t)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; slime
(use-package slime
  :init
  ;;SBCLをデフォルトのCommon Lisp処理系に設定
  (setq inferior-lisp-program "sbcl")
  :config
  ;;SLIMEのロード
  (slime-setup '(slime-repl slime-fancy slime-banner))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> web-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package web-mode
  :mode (("\\.phtml$"     . web-mode)
	 ("\\.tpl\\.php$" . web-mode)
	 ("\\.jsp$"       . web-mode)
	 ("\\.as[cp]x$"   . web-mode)
	 ("\\.erb$"       . web-mode)
	 ("\\.html?$"     . web-mode))
  :init
  (add-hook 'web-mode-hook 'my-web-mode-hook)
  :if (< emacs-major-version 24)
  :config
  (defalias 'prog-mode 'fundamental-mode)
  )
;; インデント数
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-html-offset   2)
  (setq web-mode-css-offset    2)
  (setq web-mode-script-offset 2)
  (setq web-mode-php-offset    2)
  (setq web-mode-java-offset   2)
  (setq web-mode-asp-offset    2))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> highlight-idnent
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package highlight-indentation
  :config
  (set-face-background 'highlight-indentation-face "#00aa00")
  (set-face-background 'highlight-indentation-current-column-face "#115511")
  )

