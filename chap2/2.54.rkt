#lang racket

(define (symbol? e)
    (and (not (null? e)) (not (pair? e))))

(define (equal? a b)
  (cond
    ((and (symbol? a) (symbol? b)) (eq? a b))
    ((and (pair? a) (pair? b)) (and (equal? (car a) (car b)) (equal? (cdr a) (cdr b))))
    ((and (null? a) (null? b)) #t)
    (else #f)))