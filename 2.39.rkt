#lang racket
;; this example help understand fold-left and fold-right. 
;; help methods
(define nil '())
(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (fold-right op initial (cdr sequence)))))

;; solution
(define (reverse-r sequence)
  (fold-right (lambda (x y) (append y (list x))) nil sequence))
  ;; (l 1 (l 2 (l 3 nil))) -> assume after some steps -> (l 1 (3 2)) ->l?-> (3 2 1)

(define (reverse-l sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))
  ;; (l (l (l nil 1) 2) 3) -> assume after some steps -> (l (2 1) 3) ->l?-> (3 2 1)

;; test
(reverse-r nil)
(reverse-l nil)
(reverse-r (list 1))
(reverse-l (list 2))
(reverse-r (list 1 2 3 4))
(reverse-l (list 5 6 7 8))