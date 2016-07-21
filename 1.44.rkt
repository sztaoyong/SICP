#lang racket

;; helper method

(define (compose f g)
  (lambda (x) (f (g x))))

(define (identity x)
  x)

(define (repeated f n)
  (define (repeated res f n)
    (if (= n 0)
      res
      (repeated (compose f res) f (- n 1))))
  (repeated identity f n))

;; smooth
(define (smooth f)
  (define dx 0.0001)
  (lambda (x)
    (/
     (+ (f (- x dx))
        (f x)
        (f (+ x dx)))
     3)))

;; smooth a procedure f n times
;; s(s(...s(f)...)).
(define (smooth_n f n)
  ((repeated smooth n) f))


;; testing code
(require plot)
(define (test x)
  (if (even? (floor (* 1000 x))) 1 0))

(plot (function test 0 1 #:label "y = f(x)"))
(plot (function (smooth test) 0 1 #:label "y = smooth(f(x))"))
(plot (function (smooth_n test 10) 0 1 #:label "y = smooth_10(f(x))"))