#lang scheme

;; lambda 使得过程可以作为返回值。是抽象过程成为可能
(define (compose f g)
  (lambda (x) (f (g x))))


(define (square x)
  (* x x))

(define (inc x)
  (+ 1 x))
  
