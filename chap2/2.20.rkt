#lang racket
;; helper
(define (reverse items)
  (define (reverse-iter src dst)
    (if (null? src)
        dst
        (reverse-iter (cdr src) (cons (car src) dst))))
  (reverse-iter items '()))
(define (same-parity? num1 num2)
  (= (remainder num1 2) (remainder num2 2)))

;; dotted-tail notation
(define (same-parity init . items)
  (define (append-same-parity result items)
    (if (null? items)
        result
        (if (same-parity? init (car items))
            (append-same-parity (cons (car items) result) (cdr items))
            (append-same-parity result (cdr items)))))
  (reverse (append-same-parity (list init) items)))

;; the above solution is when I did not know the exisitence of append method

(define (same-parity-using-append init . items)
  (define (append-same-parity result items)
    (if (null? items)
        result
        (if (same-parity? init (car items))
            (append-same-parity (append result (list (car items))) (cdr items))
            (append-same-parity result (cdr items)))))
  (append-same-parity (list init) items))

;; test
(same-parity-using-append 1 2 3 4 5 6 7)
(same-parity-using-append 2 3 4 5 6 7)