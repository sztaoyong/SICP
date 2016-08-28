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

(uniq-pair 4)