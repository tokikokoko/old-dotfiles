(defvar my/favorite-packages
  '(
    ;;; package-utils
    package-utils
    ;;; use-package
    use-package
    ;;; fish-shell-mode
    fish-mode
    ;;; indent-guide
    indent-guide
    ;;; company
    company
    ;;; ivy-mode
    swiper ivy-rich
    ;;; counsel
    counsel
    ;;; flycheck
    flycheck
    ;;; slime
    slime
    ;;; moe-theme
    moe-theme
    ))

(defun package-install-all ()
  (interactive)
  (package-refresh-contents)
  (dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-install package)))
  (load-file "~/.emacs.d/config/packages.el"))
