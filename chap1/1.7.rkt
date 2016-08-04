#lang scheme

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))
(define (square x)
  (* x x))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (let [(new_guess (improve guess x))]
    (if (< (abs (- guess new_guess)) 0.001)
      guess
      (sqrt-iter new_guess x))))

(define (sqrt x)
  (sqrt-iter 1.0 x))