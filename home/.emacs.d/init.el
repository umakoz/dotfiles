;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;; load-path
(add-to-list 'load-path "~/.emacs.d/elisp")

;; Emacs package system 
(when (require 'package nil t)
  ;;リポジトリにMELPAを追加
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  ;;リポジトリにMarmaladeを追加
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
  (setq package-user-dir (concat user-emacs-directory "vendor/elpa"))
  (package-initialize)

  ;; install packages by package.el
  (mapc
   (lambda (package)
     (or (package-installed-p package)
         (package-install package)))
   '(
     ;; package
     init-loader
     melpa

     ;; basic
     bm
     dired+
     scratch-log
     rainbow-mode
     smartparens
     auto-save-buffers-enhanced

     ;; undo redo
     undo-tree
     undohist
     redo+

     ;; key
     smartrep
     key-chord

     ;; cursor
     multiple-cursors
     expand-region
     ace-jump-mode
     ace-isearch

     ;; highlight
     auto-highlight-symbol
     highlight-symbol
     volatile-highlights

     ;; window
     window-layout
     popwin
     e2wm
     edbi
     dropdown-list
     powerline
     yascroll

     ;; find search replace
     ag
     anzu
     color-moccur
     ctags
     ctags-update
     gtags
     migemo
     recentf-ext
     foreign-regexp
     wgrep
     wgrep-ag

     ;; programming
     quickrun
     dash-at-point
     projectile
     sql-indent

     ;; auto-complete
     auto-complete
     fuzzy
     popup
     yasnippet

     ;; flymake
     flymake ; セットアップ時には自動インストールされないので、手動でインストールすること
     flymake-easy

     ;; ruby
     bundler
     enh-ruby-mode
     ruby-compilation
     ruby-block
     ruby-tools
     rinari
     flymake-ruby
     inf-ruby
     rhtml-mode
     rspec-mode
     rbenv
     robe

     ;; javascript
     js2-mode
     flymake-jshint
     json-mode
     flymake-json
     skewer-mode

     ;; coffee
     coffee-mode
     flymake-coffee

     ;; php
     php-mode
     flymake-php

     ;; markup
     zencoding-mode
     flymake-css
     flymake-sass
     yaml-mode
     flymake-yaml

     ;; markdown
     markdown-mode
     markdown-mode+

     ;; common lisp
     slime

     ;; vcs(git)
     magit
     git-gutter
     git-gutter-fringe
     dsvn

     ;; github
     gh
     gist

     ;; helm
     helm
     helm-ag
     helm-c-yasnippet
     helm-descbinds
     helm-gtags
     helm-ls-git
     helm-migemo
     helm-projectile
     helm-rails
     helm-swoop

     ;; org
     org ; セットアップ時には自動インストールされないので、手動でインストールすること

     ;; theme
     solarized-theme
     ))

  ;; melpa.el
  (require 'melpa nil t))

;; init-loader
;; http://coderepos.org/share/browser/lang/elisp/init-loader/init-loader.el
;; デフォルトで"~/.emacs.d/inits"以下のファイルをロードする
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load)
