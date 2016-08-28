#lang racket
;; f models a data burn
;; after buring it will only return the same data
(define (cd)
  (let ((value null)
       (value-set false))
    (lambda (n)
      (if value-set
          value
          (begin
            (set! value n)
            (set! value-set true)
            value)))))

(define f1 (cd))
(f1 0)
(f1 1)
(define f2 (cd))
(f2 1)
(f2 0)
(f2 3) 