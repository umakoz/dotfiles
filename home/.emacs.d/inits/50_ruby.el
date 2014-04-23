;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

(setq enh-ruby-indent-level 2
      enh-ruby-indent-tabs-mode nil
      enh-ruby-deep-indent-paren-style nil)
(add-hook 'enh-ruby-mode-hook (lambda ()
                                (set-face-foreground 'enh-ruby-op-face "#839496") ; solarized-theme base0
                                (set-face-foreground 'enh-ruby-regexp-delimiter-face "#B58900"))) ; solarized-theme yellow
(define-key ruby-mode-map "\C-m" 'reindent-then-newline-and-indent)

(add-to-list 'auto-coding-alist '("\\.rb\\'" . utf-8-unix))

(setq auto-mode-alist
      (append '(("\\.rb$" . enh-ruby-mode)
                ("\\.rake$" . enh-ruby-mode)
                ("\\.ru$" . enh-ruby-mode)
                ("\\.gemspec$" . enh-ruby-mode)
                ("\\.god$" . enh-ruby-mode)
                ("\\.axlsx$" . enh-ruby-mode)
                ("[Rr]akefile" . enh-ruby-mode)
                ("[Cc]apfile" . enh-ruby-mode)
                ("[Gg]uardfile" . enh-ruby-mode)
                ("[Vv]agrantfile" . enh-ruby-mode)
                ("[Gg]emfile" . enh-ruby-mode))
              auto-mode-alist))

(when (require 'rbenv nil t)
  (setq rbenv-show-active-ruby-in-modeline nil)
  (global-rbenv-mode))

(require 'bundler nil t)

(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode)
;;(add-hook 'after-init-hook 'inf-ruby-switch-setup)

(when (require 'ruby-block nil t)
  (ruby-block-mode t)
  (setq ruby-block-highlight-toggle 'overlay))

(when (require 'ruby-tools nil t))

(when (require 'flymake-ruby nil t)
  (add-hook 'enh-ruby-mode-hook 'flymake-ruby-load))

;; Rinari
(when (require 'rinari nil t)
  ;;; rhtml-mode
  (require 'rhtml-mode nil t)
  (add-hook 'rhtml-mode-hook
            (lambda () (rinari-launch))))

;; https://github.com/asok/helm-rails
(when (require 'helm-rails nil t)
  (helm-rails-def-resource 'workers "app/workers/" "^app/workers/(.+)$")

  (define-key enh-ruby-mode-map (kbd "s-c") 'helm-rails-controllers)
  (define-key enh-ruby-mode-map (kbd "s-m") 'helm-rails-models)
  (define-key enh-ruby-mode-map (kbd "s-v") 'helm-rails-views)
  (define-key enh-ruby-mode-map (kbd "s-j") 'helm-rails-javascripts)
  (define-key enh-ruby-mode-map (kbd "s-s") 'helm-rails-stylesheets)
  (define-key enh-ruby-mode-map (kbd "s-t") 'helm-rails-specs)
  (define-key enh-ruby-mode-map (kbd "s-w") 'helm-rails-workers)
  (define-key enh-ruby-mode-map (kbd "s-a") 'helm-rails-all)

  (define-key rhtml-mode-map (kbd "s-c") 'helm-rails-controllers)
  (define-key rhtml-mode-map (kbd "s-m") 'helm-rails-models)
  (define-key rhtml-mode-map (kbd "s-v") 'helm-rails-views)
  (define-key rhtml-mode-map (kbd "s-j") 'helm-rails-javascripts)
  (define-key rhtml-mode-map (kbd "s-s") 'helm-rails-stylesheets)
  (define-key rhtml-mode-map (kbd "s-t") 'helm-rails-specs)
  (define-key rhtml-mode-map (kbd "s-w") 'helm-rails-workers)
  (define-key rhtml-mode-map (kbd "s-a") 'helm-rails-all))

;; Robe
(when (require 'robe nil t)
  (setq robe-highlight-capf-candidates nil)
  (add-hook 'enh-ruby-mode-hook (lambda ()
                                  (robe-mode)))
  (add-hook 'robe-mode-hook 'ac-robe-setup))
