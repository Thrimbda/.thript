#!/usr/bin/env -S scheme --script
;;#!/usr/bin/scheme --script

;;---------------------------------------- meta ---------------------------------------

;; set chezscheme path
(system "export CHEZSCHEMELIBDIRS=~/.thript/scheme")

;; make chez libraries
(define pwd (current-directory))
(cd "~/.thript/scheme")
(include "chez-make.ss")
(cd pwd)

;;---------------------------------------- init ---------------------------------------

(import (tools cli))

;; make srfi link, but now it can only work in the repo's directory.
(define (make-srfi)
  (with-command "git" "submodule update --init")
  (run-silent "./scheme/srfi/link-dirs.chezscheme.sps"))

(define (make-symbolic-link)
  (with-command "ln" "-s ~/.thript/git/.gitignore ~/.gitignore")
  (with-command "ln" "-s ~/.thript/git/.gitconfig ~/.gitconfig"))

(define (main)
  (make-srfi)
  (make-symbolic-link))

(main)
