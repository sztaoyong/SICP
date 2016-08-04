#lang racket

(define (make-interval a b) (cons a b))
(define (upper-bound i) (cdr i))
(define (lower-bound i) (car i))

;; an interval is one of three cases: negative; cross-zero; positive;
(define (negative? x) (<= (upper-bound x) 0))
(define (cross-zero? x) (and (< (lower-bound x) 0) (< 0 (upper-bound x))))
(define (positive? x) (<= 0 (lower-bound x)))

(define (mul-interval x y)
 (cond
   ((and (positive? x) (positive? y))
    (make-interval (* (lower-bound x) (lower-bound y)) (* (upper-bound x) (upper-bound y))))
   ((and (positive? x) (cross-zero? y))
    (make-interval (* (upper-bound x) (lower-bound y)) (* (upper-bound x) (upper-bound y))))
   ((and (positive? x) (negative? y))
    (make-interval (* (upper-bound x) (lower-bound y)) (* (lower-bound x) (upper-bound y))))
   ((and (cross-zero? x) (negative? y))
    (make-interval (* (upper-bound x) (lower-bound y)) (* (lower-bound x) (lower-bound y))))
   ((and (cross-zero? x) (cross-zero? y))
    (make-interval (min (* (upper-bound x) (lower-bound y)) (* (lower-bound x) (upper-bound y)))
                   (max (* (upper-bound x) (upper-bound y)) (* (lower-bound x) (lower-bound y)))))
   ((and (negative? x) (negative? y))
    (make-interval (* (upper-bound x) (upper-bound y)) (* (lower-bound x) (lower-bound y))))
   (else (mul-interval y x))))

;; test
(mul-interval (make-interval 1 5) (make-interval 1 2)) ;; PP
(mul-interval (make-interval 1 5) (make-interval -1 2)) ;; PC
(mul-interval (make-interval 1 5) (make-interval -2 -1)) ;; PN
(mul-interval (make-interval -1 2) (make-interval 3 5)) ;; CP
(mul-interval (make-interval -1 5) (make-interval -6 1)) ;; CC
(mul-interval (make-interval -1 5) (make-interval -6 -1)) ;; CN
(mul-interval (make-interval -5 -4) (make-interval 2 3)) ;; NP
(mul-interval (make-interval -5 -4) (make-interval -6 1)) ;; NC
(mul-interval (make-interval -5 -4) (make-interval -3 -2)) ;; NN