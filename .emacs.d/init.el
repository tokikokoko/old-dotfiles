
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> 00.Package Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(package-initialize)

;; リポジトリの設定
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))
;; ロードパスの追加
(setq load-path (append
                 '(
		   "~/.emacs.d/lisp"
		   )
                 load-path))
;; elisp配下のディレクトリをロードパスに一括追加
(let ((default-directory (expand-file-name "~/.emacs.d/elisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))
;;;-> use-package.el
;; url: https://github.com/jwiegley/use-package
(require 'use-package)
(require 'bind-key)
;; cl-lib
(use-package cl-lib)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> 01.Package list
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;-> packagelists
(defvar my/favorite-packages
  '(
    ;; package-utils
    package-utils
    ;; theme
    zenburn-theme dracula-theme spacemacs-theme
    sanityinc-tomorrow
    ;; general
    multiple-cursors indent-guide shackle
    projectile rainbow-delimiters ripgrep helm-ag
    spaceline linum-relative editorconfig
    ;; git
    magit
    ;; company
    company
    ;; ivy-mode
    ;; swiper ivy-rich counsel
    ;; helm
    helm helm-swoop
    ;; org
    ox-pandoc org-bullets
    ;; flycheck
    flycheck
    ;; fish-shell-mode
    fish-mode
    ;; docker-file
    dockerfile-mode
    ;; elixir
    elixir-mode alchemist flymake-elixir
    ;; go
    go-mode
    ;; ruby
    ruby-electric
    ;; python
    python-mode jedi
    ;; lisp
    slime
    ;; markdown
    mkdown
    ;; web
    web-mode
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> 10.Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;-> Package
;; [function]install all packages from my/favorite-packages
(defun package-install-all ()
  (interactive)
  (package-refresh-contents)
  (dolist (package my/favorite-packages)
    (unless (package-installed-p package)
      (package-install package)))
  (load-file "~/.emacs.d/init.el"))

;;;-> Buffer
;; [function]Reload current buffer no confirm
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))

;;;-> shell
;; [function]rename current shell
(defun eshell/rename-eshell (name)
  "Create a shell buffer named NAME."
  (interactive "sName: ")
  (setq name (concat "$" name))
  (eshell)
  (rename-buffer name))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> 21.User interface settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; font
(when (eq system-type 'windows-nt)
  (set-default-font "M+ 1mn light 12")
  (add-to-list 'default-frame-alist '(font . "M+ 1mn light 12"))
  )
(when (eq system-type 'darwin)
  (set-default-font "Source Han Code JP 12")
  (add-to-list 'default-frame-alist '(font . "Source Han Code JP 12"))
  )
(when (eq system-type 'gnu/linux)
  (set-default-font "Source Han Code JP 12")
  (add-to-list 'default-frame-alist '(font . "Source Han Code JP 12"))
  )
(set-fontset-font t 'japanese-jisx0208 (font-spec :family "M+ 1mn light"))

;; メニューバーを消す
(menu-bar-mode -1)
;; ツールバーを消す
(when window-system
  (tool-bar-mode -1))
;; カーソルの点滅を止める
(blink-cursor-mode 0)
;; 対応する括弧を強調
(show-paren-mode 1)
;; 閉じ括弧の自動挿入有効化
(electric-pair-mode 1)
;; ウィンドウ内に収まらないときだけ括弧内も強調
(setq show-paren-style 'mixed)
;; 行番号を表示
(global-linum-mode t)
;; スタートアップページを表示しない
(setq inhibit-startup-message t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> 22.General settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Localeを日本語に
(set-language-environment "Japanese")
;; 日本語入力
(prefer-coding-system 'utf-8-unix)
;; 最近開いたファイル
(recentf-mode 1)
;; バックアップファイルを作らない
(setq backup-inhibited t)
;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)
;; backupの保存先
(setq backup-directory-alist
      (cons (cons ".*" (expand-file-name "~/.emacs.d/backup"))
	    backup-directory-alist))
(setq auto-save-file-name-transforms
      `((".*",
	 (expand-file-name "~/.emacs.d/backup/") t)))
;; Avoid to write `package-selected-packages` in init.el
(load (setq custom-file (expand-file-name "custom.el" user-emacs-directory)))
;; 画面端まで移動したら反対側へ
(setq windmove-wrap-around t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> 23.Writing settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;-> Keyconfig
;; window-move
(global-unset-key (kbd "C-c C-f"))
(global-unset-key (kbd "C-c C-n"))
(global-unset-key (kbd "C-c C-p"))
(global-unset-key (kbd "C-c C-b"))
(global-set-key (kbd "C-c C-b") 'windmove-left)
(global-set-key (kbd "C-c C-n") 'windmove-down)
(global-set-key (kbd "C-c C-p") 'windmove-up)
(global-set-key (kbd "C-c C-f") 'windmove-right)
;; Reload buffer
(global-set-key (kbd "M-r") 'revert-buffer-no-confirm)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> 51.Builtin plugin settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;-> dired
;; diredを便利にする
(require 'dired-x)
;; diredで日本語ファイル名出力
(setq default-coding-system 'shift_jis)

;;;-> eshell
;; prompt
(setq eshell-prompt-function
      (lambda ()
        (concat "[eshell"
                (eshell/pwd)
                (if (= (user-uid) 0) "]\n# " "]\n$ "))))
;; disable company-mode
(add-hook 'eshell-mode-hook (lambda() (company-mode 0)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> 52.External plugin settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;-> theme
(load-theme 'sanityinc-tomorrow-day t)

;;;-> spaceline
(use-package spaceline-config
  :config
  (spaceline-spacemacs-theme))

;; ;;;-> ivy
;; (use-package ivy
;;   :config
;;   ;; ivy-rich
;;   (use-package ivy-rich
;;     :config
;;     (ivy-set-display-transformer 'ivy-switch-buffer 'ivy-rich-switch-buffer-transformer))
;;   ;; keys
;;   (global-set-key "\C-s" 'swiper)
;;   (global-set-key (kbd "C-c C-r") 'ivy-resume)
;;   (global-set-key (kbd "<f6>") 'ivy-resume)
;;   (global-set-key (kbd "M-x") 'counsel-M-x)
;;   (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;;   (global-set-key (kbd "C-x b") 'ivy-switch-buffer)
;;   )

;;;-> helm
(use-package helm
  :init
  (use-package helm-config
    :init
    (helm-mode t))
  :bind
  ("M-x" . helm-M-x)
  ("\C-x \C-f" . helm-find-files)
  ("C-;" . helm-mini)
  ("M-i" . helm-swoop)
  ("M-I" . helm-swoop-back-to-last-point)
  ("\C-c \M-i" . helm-multi-swoop)
  ("\C-x \M-i" . helm-multi-swoop-all)
  )

;;;-> shackle
(use-package shackle
  :config
  (setq shackle-rules
	'(
	  (neotree :select t :inhibit-window-quit t)
	  ;; ("\\`\\*helm.*?\\*\\'" :regexp t :size 0.3 :align t)
	  (magit-status-mode :select t :inhibit-window-quit t :same t)
	  (magit-log-mode :select t :inhibit-window-quit t :same t)
	  ))
  (setq shackle-lighter "")
  (shackle-mode 1)
  (provide 'setup-shackle)
  )

;;;-> projectile
(projectile-global-mode)
(setq projectile-completion-system 'helm)

;;-> magit
(use-package magit
  :bind
  ("M-g" . magit-status)
  )

;;;-> company
(use-package company
  :config
  (global-company-mode)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  (setq company-selection-wrap-around t)
  ;; keys
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "C-h") nil)
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

;;;-> multiple-cursors
(use-package multiple-cursors)

;;;-> flycheck
(use-package flycheck
  :init
  (add-hook 'after-init-hook #'global-flycheck-mode)
  :bind
  ("\C-c n" . flycheck-next-error)
  ("\C-c p" . flycheck-previous-error)
  ("\C-c d" . flycheck-list-errors)
  :config
  (setq flycheck-check-syntax-automatically '(idle-change mode-enabled new-line save))
  )

;;;-> org-mode
;; org-agenda
(setq org-agenda-files '("~/Dropbox/documents/todo.org"))

;;;-> docker
(use-package dockerfile-mode
  :config
  (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))

;;;-> web-mode
(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-comment-style 2))

;;;-> python
;; python-mode
(use-package python-mode
  :mode (("\\.py\\'" . python-mode))
  )
;;;-> jedi
(use-package jedi
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  :config
  (setq jedi:complete-on-dot t)
  )

;;;-> ruby
;; ruby-mode
(setq ruby-insert-encoding-magic-comment nil)
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(global-set-key (kbd "C-c r b") 'ruby-mode)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("[Rr]akefile$" . ruby-mode))
;; ruby-mode settings
(add-hook 'ruby-mode-hook
	  #'(lambda ()
	      ;; インデント幅: 2
	      (setq ruby-indent-level 2)))
;; ruby-flycheck
(add-hook 'ruby-mode-hook 'flycheck-mode)
;; robe
(add-hook 'ruby-mode-hook 'robe-mode)
(eval-after-load 'company
  '(push 'company-robe company-backends))

;;;-> lisp
;; slime
(use-package slime
  :init
  ;;SBCLをデフォルトのCommon Lisp処理系に設定
  (setq inferior-lisp-program "sbcl")
  :config
  ;;SLIMEのロード
  (slime-setup '(slime-repl slime-fancy slime-banner))
  )

;;;-> web-mode
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

;;;-> markdown
(use-package mkdown
  :config
  (add-hook 'markdown-mode-hook
	    '(lambda()
	       (setq markdown-css-path mkdown-css-file-name)))
  )

;;;-> fish-shell
(add-hook 'fish-mode-hook
	  #'(lambda ()
	      ;; インデント幅: 4
       	      (setq fish-indent-level 4)))

;;;-> highlight-idnent
(use-package highlight-indentation
  :config
  (set-face-background 'highlight-indentation-face "#00aa00")
  (set-face-background 'highlight-indentation-current-column-face "#115511")
  )
