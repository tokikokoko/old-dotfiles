;; use-package
(require 'use-package)
(require 'bind-key)

;; theme
(require 'moe-theme)
(moe-dark)

;; ivy
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

;; company
(global-company-mode +1)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t)
;;; 色設定
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

;; slime
;;;SBCLをデフォルトのCommon Lisp処理系に設定
(setq inferior-lisp-program "sbcl")
;;;SLIMEのロード
(slime-setup '(slime-repl slime-fancy slime-banner))

;; indent-guide
(setq indent-guide-delay 0.1)
(setq indent-guide-recursive t)
(add-hook 'prog-mode-hook 'indent-guide-mode)
