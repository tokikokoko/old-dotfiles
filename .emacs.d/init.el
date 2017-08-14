
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
		   "~/.emacs.d/lisp",
		   "~/.emacs.d/config"
		   )
                 load-path))
;; elisp配下のディレクトリをロードパスに一括追加
(let ((default-directory (expand-file-name "~/.emacs.d/elisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))
;;;-> use-package.el
(require 'use-package)
(require 'bind-key)
;; packagelist.elを読み込み
(load "~/.emacs.d/config/packagelist")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> 01.User interface settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; font設定
(when (eq system-type 'windows-nt)
  (set-default-font "M+ 1mn light 11"))
(when (eq system-type 'darwin)
  (set-default-font "M+ 1mn light 12"))
(when (eq system-type 'gnu/linux)
  (set-default-font "M+ 1mn light 10"))
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
;;-> 02.General settings
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> 10.Writing settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> 51.Builtin plugin settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;-> dired
;; diredを便利にする
(require 'dired-x)
;; diredで日本語ファイル名出力
(setq default-coding-system 'shift_jis)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-> 52.External plugin settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;-> theme
(load-theme 'zenburn t)

;;;-> ivy
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

;;;-> company
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

;;;-> multiple-cursors
(use-package multiple-cursors)

;;;-> flycheck
(use-package flycheck
  :init
  (add-hook 'after-init-hook #'global-flycheck-mode)
  :bind
  ("\C-cn" . flycheck-next-error)
  ("\C-cp" . flycheck-previous-error)
  ("\C-cd" . flycheck-list-errors)
  )

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

;;;-> highlight-idnent
(use-package highlight-indentation
  :config
  (set-face-background 'highlight-indentation-face "#00aa00")
  (set-face-background 'highlight-indentation-current-column-face "#115511")
  )

