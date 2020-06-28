#!/usr/bin/env -S scheme --script
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

;; make srfi link, but now it can only work in the repo's directory.
(define (make-srfi)
  (with-command "git" "submodule update --init scheme/srfi")
  (run-silent "./scheme/srfi/link-dirs.chezscheme.sps" ))

(define (make-tmux-conf)
  (with-command "git" "submodule update --init tmux/oh-my-tmux")
  (with-command "ln" "-s ~/.thript/tmux/oh-my-tmux/.tmux.conf ~/.tmux.conf")
  (with-command "ln" "-s ~/.thript/tmux/.tmux.conf.local ~/.tmux.conf.local"))

(define (make-vim-conf)
  (with-command "git" "submodule update --init vim/vim_runtime")
  (with-command "sh" "vim/vim_runtime/install_awesome_parameterized.sh vim/vim_runtime"))

(define (make-git-conf)
  (with-command "ln" "-s ~/.thript/git/.gitignore ~/.gitignore")
  (with-command "ln" "-s ~/.thript/git/.gitconfig ~/.gitconfig"))

;; non of these are atomic, which means it has no fault tolerance.
(define (make-irregex)
  (let [(pwd (cd))]
    (if (= 0 (with-command "curl" "-LO http://synthcode.com/scheme/irregex/irregex-0.9.7.tar.gz"))
        (begin
          (with-command "tar" "-zxvf irregex-0.9.7.tar.gz")
          (rm "irregex")
          (rename-file "irregex-0.9.7" "irregex")
          (cd "irregex")
          (system "make chez-build")
          (rename-file "irregex.chezscheme.so" "../scheme/irregex.chezscheme.so")
          (cd pwd)
          (rm "irregex")
          (rm "irregex-0.9.7.tar.gz")))))

(define (main)
  (cd thript)
  (make-srfi)
  (make-irregex)
  (make-tmux-conf)
  (make-git-conf)
  (cd pwd))

(main)
