#lang scheme

(define (make-point x y)
  (cons x y))
(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))

(define (make-segment start end)
  (cons start end))
(define (start-segment seg)
  (car seg))
(define (end-segment seg)
  (cdr seg))

(define (midpoint-segment seg)
  (define (average x y)
    (/ (+ x y) 2))
  (make-point
   (average (x-point (start-segment seg)) (x-point (end-segment seg)))
   (average (y-point (start-segment seg)) (y-point (end-segment seg)))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;;; test
(define start (make-point -2 -1))
(define end (make-point 10 -7))
(print-point start)
(print-point end)
(define seg (make-segment start end))
(print-point (midpoint-segment seg))