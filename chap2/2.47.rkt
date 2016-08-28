#lang racket

(require "./2.46.rkt")

(define (make-frame1 origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame1 f)
  (car f))
(define (edge1-frame1 f)
  (cadr f))
(define (edge2-frame1 f)
  (caddr f))


(define (make-frame2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame2 f)
  (car f))
(define (edge1-frame2 f)
  (cadr f))
(define (edge2-frame2 f)
  (cddr f))

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame2 frame)
     (add-vect (scale-vect (xcor-vect v)
                           (edge1-frame2 frame))
               (scale-vect (ycor-vect v)
                           (edge2-frame2 frame))))))

;; test
(define f1 (make-frame1 (make-vect 0 0) (make-vect 1 0) (make-vect 0 1)))
(print-vect (origin-frame1 f1))
(print-vect (edge1-frame1 f1))
(print-vect (edge2-frame1 f1))

(define f2 (make-frame2 (make-vect 2 3) (make-vect 1 1) (make-vect 0 1)))
(print-vect (origin-frame2 f2))
(print-vect (edge1-frame2 f2))
(print-vect (edge2-frame2 f2))

((frame-coord-map f2) (make-vect 1 1))