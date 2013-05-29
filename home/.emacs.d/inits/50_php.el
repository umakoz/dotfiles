;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when (require 'php-mode nil t)
  ;; PEAR コーディング規約
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(php-mode-force-pear t)
   '(text-mode-hook (quote (text-mode-hook-identify)))
   '(transient-mark-mode t)
   '(truncate-lines t)
   '(truncate-partial-width-windows t))

  (add-hook 'php-mode-hook
            (lambda ()
              (define-key php-mode-map '[(control c)(control .)] 'php-show-arglist)
              ;; (setq php-manual-path "/usr/local/share/php/doc")
              (setq php-manual-url "http://jp2.php.net/manual/ja/")
              (setq php-search-url "http://jp2.php.net/ja/")
              (gtags-mode 1)
              (when (require 'php-completion nil t)
                (php-completion-mode t)
                (define-key php-mode-map (kbd "C-o") 'phpcmp-complete))
              (when (require 'auto-complete nil t)
                (make-variable-buffer-local 'ac-sources)
                (add-to-list 'ac-sources 'ac-source-php-completion))
                (auto-complete-mode t)))

  (when (require 'flymake-php nil t)
    (add-hook 'php-mode-hook 'flymake-php-load)))
