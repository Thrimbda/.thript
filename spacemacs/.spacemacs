;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; Checkers
     spell-checking
     syntax-checking
     ;; ----------------------------------------------------------------
     ;; Completion
     auto-completion
     helm
     ;; ----------------------------------------------------------------
     ;; E-mails
     ;; gnus
     ;; ----------------------------------------------------------------
     ;; Emacs
     (org :variables
          org-enable-github-support t
          org-enable-reveal-js-support t)
     ;; ----------------------------------------------------------------
     ;; File tree
     (treemacs :variables treemacs-use-all-the-icons-theme t)
     ;; ----------------------------------------------------------------
     ;; Fun
     ;; xkcd
     ;; ----------------------------------------------------------------
     ;; MISC
     (chinese :variables)
     ;; ----------------------------------------------------------------
     ;; Programming Languages
     emacs-lisp
     (go :variables
         go-backend 'lsp
         go-tab-width 4
         go-use-golangci-lint t
         go-format-before-save t)
     javascript
     lua
     markdown
     (python :variables
             python-backend 'lsp
             python-lsp-server 'pyright
             python-formatter 'yapf
             python-sort-imports-on-save t)
     (scala)
     (yaml :variables yaml-enable-lsp t)
     ;; ----------------------------------------------------------------
     ;; Readers
     epub
     ;; ----------------------------------------------------------------
     ;; Source control
     git
     ;; ----------------------------------------------------------------
     ;; Tools
     debug
     finance
     lsp
     (shell :variables shell-default-shell 'vterm)
     ;; ----------------------------------------------------------------
     )


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      ob-ammonite
                                      ammonite-term-repl)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(vi-tilde-fringe)

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         spacemacs-dark
                         spacemacs-light
                         leuven
                         )

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(
                                  ;; doom
                                  spacemacs :separator bar :separator-scale 1.5
                                 )

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '(("FiraCode Nerd Font"
                                :size 12.0
                                :weight normal
                                :width normal)
                               ("Fira Code Symbol"
                                :weight normal
                                :width normal)
                               )

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers 'visual

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir "~/.emacs.d/server"

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%a - %t - BECAUSE I'M A POTATO."

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfer with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()

  ;; ammonite
  (setq ammonite-term-repl-auto-detect-predef-file nil)

  ;; ledger
  (setq ledger-post-amount-alignment-column 72)

  ;; Chinese char
  (spacemacs//set-monospaced-font "FiraCode Nerd Font" "Hiragino Sans GB" 12 14)

  ;; evil related
  (evil-ex-define-cmd "q" 'kill-this-buffer)

  ;; org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(;; other Babel languages
     (emacs-lisp . t)
     (ledger . t)
     (python . t)
     (ammonite . t)
     (shell . t)))

  (setq org-agenda-files '("~/OneDrive/cone"))
  (setq org-export-backends '(ascii html icalendar latex md odt))
  (setq org-todo-keyword-faces '(("TODO" . "red")
                                 ("NEXT" . "blue")
                                 ("DONE" . "forest green")
                                 ("WAITING" . "orange")
                                 ("HOLD" . "magenta")
                                 ("CANCELLED" . "forest green")
                                 ("MEETING" . "forest green")
                                 ("PHONE" . "forest green")))
  (setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
                            (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLD(c@/!)" "PHONE" "MEETING")))
  (setq org-todo-state-tags-triggers '(("CANCELLED"
                                        ("CANCELLED" . t))
                                       ("WAITING"
                                        ("WAITING" . t))
                                       ("HOLD"
                                        ("WAITING")
                                        ("HOLD" . t))
                                       (done
                                        ("WAITING")
                                        ("HOLD"))
                                       ("TODO"
                                        ("WAITING")
                                        ("CANCELLED")
                                        ("HOLD"))
                                       ("NEXT"
                                        ("WAITING")
                                        ("CANCELLED")
                                        ("HOLD"))
                                       ("DONE"
                                        ("WAITING")
                                        ("CANCELLED")
                                        ("HOLD"))))

  (setq org-directory "~/OneDrive/cone")
  (setq org-default-notes-file "~/OneDrive/cone/refile.org")

  (setq org-capture-templates
        '(("t" "todo" entry (file "~/OneDrive/cone/refile.org")
           "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
          ("r" "respond" entry (file "~/OneDrive/cone/refile.org")
           "* NEXT Respond to %:from on %:subject\n SCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
          ("n" "note" entry (file "~/OneDrive/cone/refile.org")
           "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
          ("j" "Journal" entry (file+datetree "~/OneDrive/cone/diary.org")
           "* %?\n%U\n" :clock-in t :clock-resume t)
          ("w" "org-protocol" entry (file "~/OneDrive/cone/refile.org")
           "* TODO Review %c\n%U\n" :immediate-finish t)
          ("m" "Meeting" entry (file "~/OneDrive/cone/refile.org")
           "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
          ("p" "Phone call" entry (file "~/OneDrive/cone/refile.org")
           "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
          ("h" "Habit" entry (file "~/OneDrive/cone/refile.org")
           "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n")))

  ; Targets include this file
  (setq org-refile-targets '((nil :maxlevel . 9)
                             (org-agenda-files :maxlevel . 9)))

  (setq org-refile-use-outline-path 'file)

  (setq org-outline-path-complete-in-steps nil)

  (setq org-refile-allow-creating-parent-nodes 'comfirm)

  (setq org-indirect-buffer-display 'current-window)

  (setq org-refile-target-verify-function 'bh/verify-refile-target)

  (setq org-agenda-dim-blocked-tasks nil)
  (setq org-agenda-compact-blocks t)

  ;; Custom agenda command definitions
  ;; (setq org-agenda-custom-commands
  ;;       (quote (("N" "Notes" tags "NOTE"
  ;;                ((org-agenda-overriding-header "Notes")
  ;;                 (org-tags-match-list-sublevels t)))
  ;;               ("h" "Habits" tags-todo "STYLE=\"habit\""
  ;;                ((org-agenda-overriding-header "Habits")
  ;;                 (org-agenda-sorting-strategy
  ;;                  '(todo-state-down effort-up category-keep))))
  ;;               (" " "Agenda"
  ;;                ((agenda "" nil)
  ;;                 (tags "REFILE"
  ;;                       ((org-agenda-overriding-header "Tasks to Refile")
  ;;                        (org-tags-match-list-sublevels nil)))
  ;;                 (tags-todo "-CANCELLED/!"
  ;;                            ((org-agenda-overriding-header "Stuck Projects")
  ;;                             (org-agenda-skip-function 'bh/skip-non-stuck-projects)
  ;;                             (org-agenda-sorting-strategy
  ;;                              '(category-keep))))
  ;;                 (tags-todo "-HOLD-CANCELLED/!"
  ;;                            ((org-agenda-overriding-header "Projects")
  ;;                             (org-agenda-skip-function 'bh/skip-non-projects)
  ;;                             (org-tags-match-list-sublevels 'indented)
  ;;                             (org-agenda-sorting-strategy
  ;;                              '(category-keep))))
  ;;                 (tags-todo "-CANCELLED/!NEXT"
  ;;                            ((org-agenda-overriding-header (concat "Project Next Tasks"
  ;;                                                                   (if bh/hide-scheduled-and-waiting-next-tasks
  ;;                                                                       ""
  ;;                                                                     " (including WAITING and SCHEDULED tasks)")))
  ;;                             (org-agenda-skip-function 'bh/skip-projects-and-habits-and-single-tasks)
  ;;                             (org-tags-match-list-sublevels t)
  ;;                             (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
  ;;                             (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
  ;;                             (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
  ;;                             (org-agenda-sorting-strategy
  ;;                              '(todo-state-down effort-up category-keep))))
  ;;                 (tags-todo "-REFILE-CANCELLED-WAITING-HOLD/!"
  ;;                            ((org-agenda-overriding-header (concat "Project Subtasks"
  ;;                                                                   (if bh/hide-scheduled-and-waiting-next-tasks
  ;;                                                                       ""
  ;;                                                                     " (including WAITING and SCHEDULED tasks)")))
  ;;                             (org-agenda-skip-function 'bh/skip-non-project-tasks)
  ;;                             (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
  ;;                             (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
  ;;                             (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
  ;;                             (org-agenda-sorting-strategy
  ;;                              '(category-keep))))
  ;;                 (tags-todo "-REFILE-CANCELLED-WAITING-HOLD/!"
  ;;                            ((org-agenda-overriding-header (concat "Standalone Tasks"
  ;;                                                                   (if bh/hide-scheduled-and-waiting-next-tasks
  ;;                                                                       ""
  ;;                                                                     " (including WAITING and SCHEDULED tasks)")))
  ;;                             (org-agenda-skip-function 'bh/skip-project-tasks)
  ;;                             (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
  ;;                             (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
  ;;                             (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
  ;;                             (org-agenda-sorting-strategy
  ;;                              '(category-keep))))
  ;;                 (tags-todo "-CANCELLED+WAITING|HOLD/!"
  ;;                            ((org-agenda-overriding-header (concat "Waiting and Postponed Tasks"
  ;;                                                                   (if bh/hide-scheduled-and-waiting-next-tasks
  ;;                                                                       ""
  ;;                                                                     " (including WAITING and SCHEDULED tasks)")))
  ;;                             (org-agenda-skip-function 'bh/skip-non-tasks)
  ;;                             (org-tags-match-list-sublevels nil)
  ;;                             (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
  ;;                             (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)))
  ;;                 (tags "-REFILE/"
  ;;                       ((org-agenda-overriding-header "Tasks to Archive")
  ;;                        (org-agenda-skip-function 'bh/skip-non-archivable-tasks)
  ;;                        (org-tags-match-list-sublevels nil))))
  ;;                nil))))
  (spacemacs/set-leader-keys "oh" 'helm-org-agenda-files-headings)
  (spacemacs/set-leader-keys "oi" 'bh/punch-in)
  (spacemacs/set-leader-keys "oo" 'bh/punch-out)
  (spacemacs/set-leader-keys "oc" 'bh/clock-in-last-task)

  (defun bh/verify-refile-target ()
    "Exclude todo keywords with a done state from refile targets"
    (not (member (nth 2 (org-heading-components)) org-done-keywords)))

  (defun bh/remove-empty-darwer-on-clock-out ()
    (interactive)
    (save-excursion
      (beginning-of-line 0)
      (org-remove-empty-drawer-at (point))))

  (add-hook 'org-clock-out-hook 'bh/remove-empty-darwer-on-clock-out 'append)

  ;; org line width
  (add-hook 'org-mode-hook '(lambda () (setq fill-column 72)))
  (add-hook 'org-mode-hook 'turn-on-auto-fill)

  ;; org clock settings
  (org-clock-persistence-insinuate)
  (setq org-clock-history-length 23)
  (setq org-clock-in-resume t)
  (setq org-clock-in-switch-to-state 'bh/clock-in-to-next)
  (setq org-drawers '("PROPERTIES" "LOGBOOK"))
  (setq org-clock-into-drawer t)
  (setq org-clock-out-remove-zero-time-clocks t)
  (setq org-clock-out-when-done t)
  (setq org-clock-persist t)
  (setq org-clock-persist-query-resume nil)
  (setq org-clock-auto-clock-resolution 'when-no-clock-is-running)
  (setq org-clock-report-include-clocking-task t)
  (setq bh/keep-clock-running nil)

  (defun bh/clock-in-to-next (kw)
    "Switch a task from TODO to NEXT when clocking in.
Skips capture tasks, projects, and subprojects.
Switch projects and subprojects from NEXT back to TODO"
    (when (not (and (boundp 'org-capture-mode) org-capture-mode))
      (cond
       ((and (member (org-get-todo-state) (list "TODO"))
             (bh/is-task-p))
        "NEXT")
       ((and (member (org-get-todo-state) (list "NEXT"))
             (bh/is-project-p))
        "TODO"))))


  (defun bh/find-project-task ()
    "Move point to the parent (project) task if any"
    (save-restriction
      (widen)
      (let ((parent-task (save-excursion (org-back-to-heading 'invisible-ok) (point))))
        (while (org-up-heading-safe)
          (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
            (setq parent-task (point))))
        (goto-char parent-task)
        parent-task)))

  (defun bh/punch-in (arg)
    "Start continuous clocking and set the default task to the
  selected task.  If no task is selected set the Organization task
  as the default task."
    (interactive "p")
    (setq bh/keep-clock-running t)
    (if (equal major-mode 'org-agenda-mode)
        ;;
        ;; We're in the agenda
        ;;
        (let* ((marker (org-get-at-bol 'org-hd-marker))
              (tags (org-with-point-at marker (org-get-tags-at))))
          (if (and (eq arg 4) tags)
              (org-agenda-clock-in '(16))
            (bh/clock-in-organization-task-as-default)))
      ;;
      ;; We are not in the agenda
      ;;
      (save-restriction
        (widen)
        ; Find the tags on the current task
        (if (and (equal major-mode 'org-mode) (not (org-before-first-heading-p)) (eq arg 4))
            (org-clock-in '(16))
          (bh/clock-in-organization-task-as-default)))))

  (defun bh/punch-out ()
    (interactive)
    (setq bh/keep-clock-running nil)
    (when (org-clock-is-active)
      (org-clock-out))
    (org-agenda-remove-restriction-lock))

  (defun bh/clock-in-default-task ()
    (save-excursion
      (org-with-point-at org-clock-default-task
        (org-clock-in))))

  (defun bh/clock-in-parent-task ()
    "Move point to the parent (project) task if any and clock in"
    (let ((parent-task))
      (save-excursion
        (save-restriction
          (widen)
          (while (and (not parent-task) (org-up-heading-safe))
            (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
              (setq parent-task (point))))
          (if parent-task
              (org-with-point-at parent-task
                (org-clock-in))
            (when bh/keep-clock-running
              (bh/clock-in-default-task)))))))

  (defvar bh/organization-task-id "3CA66213-50ED-48B9-8E24-310B0959DA75")

  (defun bh/clock-in-organization-task-as-default ()
    (interactive)
    (org-with-point-at (org-id-find bh/organization-task-id 'marker)
      (org-clock-in '(16))))

  (defun bh/clock-out-maybe ()
    (when (and bh/keep-clock-running
              (not org-clock-clocking-in)
              (marker-buffer org-clock-default-task)
              (not org-clock-resolving-clocks-due-to-idleness))
      (bh/clock-in-parent-task)))

  (add-hook 'org-clock-out-hook 'bh/clock-out-maybe 'append)

  (defun bh/clock-in-task-by-id (id)
    "Clock in a task by id"
    (org-with-point-at (org-id-find id 'marker)
      (org-clock-in nil)))

  (defun bh/clock-in-last-task (arg)
    "Clock in the interrupted task if there is one
Skip the default task and get the next one.
A prefix arg forces clock in of the default task."
    (interactive "p")
    (let ((clock-in-to-task
           (cond
            ((eq arg 4) org-clock-default-task)
            ((and (org-clock-is-active)
                  (equal org-clock-default-task (cadr org-clock-history)))
             (caddr org-clock-history))
            ((org-clock-is-active) (cadr org-clock-history))
            ((equal org-clock-default-task (car org-clock-history)) (cadr org-clock-history))
            (t (car org-clock-history)))))
      (widen)
      (org-with-point-at clock-in-to-task
        (org-clock-in nil))))

  ;; org tags
  (setq org-tag-alist '((:startgroup)
                        ("@errand" . ?e)
                        ("@office" . ?o)
                        ("@home" . ?H)
                        ("@farm" . ?f)
                        (:endgroup)
                        ("WAITING" . ?w)
                        ("HOLD" . ?h)
                        ("PERSONAL" . ?P)
                        ("WORK" . ?W)
                        ("FARM" . ?F)
                        ("ORG" . ?O)
                        ("BYTEDANCE" . ?N)
                        ("crypt" . ?E)
                        ("NOTE" . ?n)
                        ("CANCELLED" . ?c)
                        ("FLAGGED" . ??)))
  (setq org-fast-tag-selection-single-key  'expert)
  (setq org-agenda-tags-todo-honor-ignore-options t)

  ;; org project
  (setq org-agenda-span 'day)
  (setq org-stuck-projects (quote ("" nil nil "")))

  (defun bh/is-project-p ()
    "Any task with a todo keyword subtask"
    (save-restriction
      (widen)
      (let ((has-subtask)
            (subtree-end (save-excursion (org-end-of-subtree t)))
            (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
        (save-excursion
          (forward-line 1)
          (while (and (not has-subtask)
                      (< (point) subtree-end)
                      (re-search-forward "^\*+ " subtree-end t))
            (when (member (org-get-todo-state) org-todo-keywords-1)
              (setq has-subtask t))))
        (and is-a-task has-subtask))))

  (defun bh/is-project-subtree-p ()
    "Any task with a todo keyword that is in a project subtree.
    Callers of this function already widen the buffer view."
    (let ((task (save-excursion (org-back-to-heading 'invisible-ok)
                                (point))))
      (save-excursion
        (bh/find-project-task)
        (if (equal (point) task)
            nil
          t))))

  (defun bh/is-task-p ()
    "Any task with a todo keyword and no subtask"
    (save-restriction
      (widen)
      (let ((has-subtask)
            (subtree-end (save-excursion (org-end-of-subtree t)))
            (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
        (save-excursion
          (forward-line 1)
          (while (and (not has-subtask)
                      (< (point) subtree-end)
                      (re-search-forward "^\*+ " subtree-end t))
            (when (member (org-get-todo-state) org-todo-keywords-1)
              (setq has-subtask t))))
        (and is-a-task (not has-subtask)))))

  (defun bh/is-subproject-p ()
    "Any task which is a subtask of another project"
    (let ((is-subproject)
          (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
      (save-excursion
        (while (and (not is-subproject) (org-up-heading-safe))
          (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
            (setq is-subproject t))))
      (and is-a-task is-subproject)))

  (defun bh/list-sublevels-for-projects-indented ()
    "Set org-tags-match-list-sublevels so when restricted to a subtree we list all subtasks.
      This is normally used by skipping functions where this variable is already local to the agenda."
    (if (marker-buffer org-agenda-restrict-begin)
        (setq org-tags-match-list-sublevels 'indented)
      (setq org-tags-match-list-sublevels nil))
    nil)

  (defun bh/list-sublevels-for-projects ()
    "Set org-tags-match-list-sublevels so when restricted to a subtree we list all subtasks.
      This is normally used by skipping functions where this variable is already local to the agenda."
    (if (marker-buffer org-agenda-restrict-begin)
        (setq org-tags-match-list-sublevels t)
      (setq org-tags-match-list-sublevels nil))
    nil)

  (defvar bh/hide-scheduled-and-waiting-next-tasks t)

  (defun bh/toggle-next-task-display ()
    (interactive)
    (setq bh/hide-scheduled-and-waiting-next-tasks (not bh/hide-scheduled-and-waiting-next-tasks))
    (when  (equal major-mode 'org-agenda-mode)
      (org-agenda-redo))
    (message "%s WAITING and SCHEDULED NEXT Tasks" (if bh/hide-scheduled-and-waiting-next-tasks "Hide" "Show")))

  (defun bh/skip-stuck-projects ()
    "Skip trees that are not stuck projects"
    (save-restriction
      (widen)
      (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
        (if (bh/is-project-p)
            (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
                   (has-next ))
              (save-excursion
                (forward-line 1)
                (while (and (not has-next) (< (point) subtree-end) (re-search-forward "^\\*+ NEXT " subtree-end t))
                  (unless (member "WAITING" (org-get-tags-at))
                    (setq has-next t))))
              (if has-next
                  nil
                next-headline)) ; a stuck project, has subtasks but no next task
          nil))))

  (defun bh/skip-non-stuck-projects ()
    "Skip trees that are not stuck projects"
    ;; (bh/list-sublevels-for-projects-indented)
    (save-restriction
      (widen)
      (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
        (if (bh/is-project-p)
            (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
                   (has-next ))
              (save-excursion
                (forward-line 1)
                (while (and (not has-next) (< (point) subtree-end) (re-search-forward "^\\*+ NEXT " subtree-end t))
                  (unless (member "WAITING" (org-get-tags-at))
                    (setq has-next t))))
              (if has-next
                  next-headline
                nil)) ; a stuck project, has subtasks but no next task
          next-headline))))

  (defun bh/skip-non-projects ()
    "Skip trees that are not projects"
    ;; (bh/list-sublevels-for-projects-indented)
    (if (save-excursion (bh/skip-non-stuck-projects))
        (save-restriction
          (widen)
          (let ((subtree-end (save-excursion (org-end-of-subtree t))))
            (cond
             ((bh/is-project-p)
              nil)
             ((and (bh/is-project-subtree-p) (not (bh/is-task-p)))
              nil)
             (t
              subtree-end))))
      (save-excursion (org-end-of-subtree t))))

  (defun bh/skip-non-tasks ()
    "Show non-project tasks.
    Skip project and sub-project tasks, habits, and project related tasks."
    (save-restriction
      (widen)
      (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
        (cond
         ((bh/is-task-p)
          nil)
         (t
          next-headline)))))

  (defun bh/skip-project-trees-and-habits ()
    "Skip trees that are projects"
    (save-restriction
      (widen)
      (let ((subtree-end (save-excursion (org-end-of-subtree t))))
        (cond
         ((bh/is-project-p)
          subtree-end)
         ((org-is-habit-p)
          subtree-end)
         (t
          nil)))))

  (defun bh/skip-projects-and-habits-and-single-tasks ()
    "Skip trees that are projects, tasks that are habits, single non-project tasks"
    (save-restriction
      (widen)
      (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
        (cond
         ((org-is-habit-p)
          next-headline)
         ((and bh/hide-scheduled-and-waiting-next-tasks
               (member "WAITING" (org-get-tags-at)))
          next-headline)
         ((bh/is-project-p)
          next-headline)
         ((and (bh/is-task-p) (not (bh/is-project-subtree-p)))
          next-headline)
         (t
          nil)))))

  (defun bh/skip-project-tasks-maybe ()
    "Show tasks related to the current restriction.
    When restricted to a project, skip project and sub project tasks, habits, NEXT tasks, and loose tasks.
    When not restricted, skip project and sub-project tasks, habits, and project related tasks."
    (save-restriction
      (widen)
      (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
             (next-headline (save-excursion (or (outline-next-heading) (point-max))))
             (limit-to-project (marker-buffer org-agenda-restrict-begin)))
        (cond
         ((bh/is-project-p)
          next-headline)
         ((org-is-habit-p)
          subtree-end)
         ((and (not limit-to-project)
               (bh/is-project-subtree-p))
          subtree-end)
         ((and limit-to-project
               (bh/is-project-subtree-p)
               (member (org-get-todo-state) (list "NEXT")))
          subtree-end)
         (t
          nil)))))

  (defun bh/skip-project-tasks ()
    "Show non-project tasks.
    Skip project and sub-project tasks, habits, and project related tasks."
    (save-restriction
      (widen)
      (let* ((subtree-end (save-excursion (org-end-of-subtree t))))
        (cond
         ((bh/is-project-p)
          subtree-end)
         ((org-is-habit-p)
          subtree-end)
         ((bh/is-project-subtree-p)
          subtree-end)
         (t
          nil)))))

  (defun bh/skip-non-project-tasks ()
    "Show project tasks.
    Skip project and sub-project tasks, habits, and loose non-project tasks."
    (save-restriction
      (widen)
      (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
             (next-headline (save-excursion (or (outline-next-heading) (point-max)))))
        (cond
         ((bh/is-project-p)
          next-headline)
         ((org-is-habit-p)
          subtree-end)
         ((and (bh/is-project-subtree-p)
               (member (org-get-todo-state) (list "NEXT")))
          subtree-end)
         ((not (bh/is-project-subtree-p))
          subtree-end)
         (t
          nil)))))

  (defun bh/skip-projects-and-habits ()
    "Skip trees that are projects and tasks that are habits"
    (save-restriction
      (widen)
      (let ((subtree-end (save-excursion (org-end-of-subtree t))))
        (cond
         ((bh/is-project-p)
          subtree-end)
         ((org-is-habit-p)
          subtree-end)
         (t
          nil)))))

  (defun bh/skip-non-subprojects ()
    "Skip trees that are not projects"
    (let ((next-headline (save-excursion (outline-next-heading))))
      (if (bh/is-subproject-p)
          nil
        next-headline)))

  ;; org time reporting
  (setq org-clock-out-remove-zero-time-clocks t)
  ;; Agenda clock report parameters
  (setq org-agenda-clockreport-parameter-plist
        (quote (:link t :maxlevel 5 :fileskip0 t :compact t :narrow 80)))
  ;; Set default column view headings: Task Effort Clock_Summary
  (setq org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")
  (setq org-global-properties (quote (("Effort_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")
                                      ("STYLE_ALL" . "habit"))))
  ;; Agenda log mode items to display (closed and state changes by default)
  (setq org-agenda-log-mode-items (quote (closed state)))

  ;; org Archived tasks
  (setq org-archive-mark-done nil)
  (setq org-archive-location "%s_archive::* Archived Tasks")
  (defun bh/skip-non-archivable-tasks ()
    "Skip trees that are not available for archiving"
    (save-restriction
      (widen)
      ;; Consider only tasks with done todo headings as archivable candidates
      (let ((next-headline (save-excursion (or (outline-next-heading) (point-max))))
            (subtree-end (save-excursion (org-end-of-subtree t))))
        (if (member (org-get-todo-state) org-todo-keywords-1)
            (if (member (org-get-todo-state) org-done-keywords)
                (let* ((daynr (string-to-int (format-time-string "%d" (current-time))))
                       (a-month-ago (* 60 60 24 (+ daynr 1)))
                       (last-month (format-time-string "%Y-%m-" (time-subtract (current-time) (seconds-to-time a-month-ago))))
                       (this-month (format-time-string "%Y-%m-" (current-time)))
                       (subtree-is-current (save-excursion
                                             (forward-line 1)
                                             (and (< (point) subtree-end)
                                                  (re-search-forward (concat last-month "\\|" this-month) subtree-end t)))))
                  (if subtree-is-current
                      subtree-end ; Has a date in this month or last month, skip it
                    nil))  ; available to archive
              (or subtree-end (point-max)))
          next-headline))))

  ;; Org reveal
  (setq org-re-reveal-root "file:///Users/thrimbda/Onedrive/cone/tools/reveal.js-4.1.0")

  ;; Yas
  (add-hook 'yas-minor-mode-hook (lambda ()
                                   (yas-activate-extra-mode 'fundamental-mode)))

  ;; Font Ligatures
  (defun my-correct-symbol-bounds (pretty-alist)
      "Prepend a TAB character to each symbol in this alist,
  this way compose-region called by prettify-symbols-mode
  will use the correct width of the symbols
  instead of the width measured by char-width."
      (mapcar (lambda (el)
                (setcdr el (string ?\t (cdr el)))
                el)
              pretty-alist))

  (defun my-ligature-list (ligatures codepoint-start)
      "Create an alist of strings to replace with
  codepoints starting from codepoint-start."
      (let ((codepoints (-iterate '1+ codepoint-start (length ligatures))))
        (-zip-pair ligatures codepoints)))

  (setq my-fira-code-ligatures
      (let* ((ligs '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\"
                    "{-" "[]" "::" ":::" ":=" "!!" "!=" "!==" "-}"
                    "--" "---" "-->" "->" "->>" "-<" "-<<" "-~"
                    "#{" "#[" "##" "###" "####" "#(" "#?" "#_" "#_("
                    ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*"
                    "/**" "/=" "/==" "/>" "//" "///" "&&" "||" "||="
                    "|=" "|>" "^=" "$>" "++" "+++" "+>" "=:=" "=="
                    "===" "==>" "=>" "=>>" "<=" "=<<" "=/=" ">-" ">="
                    ">=>" ">>" ">>-" ">>=" ">>>" "<*" "<*>" "<|" "<|>"
                    "<$" "<$>" "<!--" "<-" "<--" "<->" "<+" "<+>" "<="
                    "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<" "<~"
                    "<~~" "</" "</>" "~@" "~-" "~=" "~>" "~~" "~~>" "%%"
                    "x" ":" "+" "+" "*")))
        (my-correct-symbol-bounds (my-ligature-list ligs #Xe100))))

  (defun my-set-fira-code-ligatures ()
      "Add fira code ligatures for use with prettify-symbols-mode."
      (setq prettify-symbols-alist
            (append my-fira-code-ligatures prettify-symbols-alist))
      (prettify-symbols-mode))

  (add-hook 'prog-mode-hook 'my-set-fira-code-ligatures)
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  (spacemacs/set-leader-keys "op" 'projectile-add-known-project)
  (setq save-interprogram-paste-before-kill t)
  (setq x-select-enable-clipboard nil)

  ;; make macos title bar transparent
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))

  ;; disable evil in vterm
  (evil-set-initial-state 'vterm-mode 'emacs)

  (if (eq system-type 'darwin)
      (setq insert-directory-program "/usr/local/bin/gls"))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(evil-want-Y-yank-to-eol nil)
 '(helm-completion-style 'emacs)
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("CANCELLED" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("HOLD" . "#ff00ff")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")))
 '(org-modules
   '(ol-bbdb ol-bibtex org-crypt ol-docview ol-eww ol-gnus org-habit org-id ol-info org-inlinetask ol-irc ol-mhe org-protocol ol-rmail ol-w3m))
 '(package-selected-packages
   '(realgud test-simple loc-changes load-relative scala-mode sbt-mode mvn meghanada maven-test-mode lsp-metals lsp-java groovy-mode groovy-imports pcache org-re-reveal pinyinlib flycheck-ledger evil-ledger ledger-mode web-beautify tern prettier-js nodejs-repl livid-mode skewer-mode js2-refactor multiple-cursors js2-mode js-doc import-js grizzl impatient-mode simple-httpd add-node-modules-path kubernetes-tramp kubernetes-evil kubernetes nov esxml yapfify stickyfunc-enhance sphinx-doc pytest pyenv-mode py-isort pippel pipenv pyvenv pip-requirements lsp-python-ms lsp-pyright live-py-mode importmagic epc ctable concurrent deferred helm-pydoc helm-cscope xcscope cython-mode blacken anaconda-mode pythonic treemacs-all-the-icons company-lua lua-mode vi-tilde-fringe lsp-ui lsp-origami origami helm-lsp ox-gfm helm-gtags godoctor go-tag go-rename go-impl go-guru go-gen-test go-fill-struct go-eldoc ggtags flycheck-golangci-lint dap-mode lsp-treemacs bui lsp-mode cfrs posframe dash-functional counsel-gtags counsel swiper ivy company-go go-mode yasnippet-snippets unfill mwim helm-company helm-c-yasnippet fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete xkcd treemacs-magit smeargle orgit magit-svn magit-section magit-gitflow magit-popup helm-gitignore helm-git-grep gitignore-templates gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link forge ghub closql emacsql-sqlite emacsql treepy evil-magit magit git-commit with-editor transient org-rich-yank org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download org-cliplink org-brain htmlize helm-org-rifle gnuplot evil-org doom-themes doom-modeline shrink-path xterm-color vterm terminal-here shell-pop multi-term eshell-z eshell-prompt-extras esh-help yaml-mode vmd-mode mmm-mode markdown-toc markdown-mode gh-md emoji-cheat-sheet-plus company-emoji company ws-butler writeroom-mode visual-fill-column winum volatile-highlights valign uuidgen undo-tree treemacs-projectile treemacs-persp treemacs-icons-dired treemacs-evil treemacs ht pfuture toc-org symon symbol-overlay string-inflection spaceline-all-the-icons all-the-icons memoize spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode password-generator paradox spinner overseer org-superstar open-junk-file nameless move-text macrostep lorem-ipsum link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-xref helm-themes helm-swoop helm-purpose window-purpose imenu-list helm-projectile helm-org helm-mode-manager helm-make helm-ls-git helm-flx helm-descbinds helm-ag google-translate golden-ratio flycheck-package package-lint flycheck flycheck-elsa flx-ido flx fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired f evil-tutor evil-textobj-line evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-easymotion evil-cleverparens smartparens evil-args evil-anzu anzu eval-sexp-fu emr iedit clang-format projectile paredit list-utils pkg-info epl elisp-slime-nav editorconfig dumb-jump dash s dired-quick-sort devdocs define-word column-enforce-mode clean-aindent-mode centered-cursor-mode auto-highlight-symbol auto-compile packed aggressive-indent ace-window ace-link ace-jump-helm-line helm avy helm-core popup which-key use-package pcre2el org-plus-contrib hydra lv hybrid-mode font-lock+ evil goto-chg dotenv-mode diminish bind-map bind-key async))
 '(pdf-view-midnight-colors '("#b2b2b2" . "#292b2e")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
