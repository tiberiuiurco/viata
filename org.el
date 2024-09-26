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

(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "WAITING(w)" "|" "DONE(d!)" "CANCELLED(c)")
        ))
(setq org-tag-alist
      '((:startgroup)
                                        ; Put mutually exclusive tags here
        (:endgroup)
        ;; Places
        ("@home" . ?H)
        ("@work" . ?W)
        ("@uni" . ?U)

        ;; Devices
        ("@computer" . ?C)
        ("@phone" . ?P)

        ;; Activities
        ("@planning" . ?n)
        ("jobhunting" . ?j)
        ("@programming" . ?p)
        ("@writing" . ?w)
        ("@studying" . ?s)
        ("@email" . ?e)
        ("@calls" . ?c)
        ("@explore" .?x)
        ("@emacs" .?m)
        ("@errands" . ?r)))

(setq org-agenda-custom-commands
      '(("d" "Dashboard"
         ((agenda "" ((org-deadline-warning-days 7) (org-agenda-span 7) (org-agenda-start-day "today")))
          (tags-todo "+PRIORITY=\"A\"" ((org-agenda-overriding-header "High Priority Tasks")))
          (tags-todo "@lab" ((org-agenda-overriding-header "Lab")
                             (org-agenda-skip-function '(org-agenda-skip-entry-if 'timestamp))))
          (tags-todo "@uni" ((org-agenda-overriding-header "University")
                             (org-agenda-skip-function '(org-agenda-skip-entry-if 'timestamp))))
          (tags-todo "-@lab-@uni-roam/TODO"
                     ((org-agenda-overriding-header "Next Tasks")
                      (org-agenda-skip-function '(org-agenda-skip-entry-if 'timestamp))))
          ;; (tags-todo "roam" ((org-agenda-overriding-header "Roam")))
          ))

        ("l" "Daily Life"
         ((agenda "" ((org-deadline-warning-days 7) (org-agenda-span 7) (org-agenda-start-day "today")))
          (tags-todo "@uni/NEXT" ((org-agenda-overriding-header "University")))
          (tags-todo "-@lab-@uni-roam/NEXT"
                     ((org-agenda-overriding-header "Next Tasks")))
          ;; (tags-todo "roam" ((org-agenda-overriding-header "Roam")))
          ))

        ("n" "Next Tasks"
         ((todo "NEXT"
                ((org-agenda-overriding-header "Next Tasks")))))

        ("r" "Roam"
         ((tags-todo "roam" ((org-agenda-overriding-header "Roam")))))
        ("u" "Untagged Tasks" tags-todo "-{.*}")
        ("w" "Weekly Review"
         ((agenda ""
                  ((org-agenda-overriding-header "Completed Tasks")
                   (org-agenda-skip-function '(org-agenda-skip-entry-if 'nottodo 'done))
                   (org-agenda-span 'week)))))
	))

(setq org-agenda-prefix-format '((agenda . " %i %-12:c%?-12t%-6e% s")
                                 (todo . " %i %-12:c %-6e")
                                 (tags . " %i %-12:c")
                                 (search . " %i %-12:c")))

(setq org-refile-targets
      '(("~/Documents/Files/3 Org/gtd/gtd.org" :maxlevel . 3)))

;; Save Org buffers after refiling!
(advice-add 'org-refile :after 'org-save-all-org-buffers)

(setq org-capture-templates
      `(("t" "Tasks / Projects")
        ("tt" "Task Inbox BACKLOG" entry (file+olp "~/Documents/Files/3 Org/gtd/gtd.org" "Tasks")
         "* BACKLOG %?\n  %U\n  %a\n  %i" :empty-lines 1)
        ("tn" "Task Inbox NEXT" entry (file+olp "~/Documents/Files/3 Org/gtd/gtd.org" "Tasks")
         "* NEXT %?\n  %U\n  %a\n  %i" :empty-lines 1)
        ("ts" "Task Tickler Scheduled" entry (file+olp "~/Documents/Files/3 Org/gtd/gtd.org" "Tickler")
         "* TODO %?\n  %U\n  %a\n  %i" :empty-lines 1)))

(require 'org-checklist)

(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
