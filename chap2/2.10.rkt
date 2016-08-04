#lang racket



(define (div-interval x y)
  (cond
    ((and (> 0 (lower-bound y))
         (< 0 (upper-bound y)))
     (error "spans zero"))
    (else
       (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))))


;; test
(div-interval (make-interval -3 6) (make-interval 1 2))
(div-interval (make-interval -3 6) (make-interval -2 -1))
(div-interval (make-interval 4 6) (make-interval -1 1))
