(library (tools misc)
  (export
    string-join
    dec->bin
    zip-with-index
    list-last)
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
       (fold-left func "" strings)]
      [(strings dim)
       (define (func acc curr)
         (string-append (string-append acc dim) curr))
       (fold-left func (car strings) (cdr strings))]))

  (define (dec->bin n)
    (letrec ((stream (lambda (acc n)
                       (if (zero? n) 
                           acc
                           (stream (cons (remainder n 2) acc)
                                   (quotient n 2))))))
    (stream '() n)))

  (define (zip-with-index ls)
    (define (inner rest acc curr)
      (if (null? rest)
          acc
          (inner (cdr rest) (cons (cons (car rest) curr) acc) (+ 1 curr))))
    (reverse (inner ls '() 0)))

  (define (list-last ls)
    (if (null? (cdr ls))
        (car ls)
        (list-last (cdr ls))))

  )

