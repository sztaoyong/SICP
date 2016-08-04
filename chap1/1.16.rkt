#lang scheme
;; three state vars: initial b n     result will be initial * b ^ n
;; n even: (initial) (* b b) (/ n 2)
;; n odd:  (* initial  b)  b (- n 1)
;; return initial when n == 0

;; expand 2^6
;; (1   2  6)
;; (1   4  3)
;; (4   4  2)
;; (4  16  1)
;; (64 16  0)
;; 64


;; expand 3^7
;; (1      3  7)
;; (3      3  6)
;; (3      9  3)
;; (27     9  2)
;; (27    81  1)
;; (27*81 81  0)
;; 27 * 81

(define (faster-expt b n)
  (define (faster-expt-iter init b n)
    (cond
      ((= n 0) init)
      ((even? n) (faster-expt-iter init (* b b) (/ n 2)))
      (else (faster-expt-iter (* init b) b (- n 1)))))
  (faster-expt-iter 1 b n))
