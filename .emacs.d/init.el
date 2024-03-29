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

;;;-> straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> 01.Package list
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> straight.el
;; package-utils
(straight-use-package 'package-utils)
;; theme
(straight-use-package 'zenburn-theme)
(straight-use-package 'dracula-theme)
(straight-use-package 'color-theme-sanityinc-tomorrow)
(straight-use-package
 '(emacs-material-theme :type git :host github :repo "cpaulik/emacs-material-theme"))
;; general
(straight-use-package 'multiple-cursors)
(straight-use-package 'indent-guide)
(straight-use-package 'shackle)
(straight-use-package 'projectile)
(straight-use-package 'rainbow-delimiters)
(straight-use-package 'ripgrep)
(straight-use-package 'helm-ag)
(straight-use-package 'spaceline)
(straight-use-package 'linum-relative)
(straight-use-package 'editorconfig)
(straight-use-package 'hydra)
(straight-use-package 'visual-regexp)
(straight-use-package 'elscreen)
(straight-use-package 'winum)
;; git
(straight-use-package 'magit)
;; company
(straight-use-package 'company)
;; ivy-mode
;; (straight-use-package 'swiper)
;; (straight-use-package 'ivy-rich)
;; (straight-use-package 'counsel)
;; (straight-use-package 'counsel-projectile)
;; helm
(straight-use-package 'helm)
(straight-use-package 'helm-swoop)
;; org
(straight-use-package 'ox-pandoc)
(straight-use-package 'org-bullets)
;; flycheck
(straight-use-package 'flycheck)
;; fish-shell-mode
(straight-use-package 'fish-mode)
;; docker-file
(straight-use-package 'dockerfile-mode)
;; elixir
(straight-use-package 'elixir-mode)
(straight-use-package 'alchemist)
(straight-use-package 'flycheck-elixir)
;; go
(straight-use-package 'go-mode)
;; ruby
(straight-use-package 'ruby-electric)
;; python
(straight-use-package 'python-mode)
(straight-use-package 'jedi)
;; lisp
(straight-use-package 'slime)
;; ocaml
(straight-use-package 'merlin)
(straight-use-package 'tuareg)
;; markdown
(straight-use-package 'mkdown)
;; web
(straight-use-package 'web-mode)

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
  (set-default-font "Cica 14")
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
;; 1行ずつスクロール
(setq scroll-conservatively 1)

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
;;(load-theme 'sanityinc-tomorrow-day t)
(load-theme 'material t)

;;;-> spaceline
(use-package spaceline-config
  :config
  (spaceline-spacemacs-theme))

;;;-> ivy
;; (use-package ivy
;;   :bind
;;   ("C-s" . 'swiper)
;;   ("\C-c \C-r" . 'ivy-resume)
;;   ("M-x" . 'counsel-M-x)
;;   ("\C-x \C-f" . 'counsel-find-file)
;;   ("C-x b" . 'ivy-switch-buffer)
;;   ("\C-c g" . 'counsel-git)
;;   ("\C-c j" . 'counsel-git-grep)
;;   ("\C-c k" . 'counsel-ag)
;;   :config
;;   (setq ivy-use-virtual-buffers t)
;;   (setq enable-recursive-minibuffers t)
;;   ;; ivy-rich
;;   (use-package ivy-rich
;;     :config
;;    (ivy-set-display-transformer 'ivy-switch-buffer 'ivy-rich-switch-buffer-transformer))
;;  )

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
  ("C-M-o" . helm-occur)
  :config
  (setq helm-ag-base-command "rg --vimgrep --no-heading")
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

;;;->
(use-package winum
  :config
  (winum-mode))

;;;-> projectile
(use-package projectile
  :config
  ;; (counsel-projectile-mode)
  (projectile-global-mode)
  (setq projectile-completion-system 'helm)
  :bind
  ("C-x p f" . projectile--find-file)
  )

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

;;;-> hydra
(use-package hydra
  :config
  (global-set-key
   (kbd "C-;")
   (defhydra hydra-move ()
     "move"
     ("f" forward-char "right")
     ("b" backward-char "left")
     ("n" next-line "down")
     ("p" previous-line "up")
     ("SPC" scroll-up-command "down")
     ("<backspace>" scroll-down-command "up")
     ("." hydra-repeat "repeat")))
  (global-set-key
   (kbd "C-^")
   (defhydra hydra-window-size ()
     "move"
     ("f" enlarge-window-horizontally "horizontal-large")
     ("b" shrink-window-horizontally "horizontal-shrink")
     ("n" enlarge-window "vertical-large")
     ("p" shrink-window "vertical-shrink")
     ("." hydra-repeat "repeat"))))

;;;-> elscreen
(use-package elscreen
  :init
  (custom-set-variables
   '(elscreen-prefix-key (kbd "C-z"))
   ;;'(elscreen-display-tab nil)
   '(elscreen-tab-display-kill-screen nil)
   '(elscreen-tab-display-control nil))
  ;;(bind-key "C-t p" 'helm-elscreen)
  (bind-key* "C-<tab>" 'elscreen-next)
  (bind-key* "<C-iso-lefttab>" 'elscreen-previous)
(elscreen-start))

;;;-> multiple-cursors
(use-package multiple-cursors)

;;;-> visual-regexp
(use-package visual-regexp
  :bind
  ("M-%" . vr/query-replace)
  )

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> 53. Language Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
;; jedi
(use-package jedi
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  :config
  (setq jedi:complete-on-dot t)
  )

;;;-> ruby
;; ruby-mode
;; disable ruby magic comment
(custom-set-variables
 '(ruby-insert-encoding-magic-comment nil))
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

;;;-> Elixir
(use-package elixir-mode)
(use-package alchemist)
(use-package flycheck-elixir)

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
v  )
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
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))


;;;-> fish-shell
(add-hook 'fish-mode-hook
	  #'(lambda ()
	      ;; インデント幅: 4
       	      (setq fish-indent-level 4)))

;;;-> highlight-idnent
(use-package highlight-indentation
  :config
  (add-hook 'prog-mode-hook 'highlight-indentation-mode)
  (set-face-background 'highlight-indentation-face "#e3e3d3")
  (set-face-background 'highlight-indentation-current-column-face "#c3b3b3")
  )

;; merlin-mode
(push "~/.opam/default/share/emacs/site-lisp" load-path) ; directory containing merlin.el
(setq merlin-command "~/.opam/default/bin/ocamlmerlin")  ; needed only if ocamlmerlin not already in your PATH
(autoload 'merlin-mode "merlin" "Merlin mode" t)
(add-hook 'tuareg-mode-hook 'merlin-mode)
(add-hook 'caml-mode-hook 'merlin-mode)
