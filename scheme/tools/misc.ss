(library (tools misc)
  (export
    string-join)
  (import (chezscheme))
  ;; string-join is join a list of string into one string with given dim.
  ; (define (string-join strings dim)
  ;   (define (func acc curr)
  ;     (string-append (string-append acc dim) curr))
  ;   (fold-right func (car strings) (cdr strings)))
  (define string-join
    (case-lambda
      [(strings)
       (define (func acc curr)
         (string-append acc curr))
       (fold-right func "" (strings))]
      [(strings dim)
       (define (func acc curr)
         (string-append (string-append acc dim) curr))
       (fold-right func (car strings) (cdr strings))]))

  )

