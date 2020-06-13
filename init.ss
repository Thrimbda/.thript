#!/usr/bin/scheme --script

; (define (string-join strings dim)
;   (define (func acc curr)
;     (string-append (string-append acc dim) curr))
;   (fold-right func (car strings) (cdr strings)))

;; make srfi link, but now it can only work in the repo's directory.
(define (git-exist?)
  (not (eq? (run-silent "git") 127)))

(define (run-silent command)
  (if (string? command)
      (system (string-append command " >/dev/null"))
      (error 'run-silent (format "the command ~a is not a valid string" command))))

(define (with-git procedure . args)
  (if (git-exist?)
      (if (null? args)
          procedure
          (procedure args))
      (error 'make-srfi "Error: git is not installed")))

(define (make-srfi)
  (display "running")
  (run-silent "git submodule update --init")
  (run-silent "./scheme/srfi/link-dirs.chezscheme.sps"))

(define (main)
  (with-git make-srfi))

(main)
