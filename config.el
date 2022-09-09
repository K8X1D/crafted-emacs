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
  ;;(require 'crafted-pdf-reader)  ; pdf support
  (require 'crafted-latex)       ; latex support
  (require 'crafted-lisp)        ; lisp support
  ;;(require 'crafted-python)      ; python support
  ;;(require 'crafted-compile)     ; automatically compile some emacs lisp files  TODO: repair bug

  (require 'k8x1d-org)           ; org-appear, clickable hyperlinks etc.

  (require 'k8x1d-python)           ; org-appear, clickable hyperlinks etc.

  (require 'k8x1d-julia)         ; julia support
  (require 'k8x1d-R)             ; R support
  (require 'k8x1d-git)           ; git support
  (require 'k8x1d-ivy)           ; ivy completion support
  (require 'k8x1d-language-tool) ; language-tool support

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

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves/"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

(setq auto-save-file-name-transforms
  `((".*" "~/.cache/emacs/saves/" t)))

(setq julia-vterm-repl-program (concat (getenv "HOME") "/.nix-profile/bin/julia -t 4"))
(setq eglot-jl-default-environment "~/.julia/environments/v1.7")
;; (setq eglot-connect-timeout 60)
(setq eglot-connect-timeout 600)
(setq eglot-jl-julia-command (concat (getenv "HOME") "/.nix-profile/bin/julia"))

  (setq tab-bar-show nil)
  (setq tab-bar-new-tab-choice "*scratch*")

  (fset 'yes-or-no-p 'y-or-n-p)

  (add-hook 'text-mode-hook 'visual-line-mode)

  (setq vc-follow-symlinks t)

  (crafted-package-install-package 'minions)
  (add-hook 'after-init-hook 'minions-mode)

(setq doom-modeline-height 10) ; optional
(setq doom-modeline-bar-width 4)
(custom-set-faces
  '(mode-line ((t (:family "DejaVu Sans Mono" :height 0.8))))
  '(mode-line-active ((t (:family "DejaVu Sans Mono" :height 0.8)))) ; For 29+
  '(mode-line-inactive ((t (:family "DejaVu Sans Mono" :height 0.8)))))

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(setq TeX-view-program-selection '((output-pdf "PDF Tools")))

(crafted-package-install-package 'vterm)
(global-set-key (kbd "C-c t") 'vterm-other-window)
(defun kk/new-vterm-instance ()
  (interactive)
  (vterm t))
(global-set-key (kbd "C-c T") 'kk/new-vterm-instance)
(add-hook 'vterm-mode-hook 'visual-line-mode)

  (crafted-package-install-package 'mixed-pitch)
  (add-hook 'text-mode-hook 'mixed-pitch-mode)

  (crafted-package-install-package 'csv-mode)

  (setq org-confirm-babel-evaluate nil)

(setq org-src-tab-acts-natively t)

(setq org-src-preserve-indentation t)

(crafted-package-install-package 'pdf-tools)

(pdf-loader-install)

(add-hook 'pdf-view-mode-hook 'pdf-view-midnight-minor-mode)

(provide 'config)
;;; config.el ends here

(provide 'early-config)
;;; early-config.el ends here
