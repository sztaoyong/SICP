#lang scheme

(define (filtered-accumulate combiner null-value term a next b predicate)
  (define (accumulate-iter a result)
    (if (> a b)
        result
        (accumulate-iter (next a) (if (predicate a) (combiner result (term a)) result))))
  (accumulate-iter a null-value))

(define (filtered-accumulate-recur combiner null-value term a next b predicate)
  (if (> a b)
      null-value
      (if (predicate a)
          (combiner (term a)
                    (filtered-accumulate-recur combiner null-value term (next a) next b predicate))
          (filtered-accumulate-recur combiner null-value term (next a) next b predicate))))

(define (inc x)
  (+ x 1))

(define (identity x)
  x)
;; did not write prime?; use even? instead.
(define (sum-of-even a b)
  (filtered-accumulate-recur + 0 identity a inc b even?))