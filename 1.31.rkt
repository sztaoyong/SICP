#lang scheme

(define (product-recur term a next b)
  (if (> a b)
      1 ;; Identity element for multiplication
      (* (term a)
         (product-recur term (next a) next b))))

(define (product term a next b)
  (define (product-iter a result)
    (if (> a b)
        result
        (product-iter (next a) (* result (term a)))))
  (product-iter a 1))

(define (factorial n)
  (product (lambda (x) x) 1 (lambda (x) (+ x 1)) n))

;; in the original formulate, numerators & denominators are incremented in turn.
;; it would be easier to define term & next/less vars need to keep if I group them in pairs.
;; (2/3 * 4/3) (4/5 * 6/5)
(define (pi n)
  (define (term x)
    (/ (* x (+ x 2.0)) (* (+ x 1.0) (+ x 1.0))))
  (define (next x)
    (+ x 2))
  (* (product term 2 next (+ 2 (* 2 n))) 4.0))
