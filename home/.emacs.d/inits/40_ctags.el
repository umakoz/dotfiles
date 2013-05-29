;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when (require 'ctags nil t)
  (setq tags-revert-without-query t)
  ;; (global-set-key (kbd "<f7>") 'ctags-create-or-update-tags-table)
  ;;(global-set-key (kbd "M-.")  'ctags-search)
  ;;(autoload 'turn-on-ctags-auto-update-mode "ctags-update" "turn on `ctags-auto-update-mode'." t)
  ;;(add-hook 'c-mode-common-hook  'turn-on-ctags-auto-update-mode)
  ;;(add-hook 'emacs-lisp-mode-hook  'turn-on-ctags-auto-update-mode)
  ;;
  ;; then when you save a file ,`ctags-auto-update-mode' will recursively searches each
  ;; parent directory for a file named 'TAGS'. if found ,it will use
  ;; `exuberant-ctags' update TAGS,
  ;; it would not be updated if last time calling `ctags-update' is not 5 minute age(default).
  ;;
  ;; if you want to update TAGS immediately
  ;; you can
  ;;     (autoload 'ctags-update "ctags-update" "update TAGS using ctags" t)
  ;;     (global-set-key "\C-cE" 'ctags-update)
  ;; with prefix `C-u' ,then you can generate a new TAGS file in your selected directory,
  ;; with prefix `C-uC-u' same to prefix `C-u',but save it to king-ring instead of execute it."
  
  ;;
  ;; on windows ,you can custom `ctags-update-command' like this:
  ;; (when (equal system-type 'windows-nt)
  ;;   (setq ctags-update-command (expand-file-name  "~/.emacs.d/bin/ctags.exe")))
  )
