#lang scheme

(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

(define (double x)
  (+ x x))

(define (halve x)
  (when (even? x) (/ x 2)))

;; recusive
;; a * b =  (* (double a) (halve b)) when b is even   
;;          (+ a (* a (b - 1))) when b is odd
;;          until b = 0

(define (fast-mult a b)
  (cond
    ((= b 0) 0)
    ((even? b) (fast-mult (double a) (halve b)))
    (else (+ a (fast-mult a (- b 1))))))


;; iterative
;; three state vars: initial a b     result will be initial + a * b
;; b even: (initial) (double a) (halve b)
;; b odd:  (+ initial  a)  a (- b 1)
;; return initial when b == 0

(define (faster-mult a b)
  (define (faster-mult-iter init a b)
    (cond
      ((= b 0) init)
      ((even? b) (faster-mult-iter init (double a) (halve b)))
      (else (faster-mult-iter (+ init a) a (- b 1)))))
  (faster-mult-iter 0 a b))