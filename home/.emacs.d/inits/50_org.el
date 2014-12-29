;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(setq org-startup-truncated nil
      org-return-follows-link t
      org-hide-leading-stars t
      org-odd-levels-only nil
      org-log-done 'time
      org-directory "~/Dropbox/org/"
      org-default-notes-file (concat org-directory "notes.org")
      org-agenda-files (list org-directory))

(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d)" "SOMEDAY(s)")))

(setq org-todo-keyword-faces 
      '(("TODO" :foreground "red" :weight bold)
        ("WAIT" :foreground "yellow" :weight bold)
        ("DONE" :foreground "green" :weight bold)
        ("SOMEDAY" :foreground "cyan" :weight bold)))

(setq org-capture-templates
      '(("t" "Todo" entry
         (file+headline nil "Inbox")
         "** TODO %?\n   %i\n   %a\n   %t")
        ("b" "Bug" entry
         (file+headline nil "Inbox")
         "** TODO %?   :bug:\n   %i\n   %a\n   %t")
        ("i" "Idea" entry
         (file+headline nil "New Ideas")
         "** %?\n   %i\n   %a\n   %t")))

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
