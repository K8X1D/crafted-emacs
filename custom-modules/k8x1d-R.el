;;; k8x1d-R.el -- R support -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Kevin Kaiser

;; Author: Kevin Kaiser <k8x1d@proton.me>
;; Keywords: lisp

(crafted-package-install-package 'ess)

(add-hook 'ess-r-mode-hook #'eglot-ensure)

(provide 'k8x1d-R)
;;; k8x1d-R.el ends here
