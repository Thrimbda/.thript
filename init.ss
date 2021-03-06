#!/usr/bin/env -S scheme --libdirs "~/.thript/scheme" --script
;;#!/usr/bin/scheme --script

;;---------------------------------------- meta ---------------------------------------

;; set chezscheme path
(define thript "~/.thript")
(system (format "export CHEZSCHEMELIBDIRS=~a/scheme" thript))

;; make chez libraries
(define pwd (current-directory))
(cd (format "~a/scheme" thript))
(include "chez-make.ss")
(cd pwd)

;;---------------------------------------- init ---------------------------------------

(import (tools cli))

(define (get-user)
  (call-with-values
    (lambda () (open-process-ports "echo $USER" 'block (native-transcoder)))
    (lambda (stdin stdout stderr pid) (get-line stdout))))

;; make srfi link, but now it can only work in the repo's directory.
(define (make-srfi)
  (with-command "git" "submodule update --init scheme/srfi")
  (run-silent "./scheme/srfi/link-dirs.chezscheme.sps" ))

(define (make-tmux-conf)
  (with-command "git" "submodule update --init tmux/oh-my-tmux")
  (with-command "git" "clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm")
  (with-command "ln" "-s ~/.thript/tmux/oh-my-tmux/.tmux.conf ~/.tmux.conf")
  (with-command "ln" "-s ~/.thript/tmux/.tmux.conf.local ~/.tmux.conf.local"))

(define (connect-yas)
  (let [(paths (ls "~/.thript/yasnippets/"))]
    (for-each (lambda (path)
                (let [(real-path (format "~~/.thript/yasnippets/~a" path))]
                  (begin
                    (cd "~/.emacs.d/private/snippets")
                    (with-command "ln" (format "-s ~a ~a" real-path path)))))
              paths)))

(define (make-vim-conf)
  (with-command "git" "submodule update --init vim/vim_runtime")
  (if (file-exists? "~/.vimrc")
      (begin
        (rm "~/.vimrc.back")
        (rename-file "~/.vimrc" "~/.vimrc.back"))
      (void))
  (system (format "./vim/vim_runtime/install_awesome_parameterized.sh ~a/vim/vim_runtime ~a" thript (get-user)))
  (with-command "ln" "-s ~/.thript/vim/init.vim ~/.config/nvim/init.vim")
  (with-command "ln" "-s ~/.thript/vim/my_configs.vim ~/.thript/vim/vim_runtime/my_configs.vim")
  )

(define (make-git-conf)
  (with-command "ln" "-s ~/.thript/git/.gitignore ~/.gitignore")
  (with-command "ln" "-s ~/.thript/git/.gitconfig ~/.gitconfig"))

;; non of these are atomic, which means it has no fault tolerance.
(define (make-irregex)
  (let [(pwd (cd))]
    (if (= 0 (with-command "curl" "-LO http://synthcode.com/scheme/irregex/irregex-0.9.7.tar.gz"))
        (begin
          (rm "irregex")
          (with-command "tar" "-zxvf irregex-0.9.7.tar.gz")
          (rename-file "irregex-0.9.7" "irregex")
          (cd "irregex")
          (system "make chez-build")
          (rm "../scheme/irregex.chezscheme.so")
          (rename-file "irregex.chezscheme.so" "../scheme/irregex.chezscheme.so")
          (cd pwd)
          (rm "irregex")
          (rm "irregex-0.9.7.tar.gz")))))

(define (main)
  (cd thript)
  (make-srfi)
  (make-irregex)
  (make-tmux-conf)
  (make-vim-conf)
  (make-git-conf)
  (cd pwd))

;; (main)
(connect-yas)
