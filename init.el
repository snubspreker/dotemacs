(if (fboundp 'menu-bar-mode)
    (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

(load-theme 'wombat)

(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-complete-lisp-symbol-partially
	try-complete-lisp-symbol
	try-complete-file-name-partially
	try-complete-file-name
	try-expand-all-abbrevs
	try-expand-list
	try-expand-line
	))

(global-set-key (kbd "M-/") #'hippie-expand)

(setq viper-mode t)
(require 'viper)

(add-to-list 'viper-vi-state-mode-list 'help-mode)
(add-hook 'help-mode-hook (lambda () (setq viper-mode t)))

;; some extra movement
(define-key viper-vi-global-user-map (kbd "gg") #'beginning-of-buffer)
(define-key viper-vi-global-user-map (kbd "ge") #'end-of-buffer)
(define-key viper-vi-global-user-map (kbd "gb") #'ido-switch-buffer)
(define-key viper-vi-global-user-map (kbd "go") #'other-window)
(define-key viper-vi-global-user-map (kbd "g1") #'delete-other-windows)
(define-key viper-vi-global-user-map (kbd "g2") #'split-window-below)
(define-key viper-vi-global-user-map (kbd "g3") #'split-window-right)
(define-key viper-vi-global-user-map (kbd "gl") #'goto-line)
(define-key viper-vi-global-user-map (kbd "gw") #'eww)
(define-key viper-vi-global-user-map (kbd "gk") #'ido-kill-buffer)
(define-key viper-vi-kbd-map (kbd "/") #'isearch-forward)

(setq-default cursor-type 'bar)           ; Line-style cursor similar to other text editors
(setq inhibit-startup-screen t)           ; Disable startup screen
(setq initial-scratch-message "")         ; Make *scratch* buffer blank
(setq-default frame-title-format '("%b")) ; Make window title the buffer name
(setq ring-bell-function 'ignore)         ; Disable bell sound
(setq linum-format "%4d ")                ; Line number format
(setq x-select-enable-clipboard t)
(setq x-select-enable-primary t)
(setq global-hl-line-mode t)
(setq browse-url-browser-function 'eww-browse-url)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-use-filename-at-point 'guess)
(setq ido-use-url-at-point t)
(setq ido-create-new-buffer 'always)
(setq ido-file-extensions-order '(".org" ".txt" ".el"))
(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)
(setq dired-dwim-target t)
(setq woman-use-own-frame nil)
(setq woman-use-topic-at-point t)
(setq-default tab-always-indent 'complete)

(fset 'yes-or-no-p 'y-or-n-p)             ; y-or-n-p makes answering questions faster
(show-paren-mode 1)                       ; Show closing parens by default
(global-display-line-numbers-mode)
(delete-selection-mode 1)                 ; Selected text will be overwritten when you start typing
(global-auto-revert-mode t)               ; Auto-update buffer if file has changed on disk

(column-number-mode t)
(global-prettify-symbols-mode t)

(ido-mode 1)

(defalias 'list-buffers 'ibuffer)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

(global-set-key (kbd "M-;") #'comment-line)
(global-set-key (kbd "C-x C-;") #'comment-box)

(electric-pair-mode t)
(electric-indent-mode t)

(require 'icomplete)
(icomplete-mode t)
(setq icomplete-in-buffer t)

(define-key icomplete-minibuffer-map (kbd "M-n") 'icomplete-forward-completions)
(define-key icomplete-minibuffer-map (kbd "M-p") 'icomplete-backward-completions)

(require 'org)
(setq org-hide-emphasis-markers t)

(let* ((variable-tuple
	(cond ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
	      ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
	      ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
	      ((x-list-fonts "Verdana")         '(:font "Verdana"))
	      ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
	      (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
       (base-font-color     (face-foreground 'default nil 'default))
       (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

  (custom-theme-set-faces
   'user
   `(org-level-8 ((t (,@headline ,@variable-tuple))))
   `(org-level-7 ((t (,@headline ,@variable-tuple))))
   `(org-level-6 ((t (,@headline ,@variable-tuple))))
   `(org-level-5 ((t (,@headline ,@variable-tuple))))
   `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
   `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
   `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
   `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
	   `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))

  (custom-theme-set-faces
   'user
   '(variable-pitch ((t (:family "DejaVu Sans" :height 180 :weight thin))))
   '(fixed-pitch ((t ( :family "Fira Code Retina" :height 160)))))

(define-key flymake-mode-map (kbd "M-n") 'flymake-goto-next-error)
(define-key flymake-mode-map (kbd "M-p") 'flymake-goto-prev-error)
