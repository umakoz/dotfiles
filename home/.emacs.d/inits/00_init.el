;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

; server start for emacs-client
(when (require 'server nil t)
  (unless (server-running-p)
    (server-start)))


;; PATH
(when (require 'exec-path-from-shell nil t)
  (let ((envs '("PATH" "GOPATH")))
    (exec-path-from-shell-copy-envs envs)))
