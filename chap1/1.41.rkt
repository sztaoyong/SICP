#lang scheme

(define (double f)
  (lambda (x)
    (f (f x))))


(define (inc x)
  (+ x 1))

;; apply double on double
((double double) inc)
((lambda (x) (double (double x)) inc) ;; inc going to be passed as parameter
(double (double inc)) ;; substitution method
(double (lambda (x) (inc (inc x))))
((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x))) ;; keep using substitution method
((lambda (x) (inc (inc x))) (inc (inc x)))
(inc inc (inc (inc x)))