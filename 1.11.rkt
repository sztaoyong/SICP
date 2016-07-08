#lang scheme

(define (f-recur n)
  (cond
    ((<= n 3) n)
    (else (+ (f-recur (- n 1))
             (* 2 (f-recur (- n 2)))
             (* 3 (f-recur (- n 3)))))))

;; iterative a b c
;; a <- a + 2b + 3c
;; b <- a
;; c <- b
;; expand (if counter <= 3 then res = a (counter = 3); res = b (counter = 2); res = c (counter = 1)
;; (f a b c counter)  
;; (f 3 2 1 5)
;; (f 10 3 2 4)
;; (f 22 10 3 3)

(define (f-iter a b c counter)
  (cond
    ((> counter 3) (f-iter (+ a (* 2 b) (* 3 c)) a b (- counter 1)))
    ((= counter 3) a)
    ((= counter 2) b)
    ((= counter 1) c)
    (else counter)))

(define (f n)
   (f-iter 3 2 1 n))