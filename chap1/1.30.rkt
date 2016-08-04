#lang scheme
(define (sum-recur term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum-recur term (next a) next b))))


(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

;;; test code.
(sum (lambda (x) (* x x)) 1 (lambda (x) (+ x 1)) 3) ;; 1^2 + 2^2 + 3^9 = 9;

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(integral (lambda (x) (* x x x)) 0 1 0.01) ;; 0.25 - integral of x^3 from 0 to 1 