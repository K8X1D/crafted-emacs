;;; k8x1d-julia.el -- Julia support -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Kevin Kaiser

;; Author: Kevin Kaiser <k8x1d@proton.me>
;; Keywords: lisp

(crafted-package-install-package 'julia-mode)
(crafted-package-install-package 'julia-vterm)
(crafted-package-install-package 'ob-julia-vterm)
(crafted-package-install-package 'eglot-jl)

(eglot-jl-init)

(add-hook 'julia-mode-hook 'julia-vterm-mode)
(add-hook 'org-mode-hook (lambda ()
                           (add-to-list 'org-babel-load-languages '(julia-vterm . t))
                           (org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages)))
(add-hook 'julia-mode-hook #'eglot-ensure)

(provide 'k8x1d-julia)
;;; k8x1d-julia.el ends here
