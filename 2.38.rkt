#lang racket
(require "./seq_base.rkt")

(define nil '())

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (fold-right op initial sequence)
  ;; copy from accumulate
  (if (null? sequence)
      initial
      (op (car sequence) (fold-right op initial (cdr sequence)))))


(fold-right / 1 (list 1 2 3)) ;; (/ 1 (/ 2 (/ 3 1)) = (/ 1 (/ 2 3)) = 3/2;
(fold-left / 1 (list 1 2 3))  ;; (/ (/ (/ 1 1) 2) 3) = 1/6
(fold-right list nil (list 1 2 3)) ;; (1 (2 (3 ())))
(fold-left list nil (list 1 2 3)) ;; (((() 1) 2) 3)

;; to satisfied; a procedure needs to be com·mu·ta·tive ...
(fold-right * 1 (list 1 2 3)) 
(fold-left * 1 (list 1 2 3))

(fold-right - 1 (list 2 3 4)) ;; (- 2 (- 3 (- 4 1))) = 2
(fold-left - 1 (list 2 3 4)) ;; (- (- (- 1 2) 3) 4) = -8