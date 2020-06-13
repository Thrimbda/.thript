#! /usr/bin/scheme --script

;; load dependency irrgex to support regex.
(load "irregex.scm")

(define pattern 
  (irregex "([0-9]+(?:.[0-9]+)?)" 'fast))

(define (string-join strings dim)
  (define (func acc curr)
    (string-append (string-append acc dim) curr))
  (fold-right func (car strings) (cdr strings)))

(define (coord-reverse normal-coord)
  (let ((groups (irregex-extract pattern normal-coord)))
    (if (= (length groups) 2)
        (string-join groups ", ")
        '())))

(define (main)
  (if (= (length (command-line)) 2)
    (display (coord-reverse (cadr (command-line))))
    (error (string-append "invalid argument" (string-join (cdr (command-line)))))))

(main)

