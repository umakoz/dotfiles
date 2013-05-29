;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;; linum
(when (require 'linum nil t)
  ;(global-linum-mode t)
  (setq linum-format "%4d ")
  (global-set-key [f9] 'linum-mode)

  (setq my-linum-hook-name '(emacs-lisp-mode-hook
                             slime-mode-hook
                             sh-mode-hook
                             text-mode-hook
                             php-mode-hook
                             python-mode-hook
                             ruby-mode-hook
                             rhtml-mode-hook
                             css-mode-hook
                             yaml-mode-hook
                             org-mode-hook
                             javascript-mode-hook))

  ;; メジャーモード/マイナーモードでの指定
  (defvar my-linum-hook-name nil)
  (mapc (lambda (hook-name)
          (add-hook hook-name (lambda () (linum-mode t))))
        my-linum-hook-name)

  ;; ファイル名での判定
  (defvar my-linum-file nil)
  (defun my-linum-file-name ()
    (when (member (buffer-name) my-linum-file)
      (linum-mode t)))
  (add-hook 'find-file-hook 'my-linum-file-name)

  ;; 拡張子での判定
  (defvar my-linum-file-extension nil)
  (defun my-linum-file-extension ()
    (when (member (file-name-extension (buffer-file-name)) my-linum-file-extension)
      (linum-mode t)))

  (add-hook 'find-file-hook 'my-linum-file-extension))
