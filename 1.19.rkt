#lang scheme
;; R2 -> R2 linear transformation; can be represented by 2x2 matrix.
;; 
;; Tpq = [p + q, q; q, p]
;; Tp'q' = [(p + q)^2 + q^2, q(2p + q); q(2p + q), q^2 + p^2]

;; it not difficult to get
;; p' = p^2 + q^2 and q' = q*(2p + q)
                
(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))     ; compute p'
                   (* q (+ (* 2 p) q))     ; compute q'
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))