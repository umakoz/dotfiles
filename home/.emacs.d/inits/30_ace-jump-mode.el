;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(autoload 'ace-jump-mode "ace-jump-mode" "Emacs quick move minor mode" t)

;; (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(defun add-keys-to-ace-jump-mode (prefix c &optional mode)
  (define-key global-map
    (read-kbd-macro (concat prefix (string c)))
    `(lambda ()
       (interactive)
       (funcall (if (eq ',mode 'word)
                    #'ace-jump-word-mode
                  #'ace-jump-char-mode) ,c))))

(loop for c from ?0 to ?9 do (add-keys-to-ace-jump-mode "H-" c))
(loop for c from ?a to ?z do (add-keys-to-ace-jump-mode "H-" c))
(loop for c from ?! to ?~ do (add-keys-to-ace-jump-mode "H-" c))
;; (loop for c from ?0 to ?9 do (add-keys-to-ace-jump-mode "H-M-" c 'word))
;; (loop for c from ?a to ?z do (add-keys-to-ace-jump-mode "H-M-" c 'word))
;; (loop for c from ?! to ?~ do (add-keys-to-ace-jump-mode "H-M-" c 'word))

(when (require 'ace-isearch nil t)
  (global-ace-isearch-mode +1))

(when (require 'ace-window nil t)
  (global-set-key (kbd "C-x o") 'ace-window)
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))
