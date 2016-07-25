#lang scheme
(define
  (make-rat n d)
  (let ((g (gcd n d)))
   (if (< d 0)
       ;; either case d should always be a positive number
       (cons (/ (* -1 n) g) (/ (* -1 d) g))
       (cons (/ n g) (/ d g)))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

;; test
(define x (make-rat 3 6))
(print-rat x)

(define y (make-rat 4 -8))
(print-rat y)

(define z (make-rat -3 -9))
(print-rat z)