#lang racket
(provide make-vect)
(provide xcor-vect)
(provide ycor-vect)
(provide scale-vect)
(provide add-vect)
(provide sub-vect)
(provide print-vect)

(define (make-vect x y)
  (cons x y))

;; selector
(define (xcor-vect v)
  (car v))
(define (ycor-vect v)
  (cdr v))

;; operations
(define (add-vect v1 v2)
  (make-vect
   (+ (xcor-vect v1) (xcor-vect v2))
   (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2)
  (make-vect
   (- (xcor-vect v1) (xcor-vect v2))
   (- (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect s v)
  (make-vect
   (* s (xcor-vect v))
   (* s (ycor-vect v))))

(define (print-vect v)
  (display "(")
  (display (xcor-vect v))
  (display " , ")
  (display (ycor-vect v))
  (display ")\n"))


;; test
;; (define v1 (make-vect 2 3))
;; (define v2 (make-vect 4 8))
;; (xcor-vect v1)
;; (ycor-vect v1)
;; (add-vect v1 v2)
;; (sub-vect v2 v1)
;; (scale-vect 2 v1)