;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when(require 'projectile nil t)
  (projectile-global-mode)
  (setq projectile-project-root-files
        '(".projectile" ; projectile project marker
          "Gemfile" ; Bundler file
          "package.json" ; npm package file
          "cpanfile" ; CPAN dependencies for Perl applications
          ".git" ; Git VCS root dir
          )))
