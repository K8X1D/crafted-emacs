;;; k8x1d-language-tool.el -- LanguageTools support -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Kevin Kaiser

;; Author: Kevin Kaiser <k8x1d@proton.me>
;; Keywords: lisp

(straight-use-package '(eglot-ltex :type git :host github :repo "emacs-languagetool/eglot-ltex"))

(setq eglot-languagetool-server-path "~/Documents/Logiciels/editors_set-up/ltex-ls-15.2.0")

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (require 'eglot-ltex)
            (call-interactively #'eglot)))

(defun kk/start-ltex ()
  (interactive)
  (require 'eglot-ltex)
  (call-interactively #'eglot))

(provide 'k8x1d-language-tool)
;;; k8x1d-language-tool.el ends here
