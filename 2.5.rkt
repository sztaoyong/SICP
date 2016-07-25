#lang scheme

;; helper method to get a number;
;; will deivide the base until remainder is non-zero
(define (get-a n base)
  (define (get-a-iter res n)
    (if (not (= 0 (remainder n base)))
        res
        (get-a-iter (+ res 1) (/ n base))))
  (get-a-iter 0 n))

(define (cons a b)
  (*
   (expt 2 a)
   (expt 3 b)))
(define (car p)
  (get-a p 2))
(define (cdr p)
  (get-a p 3))

