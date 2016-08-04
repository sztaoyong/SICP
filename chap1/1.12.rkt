#lang scheme 
;;      1
;;     1 1
;;    1 2 1
;;   1 3 3 1
;;  1 4 6 4 1
;; 1,5,10,10,5,1

;; represent a pascal element by its coordinate (x,y) where x >= 1 and x >= y >= 1
;; condition (f x 1) = 1; f (x x) = 1
(define (pascal x y)
  (when (and (>= x 1) (and (>= y 1) (>= x y)))
    (cond
      ((or (= y 1) (= y x)) 1)
      (else (+
             (pascal (- x 1) (- y 1))
             (pascal (- x 1) y))))))