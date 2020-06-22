#!/usr/bin/scheme --script

;;---------------------------------------- meta ---------------------------------------

;; set chezscheme path
(system "export CHEZSCHEMELIBDIRS=~/.thript/scheme")

;; make chez libraries
(system "cd scheme")
(include "chez-make.ss")

;;---------------------------------------- init ---------------------------------------

(import (tools cli))

;; make srfi link, but now it can only work in the repo's directory.
(define (make-srfi)
  (with-command "git" "submodule update --init")
  (run-silent "./scheme/srfi/link-dirs.chezscheme.sps"))

(define (main)
  (make-srfi))

(main)
