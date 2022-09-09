;;; k8x1d-git.el -- Org customizations -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Kevin Kaiser

;; Author: Kevin Kaiser <k8x1d@proton.me>
;; Keywords: lisp

(crafted-package-install-package 'magit)
(crafted-package-install-package 'magit-todos)
(crafted-package-install-package 'forge)

(add-hook 'magit-mode-hook (lambda ()
                             (magit-todos-mode)
                             (require 'forge)))

(provide 'k8x1d-git)
;;; k8x1d-git.el ends here
