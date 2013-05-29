;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(autoload 'js2-mode "js2-mode" nil t)

(setq auto-mode-alist
      (append
       '(
         ("\\.js$"    . js2-mode)
         ("\\.json$"  . js2-mode)
         ("\\.js.erb$"    . js2-mode)
         )
       auto-mode-alist))

(setq js2-basic-offset 2)


(when (require 'flymake-jshint nil t)
  (add-hook 'js2-mode-hook 'flymake-jshint-load))


(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/tern/emacs/"))
(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js2-mode-hook
          (lambda ()
            (define-key js2-mode-map [(return)] 'newline-and-indent)
            
            (tern-mode t)
            (setq tern-ac-on-dot t)
            (tern-ac-setup)))
