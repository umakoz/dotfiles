;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when (require 'ruby-mode nil t)
  (setq ruby-indent-level 2
        ruby-indent-tabs-mode nil
        ruby-deep-indent-paren-style nil)
  (define-key ruby-mode-map "\C-m" 'reindent-then-newline-and-indent)

  (add-to-list 'auto-coding-alist '("\\.rb\\'" . utf-8-unix))

  (setq auto-mode-alist
        (append '(("\\.rb$" . ruby-mode)
                  ("\\.rake$" . ruby-mode)
                  ("\\.ru$" . ruby-mode)
                  ("\\.gemspec$" . ruby-mode)
                  ("\\.god$" . ruby-mode)
                  ("[Rr]akefile" . ruby-mode)
                  ("[Cc]apfile" . ruby-mode)
                  ("[Gg]uardfile" . ruby-mode)
                  ("[Vv]agrantfile" . ruby-mode)
                  ("[Gg]emfile" . ruby-mode))
                auto-mode-alist))

  (when (require 'rbenv nil t)
    (setq rbenv-show-active-ruby-in-modeline nil)
    (global-rbenv-mode))

  (when (require 'ruby-electric nil t)
    ;(setq ruby-electric-expand-delimiters-list nil)
    (ruby-electric-mode 1))

  (when (require 'ruby-block nil t)
    (ruby-block-mode t)
    (setq ruby-block-highlight-toggle 'overlay))

  (when (require 'ruby-tools nil t))

  (when (require 'flymake-ruby nil t)
    (add-hook 'ruby-mode-hook 'flymake-ruby-load))

  ;; https://github.com/asok/helm-rails
  (when (require 'helm-rails nil t)
    (helm-rails-def-resource 'workers "app/workers/" "^app/workers/(.+)$")

    (define-key ruby-mode-map (kbd "s-c") 'helm-rails-controllers)
    (define-key ruby-mode-map (kbd "s-m") 'helm-rails-models)
    (define-key ruby-mode-map (kbd "s-v") 'helm-rails-views)
    (define-key ruby-mode-map (kbd "s-j") 'helm-rails-javascripts)
    (define-key ruby-mode-map (kbd "s-s") 'helm-rails-stylesheets)
    (define-key ruby-mode-map (kbd "s-t") 'helm-rails-specs)
    (define-key ruby-mode-map (kbd "s-w") 'helm-rails-workers)
    (define-key ruby-mode-map (kbd "s-a") 'helm-rails-all)

    (define-key rhtml-mode-map (kbd "s-c") 'helm-rails-controllers)
    (define-key rhtml-mode-map (kbd "s-m") 'helm-rails-models)
    (define-key rhtml-mode-map (kbd "s-v") 'helm-rails-views)
    (define-key rhtml-mode-map (kbd "s-j") 'helm-rails-javascripts)
    (define-key rhtml-mode-map (kbd "s-s") 'helm-rails-stylesheets)
    (define-key rhtml-mode-map (kbd "s-t") 'helm-rails-specs)
    (define-key rhtml-mode-map (kbd "s-w") 'helm-rails-workers)
    (define-key rhtml-mode-map (kbd "s-a") 'helm-rails-all))

  ;; Rinari
  (when (require 'rinari nil t)
    ;;; rhtml-mode
    (require 'rhtml-mode nil t)
    (add-hook 'rhtml-mode-hook
              (lambda () (rinari-launch))))

  ;; RSense
  (when (require 'rsense nil t)
    (setq rsense-home "/usr/local/Cellar/rsense/0.3/libexec/")
    (setq rsense-rurema-home "/usr/local/Cellar/ruby-refm/20110729/bin")
    ;;(setq rsense-rurema-refe "refe-1_8_7")
    (setq rsense-rurema-refe "refe-1_9_2")
    (add-hook 'ruby-mode-hook
              '(lambda ()
                 ;; .や::を入力直後から補完開始
                 (add-to-list 'ac-sources 'ac-source-rsense-method)
                 (add-to-list 'ac-sources 'ac-source-rsense-constant)
                 (define-key ruby-mode-map (kbd "C-c .") 'ac-complete-rsense)))))
