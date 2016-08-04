#lang racket
(require "./seq_base.rkt")

;; ((lambda (x y) (cons (p x) y)) (car seq) (accumulate (lambda (x y) (cons (p x) y)) initial (cdr seq)))
;; (cons (p (car seq)) (accumulate (lambda (x y) (cons (p x) y)) initial (cdr seq)))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))


(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))


;; test
(map (lambda (x) (- x 1)) (list 2 3 4 5 6))
(append (list 2 3 4 5 6) (list 7 8 9))
(length (list 1 2 3 4 5 7))