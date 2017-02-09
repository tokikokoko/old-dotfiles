;; package.el
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))
;;; ロードパスの追加
(setq load-path (append
                 '(
		   "~/.emacs.d/lisp",
		   "~/.emacs.d/config"
		   )
                 load-path))

;;; elisp配下のディレクトリをロードパスに一括追加
(let ((default-directory (expand-file-name "~/.emacs.d/elisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

;;; packagelist.elを読み込み
(load "~/.emacs.d/config/packagelist")

;;; Localeを日本語に
(set-language-environment "Japanese")
;;; 日本語入力
(prefer-coding-system 'utf-8-unix)

;; UI設定
;;; font設定
(when (eq system-type 'windows-nt)
  (set-default-font "M+ 1mn light 11"))
(when (eq system-type 'darwin)
  (set-default-font "M+ 1mn light 12"))
(when (eq system-type 'gnu/linux)
  (set-default-font "M+ 1mn light 10"))
;;; メニューバーを消す
(menu-bar-mode -1)
;;; ツールバーを消す
(when window-system
  (tool-bar-mode -1))
;;; カーソルの点滅を止める
(blink-cursor-mode 0)
;;; 対応する括弧を強調
(show-paren-mode 1)
;;; 閉じ括弧の自動挿入有効化
(electric-pair-mode 1)
;;; ウィンドウ内に収まらないときだけ括弧内も強調
(setq show-paren-style 'mixed)
;;; 行番号を表示
(global-linum-mode t)
;;; スタートアップページを表示しない
(setq inhibit-startup-message t)

;; 動作設定
;;; 最近開いたファイル
(recentf-mode 1)
;;; バックアップファイルを作らない
(setq backup-inhibited t)
;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)
;;; backupの保存先
(setq backup-directory-alist
      (cons (cons ".*" (expand-file-name "~/.emacs.d/backup"))
	    backup-directory-alist))
(setq auto-save-file-name-transforms
      `((".*",
	 (expand-file-name "~/.emacs.d/backup/") t)))
;; Avoid to write `package-selected-packages` in init.el
(load (setq custom-file (expand-file-name "custom.el" user-emacs-directory)))

;;; 標準Elispの設定
(load "~/.emacs.d/config/builtins")
;;; 非標準Elispの設定
(load "~/.emacs.d/config/packages")
