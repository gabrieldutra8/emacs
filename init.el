;; changing cursor shape

(setq-default cursor-type 'bar)

;; syntax highlight

(setq font-lock-maximum-decoration t)

;; removing welcome message

(setq inhibit-startup-message t)

;; removing menu

(tool-bar-mode -1)
(menu-bar-mode -1)

;; removing scroll bar

(scroll-bar-mode -1)

;; lines

(global-display-line-numbers-mode t)

;; font size

(set-face-attribute 'default nil :height 150)

;; stop creating backup
(setq make-backup-files nil)

;; custom binds

(global-set-key (kbd "M-<tab>") 'other-window)
(global-set-key (kbd "M-<down>") 'enlarge-window)
(global-set-key (kbd "M-<up>") 'shrink-window)
(global-set-key (kbd "M-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<right>") 'shrink-window-horizontally)

;; package manager

(require 'package)
(setq package-enable-at-startup nil) ; disable default package init

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))


(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package ace-window
  :ensure t
  :bind (("C-x o" . ace-window)))

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)))

(use-package all-the-icons
  :ensure t)

(use-package neotree
  :ensure t
  :config
  (progn
    (setq neo-theme (if (display-graphic-p) 'icons 'arrow))))

(use-package gruvbox-theme
  :ensure t
  :config)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode t))

(use-package lsp-mode
  :commands lsp
  :ensure t
  :config (add-hook 'python-mode-hook #'lsp) )

(use-package go-mode
  :ensure t )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruvbox-dark-hard))
 '(custom-safe-themes
   '("d5fd482fcb0fe42e849caba275a01d4925e422963d1cd165565b31d3f4189c87" "5a0ddbd75929d24f5ef34944d78789c6c3421aa943c15218bac791c199fc897d" "8363207a952efb78e917230f5a4d3326b2916c63237c1f61d7e5fe07def8d378" default))
 '(package-selected-packages
   '(treesit-auto flycheck gruvbox-theme ace-window neotree auto-complete which-key try use-package)))

;;------- end package manager -------
;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; golang setup
(require 'lsp-mode)
(require 'go-mode)

(setq gofmt-command "goimports")

(add-hook 'go-mode-hook 'lsp-deferred)
(add-hook 'go-mode-hook 'subword-mode)
(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'go-mode-hook (lambda ()
                          (setq tab-width 4)
                          (flycheck-add-next-checker 'lsp 'go-vet)
                          (flycheck-add-next-checker 'lsp 'go-staticcheck)))

