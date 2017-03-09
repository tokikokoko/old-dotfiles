
;; packagelists
(defvar my/favorite-packages
  '(
    ;; package-utils
    package-utils
    ;; use-package
    use-package
    ;; fish-shell-mode
    fish-mode
    ;; indent-guide
    indent-guide
    ;; go-mode
    go-mode
    ;; company
    company
    ;; ivy-mode
    swiper ivy-rich
    ;; counsel
    counsel
    ;; flycheck
    flycheck
    ;; python env
    elpy
    ;; slime
    slime
    ;; moe-theme
    moe-theme
    ;; zenburn
    zenburn-theme
    ))

;; [function]install all packages from my/favorite-packages
(defun package-install-all ()
  (interactive)
  (package-refresh-contents)
  (dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-install package)))
  (load-file "~/.emacs.d/config/packages.el"))
