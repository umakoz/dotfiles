;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(require 'color-moccur)

;; http://www.bookshelf.jp/cgi-bin/goto.cgi?file=meadow&node=exampleelisp+color-moccur
(require 'moccur-edit)

(setq moccur-split-word t
      moccur-use-migemo t
      color-moccur-default-ime-status nil)

(setq *moccur-buffer-name-exclusion-list*
      '(".+TAGS.+" "*Completions*" "*Messages*"
        "newsrc.eld"
        " *migemo*" ".bbdb"))

; Subversion、git、Mercurial関連のファイルをgrep対象外とする
(setq dmoccur-exclusion-mask
      (append '("\\~$" "\\.svn\\/\*" "\\.git\\/\*" "\\.hg\\/\*") dmoccur-exclusion-mask))

(add-hook 'dired-mode-hook
          '(lambda ()
             (local-set-key "O" 'dired-do-moccur)))

(define-key Buffer-menu-mode-map "O" 'Buffer-menu-moccur)

;;(global-set-key "\M-f" 'grep-buffers)
;;(global-set-key (kbd "C-x g") 'moccur-grep-find)
;;(global-set-key "\C-c\C-o" 'search-buffers)
