#lang scheme

(define (compose f g)
  (lambda (x) (f (g x))))

(define (identity x)
  x)

(define (repeated f n)
  (define (repeated res f n)
    (if (= n 0)
      res
      (repeated (compose f res) f (- n 1))))
  (repeated identity f n))


;; test
(define (square x)
  (* x x))

