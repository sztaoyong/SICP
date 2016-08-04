#lang scheme
(define (accumulate combiner null-value term a next b)
  (define (accumulate-iter a result)
    (if (> a b)
        result
        (accumulate-iter (next a) (combiner result (term a))))) ;; iterative - combine in place
  (accumulate-iter a null-value))

(define (accumulate-recur combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate-recur combiner null-value term (next a) next b)))) ;; recursive - expand

(define (sum term a next b)
  (accumulate-recur + 0 term a next b))

(define (product term a next b)
  (accumulate-recur * 1 term a next b))