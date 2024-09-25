(require 'org)
(use-package org-modern
  :hook (org-mode . org-modern-mode))

(setq org-log-done 'time)
(setq org-agenda-start-with-log-mode t)
(setq org-agenda-todo-ignore-with-date t)
(setq org-agenda-todo-ignore-timestamp t)
(setq org-agenda-todo-ignore-scheduled t)
(setq org-agenda-todo-ignore-deadlines t)

(setq org-agenda-show-inherited-tags t) ;; already default
(setq org-agenda-tags-column -100)
(setq org-agenda-view-columns-initially nil)
(setq org-agenda-start-with-clockreport-mode t)
(setq org-agenda-start-with-log-mode nil)

(setq org-log-done nil
      org-log-into-drawer t
      org-agenda-skip-scheduled-if-done t)

(setq org-agenda-window-setup 'current-window)

;; mine
(setq backup-directory-alist '((".*" . "~/.Trash")))
(setq initial-major-mode 'org-mode)
(setq initial-scratch-message "")

(setq org-directory (expand-file-name "~/Documents/Files/3 Org/gtd/"))
(setq org-agenda-files `(,org-directory))
