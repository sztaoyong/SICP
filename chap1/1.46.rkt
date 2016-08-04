#lang scheme

(define (iterative-improve good-enough? improve)
  ;; this procedure is recursive. (although the process is iterative)
  ;; by nature it cannot be a lambda...
  (define (iter-recur guess)
    (if (good-enough? guess)
        guess
        (iter-recur (improve guess))))
  iter-recur)

;; rewrite this method to this general form
;; (define (sqrt-iter guess x)
;;   (if (good-enough? guess x)
;;       guess
;;       (sqrt-iter (improve guess x)
;;                  x)))


(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (* guess guess) x)) 0.001))
  (define (improve guess)
    (/ (+ guess (/ x guess)) 2))
  ((iterative-improve good-enough? improve) 1.0))


