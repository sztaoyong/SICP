#lang scheme
(define (square x) (* x x))
(define nil '())

;; this are exactly problem I faced in Exercise 2.20 (Same parity)

;; will produce outputs in reversed order
(define (square-list-wrong1 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) 
              (cons (square (car things))
                    answer))))
  (iter items nil))

;; will produce something like -> (((() 1) 4) 9)
(define (square-list-wrong2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))


;; use append instead of cons
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (append answer
                    (list (square (car things)))))))
  (iter items nil))

;; test
(square-list-wrong1 (list 11 12 13 14))
(square-list-wrong2 (list 11 12 13 14))
(square-list        (list 11 12 13 14))