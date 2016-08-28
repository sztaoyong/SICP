#lang racket

(define (make-accumulator init)
  (lambda (num)
    (begin
      (set! init (+ init num))
      init)))

;; test
(define A (make-accumulator 5))
(A 10)
(A 10)
