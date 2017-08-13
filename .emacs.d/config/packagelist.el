
;; packagelists
(defvar my/favorite-packages
  '(
    ;; package-utils
    package-utils
    ;; use-package
    use-package
    ;; theme
    zenburn-theme
    ;; general
    multiple-cursors indent-guide
    ;; git
    magit
    ;; company
    company
    ;; ivy-mode
    swiper ivy-rich
    ;; counsel
    counsel
    ;; flycheck
    flycheck
    ;; fish-shell-mode
    fish-mode
    ;; go-mode
    go-mode
    ;; python
    python-mode jedi
    ;; lisp
    slime
    ))

;; [function]install all packages from my/favorite-packages
(defun package-install-all ()
  (interactive)
  (package-refresh-contents)
  (dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-install package)))
  (load-file "~/.emacs.d/config/packages.el"))
