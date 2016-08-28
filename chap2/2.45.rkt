#lang racket

(define (split proc1 proc2)
  (define (split-recur painter n)
    (if (= n 0)
        painter
        (let ((smaller (split-recur painter (- n 1))))
          (proc1 painter (proc2 smaller smaller)))))
  split-recur)

(define right-split (split beside below))
(define up-split (split below beside))