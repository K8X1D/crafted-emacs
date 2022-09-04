;;; config.el -- Crafted Emacs user customization file -*- lexical-binding: t; -*-

(require 'crafted-defaults)    ; Sensible default settings for Emacs
(require 'crafted-updates)     ; Tools to upgrade Crafted Emacs
(require 'crafted-completion)  ; selection framework based on `vertico`
(require 'crafted-ui)          ; Better UI experience (modeline etc.)
(require 'crafted-windows)     ; Window management configuration
(require 'crafted-editing)     ; Whitspace trimming, auto parens etc.
(require 'crafted-evil)        ; An `evil-mode` configuration
(require 'crafted-project)     ; built-in alternative to projectile
(require 'crafted-speedbar)    ; built-in file-tree
(require 'crafted-screencast)  ; show current command and binding in modeline
(require 'crafted-compile)     ; automatically compile some emacs lisp files
(require 'crafted-pdf-reader)  ; pdf support
(require 'crafted-latex)       ; latex support
(require 'crafted-lisp)        ; lisp support

(require 'k8x1d-org)           ; org-appear, clickable hyperlinks etc.

(require 'k8x1d-julia)         ; julia support
(require 'k8x1d-R)             ; R support
(require 'k8x1d-git)           ; git support

(add-hook 'emacs-startup-hook
          (lambda ()
            (custom-set-faces
             `(default ((t (:font "DejaVu Sans Mono 16"))))
             `(fixed-pitch ((t (:inherit (default)))))
             `(fixed-pitch-serif ((t (:inherit (default)))))
             `(variable-pitch ((t (:font "DejaVu Sans 16")))))))

(setq inhibit-x-resources t) ;; ignore xressources
(crafted-package-install-package 'doom-themes)
(progn
  (disable-theme 'deeper-blue)          ; first turn off the deeper-blue theme
  (load-theme 'doom-gruvbox t))       ; load the doom-gruvbox theme
;;(progn
;;  (disable-theme 'deeper-blue)          ; first turn off the deeper-blue theme
;;  (load-theme 'modus-vivendi t))       ; load the doom-palenight theme

(customize-set-variable 'crafted-startup-inhibit-splash t)

(unless (featurep 'pgtk)
  (set-frame-parameter (selected-frame) 'alpha '(85 . 85))
  (add-to-list 'default-frame-alist '(alpha . (85 . 85)))
  (set-frame-parameter (selected-frame) 'fullscreen 'maximized)
  (add-to-list 'default-frame-alist '(fullscreen . maximized))

  ;; ;; Set transparency of emacs
  (defun kk/transparency (value)
    "Sets the transparency of the frame window. 0=transparent/100=opaque"
    (interactive "nTransparency Value 0 - 100 opaque:")
    (set-frame-parameter (selected-frame) 'alpha value)))

;; For emacs pgtk >= 29
(when (featurep 'pgtk)
  (if (version< emacs-version "29")
      ;; initial transparency
      (set-frame-parameter nil 'alpha-background 100)
    (add-to-list 'default-frame-alist '(alpha-background . 100))

    ;; function to change transparency
    (defun kk/transparency (value)
      "Sets the transparency of the frame window. 0=transparent/100=opaque"
      (interactive "nTransparency Value 0 - 100 opaque:")
      (set-frame-parameter (selected-frame) 'alpha-background value))))

(setq geiser-default-implementation 'guile)
(setq scheme-program-name "guile")

(setq backup-directory-alist `(("." . "~/.saves")))

(setq julia-vterm-repl-program (concat (getenv "HOME") "/.nix-profile/bin/julia -t 4"))
(setq eglot-jl-default-environment "~/.julia/environments/v1.7")
(setq eglot-jl-language-server-project (concat eglot-jl-default-environment "/eglot-jl"))
(setq eglot-connect-timeout 60)
(setq eglot-jl-julia-command (concat (getenv "HOME") "/.nix-profile/bin/julia"))

(setq tab-bar-show nil)
(setq tab-bar-new-tab-choice "*scratch*")

(fset 'yes-or-no-p 'y-or-n-p)

(add-hook 'text-mode-hook 'visual-line-mode)

(setq vc-follow-symlinks t)

(setq package-archive-priorities nil)

(crafted-package-install-package 'vterm)

(crafted-package-install-package 'mixed-pitch)
(add-hook 'text-mode-hook 'mixed-pitch-mode)

(crafted-package-install-package 'csv-mode)

(provide 'config)
;;; config.el ends here
