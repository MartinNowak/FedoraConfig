;; =============================================================================
;; OSX key rebindings
;; http://www.emacswiki.org/emacs/MetaKeyProblems
;; -----------------------------------------------------------------------------
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; =============================================================================
;; X11 clipboard compat
;; -----------------------------------------------------------------------------

(setq x-select-enable-clipboard t)

;; =============================================================================
;; add load path for custom scripts
;; -----------------------------------------------------------------------------

(add-to-list 'load-path "~/.emacs.d/site-lisp/")

;; =============================================================================
;; windmove - window navigation
;; -----------------------------------------------------------------------------

(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;; =============================================================================
;; backup settings
;; -----------------------------------------------------------------------------

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

;; =============================================================================
;; C-Indentation inherited by d-mode
;; -----------------------------------------------------------------------------

(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(c-set-offset 'substatement-open 0)
(c-set-offset 'arglist-intro 4)
(c-set-offset 'arglist-close 0)

;; =============================================================================
;; red blocks for trailing whitespace
;; -----------------------------------------------------------------------------

(setq-default show-trailing-whitespace t)

;; =============================================================================
;; show cursor column pos
;; -----------------------------------------------------------------------------

(setq-default column-number-mode t)

;; =============================================================================
;; d-mode
;; https://github.com/Emacs-D-Mode-Maintainers/Emacs-D-Mode
;; -----------------------------------------------------------------------------

(autoload 'd-mode "d-mode" "Major mode for editing D code." t)
(add-to-list 'auto-mode-alist '("\\.d[i]?$" . d-mode))
(add-to-list 'auto-mode-alist '("\\.mixin$\\'" . d-mode))

;; =============================================================================
;; lua-mode
;; https://github.com/immerrr/lua-mode/
;; -----------------------------------------------------------------------------

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;;;; =============================================================================
;;;; haskell-mode
;;;; -----------------------------------------------------------------------------
;;
;;(load "/usr/local/share/emacs/site-lisp/haskell-mode/haskell-site-file")
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;;;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-font-lock)

;; Note that the three indentation modules are mutually exclusive - add at most one.

;; =============================================================================
;; https://github.com/brianc/jade-mode
;; diet templates

(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.dt\\'" . jade-mode))

;; =============================================================================
;; http://jblevins.org/projects/markdown-mode/
;; markdown-mode

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; =============================================================================
;; graphviz-dot-mode
;; http://www.graphviz.org/Misc/graphviz-dot-mode.el
;; -----------------------------------------------------------------------------

(autoload 'graphviz-dot-mode "graphviz-dot-mode" "Major mode for editing graphviz dot files." t)
(add-to-list 'auto-mode-alist '("\\.dot$" . graphviz-dot-mode))

;; =============================================================================
;; InteractivelyDoThings
;; -----------------------------------------------------------------------------

(require 'ido)
(ido-mode t)
;;(setq ido-enable-flex-matching t)

;; =============================================================================
;; Egg (Emacs got git)
;; https://github.com/byplayer/egg
;; -----------------------------------------------------------------------------

(require 'egg)

;; =============================================================================
;; Spell checking
;; -----------------------------------------------------------------------------

(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(add-hook 'c-mode-common-hook 'flyspell-prog-mode)

;; =============================================================================
;; gdb-mi
;; -----------------------------------------------------------------------------

;; (require 'gdb-mi)

;; =============================================================================
;; http://snarfed.org/gnu_emacs_backup_files
;; -----------------------------------------------------------------------------

;; Put autosave files (ie #foo#) in one place, *not*
;; scattered all over the file system!
(defvar autosave-dir
 (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))

(make-directory autosave-dir t)

(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defun make-auto-save-file-name ()
  (concat autosave-dir
   (if buffer-file-name
      (concat "#" (file-name-nondirectory buffer-file-name) "#")
    (expand-file-name
     (concat "#%" (buffer-name) "#")))))

;; Put backup files (ie foo~) in one place too. (The backup-directory-alist
;; list contains regexp=>directory mappings; filenames matching a regexp are
;; backed up in the corresponding directory. Emacs will mkdir it if necessary.)
(defvar backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))
(setq backup-directory-alist (list (cons "." backup-dir)))

;; =============================================================================
;; font
;; -----------------------------------------------------------------------------

(set-face-attribute 'default nil :font "DejaVu Sans-10")

;; =============================================================================
;; auto-start server for emacsclient
;; -----------------------------------------------------------------------------

(server-start)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(egg-enable-tooltip t))
