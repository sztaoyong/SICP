#lang racket
(require "./seq_base.rkt")

(define (enumerate-interval st en)
  (if (> st en)
      nil
      (cons st (enumerate-interval (+ st 1) en))))

(define (uniq-pair n)
  (flatmap
   (lambda (i) (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 n)))

(define (uniq-triple n)
  (flatmap
   (lambda (k) (map (lambda (p) (cons k p)) (uniq-pair (- k 1))))
   (enumerate-interval 1 n)))

(define (sum-equals? s)
  (lambda (lst) (= s (accumulate + 0 lst))))

(define (sum-equal-triples n s)
  (filter
   (sum-equals? s)
   (uniq-triple n)))

;; test
(uniq-triple 5)
(sum-equal-triples 6 9)