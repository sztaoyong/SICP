#lang scheme

(define (reverse items)
  (define (reverse-iter src dst)
    (if (null? src)
        dst
        (reverse-iter (cdr src) (cons (car src) dst))))
  (reverse-iter items '()))

;; test
(reverse (list 1 4 9 16 25))