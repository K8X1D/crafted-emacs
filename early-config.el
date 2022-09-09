;;; early-config.el -- Crafted Emacs user (early) customization file -*- lexical-binding: t; -*-

(setq package-archive-priorities nil)

(setq use-dialog-box nil) ;; remove gui box

(setq package-enable-at-startup nil)
(setq crafted-package-system 'straight)
(crafted-package-bootstrap crafted-package-system)
