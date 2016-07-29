#lang racket
(define (square x) (* x x))

(define (square-list items)
  ;; think at element level + recursive-definition is error-prone.
  ;; need to access each element.
  (if (null? items)
      '()
      (cons (square (car items)) (square-list (cdr items)))))

(define (square-list-map items)
  (map square items))

;; test
(square-list (list 1 2 3 4))
(square-list-map (list 5 6 7 8 9))