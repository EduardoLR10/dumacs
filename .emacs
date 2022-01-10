;; Load master config file
(org-babel-load-file "~/.emacs.d/config/emacs-config.org")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(brogrammer))
 '(package-selected-packages '(use-package)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)

;; Ligatures in Windows
(use-package ligature
  :load-path "C:Users/dudul/AppData/Roaming/.emacs.d/elisp/ligature/"
  :config
  ;; Enable the "www" ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable traditional ligature support in eww-mode, if the
  ;; `variable-pitch' face supports it
  (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  ;; Enable all Cascadia Code ligatures in programming modes
  (ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
                                       ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
                                       "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
                                       "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
                                       "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
                                       "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
                                       "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
                                       "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
                                       ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
                                       "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
                                       "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
                                       "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
                                       "\\\\" "://"))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))

;; Focus/Window Management
(windmove-default-keybindings)
(global-set-key (kbd "<C-S-left>") 'windmove-swap-states-left)
(global-set-key (kbd "<C-S-right>") 'windmove-swap-states-right)
(global-set-key (kbd "<C-S-up>") 'windmove-swap-states-up)
(global-set-key (kbd "<C-S-down>") 'windmove-swap-states-down)

;; Keycast
(use-package keycast
  :init
  (add-to-list 'global-mode-string '("" mode-line-keycast "  "))
  (keycast-mode))

(require 'moody)
(setq keycast-window-predicate 'moody-window-active-p)

(dolist (input '(self-insert-command
                   org-self-insert-command))
  (add-to-list 'keycast-substitute-alist `(,input "." "Typing…")))

(dolist (event '(mouse-event-p
                 mouse-movement-p
                 mwheel-scroll))
  (add-to-list 'keycast-substitute-alist `(,event nil)))

;; Eshell always in another window
(setq display-buffer-alist '(("\\`\\*e?eshell" display-buffer-pop-up-window)))

;; Start up Configuration
(add-hook 'emacs-startup-hook (lambda () (other-window 2)))
(add-hook 'emacs-startup-hook (lambda () (eshell)))
(add-hook 'emacs-startup-hook (lambda () (treemacs)))
(split-window-right)

;; Initial Message
(setq initial-scratch-message ";; Happy hacking, Du. Have a nice coding session!\n\n")

