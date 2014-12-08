;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;; https://github.com/emacs-helm/helm
(when (and (require 'helm-config nil t)
           (require 'helm nil t))
  (helm-mode 1)
  (setq helm-idle-delay 0.3)
  (setq helm-input-idle-delay 0)
  (setq helm-candidate-number-limit 1000)

  (global-set-key (kbd "C-x f") 'helm-for-files)
  (global-set-key (kbd "C-c j") 'helm-bookmarks)
  (global-set-key [f11] 'helm-imenu)

  ;; 自動補完を無効
  ;; http://fukuyama.co/nonexpansion
  (custom-set-variables '(helm-ff-auto-update-initial-value nil))
  ;; C-hでバックスペースと同じように文字を削除
  (define-key helm-c-read-file-map (kbd "C-h") 'delete-backward-char)
  ;; TABで任意補完。選択肢が出てきたらC-nやC-pで上下移動してから決定することも可能
  (define-key helm-c-read-file-map (kbd "TAB") 'helm-execute-persistent-action)


  ;; https://github.com/syohex/emacs-helm-ag
  (when (require 'helm-ag nil t)
    (global-set-key (kbd "C-;") 'helm-ag)
    (global-set-key (kbd "C-,") 'helm-ag-pop-stack))

  ;; https://github.com/emacs-helm/helm-ls-git
  (when (require 'helm-ls-git nil t)
    (global-set-key (kbd "C-x t") 'helm-ls-git-ls))

  ;; https://github.com/bbatsov/projectile
  (when (require 'helm-projectile nil t)
    (global-set-key (kbd "C-x p") 'helm-projectile))

  ;; https://github.com/syohex/emacs-helm-gtags
  (when (require 'helm-gtags nil t)
    (custom-set-variables
     '(helm-gtags-path-style 'relative)
     '(helm-gtags-ignore-case t)
     '(helm-gtags-auto-update t))
    (global-set-key (kbd "M-t") 'helm-gtags-find-tag)
    (global-set-key (kbd "M-r") 'helm-gtags-find-rtag))

  (when (require 'helm-swoop nil t)
    ;; Change the keybinds to whatever you like :)
    (global-set-key (kbd "M-o") 'helm-swoop)
    (global-set-key (kbd "M-O") 'helm-swoop-back-to-last-point)
    (global-set-key (kbd "C-c M-o") 'helm-multi-swoop)
    (global-set-key (kbd "C-x M-o") 'helm-multi-swoop-all)

    ;; When doing isearch, hand the word over to helm-swoop
    (define-key isearch-mode-map (kbd "M-o") 'helm-swoop-from-isearch)
    ;; From helm-swoop to helm-multi-swoop-all
    (define-key helm-swoop-map (kbd "M-o") 'helm-multi-swoop-all-from-helm-swoop))


  ;; https://github.com/emacs-helm/helm-migemo
  (require 'helm-migemo nil t)



  ;; https://github.com/emacs-helm/helm-c-yasnippet
  (when (require 'helm-c-yasnippet nil t)
    (setq helm-c-yas-space-match-any-greedy t) ;スペース区切りで絞り込めるようにする
    (global-set-key (kbd "C-c y") 'helm-c-yas-complete))


  ;; https://github.com/emacs-helm/helm-descbinds
  (when (require 'helm-descbinds nil t)
    (helm-descbinds-mode 1)
    (global-set-key (kbd "<f12>") 'helm-descbinds))

  (global-set-key (kbd "M-y") 'helm-show-kill-ring))
