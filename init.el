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
