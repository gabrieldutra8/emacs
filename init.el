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

;; package manager

(require 'package)
(setq package-enable-at-startup nil) ; disable default package init

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))


(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(auto-complete which-key try use-package)))

;;------- end package manager -------
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
