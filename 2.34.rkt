#lang racket

(require "./seq_base.rkt")

;; (an-2 + (an-1 + (an + 0) * x) * x) * x)
(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) (+ this-coeff (* x higher-terms)))
              0
              coefficient-sequence))

(ops (car seq) initial)
;; test
(horner-eval 2 (list 1 3 0 5 0 1))
;; (1 + x * (3 + x * (0 + x (5 + x * (0 + x * (1 + 0)))))
;; (1 + 2 * (3 + 2 * (0 + 2 (5 + 2 * (0 + 2 * (1 + 0)))))