;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

; server start for emacs-client
(when (require 'server nil t)
  (unless (server-running-p)
    (server-start)))


;; PATH
;; http://sakito.jp/emacs/emacsshell.html#path
;; より下に記述した物が PATH の先頭に追加されます
(dolist (dir (list
              "/sbin"
              "/bin"
              "/usr/sbin"
              "/usr/bin"
              "/usr/local/sbin"
              "/usr/local/bin"
              (expand-file-name "~/bin")
              (expand-file-name "~/.nvm/v0.10.5/bin")
              (expand-file-name "~/.emacs.d/bin")))
 ;; PATH と exec-path に同じ物を追加します
 (when (and (file-exists-p dir) (not (member dir exec-path)))
   (setenv "PATH" (concat dir ":" (getenv "PATH")))
   (setq exec-path (append (list dir) exec-path))))
