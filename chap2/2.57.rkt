#lang racket
(require "./symbol_base.rkt")
(require "./seq_base.rkt")

(define (augend s)
  (accumulate make-sum 0 (cddr s)))

(define (multiplicand p)
  (accumulate make-product 1 (cddr p)))


;; test
(deriv '(* x y (+ x 3)) 'x)
