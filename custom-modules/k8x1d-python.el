;;; k8x1d-python.el -- Org customizations -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Kevin Kaiser

;; Author: Kevin Kaiser <k8x1d@proton.me>
;; Keywords: lisp

  (require 'crafted-python)

  (setq python-shell-interpreter (concat (getenv "HOME") "/.guix-extra-profiles/code/code/bin/python3.9"))
  (setq org-babel-python-command (concat (getenv "HOME") "/.guix-extra-profiles/code/code/bin/python3.9"))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)))

(provide 'k8x1d-python)
;;; k8x1d-python.el ends here
