;;  _      _ 
;; | |_ __| | Emacs `init.el`
;; | __/ _` | Date: 16/01/2023
;; | || (_| | Created by: Tanishq Daiya
;;  \__\__,_| Check license at https://github.com/tanishqdaiya/dotfiles

(setq inhibit-startup-screen t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)
(setq visible-bell t)
(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height 180)

(setq make-backup-files nil) ;; Backup files are disgusting, amiright or amiright?

(global-set-key (kbd "<escape>") 'keyboard-escape-quit) ;; Set escape to quit

;; Line numbers
(column-number-mode)
(global-display-line-numbers-mode t)
(setq display-line-numbers 'relative)
; don't display line numbers for these modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Formatting style
(setq-default tab-width 8)
(setq-default indent-tabs-mode t)
(setq c-default-style "linux")

;; Setting up package respositories
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))
;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; org-mode
(defun td/org-mode-setup ()
  (org-indent-mode)
  (visual-line-mode 1))

(use-package org
  :hook (org-mode . td/org-mode-setup)
  :config
  (setq org-ellipsis " ▾")
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)
  (setq org-agenda-files
        '("~/Desktop/org/Tasks.org"
          "~/Desktop/org/Habits.org"
          "~/Desktop/org/Birthdays.org"))
  )

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode))

;;; visual-fill-column
(defun td/org-mode-visual-fill ()
  (setq visual-fill-column-width 100)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . td/org-mode-visual-fill))

;; `vscode-dark-plus-theme`
;; (use-package vscode-dark-plus-theme
;;   :ensure t
  ;; :config
  ;; (load-theme 'vscode-dark-plus t)
  ;; ;; Remove the border around the TODO word on org-mode files
  ;; (setq vscode-dark-plus-box-org-todo nil)
  ;; ;; Do not set different heights for some org faces
  ;; (setq vscode-dark-plus-scale-org-faces nil)
  ;; ;; Avoid inverting hl-todo face
  ;; (setq vscode-dark-plus-invert-hl-todo nil)
  ;; ;; Configure current line highlighting style (works best with Emacs 28 or newer)
  ;; (setq vscode-dark-plus-render-line-highlight 'line))

;; `doom-themes`
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-ayu-dark t)
  (doom-themes-org-config))

;; `which-key`
(use-package which-key
  :init
  (which-key-mode)
  (add-hook 'c-mode-hook 'lsp)
  (add-hook 'c++-mode-hook 'lsp)
  
  :diminish (which-key-mode)
  :config
  (setq which-key-idle-delay 0.3))

;; `helpful`
(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

;; `all-the-icons`
;;;; NOTE: Run M-x all-the-icons-install-fonts when running the config for the first time
(use-package all-the-icons)

;; `ivy`
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
p	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil)) ;; Don't start searches with ^

(use-package flx ;; Improves sorting for fuzzy-matched results
  :defer t
  :init
  (setq ivy-flx-limit 10000))

(use-package smex ;; Adds M-x recent command sorting for counsel-M-x
  :defer 1
  :after counsel)

;; NOTE: Delete this before adding the file into your own configuration.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e" "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69" default))
 '(package-selected-packages
   '(vscode-dark-plus-theme doom-themes doom-modeline evil-collection smex flx counsel ivy-rich ivy evil general all-the-icons helpful visual-fill-column org-bullets which-key)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
