#lang racket
;; represent a number as:
;; center * (1 + p) where -percent < p < percent;;

;;   x * y
;; = xc ( 1 + px) yc (1 + py)
;; = xcyc (1 + px + py + pxpy) since px py is both very small;
;; = xcyc (1 + px + py)


;; test
;; helper method
(define (make-interval a b) (cons a b))
(define (upper-bound i) (cdr i))
(define (lower-bound i) (car i))

(define (make-center-percent c p)
  (make-interval (- c (* (/ p 100.0) c)) (+ c (* (/ p 100.0) c))))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (percent i)
  (/ (* 100.0 (/ (- (upper-bound i) (lower-bound i)) 2)) (center i)))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

;; test
(define x (make-center-percent 50 2.65))
(define y (make-center-percent 100 1.75))
(+ 2.65 1.75)
(percent (mul-interval x y))
