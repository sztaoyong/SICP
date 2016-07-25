#lang scheme

(define (make-interval a b) (cons a b))
(define (upper-bound i) (cdr i))
(define (lower-bound i) (car i))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (print-interval i)
  (newline)
  (display "(")
  (display (lower-bound i))
  (display ", ")
  (display (upper-bound i))
  (display ")"))

;; test
(define interval1 (make-interval 9 11))
(define interval2 (make-interval 1.5 2.5))
(print-interval interval1)
(print-interval interval2)

(print-interval (sub-interval interval1 interval2))
