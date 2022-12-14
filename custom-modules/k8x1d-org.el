;;; k8x1d-org.el -- Org customizations -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Kevin Kaiser

;; Author: Kevin Kaiser <k8x1d@proton.me>
;; Keywords: lisp

(require 'crafted-org)
(crafted-package-install-package 'org-superstar) ;; bullets customization
(crafted-package-install-package 'evil-org) ;; evil support for org-agenda
(crafted-package-install-package 'toc-org) ;; Table of content management

(setq org-superstar-remove-leading-stars t)
(setq org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●"))
(setq org-superstar-special-todo-items t)

(setq org-startup-indented t
      org-pretty-entities t
      org-hide-emphasis-markers t
      org-startup-with-inline-images t
      org-image-actual-width '(600))

(setq org-directory "~/org")
(setq org-agenda-include-all-todo nil)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-include-diary t)
(setq org-agenda-columns-add-appointments-to-effort-sum t)
(setq org-agenda-custom-commands nil)
(setq org-agenda-default-appointment-duration 60)
(setq org-agenda-mouse-1-follows-link t)
(setq org-agenda-skip-unavailable-files t)
(setq org-agenda-use-time-grid nil)
(setq org-agenda-files (list org-directory))
;; Org capture
(global-set-key (kbd "C-c l") #'org-store-link)
;;(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
(global-set-key (kbd "C-c a a") 'org-agenda)
(global-set-key (kbd "C-c a l") 'org-agenda-list)
(global-set-key (kbd "C-c a t") 'org-todo-list)
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-capture-templates
      '(("t" "Today" entry (file+headline "~/org/today.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("p" "Project" entry (file+datetree "~/org/projects.org")
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")))
(setq org-refile-targets '((org-agenda-files :maxlevel . 3)))
(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps nil)

(add-hook 'org-mode-hook 'org-superstar-mode)
(add-hook 'org-mode-hook (lambda ()
                           (require 'evil-org)
                           (evil-org-set-key-theme '(navigation insert textobjects additional calendar))))
(add-hook 'org-agenda-mode-hook (lambda ()
                                  (require 'evil-org-agenda)
                                  (evil-org-agenda-set-keys)))
(add-hook 'org-mode-hook 'evil-org-mode)
(add-hook 'org-mode-hook 'toc-org-mode)

(provide 'k8x1d-org)
;;; k8x1d-org.el ends here
