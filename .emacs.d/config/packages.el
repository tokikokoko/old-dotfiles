
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> use-package
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'use-package)
(require 'bind-key)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> theme
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load-theme 'zenburn t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> ivy
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'ivy)
;; ivy-rich
(require 'ivy-rich)
(ivy-set-display-transformer 'ivy-switch-buffer 'ivy-rich-switch-buffer-transformer)
;; swiper
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> company
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-company-mode +1)
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> flycheck
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(define-key global-map (kbd "\C-cn") 'flycheck-next-error)
(define-key global-map (kbd "\C-cp") 'flycheck-previous-error)
(define-key global-map (kbd "\C-cd") 'flycheck-list-errors)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> python
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Elpy
(elpy-enable)
;; virtualenvのパス
(defvar venv-default "~/.virtualenvs/default")
;; デフォルト環境を有効化
(pyvenv-activate venv-default)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; slime
;;SBCLをデフォルトのCommon Lisp処理系に設定
(setq inferior-lisp-program "sbcl")
;;SLIMEのロード
(slime-setup '(slime-repl slime-fancy slime-banner))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> web-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'web-mode)
;; emacs 23以下の互換
(when (< emacs-major-version 24)
  (defalias 'prog-mode 'fundamental-mode))
;; 適用する拡張子
(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))
;; インデント数
(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-html-offset   2)
  (setq web-mode-css-offset    2)
  (setq web-mode-script-offset 2)
  (setq web-mode-php-offset    2)
  (setq web-mode-java-offset   2)
  (setq web-mode-asp-offset    2))
(add-hook 'web-mode-hook 'web-mode-hook)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> highlight-idnent
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'highlight-indentation)
(set-face-background 'highlight-indentation-face "#00aa00")
(set-face-background 'highlight-indentation-current-column-face "#115511")
