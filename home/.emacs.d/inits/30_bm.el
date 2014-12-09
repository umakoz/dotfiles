;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when (require 'bm nil t)
  (require 'bm-ext nil t)

  (setq bm-highlight-style 'bm-highlight-only-fringe)
  (setq bm-cycle-all-buffers t)

  (setq-default bm-buffer-persistence t)
  (setq bm-repository-file "~/.emacs.d/.bm-repository")
  (setq bm-restore-repository-on-load t)

  ;; load repository
  (add-hook 'after-init-hook 'bm-repository-load)
  (add-hook 'find-file-hooks 'bm-buffer-restore)
  (add-hook 'after-revert-hook 'bm-buffer-restore)
  ;; save repository
  (add-hook 'kill-buffer-hook 'bm-buffer-save)
  ;;(add-hook 'auto-save-hook 'bm-buffer-save)
  (add-hook 'after-save-hook 'bm-buffer-save)
  (add-hook 'vc-before-checkin-hook 'bm-buffer-save)

  (add-hook 'kill-emacs-hook '(lambda nil
                                (bm-buffer-save-all)
                                (bm-repository-save)))

  (global-set-key (kbd "M-@") 'bm-toggle)
  (global-set-key (kbd "M-[") 'bm-previous)
  (global-set-key (kbd "M-]") 'bm-next)
  (global-set-key (kbd "<left-fringe> <mouse-1>") 'bm-toggle-mouse))
