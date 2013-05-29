;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;; INSTALL
;; (install-elisp "https://github.com/imakado/emacs-smartchr/raw/master/smartchr.el")
(when (require 'smartchr nil t)
  (defun smartchr-common-keybindings ()
    (local-set-key (kbd "=") (smartchr '("=" " = " " == " " === ")))
    (local-set-key (kbd "!") (smartchr '("!" " != " " !== ")))
    (local-set-key (kbd "+") (smartchr '("+" "++" " + " " += ")))
    (local-set-key (kbd "-") (smartchr '("-" "--" "->" " - " " -= ")))
    ;; !! がカーソルの位置
    (local-set-key (kbd "(") (smartchr '("(`!!')" "(")))
    (local-set-key (kbd "[") (smartchr '("[`!!']" "[")))
    (local-set-key (kbd "{") (smartchr '("{`!!'}" "{")))
    (local-set-key (kbd "`") (smartchr '("\``!!'`" "\`")))
    (local-set-key (kbd "\"") (smartchr '("\"`!!'\"" "\"")))
    (local-set-key (kbd "'") (smartchr '("'`!!''" "'")))
    (local-set-key (kbd ">") (smartchr '(">" " => " " => '`!!''" " => \"`!!'\""))))

  (add-hook 'c-mode-common-hook 'smartchr-common-keybindings)
  (add-hook 'js2-mode-hook 'smartchr-common-keybindings)
  (add-hook 'sql-mode-hook 'smartchr-common-keybindings))
