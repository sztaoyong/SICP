#lang scheme
(define (make-interval a b) (cons a b))
(define (upper-bound i) (cdr i))
(define (lower-bound i) (car i))

;; constructor and selectors
(define (make-center-percent c p)
  (make-interval (- c (* (/ p 100.0) c)) (+ c (* (/ p 100.0) c))))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (percent i)
  (/ (* 100.0 (/ (- (upper-bound i) (lower-bound i)) 2)) (center i)))

;; test
(define x (make-center-percent 50 2.65))
x
(center x)
(percent x)