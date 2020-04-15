;; [[file:~/.config/doom/config.org::*Personal%20Information][Personal Information:1]]
(setq user-full-name "Kelvin Porter"
      user-mail-address "kporter@protonmail.com")
;; Personal Information:1 ends here

;; [[file:~/.config/doom/config.org::*Startup%20Time][Startup Time:1]]
(use-package! esup
  :commands (esup))
;; Startup Time:1 ends here

;; [[file:~/.config/doom/config.org::*Ivy][Ivy:1]]
(after! ivy-posframe
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center))))
;; Ivy:1 ends here

;; [[file:~/.config/doom/config.org::*Theme][Theme:1]]
(setq doom-theme 'doom-vibrant)
;; Theme:1 ends here

;; [[file:~/.config/doom/config.org::*Font][Font:1]]
(setq doom-font (font-spec :family "JetBrains Mono" :size 14))
;; Font:1 ends here

;; [[file:~/.config/doom/config.org::*Deft][Deft:1]]
(setq deft-directory "~/doc/org/roam")
;; Deft:1 ends here

;; [[file:~/.config/doom/config.org::*Deft][Deft:2]]
(evil-set-initial-state 'deft-mode 'emacs)
;; Deft:2 ends here

;; [[file:~/.config/doom/config.org::*Basic%20Settings][Basic Settings:1]]
(setq display-line-numbers-type 'relative)
;; Basic Settings:1 ends here

;; [[file:~/.config/doom/config.org::*Evil%20Snipe][Evil Snipe:1]]
(setq evil-snipe-scope 'buffer
      evil-snipe-repeat-scope 'whole-buffer)
;; Evil Snipe:1 ends here

;; [[file:~/.config/doom/config.org::*Vterm][Vterm:1]]
(evil-set-initial-state 'vterm-mode 'emacs)
;; Vterm:1 ends here

;; [[file:~/.config/doom/config.org::*Org%20Directory][Org Directory:1]]
(setq org-directory "~/doc/org/" )
;; Org Directory:1 ends here

;; [[file:~/.config/doom/config.org::*Org%20Capture%20Templates][Org Capture Templates:1]]
(setq org-capture-templates
      '(
        ("t" "Tasks")
        ("tt" "Todo" entry (file+headline "~/doc/org/todo.org" "Tasks")
         "* TODO %^{Tags}g %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"today\"))\n %^{Effort}p \n")
        ("ts" "School Todo" entry (file+headline "~/doc/org/todo.org" "Tasks")
         "* TODO %? :School:")
        ("tp" "Project Todo" entry (file+headline "~/doc/org/todo.org" "Projects")
         "* TODO %? :Project:\n %^{Effort}p \n")
        ("e" "Events")
        ("ee" "Event" entry (file+headline "~/doc/org/schedule.org" "Events")
         "* %?")
        ("ec" "Club Event" entry (file+headline "~/doc/org/schedule.org" "Clubs")
         "* %?")))
;; Org Capture Templates:1 ends here

;; [[file:~/.config/doom/config.org::*Org%20Todo][Org Todo:1]]
(setq org-todo-keywords '((sequence "TODO(t)" "HOLD(h)" "WIP(w)" "PROJECT(p)" "|" "DONE(d)")))
;; Org Todo:1 ends here

;; [[file:~/.config/doom/config.org::*Org%20Tags][Org Tags:1]]
(setq org-tag-alist '((:startgroup nil)
                      ("Trivial" . ?t) ("Unimportant" . ?u) ("Important" . ?i)
                      (:endgroup nil)
                      (:startgroup nil)
                      ("School" . ?s)
                      ("Issue" . ?i)
                      ("Project" . ?p)
                      ("Dotfiles" . ?d)
                      (:endgroup nil)))
;; Org Tags:1 ends here

;; [[file:~/.config/doom/config.org::*Org%20Agenda][Org Agenda:1]]
(setq org-agenda-files (list org-directory)
      org-agenda-time-grid '((daily today require-timed) nil nil "---------------")
      org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done t
      org-agenda-include-deadlines t
      org-agenda-block-separator nil
      org-agenda-compact-blocks t
      org-agenda-start-with-log-mode t
      org-agenda-log-mode-items '(closed clock state)
      org-agenda-prefix-format "%i %-12t %-3e "
      org-agenda-use-time-grid nil
      org-columns-default-format-for-agenda "%25ITEM %TODO %3PRIORITY %TAGS %LOCATION"
      org-agenda-start-day "0d"
      org-agenda-span 1
      org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done t
      org-agenda-include-diary t
      org-agenda-block-separator nil
      org-agenda-overriding-header ""
      org-agenda-compact-blocks t)
;; Org Agenda:1 ends here

;; [[file:~/.config/doom/config.org::*Org%20Agenda%20Property][Org Agenda Property:1]]
(use-package! org-agenda-property
  :config
  (setq org-agenda-property-list '("LOCATION" "TEACHER")
        org-agenda-property-position 'where-it-fits
        org-agenda-property-separator "|"))
;; Org Agenda Property:1 ends here

;; [[file:~/.config/doom/config.org::*Org%20Super%20Agenda][Org Super Agenda:1]]
(use-package! org-super-agenda
  :after org
  :config
  (setq org-super-agenda-groups
        '((:name "Next to do"
                 :todo "NEXT"
                 :order 1)
          (:name "Important"
                 :tag "Important"
                 :order 6)
          (:name "Due Today"
                 :deadline today
                 :order 2)
          (:name "Due Soon"
                 :deadline future
                 :order 8)
          (:name "Overdue"
                 :deadline past
                 :order 7)
          (:name "Scheduled"
                 :category "Events"
                 :order 9)
          (:name "School"
                 :tag "School"
                 :order 10)
          (:name "Issues"
                 :tag "Issue"
                 :order 12)
          (:name "Projects"
                 :tag "Project"
                 :order 14)
          (:name "Dotfiles"
                 :tag "Dotfiles"
                 :order 13)
          (:name "Waiting"
                 :todo "WAITING"
                 :order 20)
          (:name "Trivial"
                 :priority<= "C"
                 :tag ("Trivial" "Unimportant")
                 :order 90)
          (:discard (:tag ("Chore" "Routine" "Daily"))))))
;; Org Super Agenda:1 ends here

;; [[file:~/.config/doom/config.org::*Org%20Roam][Org Roam:1]]
(use-package! org-roam
    :after org
    :hook (org-mode . org-roam-mode)
    :commands (org-roam-insert org-roam-find-file org-roam)
    :custom
    (org-roam-directory "~/doc/org/roam/")
    (org-roam-capture-templates '(("d" "default" plain (function org-roam--capture-get-point)
                                   "%?"
                                   :file-name "%<%Y%m%d%H%M%S>-${slug}"
                                   :head "#+TITLE: ${title}\n"
                                   :unnarrowed t))))
(use-package! org-roam-protocol)
;; Org Roam:1 ends here

;; [[file:~/.config/doom/config.org::*Org%20Gcal][Org Gcal:1]]
(after! org-gcal
  (add-to-list 'load-path "~/.config/doom")
  (require 'config_private))
;; Org Gcal:1 ends here

;; [[file:~/.config/doom/config.org::*Org%20Screenshot][Org Screenshot:1]]
(defun org-screenshot-area ()
  "Take a screenshot into a time stamped unique-named file in the
same directory as the org-buffer and insert a link to this file."
  (interactive)
  (setq filename
        (concat
         (make-temp-name
          (concat (buffer-file-name)
                  "_"
                  (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))
  (call-process "escrotum" nil nil nil "-s" filename)
  (insert (concat "[[" filename "]]"))
  (org-display-inline-images))
;; Org Screenshot:1 ends here

;; [[file:~/.config/doom/config.org::*Conda][Conda:1]]
(setq conda-env-home-directory "/home/yack/.conda/")
;; Conda:1 ends here

;; [[file:~/.config/doom/config.org::*Web][Web:1]]

;; Web:1 ends here

;; [[file:~/.config/doom/config.org::*Web][Web:2]]
(add-hook 'web-mode-hook
          (lambda ()
            short circuit js mode and just do everything in jsx-mode
            (if (equal web-mode-content-type "javascript")
                (web-mode-set-content-type "jsx")
              (message "now set to: %s" web-mode-content-type))))
;; Web:2 ends here

;; [[file:~/.config/doom/config.org::*elcord][elcord:1]]
(use-package! elcord
  :defer t)
;; elcord:1 ends here