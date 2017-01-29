(defun package-install-all ()
  (interactive)
  ;; refresh
  (package-refresh-contents)
  ;; package-utils
  (package-install 'package-utils)

  ;; use-package
  (package-install 'use-package)

  ;; fish-shell-mode
  (package-install 'fish-mode)

  ;; indent-guide
  (package-install 'indent-guide)

  ;; company
  (package-install 'company)

  ;; swiper + ivy
  (package-install 'swiper)

;; counsel
(package-install 'counsel)

  ;; slime
  (package-install 'slime)

  ;; moe-theme
  (package-install 'moe-theme)
  )
