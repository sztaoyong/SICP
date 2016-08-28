#lang racket

(require "./symbol_base.rkt")

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))
(define (base e)
  (cadr e))
(define (exponent e)
  (caddr e))
(define (make-exponentiation u n)
  (cond ((=number? n 0) 1)
        ((=number? n 1) u)
        ((and (number? u) (number? n)) (expt u n))
        (else (list '** u n))))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
        ((exponentiation? exp)
         (make-product
          (exponent exp)
          (make-product
           (make-exponentiation (base exp)
                                (make-sum (exponent exp) -1))
           (deriv (base exp) var))))       
        (else
         (error "unknown expression type -- DERIV" exp))))

;; test
(deriv '(** 3 2) 'x)
(deriv '(** x 2) 'x)
(deriv '(** (* x 2) n) 'x)
