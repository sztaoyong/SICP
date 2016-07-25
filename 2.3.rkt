#lang scheme

;; helper method
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
(define (length-segment seg)
  (define (square x) (* x x))
  (sqrt
   (+
    (square (- (x-point (start-segment seg)) (x-point (end-segment seg))))
    (square (- (y-point (start-segment seg)) (y-point (end-segment seg)))))))


(define (make-rectangle seg1 seg2)
  (cons seg1 seg2))

;; selector
(define (length-rectangle rectangle)
  (max (length-segment (car rectangle)) (length-segment (cdr rectangle))))
(define (width-rectangle rectangle)
  (min (length-segment (car rectangle)) (length-segment (cdr rectangle))))

;; application method
(define (perimeter rectangle)
  (* 2 (+ (length-rectangle rectangle) (width-rectangle rectangle))))
(define (area rectangle)
  (* (length-rectangle rectangle) (width-rectangle rectangle)))
(define (print-rectangle rectangle)
  (newline)
  (display "length: ")
  (display (length-rectangle rectangle))
  (display ", width: ")
  (display (width-rectangle rectangle))
  (display ", parimenter: ")
  (display (perimeter rectangle))
  (display ", area:")
  (display (area rectangle)))

;; test
(define p0 (make-point 0 0))
(define p1 (make-point 3 3))
(define p2 (make-point 1 -1))
(define rec1 (make-rectangle (make-segment p0 p1) (make-segment p0 p2)))
(print-rectangle rec1)
