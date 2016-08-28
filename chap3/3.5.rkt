#lang racket
(define (square x) (* x x))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (* (random) range)))) ;; use racket built-in (random) function to generate a float


;; unit circle
(define (unit-circle-test x y)
  (<= (+ (square x)
         (square y))
      1))

(define (estimate-integral trials p x1 x2 y1 y2)
  (let ((experiment (lambda () (p (random-in-range x1 x2) (random-in-range y1 y2)))))
    (* (monte-carlo trials experiment)
       (* 1.0
          (- x2 x1)
          (- y2 y1)))))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))


;; test
;; area of unit circle is pi
(estimate-integral 1000 unit-circle-test -1 1 -1 1)